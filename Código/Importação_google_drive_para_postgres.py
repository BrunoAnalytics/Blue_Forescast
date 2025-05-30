import pandas as pd
import requests
from sqlalchemy import create_engine, text
from io import StringIO
import unidecode
import re

user = "Não posso informar"
password = "Não posso informar"
host = "lNão posso informar"
port = "Não posso informar"
dbname = "Data Lake"


engine = create_engine(f"postgresql://{user}:{password}@{host}:{port}/{dbname}")

create_table = """
CREATE TABLE IF NOT EXISTS marketing_ads (
    campaign_id VARCHAR(20),
    campaign_name TEXT,
    ad_name TEXT,
    date DATE,
    impressions INTEGER,
    clicks INTEGER,
    conversions INTEGER,
    spend NUMERIC(14,2),
    UNIQUE (campaign_id, ad_name, date)
);
"""

with engine.begin() as conn:
    conn.execute(text(create_table))


url = "https://docs.google.com/spreadsheets/d/1mxmqgHdgAHNheDmIaj-m8gSjNMrjxQIgWEJl_tg2G_c/export?format=csv&gid=1091999574"
resposta = requests.get(url)
resposta.raise_for_status()
df = pd.read_csv(StringIO(resposta.text), encoding='utf-8')


df.columns = [col.lower() for col in df.columns]
df["date"] = pd.to_datetime(df["date"], dayfirst=True, errors="coerce")

def limpar_texto(texto):
    texto = unidecode.unidecode(str(texto))                     # remove acentos
    texto = re.sub(r"[^a-zA-Z0-9\s]", "", texto)                # remove símbolos
    texto = re.sub(r"\s+", " ", texto)                          # normaliza espaços
    return texto.strip()


correcoes = {
    "LanASSamento": "Lancamento",
    "ConversAPSo": "Conversao",
    "GeraASSAPSo": "Geracao",
    "PromoASSAPSo": "Promocao",
    "VerAPSo": "Verao",
    "VAdeo": "Video"
}

def corrigir_palavras(texto):
    for errado, certo in correcoes.items():
        texto = texto.replace(errado, certo)
    return texto


df["campaign_name"] = df["campaign_name"].apply(limpar_texto).apply(corrigir_palavras)
df["ad_name"] = df["ad_name"].apply(limpar_texto).apply(corrigir_palavras)


df["campaign_id"] = df["campaign_id"].astype(str).str.replace("-", "", regex=False)


before = len(df)
df = df.dropna(subset=["date"])
after = len(df)
print(f"🧹 {before - after} linha(s) com data inválida foram removidas.")


with engine.begin() as conn:
    for _, row in df.iterrows():
        query = text("""
            INSERT INTO marketing_ads (
                campaign_id, campaign_name, ad_name, date,
                impressions, clicks, conversions, spend
            )
            VALUES (
                :campaign_id, :campaign_name, :ad_name, :date,
                :impressions, :clicks, :conversions, :spend
            )
            ON CONFLICT (campaign_id, ad_name, date) DO NOTHING;
        """)
        conn.execute(query, {
            "campaign_id": row["campaign_id"],
            "campaign_name": row["campaign_name"],
            "ad_name": row["ad_name"],
            "date": row["date"],
            "impressions": int(row["impressions"]),
            "clicks": int(row["clicks"]),
            "conversions": int(row["conversions"]),
            "spend": float(row["spend"]),
        })

print("✅ Dados atualizados do Google Sheets sem duplicações e com texto 100% limpo no PostgreSQL!")
