PGDMP                 
        {         
   callampita    15.3    15.3 @    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            W           1262    16558 
   callampita    DATABASE     }   CREATE DATABASE callampita WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE callampita;
                postgres    false            �            1259    16724    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false            �            1259    16778    defensas    TABLE     f   CREATE TABLE public.defensas (
    id integer NOT NULL,
    defensa character varying(45) NOT NULL
);
    DROP TABLE public.defensas;
       public         heap    postgres    false            �            1259    16777    defensas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.defensas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.defensas_id_seq;
       public          postgres    false    226            X           0    0    defensas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.defensas_id_seq OWNED BY public.defensas.id;
          public          postgres    false    225            �            1259    16880 
   diplomacia    TABLE     �   CREATE TABLE public.diplomacia (
    id_reino_1 integer NOT NULL,
    id_reino_2 integer NOT NULL,
    es_aliado boolean DEFAULT false NOT NULL
);
    DROP TABLE public.diplomacia;
       public         heap    postgres    false            �            1259    16749    karts    TABLE     �   CREATE TABLE public.karts (
    id integer NOT NULL,
    color character varying(45) NOT NULL,
    id_personaje integer NOT NULL,
    modelo character varying(45) NOT NULL,
    velocidad_maxima integer
);
    DROP TABLE public.karts;
       public         heap    postgres    false            �            1259    16748    karts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.karts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.karts_id_seq;
       public          postgres    false    220            Y           0    0    karts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.karts_id_seq OWNED BY public.karts.id;
          public          postgres    false    219            �            1259    16767    personaje_habita_reino    TABLE     �   CREATE TABLE public.personaje_habita_reino (
    id_personaje integer NOT NULL,
    id_reino integer NOT NULL,
    es_gobernante boolean DEFAULT false NOT NULL,
    fecha_registro date NOT NULL
);
 *   DROP TABLE public.personaje_habita_reino;
       public         heap    postgres    false            �            1259    16762    personaje_tiene_trabajo    TABLE     �   CREATE TABLE public.personaje_tiene_trabajo (
    id_trabajo integer NOT NULL,
    id_personaje integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_termino date
);
 +   DROP TABLE public.personaje_tiene_trabajo;
       public         heap    postgres    false            �            1259    16734 
   personajes    TABLE     �   CREATE TABLE public.personajes (
    id integer NOT NULL,
    fuerza integer DEFAULT 0 NOT NULL,
    nombre character varying(45) NOT NULL,
    objeto character varying(45) NOT NULL,
    fecha_nacimiento date NOT NULL
);
    DROP TABLE public.personajes;
       public         heap    postgres    false            �            1259    16733    personajes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.personajes_id_seq;
       public          postgres    false    216            Z           0    0    personajes_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.personajes_id_seq OWNED BY public.personajes.id;
          public          postgres    false    215            �            1259    16784    reino_ocupa_defensa    TABLE     l   CREATE TABLE public.reino_ocupa_defensa (
    id_defensa integer NOT NULL,
    id_reino integer NOT NULL
);
 '   DROP TABLE public.reino_ocupa_defensa;
       public         heap    postgres    false            �            1259    16756    reinos    TABLE     �   CREATE TABLE public.reinos (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    superficie integer NOT NULL,
    ubicacion character varying(45) NOT NULL
);
    DROP TABLE public.reinos;
       public         heap    postgres    false            �            1259    16755    reinos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reinos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.reinos_id_seq;
       public          postgres    false    222            [           0    0    reinos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.reinos_id_seq OWNED BY public.reinos.id;
          public          postgres    false    221            �            1259    16742    trabajos    TABLE     �   CREATE TABLE public.trabajos (
    id integer NOT NULL,
    sueldo integer NOT NULL,
    descripcion character varying(45) NOT NULL
);
    DROP TABLE public.trabajos;
       public         heap    postgres    false            �            1259    16741    trabajos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trabajos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.trabajos_id_seq;
       public          postgres    false    218            \           0    0    trabajos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.trabajos_id_seq OWNED BY public.trabajos.id;
          public          postgres    false    217            �           2604    16781    defensas id    DEFAULT     j   ALTER TABLE ONLY public.defensas ALTER COLUMN id SET DEFAULT nextval('public.defensas_id_seq'::regclass);
 :   ALTER TABLE public.defensas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16752    karts id    DEFAULT     d   ALTER TABLE ONLY public.karts ALTER COLUMN id SET DEFAULT nextval('public.karts_id_seq'::regclass);
 7   ALTER TABLE public.karts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    16737    personajes id    DEFAULT     n   ALTER TABLE ONLY public.personajes ALTER COLUMN id SET DEFAULT nextval('public.personajes_id_seq'::regclass);
 <   ALTER TABLE public.personajes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    16759 	   reinos id    DEFAULT     f   ALTER TABLE ONLY public.reinos ALTER COLUMN id SET DEFAULT nextval('public.reinos_id_seq'::regclass);
 8   ALTER TABLE public.reinos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16745    trabajos id    DEFAULT     j   ALTER TABLE ONLY public.trabajos ALTER COLUMN id SET DEFAULT nextval('public.trabajos_id_seq'::regclass);
 :   ALTER TABLE public.trabajos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            C          0    16724    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   �N       O          0    16778    defensas 
   TABLE DATA           /   COPY public.defensas (id, defensa) FROM stdin;
    public          postgres    false    226   R       Q          0    16880 
   diplomacia 
   TABLE DATA           G   COPY public.diplomacia (id_reino_1, id_reino_2, es_aliado) FROM stdin;
    public          postgres    false    228   uR       I          0    16749    karts 
   TABLE DATA           R   COPY public.karts (id, color, id_personaje, modelo, velocidad_maxima) FROM stdin;
    public          postgres    false    220   �R       M          0    16767    personaje_habita_reino 
   TABLE DATA           g   COPY public.personaje_habita_reino (id_personaje, id_reino, es_gobernante, fecha_registro) FROM stdin;
    public          postgres    false    224   S       L          0    16762    personaje_tiene_trabajo 
   TABLE DATA           h   COPY public.personaje_tiene_trabajo (id_trabajo, id_personaje, fecha_inicio, fecha_termino) FROM stdin;
    public          postgres    false    223   2S       E          0    16734 
   personajes 
   TABLE DATA           R   COPY public.personajes (id, fuerza, nombre, objeto, fecha_nacimiento) FROM stdin;
    public          postgres    false    216   pS       P          0    16784    reino_ocupa_defensa 
   TABLE DATA           C   COPY public.reino_ocupa_defensa (id_defensa, id_reino) FROM stdin;
    public          postgres    false    227   :T       K          0    16756    reinos 
   TABLE DATA           C   COPY public.reinos (id, nombre, superficie, ubicacion) FROM stdin;
    public          postgres    false    222   _T       G          0    16742    trabajos 
   TABLE DATA           ;   COPY public.trabajos (id, sueldo, descripcion) FROM stdin;
    public          postgres    false    218   �T       ]           0    0    defensas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.defensas_id_seq', 4, true);
          public          postgres    false    225            ^           0    0    karts_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.karts_id_seq', 3, true);
          public          postgres    false    219            _           0    0    personajes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.personajes_id_seq', 8, true);
          public          postgres    false    215            `           0    0    reinos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.reinos_id_seq', 3, true);
          public          postgres    false    221            a           0    0    trabajos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.trabajos_id_seq', 4, true);
          public          postgres    false    217            �           2606    16732 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    214            �           2606    16783    defensas defensas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.defensas
    ADD CONSTRAINT defensas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.defensas DROP CONSTRAINT defensas_pkey;
       public            postgres    false    226            �           2606    16885    diplomacia diplomacia_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.diplomacia
    ADD CONSTRAINT diplomacia_pkey PRIMARY KEY (id_reino_1, id_reino_2);
 D   ALTER TABLE ONLY public.diplomacia DROP CONSTRAINT diplomacia_pkey;
       public            postgres    false    228    228            �           2606    16754    karts karts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.karts
    ADD CONSTRAINT karts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.karts DROP CONSTRAINT karts_pkey;
       public            postgres    false    220            �           2606    16771 2   personaje_habita_reino personaje_habita_reino_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_pkey PRIMARY KEY (id_reino, id_personaje);
 \   ALTER TABLE ONLY public.personaje_habita_reino DROP CONSTRAINT personaje_habita_reino_pkey;
       public            postgres    false    224    224            �           2606    16766 4   personaje_tiene_trabajo personaje_tiene_trabajo_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_pkey PRIMARY KEY (id_trabajo, id_personaje);
 ^   ALTER TABLE ONLY public.personaje_tiene_trabajo DROP CONSTRAINT personaje_tiene_trabajo_pkey;
       public            postgres    false    223    223            �           2606    16740    personajes personajes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.personajes
    ADD CONSTRAINT personajes_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.personajes DROP CONSTRAINT personajes_pkey;
       public            postgres    false    216            �           2606    16788 ,   reino_ocupa_defensa reino_ocupa_defensa_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.reino_ocupa_defensa
    ADD CONSTRAINT reino_ocupa_defensa_pkey PRIMARY KEY (id_defensa, id_reino);
 V   ALTER TABLE ONLY public.reino_ocupa_defensa DROP CONSTRAINT reino_ocupa_defensa_pkey;
       public            postgres    false    227    227            �           2606    16761    reinos reinos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.reinos
    ADD CONSTRAINT reinos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.reinos DROP CONSTRAINT reinos_pkey;
       public            postgres    false    222            �           2606    16747    trabajos trabajos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.trabajos
    ADD CONSTRAINT trabajos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.trabajos DROP CONSTRAINT trabajos_pkey;
       public            postgres    false    218            �           1259    18537    personajes_nombre_key    INDEX     U   CREATE UNIQUE INDEX personajes_nombre_key ON public.personajes USING btree (nombre);
 )   DROP INDEX public.personajes_nombre_key;
       public            postgres    false    216            �           2606    16886 %   diplomacia diplomacia_id_reino_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.diplomacia
    ADD CONSTRAINT diplomacia_id_reino_1_fkey FOREIGN KEY (id_reino_1) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.diplomacia DROP CONSTRAINT diplomacia_id_reino_1_fkey;
       public          postgres    false    222    3233    228            �           2606    16891 %   diplomacia diplomacia_id_reino_2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.diplomacia
    ADD CONSTRAINT diplomacia_id_reino_2_fkey FOREIGN KEY (id_reino_2) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.diplomacia DROP CONSTRAINT diplomacia_id_reino_2_fkey;
       public          postgres    false    222    228    3233            �           2606    16791    karts karts_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.karts
    ADD CONSTRAINT karts_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 G   ALTER TABLE ONLY public.karts DROP CONSTRAINT karts_id_personaje_fkey;
       public          postgres    false    216    3227    220            �           2606    16806 ?   personaje_habita_reino personaje_habita_reino_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 i   ALTER TABLE ONLY public.personaje_habita_reino DROP CONSTRAINT personaje_habita_reino_id_personaje_fkey;
       public          postgres    false    216    224    3227            �           2606    16811 ;   personaje_habita_reino personaje_habita_reino_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_id_reino_fkey FOREIGN KEY (id_reino) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 e   ALTER TABLE ONLY public.personaje_habita_reino DROP CONSTRAINT personaje_habita_reino_id_reino_fkey;
       public          postgres    false    222    224    3233            �           2606    16801 A   personaje_tiene_trabajo personaje_tiene_trabajo_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 k   ALTER TABLE ONLY public.personaje_tiene_trabajo DROP CONSTRAINT personaje_tiene_trabajo_id_personaje_fkey;
       public          postgres    false    223    216    3227            �           2606    16796 ?   personaje_tiene_trabajo personaje_tiene_trabajo_id_trabajo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_id_trabajo_fkey FOREIGN KEY (id_trabajo) REFERENCES public.trabajos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 i   ALTER TABLE ONLY public.personaje_tiene_trabajo DROP CONSTRAINT personaje_tiene_trabajo_id_trabajo_fkey;
       public          postgres    false    223    3229    218            �           2606    16831 7   reino_ocupa_defensa reino_ocupa_defensa_id_defensa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reino_ocupa_defensa
    ADD CONSTRAINT reino_ocupa_defensa_id_defensa_fkey FOREIGN KEY (id_defensa) REFERENCES public.defensas(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 a   ALTER TABLE ONLY public.reino_ocupa_defensa DROP CONSTRAINT reino_ocupa_defensa_id_defensa_fkey;
       public          postgres    false    227    3239    226            �           2606    16826 5   reino_ocupa_defensa reino_ocupa_defensa_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reino_ocupa_defensa
    ADD CONSTRAINT reino_ocupa_defensa_id_reino_fkey FOREIGN KEY (id_reino) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 _   ALTER TABLE ONLY public.reino_ocupa_defensa DROP CONSTRAINT reino_ocupa_defensa_id_reino_fkey;
       public          postgres    false    227    3233    222            C   e  x���]�[7���Ut��,�+`P���)0	����L�Lj\����Gꜣ��9c�����e-���1FG9</Sh�"q>�x��L��)|��Xn�l �U�k�J�qk��==�>1��6�oo� ��Qn_�e]>�z�URG�o�x��S7��M���h��n�4��^v�+��X,s�y<���6-��'7�%������6N����d�;�A�]����������U��'�Y��������-�:'1�h^��k�}���up�u�-^W��Y݉E�?�0#������_}�V�j�A�d�&ѥM��|�3xx��%��A�m&��tɮ;t��݃���ͫdƻc���T_�)����o��9��
