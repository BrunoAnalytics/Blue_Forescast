import pandas as pd
import requests
from sqlalchemy import create_engine, text
from io import StringIO
from datetime import timedelta
from statsmodels.tsa.statespace.sarimax import SARIMAX

user = "Não posso informar"
password = "Não posso informar"
host = "Não posso informar"
port = "Não posso informar"
dbname = "Data Lake"
engine = create_engine(f"postgresql://{user}:{password}@{host}:{port}/{dbname}")


url = "https://docs.google.com/spreadsheets/d/1mxmqgHdgAHNheDmIaj-m8gSjNMrjxQIgWEJl_tg2G_c/export?format=csv&gid=1091999574"
resposta = requests.get(url)
resposta.raise_for_status()
df = pd.read_csv(StringIO(resposta.text), encoding='utf-8')

import re
df["date"] = df["Date"].astype(str).apply(lambda x: re.sub(r"^\s*\w+(-feira)?,\s*", "", x.lower()))
meses_pt = {
    "janeiro": "01", "fevereiro": "02", "março": "03", "abril": "04",
    "maio": "05", "junho": "06", "julho": "07", "agosto": "08",
    "setembro": "09", "outubro": "10", "novembro": "11", "dezembro": "12"
}
for mes, num in meses_pt.items():
    df["date"] = df["date"].str.replace(f" de {mes} de ", f"/{num}/", regex=False)
df["date"] = pd.to_datetime(df["date"], format="%d/%m/%Y", errors="coerce")
df = df.dropna(subset=["date"])


df = df.groupby("date")[["Impressions", "Clicks", "Conversions", "Spend"]].sum().reset_index()


meses_prever = 3
variaveis = ["Impressions", "Clicks", "Conversions", "Spend"]
previsoes = []

for col in variaveis:
    if df[col].dropna().shape[0] >= 4:
        modelo = SARIMAX(df[col], order=(1,1,1), seasonal_order=(1,1,1,6))
        resultado = modelo.fit(disp=False)
        forecast = resultado.forecast(steps=meses_prever)
        datas_futuras = pd.date_range(df["date"].max() + timedelta(days=1), periods=meses_prever, freq="MS")
        for i in range(meses_prever):
            previsoes.append({
                "data": datas_futuras[i],
                "variavel": col,
                "valor_previsto": round(forecast.iloc[i], 2),
                "tipo": "Previsto"
            })


df_real = df.melt(id_vars="date", value_vars=variaveis, var_name="variavel", value_name="valor_previsto")
df_real["tipo"] = "Real"
df_real = df_real.rename(columns={"date": "data"})


saida = pd.concat([df_real, pd.DataFrame(previsoes)], ignore_index=True)


create_table = """
CREATE TABLE IF NOT EXISTS marketing_forecast (
    data DATE,
    variavel TEXT,
    valor_previsto NUMERIC(14,2),
    tipo TEXT
);
"""
with engine.begin() as conn:
    conn.execute(text(create_table))


with engine.begin() as conn:
    for _, row in saida.iterrows():
        conn.execute(text("""
            INSERT INTO marketing_forecast (data, variavel, valor_previsto, tipo)
            VALUES (:data, :variavel, :valor_previsto, :tipo)
        """), dict(row))

print("✅ Previsões e dados reais salvos na tabela 'marketing_forecast' com sucesso!")
