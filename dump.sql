PGDMP         %                w         	   yii2-rest    9.6.6    9.6.6 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    19984 	   yii2-rest    DATABASE     �   CREATE DATABASE "yii2-rest" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE "yii2-rest";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    28226    authors    TABLE     �   CREATE TABLE authors (
    id integer NOT NULL,
    first_name character varying(256) NOT NULL,
    last_name character varying(256),
    birth_year integer NOT NULL,
    country_id integer NOT NULL
);
    DROP TABLE public.authors;
       public         postgres    false    3            �            1259    28224    authors_id_seq    SEQUENCE     p   CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.authors_id_seq;
       public       postgres    false    3    195            �           0    0    authors_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE authors_id_seq OWNED BY authors.id;
            public       postgres    false    194            �            1259    28204    books    TABLE     �   CREATE TABLE books (
    id integer NOT NULL,
    issue_year integer NOT NULL,
    name character varying(512) NOT NULL,
    author_id integer NOT NULL,
    edition_id integer NOT NULL
);
    DROP TABLE public.books;
       public         postgres    false    3            �            1259    28202    books_id_seq    SEQUENCE     n   CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.books_id_seq;
       public       postgres    false    191    3            �           0    0    books_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE books_id_seq OWNED BY books.id;
            public       postgres    false    190            �            1259    28196    country    TABLE     �   CREATE TABLE country (
    id integer NOT NULL,
    code character varying(3) NOT NULL,
    name character varying(128) NOT NULL
);
    DROP TABLE public.country;
       public         postgres    false    3            �            1259    28194    country_id_seq    SEQUENCE     p   CREATE SEQUENCE country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.country_id_seq;
       public       postgres    false    189    3            �           0    0    country_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE country_id_seq OWNED BY country.id;
            public       postgres    false    188            �            1259    28215    editions    TABLE     ]   CREATE TABLE editions (
    id integer NOT NULL,
    name character varying(512) NOT NULL
);
    DROP TABLE public.editions;
       public         postgres    false    3            �            1259    28213    editions_id_seq    SEQUENCE     q   CREATE SEQUENCE editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.editions_id_seq;
       public       postgres    false    3    193            �           0    0    editions_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE editions_id_seq OWNED BY editions.id;
            public       postgres    false    192            �            1259    28176 	   migration    TABLE     `   CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);
    DROP TABLE public.migration;
       public         postgres    false    3            �            1259    28183    user    TABLE     �  CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    password_reset_token character varying(255),
    email character varying(255) NOT NULL,
    role smallint DEFAULT 10 NOT NULL,
    status smallint DEFAULT 10 NOT NULL,
    created_at integer NOT NULL,
    updated_at integer NOT NULL
);
    DROP TABLE public."user";
       public         postgres    false    3            �            1259    28181    user_id_seq    SEQUENCE     m   CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       postgres    false    3    187            �           0    0    user_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE user_id_seq OWNED BY "user".id;
            public       postgres    false    186            �           2604    28229 
   authors id    DEFAULT     Z   ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);
 9   ALTER TABLE public.authors ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    194    195    195            �           2604    28207    books id    DEFAULT     V   ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);
 7   ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190    191            �           2604    28199 
   country id    DEFAULT     Z   ALTER TABLE ONLY country ALTER COLUMN id SET DEFAULT nextval('country_id_seq'::regclass);
 9   ALTER TABLE public.country ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    189    189            �           2604    28218    editions id    DEFAULT     \   ALTER TABLE ONLY editions ALTER COLUMN id SET DEFAULT nextval('editions_id_seq'::regclass);
 :   ALTER TABLE public.editions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    192    193            �           2604    28186    user id    DEFAULT     V   ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    187    187            �          0    28226    authors 
   TABLE DATA               M   COPY authors (id, first_name, last_name, birth_year, country_id) FROM stdin;
    public       postgres    false    195   T0       �           0    0    authors_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('authors_id_seq', 16, true);
            public       postgres    false    194            �          0    28204    books 
   TABLE DATA               E   COPY books (id, issue_year, name, author_id, edition_id) FROM stdin;
    public       postgres    false    191   �0       �           0    0    books_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('books_id_seq', 24, true);
            public       postgres    false    190            �          0    28196    country 
   TABLE DATA               *   COPY country (id, code, name) FROM stdin;
    public       postgres    false    189   U2       �           0    0    country_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('country_id_seq', 2, true);
            public       postgres    false    188            �          0    28215    editions 
   TABLE DATA               %   COPY editions (id, name) FROM stdin;
    public       postgres    false    193   �2       �           0    0    editions_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('editions_id_seq', 3, true);
            public       postgres    false    192            |          0    28176 	   migration 
   TABLE DATA               1   COPY migration (version, apply_time) FROM stdin;
    public       postgres    false    185   
3       ~          0    28183    user 
   TABLE DATA               �   COPY "user" (id, username, auth_key, password_hash, password_reset_token, email, role, status, created_at, updated_at) FROM stdin;
    public       postgres    false    187   U3       �           0    0    user_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('user_id_seq', 1, false);
            public       postgres    false    186                       2606    28234    authors authors_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public         postgres    false    195    195            �           2606    28212    books books_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public         postgres    false    191    191            �           2606    28201    country country_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public         postgres    false    189    189                       2606    28223    editions editions_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY editions
    ADD CONSTRAINT editions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.editions DROP CONSTRAINT editions_pkey;
       public         postgres    false    193    193            �           2606    28180    migration migration_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);
 B   ALTER TABLE ONLY public.migration DROP CONSTRAINT migration_pkey;
       public         postgres    false    185    185            �           2606    28193    user user_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    187    187                       2606    28245    books books_author_fkey    FK CONSTRAINT     l   ALTER TABLE ONLY books
    ADD CONSTRAINT books_author_fkey FOREIGN KEY (author_id) REFERENCES authors(id);
 A   ALTER TABLE ONLY public.books DROP CONSTRAINT books_author_fkey;
       public       postgres    false    195    191    2051                       2606    28240    books books_edition_fkey    FK CONSTRAINT     o   ALTER TABLE ONLY books
    ADD CONSTRAINT books_edition_fkey FOREIGN KEY (edition_id) REFERENCES editions(id);
 B   ALTER TABLE ONLY public.books DROP CONSTRAINT books_edition_fkey;
       public       postgres    false    193    191    2049                       2606    28235    authors country_id_fkey    FK CONSTRAINT     m   ALTER TABLE ONLY authors
    ADD CONSTRAINT country_id_fkey FOREIGN KEY (country_id) REFERENCES country(id);
 A   ALTER TABLE ONLY public.authors DROP CONSTRAINT country_id_fkey;
       public       postgres    false    195    2045    189            �   ~   x��A
�@�3�'F����I��w��``�����ٛ���{Z����P��A��ߐQĺ��N�D�+��,x`�+~(~�ł�m�Ax3�>n�Kބʭ.M,�j�T�$���i��IwM7      �   c  x��RKNA]w��w������� &�� u�DŸd��
�n�j�n:���몎.ϲ���5��E�?/�lY(Q���>WX�a�
K��h���.���%���I")�/�r��&W��^;e������Ҭ����a�-����{c	���Z�a��medsȐ]�F��j�0C-c|�H��D����{5I�R�t]̨�#I<�L_�R���/CE>��&��,��&��fk;�� ��2�넒q�;���(1����^�Ҫ�>L�ģ�,��H���ҷ�>E1������N��;�ۘm�.F�z�j���6�M�ie��i�x�0}b�)E�.�Q�dK�YlN�*!����S���V�      �   .   x�# ��2	US	США
1	RU	Россия
\.


�f      �   g   x�3�0���[.l��ta��{.6^�uaǅ�
@�}�((]�uaPh߅��@5����8����RR��󳋹���dm���}!Ѐ�(q��qqq �?�      |   ;   x��5 �x(��X��ihjfjhhnibɕkhl`jdod`hbb���Y�65����� A*      ~      x������ � �     