�V�W���6�3�Rp�N�a�u�ҷ���SCg_�}��dg�jy����a�s��?��*��>HP�)����+<%��G��V�������#���Q��gf't�c��@j�x���j&'`b�З�%=���c���<c/x�ދ�M�Yj]ӛ��~��i-u(X)�G�ZeS��"��07n�(�!����J�nM�r�Ԣ��4���1����=|�~��#���(v��:Ae�Y����J�2)*1/����gS��eݥSd�e�|�v�a��OZ�,Π�C�J/�?����t��o��~p�n7�rmT^���GtK�0r��C���.�|'h�����R|L+jǦ�x�$�<S�K��4�_|_��t��ۏ��U}�����1j$v�ۚ5�j�SFE�u�]4�@>��jum݉�}�REV�p,�c�Ì�9$������Q�߳ړ���{vU���s��/Z���H^[��t�^�O�ƀ      O   V   x���� �3[��)��F�@P�bBY�`c�3��@f�'Uh0��;Q��y�ṑ�I��P��C��Ԯ���授^�6:      Q      x�3�4�,�2�4�F@2�+F��� +cw      I   U   x�E�K
�0���)zI+��q���4bSO��َG�g��kK�$F��g
��KR,��Gu����W���R��5�)3m}���      M      x�3�4�,�4200�50"�=... +R�      L   .   x�3�4�420��50" ��@����2�4r���21~\1z\\\ �d#      E   �   x�-�A�� �3!XC�/{��A������+���ԭ!� U�T��Θ�4�!�"��E��+m	v�gꁋe,��di�$0�M�x�I��	\o�R����"�<����wZp����<:��w���xt`�)���9�~p�����gy�X{���R�ߎ}ڣ�i�9������x�{C�/T�D�      P      x�3�4�2�4����� ��      K   G   x��A
�0���1�*���J�RMBR��s��z��]MQ��o���V3��c����3Z��nt.D����      G   Y   x����  �s;E'0���KQb��V��r}��!8��YY�ys�ʆ��&2�X_b!-;��e�峢� �X��}]��cxl��7��     