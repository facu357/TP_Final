PGDMP                     
    z            TpFinal    10.22    10.22                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    33247    TpFinal    DATABASE     ?   CREATE DATABASE "TpFinal" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "TpFinal";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            ?            1259    33248    camas    TABLE     }   CREATE TABLE public.camas (
    numero_cama integer NOT NULL,
    estado character varying,
    numero_habitacion integer
);
    DROP TABLE public.camas;
       public         postgres    false    3            ?            1259    33254    habitaciones    TABLE     g   CREATE TABLE public.habitaciones (
    numero_habitacion integer NOT NULL,
    id_ubicacion integer
);
     DROP TABLE public.habitaciones;
       public         postgres    false    3            ?            1259    33257    internaciones    TABLE     ?   CREATE TABLE public.internaciones (
    id_internacion integer NOT NULL,
    paciente character varying,
    fecha date,
    diagnostico character varying,
    numero_cama integer
);
 !   DROP TABLE public.internaciones;
       public         postgres    false    3            ?            1259    33263     internaciones_id_internacion_seq    SEQUENCE     ?   CREATE SEQUENCE public.internaciones_id_internacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.internaciones_id_internacion_seq;
       public       postgres    false    3    198                       0    0     internaciones_id_internacion_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.internaciones_id_internacion_seq OWNED BY public.internaciones.id_internacion;
            public       postgres    false    199            ?            1259    33265    ubicaciones    TABLE     ?   CREATE TABLE public.ubicaciones (
    id_ubicacion integer NOT NULL,
    hospital character varying,
    nombre character varying
);
    DROP TABLE public.ubicaciones;
       public         postgres    false    3            ?            1259    33271    ubicaciones_id_ubicacion_seq    SEQUENCE     ?   CREATE SEQUENCE public.ubicaciones_id_ubicacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ubicaciones_id_ubicacion_seq;
       public       postgres    false    200    3                       0    0    ubicaciones_id_ubicacion_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.ubicaciones_id_ubicacion_seq OWNED BY public.ubicaciones.id_ubicacion;
            public       postgres    false    201            
           2604    33273    internaciones id_internacion    DEFAULT     ?   ALTER TABLE ONLY public.internaciones ALTER COLUMN id_internacion SET DEFAULT nextval('public.internaciones_id_internacion_seq'::regclass);
 K   ALTER TABLE public.internaciones ALTER COLUMN id_internacion DROP DEFAULT;
       public       postgres    false    199    198            ?
           2604    33274    ubicaciones id_ubicacion    DEFAULT     ?   ALTER TABLE ONLY public.ubicaciones ALTER COLUMN id_ubicacion SET DEFAULT nextval('public.ubicaciones_id_ubicacion_seq'::regclass);
 G   ALTER TABLE public.ubicaciones ALTER COLUMN id_ubicacion DROP DEFAULT;
       public       postgres    false    201    200                      0    33248    camas 
   TABLE DATA               G   COPY public.camas (numero_cama, estado, numero_habitacion) FROM stdin;
    public       postgres    false    196   !                 0    33254    habitaciones 
   TABLE DATA               G   COPY public.habitaciones (numero_habitacion, id_ubicacion) FROM stdin;
    public       postgres    false    197   q!                 0    33257    internaciones 
   TABLE DATA               b   COPY public.internaciones (id_internacion, paciente, fecha, diagnostico, numero_cama) FROM stdin;
    public       postgres    false    198   ?!       	          0    33265    ubicaciones 
   TABLE DATA               E   COPY public.ubicaciones (id_ubicacion, hospital, nombre) FROM stdin;
    public       postgres    false    200    "                  0    0     internaciones_id_internacion_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.internaciones_id_internacion_seq', 48, true);
            public       postgres    false    199                       0    0    ubicaciones_id_ubicacion_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ubicaciones_id_ubicacion_seq', 7, true);
            public       postgres    false    201            ?
           2606    33276    ubicaciones ok_ubicacion 
   CONSTRAINT     `   ALTER TABLE ONLY public.ubicaciones
    ADD CONSTRAINT ok_ubicacion PRIMARY KEY (id_ubicacion);
 B   ALTER TABLE ONLY public.ubicaciones DROP CONSTRAINT ok_ubicacion;
       public         postgres    false    200            ?
           2606    33278    camas pk_cama 
   CONSTRAINT     T   ALTER TABLE ONLY public.camas
    ADD CONSTRAINT pk_cama PRIMARY KEY (numero_cama);
 7   ALTER TABLE ONLY public.camas DROP CONSTRAINT pk_cama;
       public         postgres    false    196            ?
           2606    33280    habitaciones pk_habitacion 
   CONSTRAINT     g   ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT pk_habitacion PRIMARY KEY (numero_habitacion);
 D   ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT pk_habitacion;
       public         postgres    false    197            ?
           2606    33282    internaciones pk_internacion 
   CONSTRAINT     f   ALTER TABLE ONLY public.internaciones
    ADD CONSTRAINT pk_internacion PRIMARY KEY (id_internacion);
 F   ALTER TABLE ONLY public.internaciones DROP CONSTRAINT pk_internacion;
       public         postgres    false    198            ?
           2606    33283    camas fk_cama_habitacion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.camas
    ADD CONSTRAINT fk_cama_habitacion FOREIGN KEY (numero_habitacion) REFERENCES public.habitaciones(numero_habitacion);
 B   ALTER TABLE ONLY public.camas DROP CONSTRAINT fk_cama_habitacion;
       public       postgres    false    197    2692    196            ?
           2606    33288 !   internaciones fk_internacion_cama    FK CONSTRAINT     ?   ALTER TABLE ONLY public.internaciones
    ADD CONSTRAINT fk_internacion_cama FOREIGN KEY (numero_cama) REFERENCES public.camas(numero_cama);
 K   ALTER TABLE ONLY public.internaciones DROP CONSTRAINT fk_internacion_cama;
       public       postgres    false    196    198    2690            ?
           2606    33293    habitaciones fk_ubicacion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT fk_ubicacion FOREIGN KEY (id_ubicacion) REFERENCES public.ubicaciones(id_ubicacion);
 C   ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT fk_ubicacion;
       public       postgres    false    200    197    2696               Z   x?34??O.-HLI?4?2?tI-·r????\??\CTզp????QL???%M?%M?,P?f?Z??:M?L?匸LP]??Đ+F??? ?>?         9   x???  B?s?H[????s??$0?T?Z?Hluԍ??IS??i(????7 |v	?         V   x?U??
?  ???/?K?>#?c?iQX??]??^???rM??h?9??,??d?Xzݹ}A??E!??`?G?(?T??6 ?=?l      	   E   x?3?K-JTpJ,*?/?HM?L,):?6??E?=3/59?'?$e?"Z7D?J,?L-?????? 9?#     