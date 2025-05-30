PGDMP  0    5                }         	   Data Lake    17.2    17.2 	                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            "           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            #           1262    16505 	   Data Lake    DATABASE     �   CREATE DATABASE "Data Lake" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "Data Lake";
                     postgres    false            �            1259    16534    marketing_ads    TABLE     �   CREATE TABLE public.marketing_ads (
    campaign_id character varying(20),
    campaign_name text,
    ad_name text,
    date date,
    impressions integer,
    clicks integer,
    conversions integer,
    spend numeric(14,2)
);
 !   DROP TABLE public.marketing_ads;
       public         heap r       postgres    false            �            1259    16541    marketing_forecast    TABLE     ~   CREATE TABLE public.marketing_forecast (
    data date,
    variavel text,
    valor_previsto numeric(14,2),
    tipo text
);
 &   DROP TABLE public.marketing_forecast;
       public         heap r       postgres    false                      0    16534    marketing_ads 
   TABLE DATA           {   COPY public.marketing_ads (campaign_id, campaign_name, ad_name, date, impressions, clicks, conversions, spend) FROM stdin;
    public               postgres    false    217   �	                 0    16541    marketing_forecast 
   TABLE DATA           R   COPY public.marketing_forecast (data, variavel, valor_previsto, tipo) FROM stdin;
    public               postgres    false    218   *$       �           2606    16540 8   marketing_ads marketing_ads_campaign_id_ad_name_date_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.marketing_ads
    ADD CONSTRAINT marketing_ads_campaign_id_ad_name_date_key UNIQUE (campaign_id, ad_name, date);
 b   ALTER TABLE ONLY public.marketing_ads DROP CONSTRAINT marketing_ads_campaign_id_ad_name_date_key;
       public                 postgres    false    217    217    217                  x��]]�%��}.���)H�>�G{� �]d_���i8�x���q���=��Q�ķT��@l�FLK%~������7����O?=~|������_}���~yZ����秏�������KpA��<����KZ����OK�����;
