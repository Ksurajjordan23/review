PGDMP     4    9                z           postgres    14.2    14.2                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    13754    postgres    DATABASE     l   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            	           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3336                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            
           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    16854    dict    TABLE     ?   CREATE TABLE public.dict (
    word_id integer NOT NULL,
    word_name character varying(50) NOT NULL,
    word_def character varying(200) NOT NULL,
    stem_id integer NOT NULL
);
    DROP TABLE public.dict;
       public         heap    postgres    false            ?            1259    16853    dict_stem_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.dict_stem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.dict_stem_id_seq;
       public          postgres    false    212                       0    0    dict_stem_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.dict_stem_id_seq OWNED BY public.dict.stem_id;
          public          postgres    false    211            ?            1259    16852    dict_word_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.dict_word_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.dict_word_id_seq;
       public          postgres    false    212                       0    0    dict_word_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.dict_word_id_seq OWNED BY public.dict.word_id;
          public          postgres    false    210            ?            1259    16916    word    TABLE     ?   CREATE TABLE public.word (
    word_id integer NOT NULL,
    word_name character varying(50) NOT NULL,
    word_def character varying(200),
    stem_id integer NOT NULL
);
    DROP TABLE public.word;
       public         heap    postgres    false            ?            1259    16915    word_stem_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.word_stem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.word_stem_id_seq;
       public          postgres    false    215                       0    0    word_stem_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.word_stem_id_seq OWNED BY public.word.stem_id;
          public          postgres    false    214            ?            1259    16914    word_word_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.word_word_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.word_word_id_seq;
       public          postgres    false    215                       0    0    word_word_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.word_word_id_seq OWNED BY public.word.word_id;
          public          postgres    false    213            d           2604    16857    dict word_id    DEFAULT     l   ALTER TABLE ONLY public.dict ALTER COLUMN word_id SET DEFAULT nextval('public.dict_word_id_seq'::regclass);
 ;   ALTER TABLE public.dict ALTER COLUMN word_id DROP DEFAULT;
       public          postgres    false    210    212    212            e           2604    16858    dict stem_id    DEFAULT     l   ALTER TABLE ONLY public.dict ALTER COLUMN stem_id SET DEFAULT nextval('public.dict_stem_id_seq'::regclass);
 ;   ALTER TABLE public.dict ALTER COLUMN stem_id DROP DEFAULT;
       public          postgres    false    212    211    212            f           2604    16919    word word_id    DEFAULT     l   ALTER TABLE ONLY public.word ALTER COLUMN word_id SET DEFAULT nextval('public.word_word_id_seq'::regclass);
 ;   ALTER TABLE public.word ALTER COLUMN word_id DROP DEFAULT;
       public          postgres    false    215    213    215            g           2604    16920    word stem_id    DEFAULT     l   ALTER TABLE ONLY public.word ALTER COLUMN stem_id SET DEFAULT nextval('public.word_stem_id_seq'::regclass);
 ;   ALTER TABLE public.word ALTER COLUMN stem_id DROP DEFAULT;
       public          postgres    false    215    214    215            ?          0    16854    dict 
   TABLE DATA           E   COPY public.dict (word_id, word_name, word_def, stem_id) FROM stdin;
    public          postgres    false    212   ?                  0    16916    word 
   TABLE DATA           E   COPY public.word (word_id, word_name, word_def, stem_id) FROM stdin;
    public          postgres    false    215   ?%                  0    0    dict_stem_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.dict_stem_id_seq', 55, true);
          public          postgres    false    211                       0    0    dict_word_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.dict_word_id_seq', 55, true);
          public          postgres    false    210                       0    0    word_stem_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.word_stem_id_seq', 44, true);
          public          postgres    false    214                       0    0    word_word_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.word_word_id_seq', 44, true);
          public          postgres    false    213            i           2606    16860    dict dict_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.dict
    ADD CONSTRAINT dict_pkey PRIMARY KEY (word_id);
 8   ALTER TABLE ONLY public.dict DROP CONSTRAINT dict_pkey;
       public            postgres    false    212            k           2606    16864    dict dict_stem_id_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.dict
    ADD CONSTRAINT dict_stem_id_key UNIQUE (stem_id);
 ?   ALTER TABLE ONLY public.dict DROP CONSTRAINT dict_stem_id_key;
       public            postgres    false    212            m           2606    16862    dict dict_word_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.dict
    ADD CONSTRAINT dict_word_name_key UNIQUE (word_name);
 A   ALTER TABLE ONLY public.dict DROP CONSTRAINT dict_word_name_key;
       public            postgres    false    212            o           2606    16922    word word_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.word
    ADD CONSTRAINT word_pkey PRIMARY KEY (word_id);
 8   ALTER TABLE ONLY public.word DROP CONSTRAINT word_pkey;
       public            postgres    false    215            q           2606    16924    word word_stem_id_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.word
    ADD CONSTRAINT word_stem_id_key UNIQUE (stem_id);
 ?   ALTER TABLE ONLY public.word DROP CONSTRAINT word_stem_id_key;
       public            postgres    false    215            ?   M  x?}VK??6]??`f?1?n?~3??j??#	`{?%?$vS?BR?nr? ?=r?lr???ƞ ?H?,???b??/?x?>[??Bܑ??U3??&u????⍰?,E?f?P4???M$JY??=?+y%Nη?Wr/?v???l'j??f?^??Y&????@??S[|???s?Q?6JO???Dj??,??M?u??Ϫ^?d?^9??Ѷ?y5ꈉ?[?e2??IG?Fp?GͶ ~"??<??fCA:?Y?0?δ45$ޒ???v?
?q??D?!????QʬJX??????V?2??y8???P???O?#?g?̮Dc]s?dB??HSTK??????+??#Ѭ???1iG/؞??}???]??F<jD.Z?3}V={?.X?K0??l/??c?]ZG?[
?ag??#???.?^?;kq??B??MD={?.gϚh\J@?H?8Oښx,w2???aspx??R`??@?3?*???8??ԺN?G??>DH2??Md????I]?9??Q????e??˧8Q??Z܏?Q????R???k8??L!~-??$Nx"?C?:??w?F;q?oz?G?k9?^F@??a?A͝,r1?k?i:??C? ?1??E?;(K1??tVoi? utM1<??A?A]?<8?Lc??Q?^??4??`????}?ޞ??F???J[?????7? ???u=???Т?E	?Zq	?箃h0??*?qK?,,B??E%H??<?;
`T????s$??????OX}%?+?6????ۨp"d?G??+Y\+ޘ?i? :t??Z7?j?	gk?G???l?ן@ ?i???T0????ޏ???n??̣?{?????$?xl?e???????N`
y?"(?ٽ~H'S^???Z???>̄?0V???R??5???[Q?d????=?j?s?8,?v?y?"?RR];k>b=-P?ݨTwF9??*?>???j?????L@??즵?w)f?H'???5??1?S3 }?\???_??1???R??g??=??n?W??ٮ=	?????r?:
?8IPR??ֵ\d&??u?Bp?4?Iy%?k?'?O?????L??s2?#?y????W?I?h???Z?7I??j?a?????,C)Y?b7??F?{1??f0ԡ???b?/8h?????t?Km?S8-|kr?u\N??;??Q ?[ukG"?I??	??iM???^V;1?}??cB|??h T3=\????3?? ?8G??a???8m?=??X??b+???2?????oވ*?U??O?\VEZ;q????\?uF???????ރ??u??J??????ob???}V?w#&?T??q?J??VJ?/?	?         ?  x??ֱ??0?Y?Spl? ?H?qpS??tk݅I?*R +wh??r߀???-
`ۻ?^So????6??.W?Z???:???V󙾥B?P???Ş>uT˪???!#????]?-?+?[??V?/?=j*}?a?U??.9???.???{?u??????RƮg??uU?uG??~j????D??곜?J,u,4*??c??mZ>?9???(?-]o[o???g?&????~j,c?u??8?v?:??J?ѩ??=????h??N??	?`K??7F<<#/ƈ?c$?O??od?3?????~?7??ب??Q??+???6곀???F}??F}??F}>???????|??? 1ꋇ?e|??"???Q_&?Q_f?Q_???,???????`??????_?Q????a??Z     