˻Ǐ�>~�����<��χ?�|x���忿<�|x�����ӿ�^>?>+��x���D�k�c�������_B�V���X����?|��O�Ooe�'�Y𧸔�k�M�,zzy��������_��~�!��������v���}��7�,9iYB�u�	�⪥I��=}y|���ˇO??�{|y�����?�����������ćz+8��pe�<o��o|,��ˇ�/���Ў��
N��͂+q��[RY�y��gϟ??������}��c�\#�j�|��T�������y���g�2;�^HbXr���}Q�/��.)ץ�p�Z�I���>������ß^�����&������y��ͫ��P��_��5�2�&#�e�+��.ɕ5l�ܳ潷�����/PL��0�y7�τ�D�P��K�okZc����3q�f�vЄ�⏒tuh�7���Iu��EeU�b��T�@H�?��5ʽ�a�k���0�p�ל�J޽�VO���\l
��tV��C�:|P����l/�xts8E�K'|����1���t3�U
�X�|(t_�K��B�e�R�OH�{u����<8�b��ּ�"b71EFxC:G�Vuע���E�#>����!q<74�sn����o"��r:�iO��k���L2�ջ;��4_}X�6�}����R���h�m,��z>@s�`��"������j^c=��E;d��e�<�dNt-�T8�Ϙj�B��M�A�<^�����G�S`��U��/���"%+���o���l|i߭� ��"�(��j�0�U�$���[,GxX�l�Q�n*��-�R�������Ř���p�UծdA�w�j�j�q����}���:�zM�S�^�4>�[	�s�e8�di&.h�|N�G'{���&��ja0�t�Fwŷ"�/0��*@!c���Y;[�9�"�w��L������	Pa��!\����5 t v	�GΫ;���N�-SVh^���:�����{�Y�� I=cq�;T�r�(%Я�����'������ж�������v���ձ܀������0q�\���b��~MI�d�|��2�?�]OHٲʽ�v��ZL 40�\���M����X.ViI=��s��$C=Sܰ�Uq>2���
�� 㠉��;����PD�1��}(��%���d��
�%C��y>�}��!f�Vp��S:Um)'�?.o6�<�FYc���.@��H�r����\,4�@s&���9wñ��X��~b֔�rP��{�ҠGR(��
^%��v��M�k'�05��A�H}I=D��u&*�
T ��;�r?:s��/Y]���ܨ.I�����J\��^��^�+;��A��qSM�B�����X���l�$�ީ�X��uY	I�s����-{�bZm�t�{Eo�,L�U�n�,�,	i���tYD-�	( B�"�{=����R��KT�Z�y�#�QÃ���&@��e�@n糣�3� �]�Y��:oZ�6�����z���hy2G�VU��AD�a�х�x־�P�++�Vې��)8�Z��D��T0����\7�� �Y�!Xq�}t�5���,�ꉬ�"�筿�=q{�g�B�KEVk6��ˋ�V�Χ^�	Z!7��ps�Q;,�e�DY���G7�e;Wa�����J�o>���D�ؿ�tz����|��u��R�V6���@ok*�%d��H��&45��a�n�R0�ծb��a]1��5��=C��i��������.�ڜQ��_kۓ&Ҥi�ɂ�����>^L��i����1�P�{,�7�,<J�^�v�w:�m��b������5�끨��B����n\
 A<�`ݲ��E���Mvf�#
0?B� �=8�$������n����eo�Ed��J��\l�.�&��!F^���Wu8PN��be3�&�t�g{Ԡ�L!X����j��	�i�30 s|�8����d�п�X+\<���|o�%�5�=�������-q>3�.�L�B5@Iiܮ~2�,|L&,�x���J7�}z��L�WY� ��W^ir;�
< �v�Ox��Ҥ*@<��]F8���Zg����V�4�M[mB~-��������8*�����MV�y"g�>v���[p��$�YU{��g#dk�䦐�4v����TK��k�@�R"#a�Dmw�4l�X-ш��HY�Z�-F:z�lN�T�Л�s`��c��bX�U�^	��dlW���}5�=% �i(�{�VFb.p������&�,�j�b��5O���(��bhʲhz%�]
�_)t�,�����3���1��-Iz K�N���yr�>?@bH)��}>W`�FR�h���R	ͤ9���&{as"v�y	�8oEC�ZioL�Ҿ��a�$����b�&B=q�c��P��k-w��:�?]�0I�
	)�>ϳ._V9��o33!/�2s�F�������G���>*�8J̫ �ۤf��(8=�ȹN���FxN5��|�v���@�w��-��Jf+[�vD;[l4�Z]`�-g���}�T7 �Aގ|b��jf���&���`U��16g:���;��"��]!5��l���Jj��3�K�({����>m�%�P��X�eM����#eV�y��S���1��i���H!i�98�ڛUW)��-L���s,�^���=�gKR\��	'x�n�'�Q�kSBH�Ӡ��H�P�MY{�A3��z����btjv��t
�WR�&-k&*�OX����ٴO(Pn�E�}x��tӏ���ps���K��i���Ѻx%N;�t<=S��N��k�Jl�
O��8Y�� g�Vϭ�S�߉w�`$Zy�=9���&��,g<�l� �.pS"eI��%nQ���1%}��G�G�fc�y�����H:A�_I.UZ���f��\��	+֑بq.ǒ��E�`]Oē�*�@��JF����|T�߻h
�W�yR�x۸���}����;e���I�E�F*�`���D�{X�&z�b��SH!�X~�m�/(Eɯb9��C��>��T{b��SOy'g>R{���!o�O�Nv����!����WV����6�	��:�N��:�7��2#��{Y����2h�#T�7��2-:-t�\��-�����$7�I��jr�{�й��ШL"�LZn�.*Q�?���d�2n]�6�%�+����H�����k�c�o��(Y���m��ur�$�5i���q�/� _I-s�&.�H����F��z8����JI�<'�Y�/6Fs���E9	�l��Puq_/3��ɛ�!�\�����%*�%�l�v�=>������&#�3�7�ER>ܠqݘ5ש����Ť	�(�M(� �qK{�O�"0����ҹ��da��l���ɐ��R_`c���^�B����(�W�� YY`� 	�"%�Iˁ�"�%p�%�<_��B䋰ȋۼ[}=�D)�V�\&%��<&׏���X��<C��H������zeZ� ���1~�H��ߒ�[+�G��ڴU6
�'А@�0��?��(~�/Q��8�o:n��imE�jS���Ƒ�7(6�Ǣ��TN��r�EY}k�D�� iAʮ�.%�#$8�rI���Hd�\=���f��M2Y��%�O���ڬ$�q�4YK�͗tCkF�d�E�B}����=�8�CL��i�>��]�I���p̾�6]O�@=����6�{� V�dӁM��(��;���G���}�!�̩c2|Ic�{��W����U�HC\��ѕ}�\��?� �� 49���Kvl!��Mf]$`R���͋&+3;��`O~g[[�K:��y{RJHZ8��4<&0.OPd���!BۥA\E��j�*��ʹ\��Wm�){�w|f\|����l�� .
  ����3���`��x[��R9��6�%���k���z�;�
��.)0��W>�=�x�fo����T<���쁌d[�"���,#S:�k�i�,� 7ηf�,x���3g��;|�;g@�׊T���|iҊ�L	y��l�s-θ�5�n*�Ph��>"+�W*��U#�Ԥ~��}�K�Y)����q��#A��>��8��y�>N�Zڝ�Zo:�6���Hp��O�x�1I����b�C&َ�[톜|�<� b�-���D,�əd�Z�t륙�&χB{cş���{�n�Z���+�VK����c۩`�Υ�u%J���j��7�
3W>pR�mӐ�Ѵ�g݅z�����+G��iC�-ձt���#�u�����҈Y8�ec(ܨ�/S�bv�L�>6C.�K�A�fm���ێom[q�M�0p[/	�V����R5�1W�c���=xP�lrĘ�HRS8Lc��`,8��8@qGvN�_�4>L��
'݅E>/�7���fr>�VE�իh���n=b���h:Ǚ������!Ʀ��Õ�d�o�k�$pB��������L{��m `�\]O�.լ�H�ܩ�J勧s������y˸��G�z ��!!��U{Mb;��0��c���������s�[/�޳K��B+&��s�і��k3�&�f�",���-���f���^9�CC���8�`b@7�����g(�x�g�-�@��V�!���i(����{�F����r	��ۓ�\1at:�5KY9�}>uyaa�ت:���G2�yԡ٣��	r�}f(�SҗLvM�*=+��q��������'S1F�0�q0����n��5&�B��{���;���E	6����g�X/.M-���T��5~{n��d��e��W8&�V�j�a�l�&��w �sF'\�������:�)�h[���J��-6�I]�̠�t�ڷC\jM�P�n˒�����_�:̺����iskĢ�2���8%�i�+�Ma���I�G�-�)��k�LZI�oq�Q9L+�=�x�b�!�fۉvi!m�(\;���H�ߧz�e5a���S��^����4_������o7�;笶�(��O�����2թ	6�*��M'�8*��*���X�Ḵ7���8
���p��+����+����yT����ʚly��%��<9/�`z����r�2�e�q�i�Qj<���u9lU8�����p�m�W%Ta�5�vfI�����,�]Q��u��sn���:�m�d;ˊK=O��<k����ׁ����~�N���9&V19��N{ �CdxH��t�;�0b�/�GU�[Y�Zk3��
�S��'7�P��=��HR�c����M*��ޝa�h��R���.ޛ��2ñ4Z���c��-.�Z:�)��|�d�V��I�k���W��7itz,�ـ@N�WO�Y����md����%Ll�	�J�D�2(�G�:]��y���3�Z$��˫��7ʣ��"���Ya0G^ۈ���`�r5�[ۥ%s����;�4�NW����7��������(��/B��l%B����nպ�N���C$�!���^�����b�)۸w����.����W��	��%��bF���h+��ƣ�	�����Kbg��[�QY_�b��OdY��n��+m\�o�L���#�A�dy�y��w�R"�~TZ�,�d��ŅL��C����c�+�u{k�gV��b�܀�g�7o�f�y"�a�O�#�_�a�I�C^Æ��U��1�u�kͲ!�H[�g�6"_����$���B:Q��_�il4!���;��(o��s˜�����p~�#��]c�t�d@�N�d�yg�[$��e��.�"�Z����6rcZ\�_���V�*VܷY�rj��^ F�u|�%�6N�B�kSc����~��7-о;�+��$��o��jk���?X?�vί���prf��wi�,�$o���m5��~�|:��R�ZX]R�Z�?80�����Y�G�ӯ�KlK#$�CD��nto_*܁�'�u׽�2�5���A"=K]���a>�jo�A�g?�Ť$\�ҶBS��z����Rz�i�l��
LrX�w��a��*ٷ�C�z�/��'�
�P��Ac�Y���M�<�&�<�8S��s��o�-�i��Ef�n�K�Sฃ������ �$K�(i��
i���;�)iȑ��9,W͹��9,O���J�5��Ƹ����x�܄��I���f��Ri-?&7mUٙπ@�Ѧ��7$�-�;$��//dj3����+8��Wm�V�k;�Ȫg���&G�����Y�-�c��H�O�L56�����j1o�G@77��2��~����e����=Mrg�(��悌v��-zxb���E���`j_:x�1��Q�i�ϠBV��²��TlWP��Js�y_��lO���� V��)�2���V�a4L�2wL/�7o���ziI�y&#ՃZ�X�������k�<�E3�*�S�ŕ<�{;*�H2!�Hvי�ء/���>�¾��ۍ�/(�[�1eb�U��jt�vg�^�;��ع)&�w��~��w��7W�            x������ � �     