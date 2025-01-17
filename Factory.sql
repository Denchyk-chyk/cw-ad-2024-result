PGDMP  *    *                |           factory    16.3    16.3    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    factory    DATABASE     ~   CREATE DATABASE factory WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Ukrainian_Ukraine.1251';
    DROP DATABASE factory;
                postgres    false            �           0    0    DATABASE factory    ACL        GRANT CONNECT ON DATABASE factory TO user_0;
GRANT CONNECT ON DATABASE factory TO admin_0;
GRANT ALL ON DATABASE factory TO admin_1;
GRANT ALL ON DATABASE factory TO admin_2;
GRANT ALL ON DATABASE factory TO user_n;
GRANT ALL ON DATABASE factory TO trial;
                   postgres    false    5251            !           1255    33167    insert_default_values(integer)    FUNCTION     �   CREATE FUNCTION public.insert_default_values(p_count integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    FOR i IN 1..p_count LOOP
        INSERT INTO brigades_staff (id) VALUES (DEFAULT);
    END LOOP;
END;
$$;
 =   DROP FUNCTION public.insert_default_values(p_count integer);
       public          postgres    false            "           1255    33168    insert_default_values(bigint)    FUNCTION     �   CREATE FUNCTION public.insert_default_values(p_count bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    FOR i IN 1..p_count LOOP
        INSERT INTO brigades_staff (brigade) VALUES (1);
    END LOOP;
END;
$$;
 <   DROP FUNCTION public.insert_default_values(p_count bigint);
       public          postgres    false                       1255    33063    insert_multiple_times()    FUNCTION       CREATE FUNCTION public.insert_multiple_times() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    i INTEGER := 0;
BEGIN
    WHILE i < 29 LOOP
        INSERT INTO engineers VALUES (nextval('zero'), 3);
        i := i + 1;
    END LOOP;
END;
$$;
 .   DROP FUNCTION public.insert_multiple_times();
       public          postgres    false                       1255    33071    insert_multiple_times(integer)    FUNCTION     "  CREATE FUNCTION public.insert_multiple_times(inserts_count integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    i INTEGER := 0;
BEGIN
    WHILE i < inserts_count LOOP
        INSERT INTO engineers VALUES (nextval('zero'), 5);
        i := i + 1;
    END LOOP;
END;
$$;
 C   DROP FUNCTION public.insert_multiple_times(inserts_count integer);
       public          postgres    false                       1255    33066 '   insert_multiple_times(integer, integer)    FUNCTION     -  CREATE FUNCTION public.insert_multiple_times(inserts_count integer, category integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    i INTEGER := 0;
BEGIN
    WHILE i < inserts_count LOOP
        INSERT INTO engineers(category) VALUES (5);
        i := i + 1;
    END LOOP;
END;
$$;
 U   DROP FUNCTION public.insert_multiple_times(inserts_count integer, category integer);
       public          postgres    false            '           1255    33185    insert_random_values()    FUNCTION       CREATE FUNCTION public.insert_random_values() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    i INT := 1;
    random_date DATE;
    random_number INT;
BEGIN
    WHILE i <= 2500 LOOP
        random_date := DATE '2024-02-01' + (FLOOR(RANDOM() * (DATE '2025-01-31' - DATE '2024-02-01')::INTEGER)) * INTERVAL '1 day';
        random_number := floor(random() * 15) + 1;
        INSERT INTO production (product, time) VALUES (random_number, random_date);
        i := i + 1;
    END LOOP;
END;
$$;
 -   DROP FUNCTION public.insert_random_values();
       public          postgres    false                        1255    33143    insert_values(integer, integer)    FUNCTION     �   CREATE FUNCTION public.insert_values(count integer, value integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    FOR i IN 1..count LOOP
        INSERT INTO brigades_specialization (product) VALUES (value);
    END LOOP;
END;
$$;
 B   DROP FUNCTION public.insert_values(count integer, value integer);
       public          postgres    false                       1259    33038    bikes    TABLE     g   CREATE TABLE public.bikes (
    id integer NOT NULL,
    maneuverability integer,
    speed integer
);
    DROP TABLE public.bikes;
       public         heap    postgres    false                       1259    33037    bikes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bikes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.bikes_id_seq;
       public          postgres    false    268            �           0    0    bikes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.bikes_id_seq OWNED BY public.bikes.id;
          public          postgres    false    267            �            1259    16767    brigades    TABLE     p   CREATE TABLE public.brigades (
    id integer NOT NULL,
    name text,
    foreman integer,
    site integer
);
    DROP TABLE public.brigades;
       public         heap    postgres    false            �            1259    16766    brigades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brigades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.brigades_id_seq;
       public          postgres    false    246            �           0    0    brigades_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.brigades_id_seq OWNED BY public.brigades.id;
          public          postgres    false    245                       1259    33151    brigades_specialization    TABLE     ^   CREATE TABLE public.brigades_specialization (
    id integer NOT NULL,
    product integer
);
 +   DROP TABLE public.brigades_specialization;
       public         heap    postgres    false                       1259    33150    brigades_specialization_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brigades_specialization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.brigades_specialization_id_seq;
       public          postgres    false    273            �           0    0    brigades_specialization_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.brigades_specialization_id_seq OWNED BY public.brigades_specialization.id;
          public          postgres    false    272            �            1259    16788    brigades_staff    TABLE     U   CREATE TABLE public.brigades_staff (
    id integer NOT NULL,
    brigade integer
);
 "   DROP TABLE public.brigades_staff;
       public         heap    postgres    false            �            1259    16787    brigades_staff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brigades_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.brigades_staff_id_seq;
       public          postgres    false    248            �           0    0    brigades_staff_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.brigades_staff_id_seq OWNED BY public.brigades_staff.id;
          public          postgres    false    247                       1259    33050    buses    TABLE     g   CREATE TABLE public.buses (
    id integer NOT NULL,
    capacity integer,
    spaciousness integer
);
    DROP TABLE public.buses;
       public         heap    postgres    false                       1259    33049    buses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.buses_id_seq;
       public          postgres    false    270            �           0    0    buses_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.buses_id_seq OWNED BY public.buses.id;
          public          postgres    false    269                       1259    33000    cars    TABLE     S   CREATE TABLE public.cars (
    id integer NOT NULL,
    ease_of_driving integer
);
    DROP TABLE public.cars;
       public         heap    postgres    false                       1259    32999    cars_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cars_id_seq;
       public          postgres    false    262            �           0    0    cars_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;
          public          postgres    false    261            �            1259    16528    engineer_categories    TABLE     T   CREATE TABLE public.engineer_categories (
    id integer NOT NULL,
    name text
);
 '   DROP TABLE public.engineer_categories;
       public         heap    postgres    false            �            1259    16527    engineer_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.engineer_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.engineer_categories_id_seq;
       public          postgres    false    218            �           0    0    engineer_categories_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.engineer_categories_id_seq OWNED BY public.engineer_categories.id;
          public          postgres    false    217            �            1259    16595 	   engineers    TABLE     Q   CREATE TABLE public.engineers (
    id integer NOT NULL,
    category integer
);
    DROP TABLE public.engineers;
       public         heap    postgres    false                       1259    33012 	   excavator    TABLE     U   CREATE TABLE public.excavator (
    id integer NOT NULL,
    productivity integer
);
    DROP TABLE public.excavator;
       public         heap    postgres    false                       1259    33011    excavator_id_seq    SEQUENCE     �   CREATE SEQUENCE public.excavator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.excavator_id_seq;
       public          postgres    false    264            �           0    0    excavator_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.excavator_id_seq OWNED BY public.excavator.id;
          public          postgres    false    263                       1259    49211 	   first_sec    SEQUENCE     s   CREATE SEQUENCE public.first_sec
    START WITH 28
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.first_sec;
       public          postgres    false            �            1259    16660    grinders    TABLE     X   CREATE TABLE public.grinders (
    id integer NOT NULL,
    processing_level integer
);
    DROP TABLE public.grinders;
       public         heap    postgres    false            �            1259    16650 
   installers    TABLE     O   CREATE TABLE public.installers (
    id integer NOT NULL,
    speed integer
);
    DROP TABLE public.installers;
       public         heap    postgres    false            �            1259    16806    laboratories    TABLE     M   CREATE TABLE public.laboratories (
    id integer NOT NULL,
    name text
);
     DROP TABLE public.laboratories;
       public         heap    postgres    false            �            1259    16805    laboratories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.laboratories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.laboratories_id_seq;
       public          postgres    false    250            �           0    0    laboratories_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.laboratories_id_seq OWNED BY public.laboratories.id;
          public          postgres    false    249            �            1259    16539    laborer_categories    TABLE     S   CREATE TABLE public.laborer_categories (
    id integer NOT NULL,
    name text
);
 &   DROP TABLE public.laborer_categories;
       public         heap    postgres    false            �            1259    16538    laborer_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.laborer_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.laborer_categories_id_seq;
       public          postgres    false    220            �           0    0    laborer_categories_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.laborer_categories_id_seq OWNED BY public.laborer_categories.id;
          public          postgres    false    219            �            1259    16580    laborers    TABLE     P   CREATE TABLE public.laborers (
    id integer NOT NULL,
    category integer
);
    DROP TABLE public.laborers;
       public         heap    postgres    false            �            1259    16670 
   management    TABLE     �   CREATE TABLE public.management (
    id integer NOT NULL,
    production_efficiency integer,
    staff_management integer,
    standards_compliance integer
);
    DROP TABLE public.management;
       public         heap    postgres    false            �            1259    16630    millers    TABLE     O   CREATE TABLE public.millers (
    id integer NOT NULL,
    accuracy integer
);
    DROP TABLE public.millers;
       public         heap    postgres    false                       1259    40989 	   processes    TABLE     J   CREATE TABLE public.processes (
    id integer NOT NULL,
    name text
);
    DROP TABLE public.processes;
       public         heap    postgres    false                       1259    40988    processes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.processes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.processes_id_seq;
       public          postgres    false    275            �           0    0    processes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.processes_id_seq OWNED BY public.processes.id;
          public          postgres    false    274                       1259    41000 
   processing    TABLE     g   CREATE TABLE public.processing (
    id integer NOT NULL,
    category integer,
    process integer
);
    DROP TABLE public.processing;
       public         heap    postgres    false                       1259    40999    processing_id_seq    SEQUENCE     �   CREATE SEQUENCE public.processing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.processing_id_seq;
       public          postgres    false    277            �           0    0    processing_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.processing_id_seq OWNED BY public.processing.id;
          public          postgres    false    276            �            1259    32797    product_categories    TABLE     S   CREATE TABLE public.product_categories (
    id integer NOT NULL,
    name text
);
 &   DROP TABLE public.product_categories;
       public         heap    postgres    false            �            1259    32796    product_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.product_categories_id_seq;
       public          postgres    false    254            �           0    0    product_categories_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;
          public          postgres    false    253            
           1259    33024 
   production    TABLE     b   CREATE TABLE public.production (
    id integer NOT NULL,
    product integer,
    "time" date
);
    DROP TABLE public.production;
       public         heap    postgres    false            	           1259    33023    production_id_seq    SEQUENCE     �   CREATE SEQUENCE public.production_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.production_id_seq;
       public          postgres    false    266            �           0    0    production_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.production_id_seq OWNED BY public.production.id;
          public          postgres    false    265            �            1259    16700    production_specialists    TABLE     ~   CREATE TABLE public.production_specialists (
    id integer NOT NULL,
    productivity integer,
    specialization integer
);
 *   DROP TABLE public.production_specialists;
       public         heap    postgres    false            �            1259    16561    production_specialization    TABLE     Z   CREATE TABLE public.production_specialization (
    id integer NOT NULL,
    name text
);
 -   DROP TABLE public.production_specialization;
       public         heap    postgres    false            �            1259    16560     production_specialization_id_seq    SEQUENCE     �   CREATE SEQUENCE public.production_specialization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.production_specialization_id_seq;
       public          postgres    false    224            �           0    0     production_specialization_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.production_specialization_id_seq OWNED BY public.production_specialization.id;
          public          postgres    false    223                        1259    32935    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    category integer,
    name text,
    convenience integer,
    reliability integer,
    engine_power integer,
    safety integer,
    prime_cost integer,
    cost_effectiveness integer
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    32934    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    256            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    255                       1259    49212 
   second_sec    SEQUENCE     t   CREATE SEQUENCE public.second_sec
    START WITH 68
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.second_sec;
       public          postgres    false            �            1259    16729    sites    TABLE     o   CREATE TABLE public.sites (
    id integer NOT NULL,
    name text,
    chief integer,
    workshop integer
);
    DROP TABLE public.sites;
       public         heap    postgres    false            �            1259    16728    sites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sites_id_seq;
       public          postgres    false    242            �           0    0    sites_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sites_id_seq OWNED BY public.sites.id;
          public          postgres    false    241            �            1259    16750    sites_masters    TABLE     Q   CREATE TABLE public.sites_masters (
    id integer NOT NULL,
    site integer
);
 !   DROP TABLE public.sites_masters;
       public         heap    postgres    false            �            1259    16749    sites_masters_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sites_masters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sites_masters_id_seq;
       public          postgres    false    244            �           0    0    sites_masters_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sites_masters_id_seq OWNED BY public.sites_masters.id;
          public          postgres    false    243            �            1259    16572    staff    TABLE     �   CREATE TABLE public.staff (
    id integer NOT NULL,
    first_name text,
    last_name text,
    age integer,
    experience integer
);
    DROP TABLE public.staff;
       public         heap    postgres    false            �            1259    16571    staff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.staff_id_seq;
       public          postgres    false    226            �           0    0    staff_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;
          public          postgres    false    225            �            1259    16680    technical_support    TABLE     �   CREATE TABLE public.technical_support (
    id integer NOT NULL,
    service_efficiency integer,
    emergency_response_speed integer
);
 %   DROP TABLE public.technical_support;
       public         heap    postgres    false            �            1259    16690    technologists    TABLE     {   CREATE TABLE public.technologists (
    id integer NOT NULL,
    optimization_level integer,
    specialization integer
);
 !   DROP TABLE public.technologists;
       public         heap    postgres    false            �            1259    16550    tester_specialization    TABLE     V   CREATE TABLE public.tester_specialization (
    id integer NOT NULL,
    name text
);
 )   DROP TABLE public.tester_specialization;
       public         heap    postgres    false            �            1259    16549    tester_specialization_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tester_specialization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.tester_specialization_id_seq;
       public          postgres    false    222            �           0    0    tester_specialization_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.tester_specialization_id_seq OWNED BY public.tester_specialization.id;
          public          postgres    false    221            �            1259    16610    testers    TABLE     j   CREATE TABLE public.testers (
    id integer NOT NULL,
    specialization integer,
    quality integer
);
    DROP TABLE public.testers;
       public         heap    postgres    false                       1259    41109    testing    TABLE     �   CREATE TABLE public.testing (
    id integer NOT NULL,
    product integer,
    tester integer,
    tool integer,
    test integer,
    laboratory integer
);
    DROP TABLE public.testing;
       public         heap    postgres    false                       1259    41108    testing_id_seq    SEQUENCE     �   CREATE SEQUENCE public.testing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.testing_id_seq;
       public          postgres    false    281            �           0    0    testing_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.testing_id_seq OWNED BY public.testing.id;
          public          postgres    false    280            �            1259    16815    testing_tools    TABLE     N   CREATE TABLE public.testing_tools (
    id integer NOT NULL,
    name text
);
 !   DROP TABLE public.testing_tools;
       public         heap    postgres    false            �            1259    16814    testing_tools_id_seq    SEQUENCE     �   CREATE SEQUENCE public.testing_tools_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.testing_tools_id_seq;
       public          postgres    false    252            �           0    0    testing_tools_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.testing_tools_id_seq OWNED BY public.testing_tools.id;
          public          postgres    false    251                       1259    41018    tests    TABLE     F   CREATE TABLE public.tests (
    id integer NOT NULL,
    name text
);
    DROP TABLE public.tests;
       public         heap    postgres    false                       1259    41017    tests_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tests_id_seq;
       public          postgres    false    279            �           0    0    tests_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;
          public          postgres    false    278                       1259    49213 	   third_sec    SEQUENCE     t   CREATE SEQUENCE public.third_sec
    START WITH 108
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.third_sec;
       public          postgres    false                       1259    32988    tractors    TABLE     V   CREATE TABLE public.tractors (
    id integer NOT NULL,
    traction_force integer
);
    DROP TABLE public.tractors;
       public         heap    postgres    false                       1259    32987    tractors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tractors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.tractors_id_seq;
       public          postgres    false    260            �           0    0    tractors_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.tractors_id_seq OWNED BY public.tractors.id;
          public          postgres    false    259                       1259    32976    trucks    TABLE     W   CREATE TABLE public.trucks (
    id integer NOT NULL,
    carrying_capacity integer
);
    DROP TABLE public.trucks;
       public         heap    postgres    false                       1259    32975    trucks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trucks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.trucks_id_seq;
       public          postgres    false    258            �           0    0    trucks_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.trucks_id_seq OWNED BY public.trucks.id;
          public          postgres    false    257            �            1259    16640    turners    TABLE     V   CREATE TABLE public.turners (
    id integer NOT NULL,
    material_saving integer
);
    DROP TABLE public.turners;
       public         heap    postgres    false            �            1259    16620    welders    TABLE     R   CREATE TABLE public.welders (
    id integer NOT NULL,
    detect_rate integer
);
    DROP TABLE public.welders;
       public         heap    postgres    false            �            1259    16711 	   workshops    TABLE     ]   CREATE TABLE public.workshops (
    id integer NOT NULL,
    name text,
    chief integer
);
    DROP TABLE public.workshops;
       public         heap    postgres    false            �            1259    16710    workshops_id_seq    SEQUENCE     �   CREATE SEQUENCE public.workshops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.workshops_id_seq;
       public          postgres    false    240            �           0    0    workshops_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.workshops_id_seq OWNED BY public.workshops.id;
          public          postgres    false    239                       1259    33073    zero    SEQUENCE     n   CREATE SEQUENCE public.zero
    START WITH -1
    INCREMENT BY 1
    MINVALUE -1
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.zero;
       public          postgres    false                       2604    33041    bikes id    DEFAULT     d   ALTER TABLE ONLY public.bikes ALTER COLUMN id SET DEFAULT nextval('public.bikes_id_seq'::regclass);
 7   ALTER TABLE public.bikes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267    268                       2604    16770    brigades id    DEFAULT     j   ALTER TABLE ONLY public.brigades ALTER COLUMN id SET DEFAULT nextval('public.brigades_id_seq'::regclass);
 :   ALTER TABLE public.brigades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246                       2604    33154    brigades_specialization id    DEFAULT     �   ALTER TABLE ONLY public.brigades_specialization ALTER COLUMN id SET DEFAULT nextval('public.brigades_specialization_id_seq'::regclass);
 I   ALTER TABLE public.brigades_specialization ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    273    272    273                       2604    16791    brigades_staff id    DEFAULT     v   ALTER TABLE ONLY public.brigades_staff ALTER COLUMN id SET DEFAULT nextval('public.brigades_staff_id_seq'::regclass);
 @   ALTER TABLE public.brigades_staff ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247    248                       2604    33053    buses id    DEFAULT     d   ALTER TABLE ONLY public.buses ALTER COLUMN id SET DEFAULT nextval('public.buses_id_seq'::regclass);
 7   ALTER TABLE public.buses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    270    270                       2604    33003    cars id    DEFAULT     b   ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);
 6   ALTER TABLE public.cars ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    262    262            
           2604    16531    engineer_categories id    DEFAULT     �   ALTER TABLE ONLY public.engineer_categories ALTER COLUMN id SET DEFAULT nextval('public.engineer_categories_id_seq'::regclass);
 E   ALTER TABLE public.engineer_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218                       2604    33015    excavator id    DEFAULT     l   ALTER TABLE ONLY public.excavator ALTER COLUMN id SET DEFAULT nextval('public.excavator_id_seq'::regclass);
 ;   ALTER TABLE public.excavator ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    264    264                       2604    16809    laboratories id    DEFAULT     r   ALTER TABLE ONLY public.laboratories ALTER COLUMN id SET DEFAULT nextval('public.laboratories_id_seq'::regclass);
 >   ALTER TABLE public.laboratories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249    250                       2604    16542    laborer_categories id    DEFAULT     ~   ALTER TABLE ONLY public.laborer_categories ALTER COLUMN id SET DEFAULT nextval('public.laborer_categories_id_seq'::regclass);
 D   ALTER TABLE public.laborer_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220                        2604    40992    processes id    DEFAULT     l   ALTER TABLE ONLY public.processes ALTER COLUMN id SET DEFAULT nextval('public.processes_id_seq'::regclass);
 ;   ALTER TABLE public.processes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    274    275    275            !           2604    41003    processing id    DEFAULT     n   ALTER TABLE ONLY public.processing ALTER COLUMN id SET DEFAULT nextval('public.processing_id_seq'::regclass);
 <   ALTER TABLE public.processing ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    276    277    277                       2604    32800    product_categories id    DEFAULT     ~   ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);
 D   ALTER TABLE public.product_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    254    254                       2604    33027    production id    DEFAULT     n   ALTER TABLE ONLY public.production ALTER COLUMN id SET DEFAULT nextval('public.production_id_seq'::regclass);
 <   ALTER TABLE public.production ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    266    266                       2604    16564    production_specialization id    DEFAULT     �   ALTER TABLE ONLY public.production_specialization ALTER COLUMN id SET DEFAULT nextval('public.production_specialization_id_seq'::regclass);
 K   ALTER TABLE public.production_specialization ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224                       2604    32938    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    256    256                       2604    16732    sites id    DEFAULT     d   ALTER TABLE ONLY public.sites ALTER COLUMN id SET DEFAULT nextval('public.sites_id_seq'::regclass);
 7   ALTER TABLE public.sites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242                       2604    16753    sites_masters id    DEFAULT     t   ALTER TABLE ONLY public.sites_masters ALTER COLUMN id SET DEFAULT nextval('public.sites_masters_id_seq'::regclass);
 ?   ALTER TABLE public.sites_masters ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244                       2604    16575    staff id    DEFAULT     d   ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);
 7   ALTER TABLE public.staff ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226                       2604    16553    tester_specialization id    DEFAULT     �   ALTER TABLE ONLY public.tester_specialization ALTER COLUMN id SET DEFAULT nextval('public.tester_specialization_id_seq'::regclass);
 G   ALTER TABLE public.tester_specialization ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            #           2604    41112 
   testing id    DEFAULT     h   ALTER TABLE ONLY public.testing ALTER COLUMN id SET DEFAULT nextval('public.testing_id_seq'::regclass);
 9   ALTER TABLE public.testing ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    281    280    281                       2604    16818    testing_tools id    DEFAULT     t   ALTER TABLE ONLY public.testing_tools ALTER COLUMN id SET DEFAULT nextval('public.testing_tools_id_seq'::regclass);
 ?   ALTER TABLE public.testing_tools ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            "           2604    41021    tests id    DEFAULT     d   ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);
 7   ALTER TABLE public.tests ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    279    279                       2604    32991    tractors id    DEFAULT     j   ALTER TABLE ONLY public.tractors ALTER COLUMN id SET DEFAULT nextval('public.tractors_id_seq'::regclass);
 :   ALTER TABLE public.tractors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    259    260                       2604    32979 	   trucks id    DEFAULT     f   ALTER TABLE ONLY public.trucks ALTER COLUMN id SET DEFAULT nextval('public.trucks_id_seq'::regclass);
 8   ALTER TABLE public.trucks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    258    258                       2604    16714    workshops id    DEFAULT     l   ALTER TABLE ONLY public.workshops ALTER COLUMN id SET DEFAULT nextval('public.workshops_id_seq'::regclass);
 ;   ALTER TABLE public.workshops ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240            m          0    33038    bikes 
   TABLE DATA           ;   COPY public.bikes (id, maneuverability, speed) FROM stdin;
    public          postgres    false    268   �H      W          0    16767    brigades 
   TABLE DATA           ;   COPY public.brigades (id, name, foreman, site) FROM stdin;
    public          postgres    false    246   �H      r          0    33151    brigades_specialization 
   TABLE DATA           >   COPY public.brigades_specialization (id, product) FROM stdin;
    public          postgres    false    273   JK      Y          0    16788    brigades_staff 
   TABLE DATA           5   COPY public.brigades_staff (id, brigade) FROM stdin;
    public          postgres    false    248   �K      o          0    33050    buses 
   TABLE DATA           ;   COPY public.buses (id, capacity, spaciousness) FROM stdin;
    public          postgres    false    270   �N      g          0    33000    cars 
   TABLE DATA           3   COPY public.cars (id, ease_of_driving) FROM stdin;
    public          postgres    false    262   'O      ;          0    16528    engineer_categories 
   TABLE DATA           7   COPY public.engineer_categories (id, name) FROM stdin;
    public          postgres    false    218   PO      E          0    16595 	   engineers 
   TABLE DATA           1   COPY public.engineers (id, category) FROM stdin;
    public          postgres    false    228   �O      i          0    33012 	   excavator 
   TABLE DATA           5   COPY public.excavator (id, productivity) FROM stdin;
    public          postgres    false    264   Q      K          0    16660    grinders 
   TABLE DATA           8   COPY public.grinders (id, processing_level) FROM stdin;
    public          postgres    false    234   8Q      J          0    16650 
   installers 
   TABLE DATA           /   COPY public.installers (id, speed) FROM stdin;
    public          postgres    false    233   TR      [          0    16806    laboratories 
   TABLE DATA           0   COPY public.laboratories (id, name) FROM stdin;
    public          postgres    false    250   �S      =          0    16539    laborer_categories 
   TABLE DATA           6   COPY public.laborer_categories (id, name) FROM stdin;
    public          postgres    false    220   ET      D          0    16580    laborers 
   TABLE DATA           0   COPY public.laborers (id, category) FROM stdin;
    public          postgres    false    227   �T      L          0    16670 
   management 
   TABLE DATA           g   COPY public.management (id, production_efficiency, staff_management, standards_compliance) FROM stdin;
    public          postgres    false    235   {W      H          0    16630    millers 
   TABLE DATA           /   COPY public.millers (id, accuracy) FROM stdin;
    public          postgres    false    231   X      t          0    40989 	   processes 
   TABLE DATA           -   COPY public.processes (id, name) FROM stdin;
    public          postgres    false    275   �X      v          0    41000 
   processing 
   TABLE DATA           ;   COPY public.processing (id, category, process) FROM stdin;
    public          postgres    false    277   uY      _          0    32797    product_categories 
   TABLE DATA           6   COPY public.product_categories (id, name) FROM stdin;
    public          postgres    false    254   �Y      k          0    33024 
   production 
   TABLE DATA           9   COPY public.production (id, product, "time") FROM stdin;
    public          postgres    false    266   yZ      O          0    16700    production_specialists 
   TABLE DATA           R   COPY public.production_specialists (id, productivity, specialization) FROM stdin;
    public          postgres    false    238   ke      A          0    16561    production_specialization 
   TABLE DATA           =   COPY public.production_specialization (id, name) FROM stdin;
    public          postgres    false    224   f      a          0    32935    products 
   TABLE DATA           �   COPY public.products (id, category, name, convenience, reliability, engine_power, safety, prime_cost, cost_effectiveness) FROM stdin;
    public          postgres    false    256   uf      S          0    16729    sites 
   TABLE DATA           :   COPY public.sites (id, name, chief, workshop) FROM stdin;
    public          postgres    false    242   Bg      U          0    16750    sites_masters 
   TABLE DATA           1   COPY public.sites_masters (id, site) FROM stdin;
    public          postgres    false    244   �h      C          0    16572    staff 
   TABLE DATA           K   COPY public.staff (id, first_name, last_name, age, experience) FROM stdin;
    public          postgres    false    226   �i      M          0    16680    technical_support 
   TABLE DATA           ]   COPY public.technical_support (id, service_efficiency, emergency_response_speed) FROM stdin;
    public          postgres    false    236   ��      N          0    16690    technologists 
   TABLE DATA           O   COPY public.technologists (id, optimization_level, specialization) FROM stdin;
    public          postgres    false    237   -�      ?          0    16550    tester_specialization 
   TABLE DATA           9   COPY public.tester_specialization (id, name) FROM stdin;
    public          postgres    false    222   '�      F          0    16610    testers 
   TABLE DATA           >   COPY public.testers (id, specialization, quality) FROM stdin;
    public          postgres    false    229   Ǆ      z          0    41109    testing 
   TABLE DATA           N   COPY public.testing (id, product, tester, tool, test, laboratory) FROM stdin;
    public          postgres    false    281   .�      ]          0    16815    testing_tools 
   TABLE DATA           1   COPY public.testing_tools (id, name) FROM stdin;
    public          postgres    false    252   .�      x          0    41018    tests 
   TABLE DATA           )   COPY public.tests (id, name) FROM stdin;
    public          postgres    false    279   ,�      e          0    32988    tractors 
   TABLE DATA           6   COPY public.tractors (id, traction_force) FROM stdin;
    public          postgres    false    260   ׇ      c          0    32976    trucks 
   TABLE DATA           7   COPY public.trucks (id, carrying_capacity) FROM stdin;
    public          postgres    false    258   ��      I          0    16640    turners 
   TABLE DATA           6   COPY public.turners (id, material_saving) FROM stdin;
    public          postgres    false    232   %�      G          0    16620    welders 
   TABLE DATA           2   COPY public.welders (id, detect_rate) FROM stdin;
    public          postgres    false    230   ��      Q          0    16711 	   workshops 
   TABLE DATA           4   COPY public.workshops (id, name, chief) FROM stdin;
    public          postgres    false    240   �      �           0    0    bikes_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.bikes_id_seq', 1, false);
          public          postgres    false    267            �           0    0    brigades_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.brigades_id_seq', 65, true);
          public          postgres    false    245            �           0    0    brigades_specialization_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.brigades_specialization_id_seq', 65, true);
          public          postgres    false    272            �           0    0    brigades_staff_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.brigades_staff_id_seq', 617, true);
          public          postgres    false    247            �           0    0    buses_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.buses_id_seq', 1, false);
          public          postgres    false    269            �           0    0    cars_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cars_id_seq', 1, false);
          public          postgres    false    261            �           0    0    engineer_categories_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.engineer_categories_id_seq', 1, false);
          public          postgres    false    217            �           0    0    excavator_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.excavator_id_seq', 1, false);
          public          postgres    false    263            �           0    0 	   first_sec    SEQUENCE SET     8   SELECT pg_catalog.setval('public.first_sec', 67, true);
          public          postgres    false    282            �           0    0    laboratories_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.laboratories_id_seq', 3, true);
          public          postgres    false    249            �           0    0    laborer_categories_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.laborer_categories_id_seq', 5, true);
          public          postgres    false    219            �           0    0    processes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.processes_id_seq', 1, false);
          public          postgres    false    274            �           0    0    processing_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.processing_id_seq', 81, true);
          public          postgres    false    276            �           0    0    product_categories_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.product_categories_id_seq', 1, false);
          public          postgres    false    253            �           0    0    production_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.production_id_seq', 12500, true);
          public          postgres    false    265            �           0    0     production_specialization_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.production_specialization_id_seq', 5, true);
          public          postgres    false    223            �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          postgres    false    255            �           0    0 
   second_sec    SEQUENCE SET     :   SELECT pg_catalog.setval('public.second_sec', 107, true);
          public          postgres    false    283            �           0    0    sites_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.sites_id_seq', 54, true);
          public          postgres    false    241            �           0    0    sites_masters_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sites_masters_id_seq', 0, false);
          public          postgres    false    243            �           0    0    staff_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.staff_id_seq', 637, true);
          public          postgres    false    225            �           0    0    tester_specialization_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tester_specialization_id_seq', 4, true);
          public          postgres    false    221            �           0    0    testing_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.testing_id_seq', 200, true);
          public          postgres    false    280            �           0    0    testing_tools_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.testing_tools_id_seq', 1, false);
          public          postgres    false    251            �           0    0    tests_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tests_id_seq', 1, false);
          public          postgres    false    278            �           0    0 	   third_sec    SEQUENCE SET     9   SELECT pg_catalog.setval('public.third_sec', 147, true);
          public          postgres    false    284            �           0    0    tractors_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.tractors_id_seq', 1, false);
          public          postgres    false    259            �           0    0    trucks_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.trucks_id_seq', 1, false);
          public          postgres    false    257            �           0    0    workshops_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.workshops_id_seq', 2, true);
          public          postgres    false    239            �           0    0    zero    SEQUENCE SET     4   SELECT pg_catalog.setval('public.zero', 637, true);
          public          postgres    false    271            u           2606    33043    bikes bikes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.bikes
    ADD CONSTRAINT bikes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.bikes DROP CONSTRAINT bikes_pkey;
       public            postgres    false    268            [           2606    16776    brigades brigades_foreman_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.brigades
    ADD CONSTRAINT brigades_foreman_key UNIQUE (foreman);
 G   ALTER TABLE ONLY public.brigades DROP CONSTRAINT brigades_foreman_key;
       public            postgres    false    246            ]           2606    16774    brigades brigades_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.brigades
    ADD CONSTRAINT brigades_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.brigades DROP CONSTRAINT brigades_pkey;
       public            postgres    false    246            y           2606    33156 4   brigades_specialization brigades_specialization_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.brigades_specialization
    ADD CONSTRAINT brigades_specialization_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.brigades_specialization DROP CONSTRAINT brigades_specialization_pkey;
       public            postgres    false    273            _           2606    16793 "   brigades_staff brigades_staff_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.brigades_staff
    ADD CONSTRAINT brigades_staff_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.brigades_staff DROP CONSTRAINT brigades_staff_pkey;
       public            postgres    false    248            w           2606    33055    buses buses_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.buses
    ADD CONSTRAINT buses_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.buses DROP CONSTRAINT buses_pkey;
       public            postgres    false    270            o           2606    33005    cars cars_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public            postgres    false    262            %           2606    16537 0   engineer_categories engineer_categories_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.engineer_categories
    ADD CONSTRAINT engineer_categories_name_key UNIQUE (name);
 Z   ALTER TABLE ONLY public.engineer_categories DROP CONSTRAINT engineer_categories_name_key;
       public            postgres    false    218            '           2606    16535 ,   engineer_categories engineer_categories_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.engineer_categories
    ADD CONSTRAINT engineer_categories_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.engineer_categories DROP CONSTRAINT engineer_categories_pkey;
       public            postgres    false    218            9           2606    16599    engineers engineers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.engineers
    ADD CONSTRAINT engineers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.engineers DROP CONSTRAINT engineers_pkey;
       public            postgres    false    228            q           2606    33017    excavator excavator_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.excavator
    ADD CONSTRAINT excavator_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.excavator DROP CONSTRAINT excavator_pkey;
       public            postgres    false    264            E           2606    16664    grinders grinders_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.grinders
    ADD CONSTRAINT grinders_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.grinders DROP CONSTRAINT grinders_pkey;
       public            postgres    false    234            C           2606    16654    installers installers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.installers
    ADD CONSTRAINT installers_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.installers DROP CONSTRAINT installers_pkey;
       public            postgres    false    233            a           2606    16813    laboratories laboratories_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.laboratories
    ADD CONSTRAINT laboratories_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.laboratories DROP CONSTRAINT laboratories_pkey;
       public            postgres    false    250            )           2606    16548 .   laborer_categories laborer_categories_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.laborer_categories
    ADD CONSTRAINT laborer_categories_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.laborer_categories DROP CONSTRAINT laborer_categories_name_key;
       public            postgres    false    220            +           2606    16546 *   laborer_categories laborer_categories_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.laborer_categories
    ADD CONSTRAINT laborer_categories_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.laborer_categories DROP CONSTRAINT laborer_categories_pkey;
       public            postgres    false    220            7           2606    16584    laborers laborers_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.laborers
    ADD CONSTRAINT laborers_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.laborers DROP CONSTRAINT laborers_pkey;
       public            postgres    false    227            G           2606    16674    management management_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.management
    ADD CONSTRAINT management_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.management DROP CONSTRAINT management_pkey;
       public            postgres    false    235            ?           2606    16634    millers millers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.millers
    ADD CONSTRAINT millers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.millers DROP CONSTRAINT millers_pkey;
       public            postgres    false    231            {           2606    40998    processes processes_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.processes
    ADD CONSTRAINT processes_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.processes DROP CONSTRAINT processes_name_key;
       public            postgres    false    275            }           2606    40996    processes processes_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.processes
    ADD CONSTRAINT processes_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.processes DROP CONSTRAINT processes_pkey;
       public            postgres    false    275                       2606    41005    processing processing_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.processing
    ADD CONSTRAINT processing_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.processing DROP CONSTRAINT processing_pkey;
       public            postgres    false    277            e           2606    32806 .   product_categories product_categories_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.product_categories DROP CONSTRAINT product_categories_name_key;
       public            postgres    false    254            g           2606    32804 *   product_categories product_categories_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.product_categories DROP CONSTRAINT product_categories_pkey;
       public            postgres    false    254            s           2606    33029    production production_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.production DROP CONSTRAINT production_pkey;
       public            postgres    false    266            M           2606    16704 2   production_specialists production_specialists_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.production_specialists
    ADD CONSTRAINT production_specialists_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.production_specialists DROP CONSTRAINT production_specialists_pkey;
       public            postgres    false    238            1           2606    16570 <   production_specialization production_specialization_name_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.production_specialization
    ADD CONSTRAINT production_specialization_name_key UNIQUE (name);
 f   ALTER TABLE ONLY public.production_specialization DROP CONSTRAINT production_specialization_name_key;
       public            postgres    false    224            3           2606    16568 8   production_specialization production_specialization_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.production_specialization
    ADD CONSTRAINT production_specialization_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.production_specialization DROP CONSTRAINT production_specialization_pkey;
       public            postgres    false    224            i           2606    32942    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    256            U           2606    16738    sites sites_chief_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.sites
    ADD CONSTRAINT sites_chief_key UNIQUE (chief);
 ?   ALTER TABLE ONLY public.sites DROP CONSTRAINT sites_chief_key;
       public            postgres    false    242            Y           2606    16755     sites_masters sites_masters_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sites_masters
    ADD CONSTRAINT sites_masters_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sites_masters DROP CONSTRAINT sites_masters_pkey;
       public            postgres    false    244            W           2606    16736    sites sites_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sites DROP CONSTRAINT sites_pkey;
       public            postgres    false    242            5           2606    16579    staff staff_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            postgres    false    226            I           2606    16684 (   technical_support technical_support_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.technical_support
    ADD CONSTRAINT technical_support_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.technical_support DROP CONSTRAINT technical_support_pkey;
       public            postgres    false    236            K           2606    16694     technologists technologists_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.technologists
    ADD CONSTRAINT technologists_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.technologists DROP CONSTRAINT technologists_pkey;
       public            postgres    false    237            -           2606    16559 4   tester_specialization tester_specialization_name_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.tester_specialization
    ADD CONSTRAINT tester_specialization_name_key UNIQUE (name);
 ^   ALTER TABLE ONLY public.tester_specialization DROP CONSTRAINT tester_specialization_name_key;
       public            postgres    false    222            /           2606    16557 0   tester_specialization tester_specialization_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.tester_specialization
    ADD CONSTRAINT tester_specialization_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.tester_specialization DROP CONSTRAINT tester_specialization_pkey;
       public            postgres    false    222            ;           2606    16614    testers testers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.testers
    ADD CONSTRAINT testers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.testers DROP CONSTRAINT testers_pkey;
       public            postgres    false    229            �           2606    41114    testing testing_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.testing
    ADD CONSTRAINT testing_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.testing DROP CONSTRAINT testing_pkey;
       public            postgres    false    281            c           2606    16822     testing_tools testing_tools_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.testing_tools
    ADD CONSTRAINT testing_tools_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.testing_tools DROP CONSTRAINT testing_tools_pkey;
       public            postgres    false    252            �           2606    41025    tests tests_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tests DROP CONSTRAINT tests_pkey;
       public            postgres    false    279            m           2606    32993    tractors tractors_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.tractors
    ADD CONSTRAINT tractors_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.tractors DROP CONSTRAINT tractors_pkey;
       public            postgres    false    260            k           2606    32981    trucks trucks_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.trucks
    ADD CONSTRAINT trucks_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.trucks DROP CONSTRAINT trucks_pkey;
       public            postgres    false    258            A           2606    16644    turners turners_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.turners
    ADD CONSTRAINT turners_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.turners DROP CONSTRAINT turners_pkey;
       public            postgres    false    232            =           2606    16624    welders welders_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.welders
    ADD CONSTRAINT welders_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.welders DROP CONSTRAINT welders_pkey;
       public            postgres    false    230            O           2606    16722    workshops workshops_chief_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.workshops
    ADD CONSTRAINT workshops_chief_key UNIQUE (chief);
 G   ALTER TABLE ONLY public.workshops DROP CONSTRAINT workshops_chief_key;
       public            postgres    false    240            Q           2606    16720    workshops workshops_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.workshops
    ADD CONSTRAINT workshops_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.workshops DROP CONSTRAINT workshops_name_key;
       public            postgres    false    240            S           2606    16718    workshops workshops_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.workshops
    ADD CONSTRAINT workshops_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.workshops DROP CONSTRAINT workshops_pkey;
       public            postgres    false    240            �           2606    33044    bikes bikes_id_fkey    FK CONSTRAINT     p   ALTER TABLE ONLY public.bikes
    ADD CONSTRAINT bikes_id_fkey FOREIGN KEY (id) REFERENCES public.products(id);
 =   ALTER TABLE ONLY public.bikes DROP CONSTRAINT bikes_id_fkey;
       public          postgres    false    268    4969    256            �           2606    16777    brigades brigades_foreman_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.brigades
    ADD CONSTRAINT brigades_foreman_fkey FOREIGN KEY (foreman) REFERENCES public.laborers(id);
 H   ALTER TABLE ONLY public.brigades DROP CONSTRAINT brigades_foreman_fkey;
       public          postgres    false    246    227    4919            �           2606    16782    brigades brigades_site_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.brigades
    ADD CONSTRAINT brigades_site_fkey FOREIGN KEY (site) REFERENCES public.sites(id);
 E   ALTER TABLE ONLY public.brigades DROP CONSTRAINT brigades_site_fkey;
       public          postgres    false    4951    246    242            �           2606    33157 7   brigades_specialization brigades_specialization_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.brigades_specialization
    ADD CONSTRAINT brigades_specialization_id_fkey FOREIGN KEY (id) REFERENCES public.brigades(id);
 a   ALTER TABLE ONLY public.brigades_specialization DROP CONSTRAINT brigades_specialization_id_fkey;
       public          postgres    false    4957    273    246            �           2606    33162 <   brigades_specialization brigades_specialization_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.brigades_specialization
    ADD CONSTRAINT brigades_specialization_product_fkey FOREIGN KEY (product) REFERENCES public.products(id);
 f   ALTER TABLE ONLY public.brigades_specialization DROP CONSTRAINT brigades_specialization_product_fkey;
       public          postgres    false    256    4969    273            �           2606    16799 *   brigades_staff brigades_staff_brigade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.brigades_staff
    ADD CONSTRAINT brigades_staff_brigade_fkey FOREIGN KEY (brigade) REFERENCES public.brigades(id);
 T   ALTER TABLE ONLY public.brigades_staff DROP CONSTRAINT brigades_staff_brigade_fkey;
       public          postgres    false    246    248    4957            �           2606    16794 %   brigades_staff brigades_staff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.brigades_staff
    ADD CONSTRAINT brigades_staff_id_fkey FOREIGN KEY (id) REFERENCES public.laborers(id);
 O   ALTER TABLE ONLY public.brigades_staff DROP CONSTRAINT brigades_staff_id_fkey;
       public          postgres    false    248    227    4919            �           2606    33056    buses buses_id_fkey    FK CONSTRAINT     p   ALTER TABLE ONLY public.buses
    ADD CONSTRAINT buses_id_fkey FOREIGN KEY (id) REFERENCES public.products(id);
 =   ALTER TABLE ONLY public.buses DROP CONSTRAINT buses_id_fkey;
       public          postgres    false    256    270    4969            �           2606    33006    cars cars_id_fkey    FK CONSTRAINT     n   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_id_fkey FOREIGN KEY (id) REFERENCES public.products(id);
 ;   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_id_fkey;
       public          postgres    false    262    4969    256            �           2606    16605 !   engineers engineers_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.engineers
    ADD CONSTRAINT engineers_category_fkey FOREIGN KEY (category) REFERENCES public.engineer_categories(id);
 K   ALTER TABLE ONLY public.engineers DROP CONSTRAINT engineers_category_fkey;
       public          postgres    false    4903    228    218            �           2606    16600    engineers engineers_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.engineers
    ADD CONSTRAINT engineers_id_fkey FOREIGN KEY (id) REFERENCES public.staff(id);
 E   ALTER TABLE ONLY public.engineers DROP CONSTRAINT engineers_id_fkey;
       public          postgres    false    4917    226    228            �           2606    33018    excavator excavator_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.excavator
    ADD CONSTRAINT excavator_id_fkey FOREIGN KEY (id) REFERENCES public.products(id);
 E   ALTER TABLE ONLY public.excavator DROP CONSTRAINT excavator_id_fkey;
       public          postgres    false    264    256    4969            �           2606    16665    grinders grinders_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.grinders
    ADD CONSTRAINT grinders_id_fkey FOREIGN KEY (id) REFERENCES public.laborers(id);
 C   ALTER TABLE ONLY public.grinders DROP CONSTRAINT grinders_id_fkey;
       public          postgres    false    234    4919    227            �           2606    16655    installers installers_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.installers
    ADD CONSTRAINT installers_id_fkey FOREIGN KEY (id) REFERENCES public.laborers(id);
 G   ALTER TABLE ONLY public.installers DROP CONSTRAINT installers_id_fkey;
       public          postgres    false    233    227    4919            �           2606    16590    laborers laborers_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.laborers
    ADD CONSTRAINT laborers_category_fkey FOREIGN KEY (category) REFERENCES public.laborer_categories(id);
 I   ALTER TABLE ONLY public.laborers DROP CONSTRAINT laborers_category_fkey;
       public          postgres    false    227    220    4907            �           2606    16585    laborers laborers_id_fkey    FK CONSTRAINT     s   ALTER TABLE ONLY public.laborers
    ADD CONSTRAINT laborers_id_fkey FOREIGN KEY (id) REFERENCES public.staff(id);
 C   ALTER TABLE ONLY public.laborers DROP CONSTRAINT laborers_id_fkey;
       public          postgres    false    4917    227    226            �           2606    16675    management management_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.management
    ADD CONSTRAINT management_id_fkey FOREIGN KEY (id) REFERENCES public.engineers(id);
 G   ALTER TABLE ONLY public.management DROP CONSTRAINT management_id_fkey;
       public          postgres    false    228    4921    235            �           2606    16635    millers millers_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.millers
    ADD CONSTRAINT millers_id_fkey FOREIGN KEY (id) REFERENCES public.laborers(id);
 A   ALTER TABLE ONLY public.millers DROP CONSTRAINT millers_id_fkey;
       public          postgres    false    231    4919    227            �           2606    41006 #   processing processing_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.processing
    ADD CONSTRAINT processing_category_fkey FOREIGN KEY (category) REFERENCES public.product_categories(id);
 M   ALTER TABLE ONLY public.processing DROP CONSTRAINT processing_category_fkey;
       public          postgres    false    254    277    4967            �           2606    41011 "   processing processing_process_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.processing
    ADD CONSTRAINT processing_process_fkey FOREIGN KEY (process) REFERENCES public.processes(id);
 L   ALTER TABLE ONLY public.processing DROP CONSTRAINT processing_process_fkey;
       public          postgres    false    275    277    4989            �           2606    33030 "   production production_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_product_fkey FOREIGN KEY (product) REFERENCES public.products(id);
 L   ALTER TABLE ONLY public.production DROP CONSTRAINT production_product_fkey;
       public          postgres    false    256    4969    266            �           2606    16705 5   production_specialists production_specialists_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.production_specialists
    ADD CONSTRAINT production_specialists_id_fkey FOREIGN KEY (id) REFERENCES public.engineers(id);
 _   ALTER TABLE ONLY public.production_specialists DROP CONSTRAINT production_specialists_id_fkey;
       public          postgres    false    238    4921    228            �           2606    32943    products products_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_fkey FOREIGN KEY (category) REFERENCES public.product_categories(id);
 I   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_fkey;
       public          postgres    false    256    4967    254            �           2606    16739    sites sites_chief_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.sites
    ADD CONSTRAINT sites_chief_fkey FOREIGN KEY (chief) REFERENCES public.management(id);
 @   ALTER TABLE ONLY public.sites DROP CONSTRAINT sites_chief_fkey;
       public          postgres    false    242    4935    235            �           2606    16756 #   sites_masters sites_masters_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sites_masters
    ADD CONSTRAINT sites_masters_id_fkey FOREIGN KEY (id) REFERENCES public.engineers(id);
 M   ALTER TABLE ONLY public.sites_masters DROP CONSTRAINT sites_masters_id_fkey;
       public          postgres    false    228    244    4921            �           2606    16761 %   sites_masters sites_masters_site_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sites_masters
    ADD CONSTRAINT sites_masters_site_fkey FOREIGN KEY (site) REFERENCES public.sites(id);
 O   ALTER TABLE ONLY public.sites_masters DROP CONSTRAINT sites_masters_site_fkey;
       public          postgres    false    244    4951    242            �           2606    16744    sites sites_workshop_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.sites
    ADD CONSTRAINT sites_workshop_fkey FOREIGN KEY (workshop) REFERENCES public.workshops(id);
 C   ALTER TABLE ONLY public.sites DROP CONSTRAINT sites_workshop_fkey;
       public          postgres    false    240    4947    242            �           2606    16685 +   technical_support technical_support_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.technical_support
    ADD CONSTRAINT technical_support_id_fkey FOREIGN KEY (id) REFERENCES public.engineers(id);
 U   ALTER TABLE ONLY public.technical_support DROP CONSTRAINT technical_support_id_fkey;
       public          postgres    false    228    4921    236            �           2606    16695 #   technologists technologists_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.technologists
    ADD CONSTRAINT technologists_id_fkey FOREIGN KEY (id) REFERENCES public.engineers(id);
 M   ALTER TABLE ONLY public.technologists DROP CONSTRAINT technologists_id_fkey;
       public          postgres    false    228    237    4921            �           2606    16615    testers testers_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.testers
    ADD CONSTRAINT testers_id_fkey FOREIGN KEY (id) REFERENCES public.engineers(id);
 A   ALTER TABLE ONLY public.testers DROP CONSTRAINT testers_id_fkey;
       public          postgres    false    228    229    4921            �           2606    41115    testing testing_laboratory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.testing
    ADD CONSTRAINT testing_laboratory_fkey FOREIGN KEY (laboratory) REFERENCES public.laboratories(id);
 I   ALTER TABLE ONLY public.testing DROP CONSTRAINT testing_laboratory_fkey;
       public          postgres    false    4961    250    281            �           2606    41130    testing testing_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.testing
    ADD CONSTRAINT testing_product_fkey FOREIGN KEY (product) REFERENCES public.product_categories(id);
 F   ALTER TABLE ONLY public.testing DROP CONSTRAINT testing_product_fkey;
       public          postgres    false    254    4967    281            �           2606    41125    testing testing_test_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.testing
    ADD CONSTRAINT testing_test_fkey FOREIGN KEY (test) REFERENCES public.tests(id);
 C   ALTER TABLE ONLY public.testing DROP CONSTRAINT testing_test_fkey;
       public          postgres    false    4993    281    279            �           2606    41120    testing testing_tool_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.testing
    ADD CONSTRAINT testing_tool_fkey FOREIGN KEY (tool) REFERENCES public.testing_tools(id);
 C   ALTER TABLE ONLY public.testing DROP CONSTRAINT testing_tool_fkey;
       public          postgres    false    252    4963    281            �           2606    32994    tractors tractors_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.tractors
    ADD CONSTRAINT tractors_id_fkey FOREIGN KEY (id) REFERENCES public.products(id);
 C   ALTER TABLE ONLY public.tractors DROP CONSTRAINT tractors_id_fkey;
       public          postgres    false    256    260    4969            �           2606    32982    trucks trucks_id_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY public.trucks
    ADD CONSTRAINT trucks_id_fkey FOREIGN KEY (id) REFERENCES public.products(id);
 ?   ALTER TABLE ONLY public.trucks DROP CONSTRAINT trucks_id_fkey;
       public          postgres    false    256    4969    258            �           2606    16645    turners turners_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.turners
    ADD CONSTRAINT turners_id_fkey FOREIGN KEY (id) REFERENCES public.laborers(id);
 A   ALTER TABLE ONLY public.turners DROP CONSTRAINT turners_id_fkey;
       public          postgres    false    232    227    4919            �           2606    16625    welders welders_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.welders
    ADD CONSTRAINT welders_id_fkey FOREIGN KEY (id) REFERENCES public.laborers(id);
 A   ALTER TABLE ONLY public.welders DROP CONSTRAINT welders_id_fkey;
       public          postgres    false    230    227    4919            �           2606    16723    workshops workshops_chief_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.workshops
    ADD CONSTRAINT workshops_chief_fkey FOREIGN KEY (chief) REFERENCES public.management(id);
 H   ALTER TABLE ONLY public.workshops DROP CONSTRAINT workshops_chief_fkey;
       public          postgres    false    235    4935    240            m      x�3�4�4�2� �f�F��\1z\\\ #z�      W   b  x���Mn�@F�]���U���E"�!`�H�BDD2g�_y"c��;�Y��޸\U�.˦ܔ�zQn���P��E�P�������u��o�w,�p�	��Ό��0����qV��px�3�V���,�j�]���0�����=���+�/�}|����lq��I�����<$%�����zz��dؓ�~#�ِ㪞�{��u}n�0��*����[7j���HΟ&�%Â\M���'r��w�4��o�3�Й\��U�Oo��L��4��L�"�K��/�C��	��	��ܢn���ؑ��rR���3�~�k,�����t�v��=�ɣוO��x�#��,�ja��Z�n�6�x��%�y���#�Ý|�3�QmT4#��6���D"���C7�u}c�1�iN�z��9�<�[p��d�� �Kk�(t�h<��t� ag,�^Zt�3h_����]y��+��Z��8bQ�=�Ȉ�D��4r+�xB��Ŭ�1�@m����<�H��AB�
yCh���H��-�	č�h�Q��z���8%�H�ꚒE7��O�����b2Is�:q������Ns��8����ͨ���M60߼&�?�'�c      r   �   x�ϹAA[
�0���e��Hz�),<-����7|�?8��G�x�m�b6s��y�������L;�e׳�ys3�2��Y�,&Z^c^[>�݋�S.���m��W~�,zBN�dmG���}��+?z/z��r�-����<1Q      Y   �  x�%��m%1D�u�`�D꓋�c�u7u ��%�����/*�ӹ��,�v�o*_��pNg~KY��<��y��$�/�ٹ���u��f�Te����8p�U1�.<��/�X�P������/��� ���C��6Ё�n�7u���l8�u��c@�֕H(Ђ-.<t�G,H(�)�f\xf�� A��m�ϬtJZ�
6��Lꐵ ',H(�p�}5~SS`&,H(8_������LXPߞbÁ�h:L����\xF}m&,�ʥʥʥʥʥʣʣʣʣʣʣʣʣʣ�s�5���,�v�u����)�s9�Y��<Nm�[j��pN�rj���Z��F��J�e&,H�:���2���}>�[�`�&I_
�V��2��!$l�(��T���LX�P������p@�l���9�Ԩ��	
6���xFWa&,Hб����\x�o�	�u���:���N���L�~Sl8pᙞ�&@��DB�n���ﷻ��~x�݅gtG�*�#� �`�����rR�u9fAB���Kk��z��� �`�֕xF3n&,H(ؠ�V���Uw0aA��%\xF}f&,��(��8��u��:ù��Lg9��8o�z�)�9�˙�r����tS5��7Ă������74�M����7�N}���l8�f��n0aAB�N۪�3j#0aA��U'�?��3j#0!{L��j6������1MB����	1aAB�������~�/��      o      x�3��4���4��4�4����� $�      g      x�3�4�2�4�2������ �      ;   �   x�u�;�PD�wW�4��ψ���;@|�-�ّ�`k1����WOMK��ց��B%�J3^�����ZQ9�7�6���lR��=Fz�Ӷ�<H���=��T�\�?͓�_���f�8�t�      E     x�ѻ��0Q{�B��\^�q,��.�����zֽ����^ߛ{߽}�y	��t�]���|�_��D�mD �@"q~��K	��H�!�Q�B��(D!
Q�B4��hD#шF4��� 1�Ab�����{�"A�i2�#� 6b#6b#6b#6b#6b#� � � � � ���eæ-�v�g�=��?��ˆM[����n�mhC�І6��mhS��Ԧ6��MmjS��Җ���-miK[���}y�z_N���l۱�Ն6��MmjS���&����<�P:*      i      x�34�4�24�4����� �      K     x�%Rɵ$1;������c,�EMa-`wy����ɇ�هs���_]�~���=�a�z�߁��>�pT/M�x�N\�F�(RX4
i�U�Lc��ƴt��'&YH���S���.c]
.iK�J�
.�nE֗\��0��I�%�#����G���b9kﵕ�W��:u���HM����1��?�SL�h�XSBiGK��G�����{鰚z�>��Z��zG|^6���ׁ]��T�|0ja�U���7��UK��:
Ι�?\��������_�      J   �  x�%Sɱ%1;�3e�&��#�/4%VǙU��{m���`%m�C{֥��і�^A��3Bj�RXM�jZ��:Z"�V�rm�����qC�NC&�@k�n[����"x!�A�/m]�<�+#��޳��Vx<�@�&5�%���m�OMgX��9(v؊;����
�m��v��mŋ��H�G}�r�k��B����сP�i�|��\��B�<'靐f������;!�񲯍�fN��7>��G��I#��k\τӎ>���؇��~׼׵7�CS\L��@���zd���+��^T�K�����y�}���զnw����c[]���B@u�^�ye��9T��Q^
���b��(/!���x|��?����.!^y|��BF�2sK!�~���ъ       [   J   x�3�0��֋;.lP���/��pa��&}q��~.#�S����q�1漰(��b��~\jb���� 3=F�      =   ^   x�e�;@`E�zf1��X��%�JJ�x���3;�KTT77�󅖋�2FN6v����R����M��9�?Q#��������ccap���OUo�YN�      D   �  x�ұ�6 �ؿ� ���:|7�f��������ѣ���W�����}�c���>���}l��6�l��6�l��;��;��;��.���.����������ҫO[G�����=�a{��6�`�6�`�6�`�M6�d�M6�d�M��b�-��b�-�X_���W��U�*|�
_���W��U�*|�
_���W��U�*|�
_���W��U�*|�
_���W��U�*|�
_���W��U�*|�
_���W��U~��oSK�>m�_�_�z�=�a{�����l��l���l��&�l��&�l��[l��[l��{��^�����e/{��>���}�c���>���6�l��6�l��6;��;��;��.���.�������GCSK�>me}U�*_���W��U��|U�*_���W��U}��o����߯~=�Z�&�l��[l��[l��[�e/{��^�����e/����=�Zz�i����l��6�l��6�l��;��;�����.���.�����|�hhj�է���a{��~���^}�:��~���hh*l��l��&�l��&�l��[l��[l��[�e/{��^�����e/���>���}�c���6�l��6�l��6���;��;��.���.���.�?�>=�Zz�i�({�����z�z�z���߿����۞�      L   �   x�-��D!C�I1;�^��:6��E�%0��F�zS�Fs�И��Ku�/Q׆����)�`<$1B\��2-Hmw�E���%���!������y��}�2n�f������r$��_̾�������?�!k      H   �   x�%�� C�q�P��t�9Jҟk�TO��i��+�|K�\�I]�-�TJ�-Mly٨K��7I]�ӭ��F}�c��F3��w�>2�G�.���-�q�	6��/LO37���P�q�eig/���؆����"��M�4���ca�����l42N      t   �   x�}�;�0Dk�)|$���$qC��Da:�� V'W��cD�vvf�v�g-�B@:4���,�wu\Y\P��-�Ւ����N��)�E�d%=�ꛁ���dmp�WP�娎h'��K�X�h�hX�f@�-�����<��e7�9�U���LD^���      v   j   x���!ѳ�?�&��?�mNo
5Lf̘J�R��c��K�2A��b�yہ-'�8��
��|!UZ��$ŋ$ŭ��U|�2PV���R=��	��'����      _   z   x�u���P�*� �o5c�DD`Y�"*x6�3vs� ����Ό3wndZ��&$��*�uM����s���ű���|aT���.J_��{�ă���ʸF�*�_G�R��I#�L��O
g�      k      x�d][�-�
�>{.����O��J�nD��Բ,Dޤ����"�_Y���'���忺��_5���W������?�2������]����j�����z��%���:��~������ꓕ������2�j�W�����k�����|�������}K=��蟯f�(���k{����.��'�������@��
)��o��'5H >�G �K��K��.��o�/>a���i�{c�6������\��$r��:�T�?-A����������eS�,Quo�b۾',�P|������=ք�)�OG����?�������|�/���y+��t^V���Mb���d���UfA� K�����_|d�?���-�;�����f�2/>��]�G����a_��w�d*���4�K߈�w	�no����l]�k�+·���/��?��9�%������{	��@|t��|�/����2~?��_���=��m�����{~�3�_�F|?�A����+���[�(�*q��z��}��9D�?�M%|����.CWߨ�����t�c���q�L��7E.r:��s�q����5(f��m��x�ʩ����7��m7�������w���0�9����eù��Å�*ww�v�^B9�|�T�._�2�:{-�����j���n��V}_���!�<[�t���Kz�o�V	��EΏ�->�,T]�;���'�K�L3 �K�OH�g�w�Z��d��u)���$7�d��#�Ā�����R���G�|��������g�#v=�'���Ѥ}B�VW?��w���))�]'�#��}@��Xݧ��$4�Ir�~@��|j�=��}#���z�۪�z�5M%U�S5�E����Ux��Y��?��~�hށ⳴k9t�M�C�w�q��>\)��V�(��K���mG��-q�In�Yj�X;����yD����$꺥�8�������N��E�u���������R���J=�Thr�a�>u�0(�Rn�����Z�+f���)��]��E��y�2�OS��C��X;�����"V��.�7�K��5w��ŝ�l�z�����)�%^4RVK�h��i��Zegf�{6�?�u����~����X���=�`�#=Z.���Mݐ���A&#�%�O`)��.�|�y�nl����_J6�b1繩W��7���\i�mac���ڗ7ǵ ���ܽ@﹘���,��J��.�|�[�J)&X��̎��h=���4��E����w�瓶�\�2j�ģ��	�B�v���2 ����|�
?AS��_Y
��K��.����\�ޓO��(q���\��O���;�0J�R,N��(5�<�*���%U��w3��S��#������>˧��(��q�@ R�@���״i�=�
-��GjL"�[,)��[$�BK���=f����g�b�W�(�����w�m�R\.D֝l+�:;Ո�zQX;��DͷV�w���A�����)������du���.S�t��������k���[=e���XǰK�f��*K�S�bl�9�Z���ظ��u��{�P[)\�O��9�����5瓖x��d��࣊k����4��VB�Zڌ�y-}k�Bz2^ڢ���O��^�C�+�U��.W�k��������},z��po�����ȸ��O��� Q���^�(W�M�ը���u�Z���lŁ�c�ԗ6���������m�?�d_�זR�\o˼��������23��y���
�.��2��<0[j��Ov�e���8s\�4�Ƽ�W��d�2-:]P,����~��i���{j4�3�jdٵ�C��vmg��>�r��H��`�O��b�IW
���밁�N���#B�S#��v�SC�4�T�~t�r�Z��cSy�4^����������ZӬ;E��D�o@����y%'8	�7��b�������ב/i�N�e*�l��R����3�Jz��~��m8���/>��@�<ף��m������~��yU"1*�R�_�<�E�|��S���(����m��{H��x�qo|�����)��'p�QȌ7P�zc�AiM����5%�����甴$m��n�� Ч62�cHm^�2�7+����6�ċZ�dA�E���fm��Q�G���/l���ONj�$��[*h
m)k-2���R'������{9�C���ε]�����\+l��^PRb��}:n��)�k#��=5.Ԛ�B��5�a됫`#��C�]T���#��#�� :��U��c��|�3�(�������Y(*�iO�5�@���)�Ǝ������\�o�/��LHڣ��G꜏���.�B�~��e}�V�܁��J>�.����2�|k[�;�/,���|��@7\]w��x+�}�ܬ�G��7"��~��d3~la��m�b�]�g�J��K�wp6�2�h�iYY��9Vo�g�[)w ưz-��\V�Fw}���H{�i}���R�Kb�.�r���Q]�vJJᔕTB�[�+f��1Qvs>��]D,٤���#��h�i��?|\m���#������z7!Ӕ���Re��#��`e����-��yhz�N5"���>M���b�lX��,w�0�֜�f�	��̮9��^F�EXϬߣ��<H6c�<a���=��#d+�Ȥ��h��Zfj��Z�x���7�������Z���k#mhzk�n{��]������dd���'���҅�*F��(O�1<�s�s�����Ù�㵚��b�H���kSؠ8G�#�Z����p����j����ai1dZm�;!�ic�]������ǎId�<Vӷ�����)�c�M<�%�-!E�@�MV��������<X���z}��s�#���B����
�s�/�G&,���B[�ɡO��jWJ���y�7�,T���D#Խ�"��J� D�*�.�[y��3�IX�UZ1N5,َ&;�A;�,�
�Q�I(�'Y�s���Z-Tr�i�毽*��V�ۓ�Uo����o�(s�i�G�a֞�A��\!Na��-)�S��M�E
�J|�>��m�&����+il�&�H�G�VmE�����o��<8tM2����=�V�����x�I䰚�%dL��R��D�'�K�L5AO5Ma?1��c~���d��h�~��vÉ��s�Uʈ�I�L�e�I��2����k��(g�md�-��ɬ�}��dSh��
��>%��v�,��/� eu;�߲�d� ��/�0o-�p�8���Eb�52[L��󭿗�*���57@�RDH���79}�;��XXz��t5 �Z�oƿ�A�ٹ��1[8�=C��)�*eTfߑ��mn���
~/�="��(����.� U�7�	�ʬ���z
�wO�l�R���>��BN4*o�y�[ߴs`�����ߛoh��U��P��s>ޟ�,ʈ;O�t�}�,�W��")����p�:�]�nh������'�/Z���xbf���M�a��l^sT��`/3|��E����`��}�R����9s��FX��^2Hc1���_���5/wv̐x��YdH�"Cޫ�/��~�=lg��Si�Wu<r�D�EL��B��R�T����~]�
��B�SU`Fn��_Y��t��9��?��ͽ���!2Y]gþ�����ī��V ]�4�SA����%j�#���H�}��S�aP[��o�� �@�J�+����m�M��G'�x�J����=N3� }�Fr�im���� g͏�M6�|�mq��{3i4ȴ�nv$ⴽIf��M)���oG��Fn�r�uR��?�1�[�xѺ�%�z�	%�{�����.T��I�޳�gQ���Y:9�q�zg���"J�i̛e?r�/JX:��'���&�dQo�G&��C����(>���>�����џ�ߌ'���DO��ŉA$b��K��Z��>�)��8��T�4�}��f�[����-�� u��?y���}fEw���r@��}eP����I�ڹ��#^Qz@�]��Vô� �PG*@�P}qՏ����i�L-G&؎)�R�v�E�Y�7�BN:��(FJ�[�(T�M�rO8��    ���#�*}\uV������è�
2?�8�P"�kc�^�����t̢޶>���Kv;�t�ѭ�3��?N�G٧wp�<�<CʣA>JIe�9$k�Hr����Qf'q<��R��S�/��o�!\\狕Eyʏ+��'��W��/S����Pe���*���U#�����3l�~�`��g��G9UX�E�e�uE(xX��7o&�|-߼v�a�3N|}G|X.U��n,?�˰q�5��֟Ȱ,�����V�Hm*e�{Va��I�8����(3���h=�4\��ƿtPJ~˿¶m���e��^m t�9���]�E}�O�t�&!���B��4�zV�o>��.���%�@q�=�۸����HCa��P�x&i���yȂN�b��\��<(Ëh���G�gf��/�'�o�T����y~�f��?���º��^v�Aq�͞GEǘ�O��*d[8o�,$����-!�Vv�z�d�~�X�L;'ʺy��Z�q�Na�X�����٠�K$g��S�%��E�t|�a#F�M"]^؂��Ko��쪫Y2����Y��Uf� �������TI&E;ĬJ- ޓQ������8��}��d��q������������e�S]�����c@~**����L�.�gLa��G90+���%jL{{2�@�ȦΫ͎p��E�0�
G���O��f?�[Sӏ�Ot�*rn�A���R'��O2��^�*�m�L{ҧ�1&����Z�B?O3��|���.p"X'�����k]��63R������
^x��?��.~ߜy����M�P���ͨ����]�!L���ә�_���ճM:�X�"��i����I��zBW�.lI���1�U������<�Lv��<~��(�����N��~̾H�|���|?��,a��7�c&��n�O���ȇ�׌��D"q�$l�詿�mi�A��b.���B��rU:�α\���ɜY���Yj���豲+���鿥̑�(���8�Ƌ����+m,n���Y�8�7/�b��2S�_O���IkG��Aa1<1�j��LE�-V)�A?Z�[~{�#��<�����2��H�`�=W���� �'&ř�/��s��>���r��/�RW&̆u�O�̪�� ��j{��Ꚇ8�U)��������Hz�Q~�$0�KRԆ�["$���O�2q��Q
�w���>�+�}#;�`;�$B|��Z�h�[JU����ԟ1�� /��]�YX�]K)�����s�G���S'�4�mK�Ն�/K� So�=fQ@�L(U�5}¹>��D��E�ബ���-��r�fjYÎح���ݫ*����jY�48�de�4�S�_�.\���[[�,$�:)��#�6HR:�9e���١>�E��+�he�z�O��d�Jl�����7u��՟r��{�d�����S碧p�g���D`v�o/e#b��)T9F�-w=�ĸ�L8,kN��b�3˿�&��|�|̙��%¾�)�A?JNe�Ļ���Q�5��
jy��b�e[kfZz�?�H,��T\��LvO�Z�*4���%:��k��]�(:�Ҍ��(�^++��|Qp1��֭��C�S�"H���)�����Ǐ�)�7o~.F1l�G�Ʊ�Y�����2؜�&ؒ����F�2�̚5+-&z�@#o��?�f�銩����7B����RSB�G�
�$�7���}/`qx1��3�ͰHe�Y�pX�_w3hvzb��umV"oa�/A:�$�L���=��U�d#?}��h��Y�l,Z�'wG�&V��^U
��Q�@$�����xԙ}C�f"�������d�iŶhv�F�j1.�����<��n��Ϋi,����댪����X*��qm)d�������ɯ�3[��u�]��Y[Щe���G4�|CO��?�;�5N]�xT�4	N�n�IIc�����Sש;u��'IV�4��'����F�2�o�sT2^88���2���LT�уGy"1���a<$\	Obi�퉘�*��_��edf��㑐}����,o�����a{g���@���	�2.���G��?3^uN�����[�/���J�n�z��)W�F*#��o�de�����`�}�½q����M���5)d�Y�d��"�s���UԻq�1E�1�_+7`�����c����"܁�����
� �`�I����Y�8"�+(�L�V��C���To���� ��]P�$1t����:�ԃt�����F��G�<+��T�κ��:qFu��l�º�(��%�Ud����P'�V�S܄�26iu��J�з@K���1\��ˢ���J��D)V {����;G�|Q�3��1G��
�d(9�Z�N��;V9�?3a�x2���br3�b݄<�b��Iqؠ��xz`�mo!���V1rK�#�Y���0����]�ј���*0HR��SZz�{I�)�N��$( �YL^|pO����jvq^�Y ������\{*���=s���*wl~�#5ߊo�#��)=��)��F��39��	3��˲��Z��	�5�r�r��:�[��M�@��TN�!�\�$C���I�>�uG'�:#�)���_<�d�f&ԣ���]��D�:;>ǝ{��8H	���[&��a�8NI�� ݪ?���P%�� ,��Mr�2j���V���Seu��w���[8��c�\�!��%Y��+�t�7�qӀ푒mAq)OV`P5N%bd��	�U.�e�J�.�B�-+��j�s��e5d���P��g��dnΑ�<'��r�*�+>���6�j�Z���$�	�\����ʅ
�^���0¡O�����c����CW�ܟ5���ܔ_T���X������Dҝ4���sH����TJ�} �Iv�m3���+��lpy��&z�ߢ*�$�ɱM~v�'C�S[�P��ф���[��ԽX]Q��u�B9�uv ݌ �	�B�ԫ4�N��{[�º��*9&��&q��h'��m?D%|sO�(��l��?�S�faT�U!7�,r,
��>������un`�	�J��3��3���S���ۻT7W2���sO΍��T�F�C�d���(��@x��B�N����r�z ��q(����K��q;1��!'{R�UF��蠣�P/)6|��n����7j�q��1Q�&�ir�
5.D�B���|B������Șu#WۼR���[%f��#�<���(/Qul�6��x�&nE/�[pv���&�q
UE�" ��J�>B�HAn%��w�()�u��B8D]yu�rK������S6s���;+����L�bE�T��'0[w_fՃ�%����Μ�ͪ�Kw��:b�"�ʝ�~ⵦOEU�1�T�+��[AS��Coh*Fn�N(j5�C�)58DOeU�� Ze"�8��LZ8X��ʘ��p6˱wJ�'� �Q�Ĥ�E�{�N�!~�@;���>��4U�'��3�e�:�B���K*��g2k��U�G�$�B�jj������Yv<�`��
U��>�k5"Gd�aUH6��ZGjp�mL����:�ʃMWZ������I^0��M�4$��[����a;��@��ΣU`�dR�5���9ė��쵑f���x��;�����}Rf��i����c����P�86n<y`�(�i��VG\Y�g�ɫ.��c�Y��m�'����^�;�1�������+d�aD9��_YJ�0��d/e��U���5V��٤��b=��� 
K��BX���ΗppXnP9�&�#�dt��Qn��n�}�Wc�rA,s�'���]T:��qK!���[����U��*�|[�%s�@�/��WfQH+�r��q5d�z�Lڨ�gn�x{���BE���F�̈�[M����Ě�h�QXV6Xp�)��T�[����	�kuR����b�#�y����H8_�Id��ۦ�	C)�^�4>��Vr0��2j��񱧇Bv#hu����!-C��o�Gu��t�0�f�Z�*Sc����x�����ܑ\K�r����=W��.v��%V����3"�e��4f=�"�n��	�����C�[�!vw�J    K����	�e*�E�S7r���+J��ZF��C D]E�v*]�8Zv��6{���,��2R�-��3����\�d�^��������8f2�G!H�25��Mj$�JV�3��m�o���e�P��������CqL�zI���$׵���Z�8��P笳�x�G��#�cG��`a����D01DM"%���T�Sޅji�Q�]� �L(���_����%�]�j��]����9h�
Չ���n��l����j߱M�ر �VV�Gj��2��]��kNb$qz�ӵHq9�t-�C�6�G�@m�J��߁r��e�}n��n��aj;�u���v8o��a_.�z+�w���/����6J_�ؤC�d���B���F��_�f�]ā[}
�~r�zp���X)���")��I���j.@�Sp��P`�~�P.�څ4ӓ!htYO���<4�\U$��r�ш|��бp�h�:6\�}F�W�s���}�����ŵ�u�G};.u�aE�i�{��|�T�7/82���sM8@��ȁޖE��'�L�^`��[X��ِ�C8@U�-\���Б�L-/!ڎ]���pQ&��'�i���P!�>[���@���=��s�m�6j��+�!
�L��h�օS=`ҕg��lS���4��=�`�A�n�l�rw|� ����Ge��9� ��]�]5�r������K����QAJ�k�u��,�K�C���+ȪY8���Yb:�H��H�=Uwm����� 9����uϬ�ؤ�2��21&_���N���y\���E3n�H.	O�qd��=�i���)oyaG����b�
�s0���]�p�%�*�*.���P��(՜�����Q�O:����
L�f��q��	��B�?�Xl��^+W#�st���LU9��{P*�,9�v�,��ʗ�d�u<�?&�lDĥ+���N�iC���G�I�Y�S�r�L������T{��K�^���FR�o� Pl�їzB���-�5q[#��*g��?4+�c��;Q�ӳ�q�nw�<�x!����2�"ġg��5��^K=]B~���%x>���h���F�H/�7Y�cy���w���q��:��H�����/�eӹw¹/�����FsdO$�{,�|���ض��H��\$�삅�1�z�۰K�zW��s�D�x�J�6(�:�W�)��}�j��Q���5-��0�x��؂�16��9��xW�:>�h`$"��>}��-��~�N�m_:H��ⱸ�����&��b����G��)�6L��_�+�*�S%v��ͫ��{-~��6ruQx0��N͑a�9f����KV�m����i�����L��=h������u��؀��~��]R�;�1�sٚ�y�q�G���mL�ԛ�\UG�㝡����??�&fJ���cؐ��a%$�v��i�����p���z�R�55%J�mP�O��8��L�W����������kq����J��&�*�Dvtl�{�g%yq�����������H��k<�X91ġ����%�����:��ֆ��1S�p0�蠴]�́m�m`�F��yz4�@ې���q1o�q��m1(��ml����0����ɖ�m68]�2aXF��~��H���4P6�Zel�)__QSVMXd{�ڵ�"�5V{�^r�l������oH�3�v9��+�j}�Z�����z
�ao�l��rpGzG���t�t
F���o�t����S&���H��# �<vK�q��wf��oƻʫ)���c�4�{G^�&cb�\�;��'��ǬO�˷`�J!	�1/�wJ}���:19e�Ý�h8Q���4�%��֓K�5���pX�Ms�⼽������k�C�e�m��:�8�/�S�C�]�ҫv'+
q�a)l19�L��oW+N�-ݲa�lˍ��I�˝<���GN�g�k�n:a�F̲Q�����C�n�o�{>k����b��o��� ��r��w=��t�g�¢ AM�dk�Y �L5�g���u��m.����:`λ�@�Iz�⟷����Ɋ?���c0��1�H���~�dC�~4&�Vb��Ĝʰ�`���	�9w��g騅tv��m�r�����n$��&�-.��O\�:�&>�e�C�p��C�q��S��/~e$�c��?#�Ã�>m���8�v$J��KZyD�S���i�yk�fK�M���Qgk?��y:J��1	��N=��+�E����:�e�rb\ҳ�''��ּ ���s7��������'����6
�G��u�G�N�h1İ��n(9������A-S��#��~�߾�1��'c�i���v�ݙ�@�d�9+���'���tu��hN������
�:�S<��y!�.����^粞N¹�o({(�e�� ��^
v�e����;d�bWVc�����6�$}�y}KZR���r��kwz;O�5�X��p]h��9<e?5wÓ���m�I�g�԰	�'!b"Ʃ�Xy�����'ېu4��K]XU���ό�;|Gm?e$��=���B~�Sűj�6g�!y��U_��g\��������qa�R�X0b$p��<��e�o9jx%d��sd�N��K֞DՃ��j��X9��^�t�d�>��;E�8~��5�_%�Q���e�RZ'����X"a����Y��`s���:;;�������\T�s8�kX&C��=�\����P�.�]u���Ūr�\K6	;d5
�E����cx��I��k亂+	���3�(b�n"����%1�pr/϶��M!�WO)�ø���]n��k�_0�Ϲ���<� ���0}O��-���:[_�����z��Q���6v�'��u�HN�vdN-��k�'f���*��st3|�O�s�.(2��4���-YSɪ��v��[�#����'���m�����5'=�c8��"+�r"R���7i��>��/���f3�븖�����0�</�5`s�퀩g䭊��K�����5�m� �I�Y�;e�T}�|�.��+�CYK)Y9��D�$z\`?)���v,�FJ9��)n���+P	U.a����p���uO��*e��h*�C7�Ie����"q���~���./���U�F9��@qh�����	�f/c�T<H�I����~7�����y#��'_cw�(�h��������w:э���������\<ė�r������Н� {�+������+�߯��SmlR��gƚ�8�n�٤�t���n�e���ܥ��.�8��񹌙�0,b��?���[8bH��QHʹn���Ii�r���=//��$ �!�\��g%�� ߇2��q�>��� ?��%�wv1�@��^�$�8��)+��!���;�ӵ��Ny���-)���h+qt�qI��,8:13i�\2&W�۸M
sO�"������b���ǂl�x����F]��y�|�R���#u'����k)�א�y��k#��aZ~���.�]Z\ΆS���}��N��un�/����X��E�ԒUx脔Z��qb�"?�\R��u"�(��C�#��|-�gg�c�p\��Ɔ�F�"�.Lꏺ�e�BV�3���P�/F�sqt��42::Ψ�r��`&����҅G��*���(%J��8�Un�5`'��0�:	n�O�E�R%C���jFbÕ�*�]q�¼�O��an}���Y��$��I=XI_f_�r�M�+�"7?C�=��IB�����0�0�^�+x����ŋ���W|Tr�\ּ�>� �ڭ�8��Fb/F2��68��ڢڤ6�M7(�hi�Z�V�^��NA��R�<v�!��k������ ^+����D3}��g�ޝ�M=�O4~ש |� �W�l�Y�ű�F���Ǭr��k;��K�R�=(��݄��%�#�wk��x"��)㹇ۿ��b���$H�k�`�"o����Jy)��%�Ie/ !�C���ܨ�˦P쌭�YS Amj%�W��O����4;5
�'U�X�|*���b��#+�AW�U�#�    �[�x�Rve�I+���|Q{�>|;�Vj��RvTY�-�=�Rעг/�q}�׻�P�������Z�G��b"��J��Fa>�<�-]�yRɅ�:d�^X��Cra}��P�rk��!���*Y'->��c��)�.�~5r#�+R)�|~��X�����B%�Ƚ�J��I���Q���$���W���IVqXl����ЭG�i��_��
E�~?⢯���wd�"����K-J�U�z����jPJWtѼ�3<%���5�NӚ����\�9�^$r��#��3����m7��R�퉮�>X߇:��T>�_mR��e�ЭV�H�i���|-�U�-o�QS�݌�.���e��s����J�Pi|���Q�}8�B�~���;=���}�����n䙁�z�ԉ��w�W�"���U��[b�E��>���Hb��#>��:�Ҽ�8�Tš}���?l��w��%cq`�Dt����h��T��0ɬt ��')����Df֗�'!Wc�{�nCI=���x�^�u�/��2�2��U�u��\����P���*K9�X��O}����L����A�||�b��.)Ld�E�-z�q���Sv��(�.�K�^Q\v7�hɆ)��D�"e�ő}(Z��?��m�����ё��Ӛ0����F:�n�0��՘���x��Tkf�����e�C㞥�L8�O6���P*�X��s�����xU`*�SԔa{�X��Ɲ[E�t\��.I���OxҿD�㌣Juߡe��I�~JHc��q!\��i�,��VևG�_(�U*�iaX�N�,ct��Ê,;��d��p&S�wy��F�u`����ʀ��A�T�/�Ё}��E)'����!���:�⡧��(�.�ُ����K���y�	�K�T�m��a|�����;�xF��g�d�B�	�Yo��M��s����^|YDw�?���LJ���5*ǂ�!����>��M'ۭ�,	�0[V��D�����)��ٟ���D�vV�G¯�%v`�RUl�:�,�Y�+{J ������N�99Z
�-�;��WQ`/�E5���=v6�&���2�"���+��:
|��~��I��t-�ΖV
튫;X7aE��ň>ګ�_��i�Q�[�α_�j�E��$O=ָ�2��'0}�X��\L�����ڭ4vP.��S�Nx�PB����>�n)�k�`�����L�8r���Cx� &]�Ԉ�s턿N���$OAH'��U�� � ��	[%���v��Gwq�8����
��I�T~��)G~\ʙ��T�ɖ�ʵS� H�A	���>�p��-.�qye�!����}^��>T}���*,����1I3�ra��>��5{�y�����!�m��Jʞ�YK�m�c�<����>?g�q;v�e�L�'��3oK{0���cg�R{���WG_ڱk-�ַ*���k�p��0F�}��A�U1F����ԗb�*ÿ�gAoFd��n�V�Ѕ���DJ�_<C��=ؖ�b#�c#Y{�h�I����ؠ�d,���	��RX�$a
˦�Q�̴�!�`�%�q�"6�8	��&�A왉əWx�����d�H�� �ϼ�a����!,��
6��70��:���T��0��z�ņ�E ܾ���mY�V2�`qT��E����ޡ��q�^��R��6��d?���c?D5ߺW�8艧*�x��QQ��/��i����w;�֪Qi�`".�rJ:�Ϗ)��>��j��$��`&�7�I�ol7�Q�2�H�!��,�:[�7y� 0S"��m������mn�����d�Ě.�z=��P(1�ˠ��S�o��>��\*8�O���0Ό[�M�zƧ)�HE2��M^��*����>�Q�;�C�����Z���T��p0ӷ�H�G�>ُ䂩�x%�k��4�ғ�T6j��X�S郍j���<�,�aر�K�:�����>���ڥ5���>�0�[g�^|n��`d{�-�-�%K��E��֍c���Ɨ��}O��Spp�]�1��U�wt��8�IWy�/�}�	D�'s�غa�N�֍}����)��A��/uׁJ�V�\AI0/:���#�i;�����^�؛�l��R��Ԩ�d/�j}"���>{�7�c>��m6�c�i��n�n�i�&��o�(�
\���� X����_M� @����HM �'}g�1 ��e�����E�H�;�dW�P�~��[��Kv����_QGln/O��a"��	g9�<��K�{GR�?g��b�o'0��C�����M'�)�m���nwqdư���]^a�_l���3��w��҅�v� yb� ݭ���l�A����]^���pQ'��C��/���`���%(UGM�LIEH��]^{隗�����d�IѰ����w60J�XP��IИ#݄wϿ��}�8���j����%H�C���L����LH��z˲�M��2%�}���4�O3�SF�n!퓭Qؔ�v��f:�=�_�&����,S
�%�}n*���/�����w%�+[�ɮ��nB��:�Ηym��O5�\O�!�i �P��rp����.��#�!�؇ZW|s=v�)]�]���M�Eg��s5tٍ���d��4hι�����ɜ�'
����ĺ�����͖�P�̘��ֱ)3�z#n�g��CAv��+J��J�P��<i)Ŋp�n������)� ����pkP<g`e�zdt;)͐B����qL�/�G���1�Ld$�e�\L�}JF����X�������L��<�(��;;�訟����FM��GU�����j���C=	�r�N{�h$��f�qo�<���>�;:�8�O�5~����0�ԇ�A�6Ɋ�=��ݐ�(U��:�eAm�(�ҟ�'�ԠF�-��g]z��ZɊ���aO�fMX�zjˆfrg�ǹ�DO��P�(���8 �Jn��?�6n��>�C�k�l��3(��Ҭږ���P�*fj�M�-n'�M�;�A3��F��9���<�8ҕQ�;كR�+#� �螪=F1����vm����jO"�-��`���;��9�}i�f�i˰jۧ��:�����AL��]^l�lꌇ�wp-��>o��L�x��L�C)�ƞc��S�l�sJ�y`\�{W���������6��xhr�_2��ؓ���`��i��;��v\�,��	�R�}
�E,�ɖ1ӈ���X��ڑ&G��C��ϵ���K�@+X�zJ�-��]�r��J~�'����c�N�^F]ۤ�e�q������#�ԇx��Hc�W0�hg���
�er���g�<T��1�����6�'%/���5Kfv��Y��{�dV��QI�>t�/�&�*z�e�I|���z�o�҇d�/[�G;?����۸�$j�&���)�>���V��t���>	A�eKZ�aTLy,o�L��9r��[�4��'���±��8�5x(az�~��ܗ��}.�m��{��yӖr2`��C},���F���[҇��|��-�M1S6�=S���7�)`�BiR0�{� �m������"�5���	Co�������
W�!}���gM��h�������ٲ~:���Q�5º�g�t@�ȼ�X=�C��IE����,�t�S<umqO���[��/83}�m�ٟ*������Ǥo���9(7�YZ��<��r��gFcw����#�H-,�9���m#�;/u?D�ؽ��o��ۨ2�H�������%;ϕ��İէ�Q}(	�[9�q8�Y�C?s@��$�0�ʎ�(�����V�m�8qx(¹	+Piu
�a'�S��FE��$uW��#)�.
��T���dN=���;ػ��1�\y1��_	��2�s쎺G2��E�>Q����,�ez\l�����y;Ӈ�5Ldl��C�q�09%^^!	�S�*\��e���0v��D��7����P��) \[U�+*��v�%�>>X��Y�q}^4LY�H�G��:�<�;��`i!���iV��\�A�H�/U
pa����û4����q�yq�OD    F�f�h��:�����y�f9ݑ}2��f��b�(L;�uPc��]Kp�p��q�
���}�,K�6S��e�;�����h\�6y �c��� 8������j��Y��	�u��q,AǓ����:u����d`3@�$Gb�џp�z�����'N�2�Xv�?[�a(���4%p<K;���>�r$�l�~���k�:qX9���^��A}�<I�C�c�>q*n�����Q�U^<9��꓈T7[�HT���>�c}�/b,~��8��'u������\������}s��T����g'��>�rR��wܶ�Z���a�ڲ��v�wL�d�	�P�B�Z]F�:��+�Lj�EP�I��c-%�b���^+fTY#�Z1��o�.���PY��E�j��<ˈ�k��%�M˽:�%<�\����A��z{�"����C��dԻ�3��^�F���C����j��.%�M�|�o�d��̔w�F_����dq��_��EW]`W4M�3��{&՟���\�m��>����'{hS(4���Frj�����jI��H4h��X$��X6 �IӒ�C�XВx�Q����H�eB�e���lP{���e�f|��Ǩ�%�B����KuL*���m�&�E-��D�[��@��˺Y��hi�aB=ר@,�,�Y�^H`����e�hI��� Q`���,H#���e�c���W�6��6^��t����������H�C�$;�r�c��h�}�`���E���Ч����>�:�߅�[0o�/�(-�a�!+�����/��3�;�0Qڰ3�Ǽ�N�BZ�x�%0��Ό30�J)���h=V����n�;��!}ȍ�<���{eԻ��M$zi�.hTxhY���(�Vv+C���T����E���I�(�x(w���J]$�'�l	U�n���t�%+�ᲩC�(�O]3�!��Q�r���Y�(U�Zo1Xd���������V�,��[,����Ȥ��X�p>)8�e��R7��,�'^�'�\	]4�cuj��.��^��U�'�������b�Y�0;gWML���͖�(W�
ق�Q�L(tG��n;l6y�5����t<4�����m�`Q\��e�!�*�� ;�� ȑmՔ����m�#x����7«
���`�{p�����jyMg�;��9�y�gZ�A���&�`�Q�?81��'jx>)�]�8����Tf�϶�*A��(B�� 8]w�Wy�{t�7p>i��-��H�a=˧{B�VEU{���=�`�v�o����}�T�w����$My�Z]wDD끿K���i���5:���L:�tc���^EYv�C�,�1�����I�ۡЇ�Z����^}�>�c��!�-�9˲� ����&����`��U9�9���yR�g"�X����:�e�s�Ùا�Q��'ZdS�� ·R�Uʽ�|�O�_Nn��2��5*'r�<b/,`��l���]���Z�#�q�1*�R��I"ym�6��^v��$@�u(�@MO�d�����R���M�UL�8"�'	P-�p>���4!+��#�C�ka��0 LDR0|=���3 ys��mʂ�-$�e4'�d�r�y��wg�T�a�3!�@�T�g��
�E�`��������-22��[{
)T�9ѻ��� �IX<ekq� �X�a�֟B[��%���P�&��ui	�`�V߆�<����qFVq����C�F�2�*��*+��E��S����6�"e���`n��H>��Gޑ|2z�uv��uen�����{ы�sM鉿�%����=C>!�ˇ��a�oV�	[��R��>�j $hr/���-�瓅@1y��Fw8�U	��:����h%~8�ͣ�E�T�ԣ�d���%�T*_��MN�@��Ƹ��Tޜ�װ����������uZg�^�O�*��|(����"�}�p�O�.BE>�p��9w��5�y026�[<AE�jɮ��Ѓ�w��%�!$�E)�GLizt���p\C��^�%Z��Z���ɓ�{�%���X8�ņx�Z9��f�V!�ϦV%[���}��j_Sͅo��1}��ҙ�!}2�3Mv:�G{�>B��`o�X\;�	�s�$U�)��<����B8M����(hA��4OrO�''0_ITlUe��LW�YUR?a7�޺���T��X$]w�b4����V� ��˦z�b�D��'��T�u��Q�TO���jd[����,�YK�-�Cw(`�AX�g�D�sknz+ce��c�d�Yň0}c���`�v�;h��q��I_e������9�tOf�6����8�z��	��g��^vW`n�j��D�j��mP{';L��E,hr)f����8���|꼏$���A}�L�	2�2<CF��~3�r"
:�0��0[,)��io;���{��gZ(�y�b�+��T�]ǐ�����&�>�sP��=�q���-�C/���ú���n���Z=|>�2��A���UW�%�J�x�\�U�8�yy�vq��U��C�$A�U�'+�|��B��Y!�>l+�<j?]V�"ȓ������|�����Q}x5�#��b	�W�3j�<_W�+���2"���>�,�L�bO����\���^��3�ʓ8=v�$�!��SN,�A}���}1}�+Q���w��dpZ#yOPXQ��s½5��B��I��mwDp�i�Oe��)��uk���/Z,�I���ɑ?@��28�
�	�2��JH�꫎�s�n$T��
�K����kF#�U���f����W��)}�������̰���L�|�5e��5�c�Py��Bkd�sx.��ǉuP�nsZ�ǒŁjE��{�@q��F"�Ni��֕���Y6��u\��+}���)}P�-�TE���)	C�(�Bʍk�3�M�۔�A��ɇ���w0c��j8
3�n��U6��P�:I"�at���Y���B�y&DD Α}m�w�Pcw�����_A���ɉ}0��PJ�㳞�0�ʪd��3Y����%^�u��.���P5�/{u��B��f��j�LY�C�֓���r|�*��r����F��!��)��'�ފ1�
&��=����mA�m%�Lw���'�V}���Cb:�g̇*[|�����)ŷ|{�'s��Wk���>;�x�d0|�Q�GQۋU���(��s;D�I�5�����}�Z��j#��vPco�B;w^^S�	C=b#e�,�lو4-������
����|�̗��;{�-�.�5QƬ�C��W����񫗿1��#�3Y!oYv���<���nq�uU����o�5�z��y�1�Ɔ�j�8 �{�
��bZ6�����>ԙ�;~�}n��5��[<�(��E����<���I���M��E���rW���M�!�Z�ݽ�7,�#ןu��?�ʋ�#�:��c$;/�t�`��d֣2ه����������o�2ߊ�AǎX�x�a��{P8=���
j7����.&�[>obm{�{/e)K_�4v��r�@w�������*We��Z9���������~.[�F��3�ϩ�%ݰ��m�N�C�-�~v�N;�ri�ȦhZ�C���g$7a��9G7�&�ϭh�%�!=��ɫ���}R9����'3x���D	���}��^�ѣ!�򄱠�M�' �';�!�Lp�3e�L�#��
�Q�W��^ǯ���>�xV��G��넇��D��P�O%ZX4�k?�?7'��>ԣ���"l�N*�ݤ�A���Ig��N�l�l���b[���T@�\-k�❹5���>I �];τ��x�iO���]7
d*�>D�>"P���j�pS枊��;`��/��-�����������:v��zˊ����b��Yꌈ	�NwEGmU'G3��߮9���o&	3�_�YOh�����5��Ļ���J�z�T�?=�X�m,�c���d�D��� �S� "��{����{O�~K��6�]�)6�i|~v��X ��fR9�!/�ɇQ"�e4��9�*��~���    ����I�6V����f�:d�ݬ�,�U�y��J���21]G��J'�����9ԃ^W�w��iux����|���E9�k�&��)��#��b$+8綕ܴs���"(��>��\�b;�q��]���$D�C��t�c�\Ϡ���Y��$TĄ�A\��%���e�ĮX"ׯ���	�6!T���(��.��g�M;�*�G�
�4�~}T�{��4�u�C�F�g��<8�:��G�֒VxԜ��/?�C�����U��:�''�d�T�=}�?�$|;�����{��L���1H���_O��k�����`@}��WPh6҆#+�vJr� �KP�H~�ۂ�?3a�2��hD�-��e�{P��َ��hu���w�.:wy�?sb�B�,��ʉi�&?���n�^㺙r����Xv6a�R"�F�e$޶/G�0a�c�'��8����`y�{��r&��o�zt�A��)�=}%8=���8�{O�����:�Y��:�3�#�P��ӄ �w�b�D����1X����yvU����d�Άyf&���f��0���%6��^q�),��Q�ò+�ir��yή��Lf�X@�;l1��$�n��|�ce�ft�8�OV��&Ԅv�X)��BY	�>�Xi���&�0a��~��|.���3˭9��Y�F,b��\�6ux�7<3��g�������̒�	�y���g�W�I}}T�������{�e=��\��̝�>z��ɵ��Fs�ʟ��ݻ/�	������\�ucd��C	>���~��'!�\�%���L�\ߖ��P�j\c����%I	C�L��զ�\��-��Z���Z�Gq�cjfz�f2or�1~�f?#\�_�م�ߍ�0{����4����A~~Z9f�a��&��^�����Q1
��� ?��:��17%��j�FuՑj��j}�A�"8�0?\�g�=�p*�%�l��H?	�����?�v��e�s�x�]�]��(4j�d����Q�3/(�-f�=#Q�5��H�����g�%^����1�"'3jTf�^��GHiF�f�nT1��,~6��V4�G|A#]�P��7�zQ~�Ij 凂����@�������䟕�1�ǼGs��:�a#A�����G��\%� ?�����&�̀��{�W=��I�?;�qQ~�K~%�z"(���hkc�GpV׭;�d����Duާd����Wy��m>r�;����Tެ���m��K��]%��c����S�?mOD���..��j��V]k��`�E�%��w�`��aì����3\h�e�%�$�?o�媩v��৒=���O�.���K��B�M��L���RM���cK��I��|s~�� ��	+�~2k���K��� �
miz;4`QITs,MzG��^�]������.M�88�
�T���l�rbmyU���c�F�����.�h�]�Y(�g���XӤ�G��J��
�'�0S��n��?W��K���|Mt���ޣ*c�L��I�e?�Nb���
��%7кz��~׳�}w,n�����\<���'���S��8�@Vʞ��4<��OIN�x�5�%�}^;9�0?y'$X ��]Ҵ�Q'|�gw�����"{��@0��sg�LX �I9����2�ݘ��(?����L�X���=.��`&T���d\Ѝ±�Ev]L<ـ���U;�\����D������u���S��0?#*���o�4�WT*k�)�����9�Ov*}�f�$|v�
9�������A�_ 8�nVJ�Q�e��%�+O3�js���Kg��GJ�E���Z9ZR���Đ������}���2O��9�O�t�uy�|(1s�����5G��"��$����A����1K,@nqr��oD�wݗD�%!�-�~NR�ꇚ��SX�B��2�	_+G�D���~��R�����<�{u�2m�q+�D����W
�C�"�{iڞ{r�[��R�����~z09ea�X��2��7��?Ao+�-�HZ+��D��
g27Y��b���H�y��qd����]�k���dyӘ�?-�%��XaX�V�M�E���'�ₗ=�2�")W����'.+�P�Z����[��+瀱��b�S}����4h�`�5v��k��;�A��ۨ�p�q�����Ԅ��#����{��٦[���2y���Ai��g�1���x?ľx�Kٱ�Ɉڠ�X�&�E�ӭ#�Ȟ��閒(�2��%��L=0��dP�xh�.�9���2��I V�/]�u�&aɎ�M��<+�q�?��Ê��L�z��~����9�OFT�<%��h��"��唕��i�p��!��+��S�N��:wD���G��L�֟��(0�?�mt�pПL���8�e��jd��m���`�[������7{��o��fRV�����BE43�-��g�62ޜ�k�d:�8%�.;���Q(��|��13�['�gRx{D7anv��1!�R�>_��>�&^�ٵ[+{���A�QXV�k�#��u�S#��[2.+wdj�q �`�oX��ٓ.�3��Y�PK)���:׍a$��_b�v Fn�C�l�!��o߁�$[���O���g�iB���C�#�??��u�A;%	I��*�����/6��0(��p���=����}��i� Gtj���F�(���G6��O�­s�'�牌�%�O�m�?��Kz*~��#��[��#ķ$=�H\����=7`����l�i�P|�>3��R���$�zf�Ɉ5�'3�k\�����c���sit�u��h?�$���G�*,�}�����-a/0~�V�t/�2l�jOz�W��N��58���&o�[�@�!���.��D�ܤ0�`DXP�qt!tʚC�db�`�L���II�pW񇳿��f_7�����d�l	A!�>�OT�C#�G�R	�*��ҷXdmD�����{��a�eϔ������ �g���!���'�d�!K�%l1�aٲ��M�S���B�^��5�c���['�h�g��4?>���D>�ʳ��z���l�9��6�T� �O8+�	tR�[N���p��OY��Ib��t��&>��9+�����P��S/��b��H,��vú���3��-n0��]rJ�L��^��&�U��ę~�p�������/����73�2ҁ�ʿ�L�l�`���`��.���z�������Gk�r��<V��s��j�l������*'0�Rm�6#����ڑ�p7����]���,;?a��J�+eg|ޅ���5�嗥�Aݕ�&OKf�(�va��e%)�g��6���0:���O'�Lp�}0&ߌ����J�:�,���[&{J#L��,Ǻ}@,����Ԏ�m��Ra±�M�DʋġI�f�Q��G6d�iy�z'�aU�|�o�s���e�q�<wש���,�����Tez�>� �'�Yw
�.��=>�CE��#�i�p
6�1� �DT��$��s�KF�	i�?\鏟-�Y�n:�����NGؔ�KB�*W��X��E���P��%�@uF�z J|�^�Z�I�^2�[Ӧ�аV��<��,���T��~���eO
��\m���.�OݭӦ��9�W�����,�-��Hl�c�\m��m���`%K6�ƹZF�g|�A`/ǖr�*1�e3����J=��r��2S�u(�u!��?� º["k���S(�;ccz�~�}@���Dw����|s��13M73�}ğ���C��9�n�`�A��g�nD��c�����}[�ȹ"֥}����%J1�(!é�Zٽ���ֺ��.��{�!�����GL䟓�6�JS�ߨc��U����t>u�>Ԓ6�N�|�;p��~޴'���I�����	U��V#�
*�8R�]I���u��<�M�Py)@V�)�]W"���P#{ܳ:G���Wg�]�`�&5��Z�S�}����M��>"?qx@���Uѹ�r��2.if?J���! ��fQhjV)1M�I`��
�UXSU�����	�֓C��8t�K���Gw�9�O����9t��N�I��    ;n��4a��� �(� Ɇ��5�O��LL4X���2�B���C%�pJ�:�9��aN�۔�}D���Tc!��kB��и]_Ss��^����H�R�a�<N���2i�����g/�;��_��r�jK����N�������?�d̲xi�6�sb�Z��ҌR��w��&s�2%��Zb*F���琗���P�;f�f5���8L�R��Y�r��՚zJ����yT8;�?��C��r��S���\�ξQGf�5����d'��c���C���K�Q�;�%@��q{�>��̺N�N�Ɂ�0��m��3�);k�&MvF�8D67�Rk����3�K����l>�>����X�8���㫤&�iu�zW	�-��l�n�ݎZ8�ua�Vc�$X�(��q&�(qF;pyrl�V�g-��V*�挆uk��<��֊щ�_5.�����t��b�Շ��ѿd�����Ϟ;L�V��t��V�<��)�v�m�x3Q]u��ۓym�V_1����Ӓ��%ڨ�`uք�]4yBn��M.��Ӛ'	��/�O9�\M:�	e���OV1���Q=Д�� �֧���׊�m��{�Q�$�xJf�1��vU#�[�A��ś��Q(���aԊ����+���d&�}f�Q�����g|I>���j�f�9޾�ap�����N��i��	E��8��~����9�0Br���L�YP�rm<�lg�Fq�P���Vpo���n-�eϩ�$�CV5
����N��a�6Ҙ��Z�ʈ�Pb��o�TϤ��{��C:���x��6�d.�i(��N�A�jO�������F�E��?��h�l����e �Y� W������˩t������Ğ�t�Z��jK9�t����������:�O����~ ��!:�O��[V�Z���N�O=mqIx<����S���Qٹ'���ֳ �{��:5�D��STv[��O�!J�Dj�?wQ���������1���x!Lu�L����?|ۑ?T�$t �'�+���/�>�Z���Y~�e4����1������>���@`��ӲG*��%"D L-JՂ���k�Ηc�_�%J�<�PV0زSW�]�Vz��X�4����SW�F�,����L���V�ȉg�D���+U�ڞ{<C�-���ё��9���G���Eba����k���ҙ[�0�O�.v��t��-���L���O����I'p\+O6�?�Q�3�8��ɇ�[�N�k���Eo��l/�7n�r)�?��=Q�y��[.{S�r@ �-�)ԏ���
ڿ�?����W����q����ɊLv�����K��u�?3W�$!���>��&�_}��ö-�hla�Ren��?d9M�$�&���38�A���'_ݍ3����b���^��V�H�C����>����>o(bǳ��}�=�����=Ѫ�çQ?f�����Ť��e��u������_t*7���N��E�[x�E!����	7i��!�H�9nHV�G]�0>Ҟ��:E���������y�:�!]�ۓAY̰3F�t�{1��<�}g�G��n��Qɝ?�O�q�����Qo���׃oȌ����dA��q�e�T9��\bWD)S��#'�♬��n�y;7m� �M9�?r�@�I��W�D+�,��K�pw��t:��1dc�oQu�5�Si ��t������ķ�0ئ�0�w�Bh���+ɶ�a㿛Л�o��d�ŭ)'!���~��N��A�#�5&�7A!`7��'�k�_�ٓ2¯����c�i��ciF�+'kd�@��.�b�>�K�wCxk��uhb#�v���n6���p?N��#9��6�)��^S˨�c���˚U��0���#�
i&�-|5��9g�@��¥A���-�i>�	�R.����G�$a�z�0���henI$?��G��1�5�J���t��,apH��/N�������0�j�����K��V�Ք_�o%�'f�8I�GA���;-��3����oF�Hn-�t2g���,ǬX��[��IE!G�ÎW�/xJ�v��=��d��H�w�����k_���ڇ�/�>���WE !� ���@K��=�k����cuu�)R���?��!e�)����#M9u'��i�q���������OU�Z��q�!(�(l�pZ�4Y�
 ���*0+r[�n��;V;�y�'��C*{}�Vm�O�l8��.���j����?�<�~�Y+��Jʟz�Ԥ���nP��_A�
�t���ߚ��ϵ��8��njI9G���єT֣$֟��@p�c�����ԃ �O��۾tr�1��z��T�j`#��8s�j�G�F}�{<L�|(+�Yt��X��Bg��x���i%��ʆ����M����ep�<c:���Ia���j�xkv�k,65s�B1�~��y>�R͵�g+4	c\�:��k'xY�����3�/�;ʫҕ:˫҉M��ژ� [m-�p��e���l�����9 ��%B���)�E�Y˖�ι(�v��^x$�#���U��s�?u�Q�v�5���*@��nO̓��Bv��0I��K�΅Y�e[��-:z������
3��קɦ"6~w��v��k����)��3�-�ڟ�!f<��6�L{��-&'�g��%-E��-UL)H(�L���3��-8����"~�Ʉ�E�.8�1x8w׾�`�]/�U��w-��y����ψ��^�]Ń�~\�����O	(�c�����wKQi?�@������.�7J��)��}��l�-���@�#j"�=0B�WJ��fؖ���� �O���C/��P�P�vO��ߢ��c��4ؒ�Y�.��<4���������(����&QU.�2�:PfK咳U$��U|q\��qn�=���ѐ�������KC�|��N4��H�c�1{�S����������B������U�ϲ%{�/H�#�d0%3�ٕ�؍K�T����G�El*� � �� �t�1��p���!���o��y�d%�-�̝	�U���v[O]nӬ�z�Vv�0�T�>�9rL��y.]��7A*l����3a���_����Z 3N�S�仝�#��yW1]8��\�c�R�ԓS����5�-6f��;h������G$�ڼ���S��)?�σ�?r�-4���h����;@r$��z� ���j����`Ę.~Н8������P����SC��ɬXv^ڿ��_y�-��6�E����K}_�7����6�$�u�����Q�0�����UIkdN�_��	����l1�����$�� :C�~|⏭1��1|�}�v��nZV�ÖZ�<Ǘp�=�I�T���4�	6�5�q�˖R�}�$y%1��I��ۋ�7����w����	`�=�*?��~$3���|/6)�ڿ�4 t�O�c~T��'���H�^~�~3��9T��;��5��%�a����w�F��j�K�P����įxi~����<p���L@Z��i@��9E�y�������+`KNxq!�/R	+<32El��֧�~M����hi�7��X��|�R�E�x��T���_bN�3��i>�k∻�>��pn-� B�-��ŷ�59s�ܗ駄q1�SN�Dz�H�����ْ��"�a��Gν-K��۟:`��Κn�P�W&F��=Ώ����q:�-����?��~Ď�<���~\?rZ�O$J�4��T%�C�cbb�����F��R�MWN͒P���!.��JX��N��N�Q�8��?@���!����2@��4f�\�~��t?��E���"��V ��O��� !�S��+	��ih>��5W�*)�����ɘ=|�ܢ�-�FQ#s�8�z_؟�>q���v���5Ղ_4�FiE�}��n�bV�D��P���die�h)���.�������'��ňǶ*YT:v:8���iꊋ��Uz���-�ҳ�S���Ǥ�p��G�
��RwU�����SPb�����0��c��:8��g�-�Q$��\p��"V4MQ%�k���+k����!VO�    ��������Z>șN����d������k�����:&�5�̥�Ǝ4@���<e������v=�*��zm��4!Cʬ����d	yM1E�ڇ�ߙL�l(D�����GI��P����2b�oIՒ��h]Ok���a�˿M%$�l�ψ�=��؃@�[[�\����`�)\���`G�M�)��� ��zc��m�E�Q�n��'��?����d=����FKB"|��S�x�R��g����-��P������kK�y-&���e��<6���$���Q���.|������q�|?���CSc����0�?��^"��~$�]�Ol������!�e�^U
I��SO��n�Q�U�)�';��A��p��k�WOŒr�cp�h>1~��}� V����b�O���E?��7���檒{�\?�e[���cR�~��(�L֝��%JR������t��Q{�`)�Q{�Oίm���J��pKb��<����6��D���K�����(�=��렌��G�-��xTO6=r��-1J)p#k~�9	��Qt墜.��Ua!���K˛22��~�(�3S����`z��%��w�
,�Nu��<	���
����'̪BŌ/!�sg�~�Pc�C�є�%�}/U�ٷ�9f��5�����Pw��L�=u����M��j]�G
�9g����/�Js���>Y�i����so.w�=�y�JZ$ˎ��=����I�O������P��Vx�o:������&�!����绝��l_��R��'��1��ɍ;�7�)X�޼�t�P����+[LKe����|䙈陊�	N��ģ�F��i�)��c*��m�)W �������
���?r`O�!h��'�:�^-����k���-I�k�]4nM��Mh��M,)���Q2!v.9H�����ze���2��ZP��K)��ǹl�9�xK�~D��G\|�Ҋx4f�S��4���]��u�����$3�%r��;O��C��{����~BW��˒���Lt[�i=���=��qINf� 鏬/�4#�qK(s�3]b{��1�U�s�����r,�߰L�ԗE![��43�'�v+}�HO��e�k��f{�9�0�� Y��b�DyGh��B�k�.a�g�ĖZ�"A�H�XK�&!u�Qk�Q�~���GR�1�k�Bq@K�g�U�9|�'R�˕��w�_����1��D3#�Ҭ=��g����v	f���??��fi��hy��a�7�2��.S^��� Ǟp�<(��}��/&s_m%,��S��<ڹ8�@䌦�Y����#
g|���G�2l�l�RR\�ߥ]p��ѿ��vGK�>��5w���-��]A�#�ʚ��\!�T|���^�H� g�	g���T����Bf��A��'W��٘�(Y����O-���$�,9�F����c���[���D�����k\�*�|�G�lx����~9+��r�~�5�4�>2@��$��V�酞�)�O�ޚ��I�;f��Ƀ�k�y�Mi��/�E� � �1��̄n���'�nq�zz�B��Z�+��I��}���ߞ��c5��@>$���'������~Z0�hu	L���Z����W`d5U�����0�R�)�u��>���ɒ����']������"�j�{i����LU����&qv��-+]�M׵>�_�I�ӎE�E?��2AzR���uwY_Yo�b��$�
	x,NJ�j�g���f?8ă���Ӌ[K�]·��K��fs����;{u�nE�ܘn��CG�Sre��0Ã�-k3��l??����q��~�]��bY����3���c���;ð�ֻ���%��]�%z�S�<Iv��g<��cbw�"0������)�&F=�<���8T�_к����M��x�t?Z���)A4���Ԕ�z�������Q2[�m���xN=���~������ek�'���t ۏ ����	c��G�����.��W��12�$��#+d�
d?���j��;y�u�e�E�S/���-�C�Ff���6�Ff����s��~3��'$l��r� ��GJySV��ⵡ��ћ`�c{�ߣ�V;�H�0{Z�{�E"r�R�|�c9�-����!���㽩�O
k�Vs�����O����ah�0�5B�����!ž/ �5���PWfLU����1ǰ�n�;�K��$K�㏀f0��jx�d(�3a���`rg�&�or(���)�|��C{�i;)&�q��G�}�1	�x�t���JƟ�<�ߎ�y/��L�&\K�+v�ڷ�3[7!Z,�!�V�{Jѵ*�Έ���f�~���e���-h�'l8l����J��-[-9�zbm���U��ǈ�Nl��m��ʶ�=�[���Ck����l?�q���G�*S��*ُ"o&�Ŏ�*�>�\?�Y%p��.���o�O+@��<�ZzL�%1K5�p�c�gIВ��T��\?	��́�G|�t�t���L��
�xϸ��E���Nx���e����O�	�7�~����I	\8K5��z]����7y�7]-46r�\������N>#�d�!��.���-����!{OsP�<I�c&9��:uXǥ���!d3��@@�����('xK���!�J���w���Ò\z���>�UBY�7��>$e4ܔ�]�R*�#��L�����\sy�k��ނ�ߕ��Վ�N���t�'���sh���U�x�9��s~� ���9��S�o���-'�4g+�kpp?��9g"#6��k�{�U�����Ĺ��C��M��]U���"\?�7�Ҵ]�����[�W#���ӝ���]����L?�dKb#�58��F�Ϥ*������%�Yɝ|Ӧx��k���cu���;�i�7�7�'�%p��t�l�*.r\`S���$ُē��P��3��7�4P��N��Qs�{�J�߰�������B�G.�O=�������z��0jP��g�d��ӽ.P�zuח�~}��G��h)�j�@r��	=�k�{J�Xr[����%>��V����A�r�i�OA�#T�l�Y�C�����`�����,�0�u���.|��^�2�H��}/ك\ݪ�?(��j���k�tB��!�~���_�]��~$܃h#q�n	3^DB��# `Ja{�޶��AK�@��Ҹ�{ea���'u��w	�b˯���́�'9�q欞\�g@�/�s�@�b�q)�K���u�6/)Y:�:����k�?�;��ɖ�d?W�ZCAK>&�#�r R>��Vk~$bKFv @��4ڸ�f{�|&uX���)�:y%��}��G@[����P����)�ȟ�I;�*?�X�#Zr�������^�T�h�dz�;��'�2��(κ\�-2
ǲO�<d�>���&Y�i/�<cG_,KԺҖ���Cצ��x��z�}�늽؃%%�Y�.N6�J����]��a�&{��]�n�;G^B�v"� �Q�9S�?�r���$��0L���+v^>�a��ۘl;.���e��{��S��h+��ð��ي�ƾL�q��?i(r ��yS�Я�c�#��ް���0S��;MA�#�]-�� �Vi��G�����e�I�� X-ri��˿��P
�Ϋ��*|mh�kP3ν��]2���~�Ɵ�_>t����&U��x���ӕ����߿�ˋ��64&�?iS����{e�: �(���~��xQ�I���?G0�ﺺ�q�X��[�zJ��YJ�O`Ϭ?�~�'��F�%���14S
=A({��N1�r1�yW�%�O����r��=�M�6f�m܂q#��Gn!��"�d3���E�ÿޏ=Ɵ�Q���Ԡ�[����a�q"sMfқF`����&�O@�l*��Ya���D[�s��w��[�8&����ieL�'��G|�B=ۧi����U�9K��=��%����e��k�]����=.�r������bK-\%�uh�������?��N�0�]-��^zr����ke�tGW��D��d�"nּ5��h?�~������O����K�s](�,�&�    >1�+� ��8/_���1 �y8[��L�'���^�����,.P�M�����b�E�Y��{g^�
(r����dI��V���?S�,�'�?N��I�Ƙ���X�j����pO�۷�t;��]�^��i�{RMu)��n�8�ք�����HrzjU�e��{�o����oU�����G��xHc������,E�����6������|?�do������n1%}<�	�����I�����0�(���m�n�6r���ۣ�ϙ-Ml�,Yr���
v��?K���@(?y�"�5�d����'ȕ|?�`�R�$�L�$މ���v9�Bd/���?A�!�n>�-,y!�R�+�������)Hһ�M�1�e�WW �2�?�^�#v�zc�S��%zڏҟ惴'7��Y��:iu��-�H3H��"���<,l���3{�y�xf]���9T��ܻ��˹E+�9�Mܰ���^�j�4{���b��M֟�:�I�.��s�]��wR2{3���ܾ��Z���Mp�ܙ��g~���9/��>E�L��kO���8�����=N��e�`�IV�C�H��o�'Id�
�����}O�h~�֬�М�V�\>QE���E���m������zb&�Z����_S*�tk��<=���搋�U9W��`�m��-��A5�=�_���Xg�k�:�Vt�ULy����51�/^S���e2������5	
._��\�C`��1?-[2��=!^�r~�>�4~O��o��ն��8%�O�b����2���r�q�]����o)b�rJ�^|͇���nȉX}Pc��P�O��>�	��DqZƕW)�7.��+��F\8�Yd�R��Vw�d*���r�?_���7�#�l��B��IY�*�������N⡓^R�)��=��u����]I�6|�V}i����k�s��^+������/v�Jtrܴ�'_�'��a--[��i�2h]c����e�=�Wg�lK�rN��`�����j� ��'�2��3�/��gޜ�љ��IW%LjJ_Νy������JL�}����L?}����U6��w�哜��@h���ܔ�;��<�����ݸ$����!��j���Vq���뢭ܘ`��^�Y�M���6�bf}����ܾ�^���g/��=�JI�ULdU�oI�����҇���e�V�����B�ř�?��6A��&HD��kIx�|��(�ۿ֞,X����59+�)z���jQ:��SR��==����	.v��`�Dt-��������Yz�w���GH���(�==@!�=�V�l]�zbs�D�x�r��%EYo��M
8�ώ��.4�`�y�Ն2��,#14���ed�,�)��D��Hj��9���PaKQ5�_��o�.��C�+�d��,����Y23�;r�����LLo�{&H� �Y���h[t}��
��1��gy�e)5k����\L��̲�֙��?4����6�T1@������#���n�{Q�p�,���-�X����	�'�I�<�mu�r����.��-ђ�s��/9��Rq����!+���	�,�sK�J�~�?�����]Q嚌[JH�o��R�Ɩ�ѡ�״��^��z��~J���Y�*f�����^�Y�/KPŬ�Qa!M�M.��JV�(Ѣ�ʷ����ɽ|�e��1����S�0&�i=��U{����Y�O��#�VMπ Ԛ��=%���P���S}�$	�� �j9!�[��ʬ�q�c���mG�j+rwq��q��C/j	Co괢|��%5r�f2���?�z�Jϭ�C&�m�x��{jV.����?����;5| ����`�p~�!/������K���j(W��b1�k�WL2ݧ�薧0�*�/N�hr�s�ƥ�'DU��g���h��s����I��酳��ye
Ŭ�a���R��!R��T]Y$�O�;JSޏ�*����g��%�������3��4��)Is��8uiL�����b'�	���cǭD��FS�x�W���\(�c�VfSζ�EH��Yb�9���1e�;MgM������4i�n�) ��Ԯ�'n!��H������f����b֬��)+t?����t���Ndzc�GC�a��CI�}Sji7�/��A@κ��D�ݻ�(�l�,ǦM���~ ُD^Z�x�q�/���6!`_Ѳ4�)ioI�-[�V؁�����,���!b�M�|��/�~�g}���m��`�WL8�2%�Sْ&���Ӡ��(V�c����X�O�n�*R�;�D?y6>��E�ӏp����k� ��壬i��x�R�ŵؚ98��b�։^~&��e8�ͅ�4���ў��8� ~��lm=�q�G��Ž݋�İg� �Iγ���h=�kn5	`Ʀ�]��[�sy�J��$��avS�E�J�-�Ƨ���]s�	�9����Gjxa��֏χ��}���IW;�o���~���[醺ҞL�5�o��ۯO��$ 7�T����I������鶴-�?�|p���y�mmi6.G��d��ӽR����ޖ����4u8/R���w�����K����3�Kl���٧v+�Ҫ%nm5K�t��'��ҁ�@{SK�=��t��)#}2�&x~Dg�3/��������t�]�O�S��_���-)'0֎}y�vD?b�c��k�qL2���ak�nL�~�ThQf%o���0	@�#�sAK��!֮K��o��H�E~�)Ԉ��߃75�$!�����g0�4?G,�j �O����^EH2��Kp@�\P(nn�2%�_�y&����5|���\��f�5�"��]�K� ��ʽ6U��u�d=A~�:~}�>���)#}]������]�H_��dm8�@�#9oA{(�q�d�=2в�jHNKL��q���
>�4N��=w<����ǝ%?��<�	�+�0�Kr�<���N֍"p�H�/E��#��O�?f1������[�<K�\����kCtBf�>���	�,?��˧2<R|c����J
!��ڇ2Wz�� ݞ$�O"��?&&��
[�zV�R3���t!a�PG�P�	�4?�����ڼ�� vJO#�r�♪Zs5�s_�K3�u�r�d!�й���PSOl����A������Vœι=<?��,��#^T�!
�.�)g���T���ĳ��`<�N��ܙŅ��5y��\1��.�O�L\؝`Ә�-h���h+�{bK=�CJ<����'ݣ�x~{ɇ�XH�(;SAS��2~e(s����QC~/�-|�������>�0�A�#>ہ��}����6�pi�M4Jrm�h?��Q4��c?��V���;������L�nNc�Ҩ�'{��d�c�$�=I�[�M�88�F�`C,�d�8jv��GT/lf��@��h������i�=5�×��[W%��)��a.��G O|hi�#o&3G�i���X~��;绗�M���rdĥ����=ǡ���a4zd�ɬ���їzY�c�$�y⎮<Vly�HS�GQ�'�dT5�q���T�:#_��$�&�ڂX�o��dj?����槩�xf�)q��5� ?��2�DQ��qyG0��+�2�ػ\�iR+��?D|Mѱåf�aS�OE���O�"��K��=<���C��#X�M�r�f��@�`�9��4~s�/������ 4w�5�2�$v����4A�;���E��a��v6�iew��PθS?	-���My�c��=� ����-rz�e��4a�vz5�;:����C7��w�x��@rg�
Mt~Z�s�I΅��/�Ⱦ��*[��'H~�1������5s~�aä��GH�*�K��A��s�+�m��HDʍ�Y������u�@d�7�x}�F�E���v�E|���N���w�,��m?�B6bŤ��?�3,?���e����!�[�ԣ������G+F��%��>�}Ǉ���SM)Mq~N�.pE�O6ޚ��,��Q"T6���{S�=�/��}N��zhv�-&W3a>����Ua�� 샙�xq���'�[��.�*?.���v�C���`�    ��T>�C��,?o6��)B������ �O��P*FW�"[��C��!(Mw���'���ab����t*�}&9�_���*[P0}E�x5}9��ގ�ɏ�Fy���/>y�4q�0�66�O�-�s	�Vl���Ub�+k 9�,?R#�_�
���溮�P���#��\�e2"��{1ZӾ�F�{O���*g��=�OK��v��9%�d�|+��C��R|#:�Ό�+�x�b�[�X��w���3/�#z���n��t�G	h~�Ã?�r~�hZ����������NMG��[��*� ���gC˛�1��$�'���*�~$�z}�gӯo�|A,������]LX�KoL��5.��#��l�0_J��}��?,�8���\�����.o���A�#�����n.�~�g�ULzGa]��r.�U��N�ӓ��ײ�^�o�f!=���[�Do����D�/�c�ZQ��T���A��15~�	كZ����3W�%�- �d�� e����6=�~�#���?T�sI:�p� �Q"�M	�pW�~��
�U(�/�uo��7�I�.%X|�g��uZy��\�I�"f�HIq�>�~Rv(��ֵ	��|�qk:d��Z?��)�7��G�G���)d7W2�i�'%S$�J���k�Jjf:�de�F�yjTY�R�5�A���4���)⁝�"��ckUu�rۯ����TW�0eiF:Gp��1 �R�)�����8S�K���~�oɖ�:ѓ��~��?�q�-�b��O���W,��~�,I%	��2��$��p1؟�j����aHɽ�/��Hd�rSI�	2���?��4�=-uba�*�_�d�I�%6X��\C�εy�?���W~�)}�+��>���i-�HS`���܅����Mʱ��̆����R�0B?�=q^��ܙdI�v��I�p6ZY�8�
X1��W �0�z��z�$�j�*�@?���uR&�~2��i���LR2��k�L?b�o�Ȍ(��-���j�a�e^/G���-p�)�:�����R�YjC�0�-Z^;�Z&e�ܚ��8om������.b�&:ڴ�^����(qo���l�xh���-
��%�~�HOW[�V�������qL��'���J'�p�s�%�O?e��	����g�H~"w��G��R�G��c��'N:��6�� f\�~Ix��!�Nܔ�A+��ćL����y� ���'�^
R�d��,�2�XMp%\n���	p}�7	̮O�;�[���n�k�]|O��ɒ+�q���s�1�נYS�bO��_��|,��mL��<gt�p��f�x�$?����">IΜ0�7`���9�vz�<Lc��W���p��;�D���rخ��Ψ�_��S8~?��1�%�2>����	8~V��Vug�Aha��q��'#�{�َn�O�sX�-��aZ�����3z�Q�ȶ�M�!!��W�;���)qҰ	���{�5��$�$����I���<��rW�kU�����GppX�$^�8(~�ί%�'���ԑ���-UJ\��OIG."P���#jMl��t���XIxZ��sv��»�l��~�[[%����d����	��uFq-{��}�./�q��p��"%!�]p5��d���/7AON��-�![�:o^��v�����jp��5z�S]j�s��o��	��KaKRXI	X~���Ot�3>3@�t�sߪ^�L�$�O�T�zY��l���y�^j�?��~�������}�`������gʹR�&�Ԗs�kO�%�|u�t�����#ZSoGθT�
Q��W+��z:�D��i3�t�~
�����Z�-����o�m�h��T�9�Ŗ@8�f��-+�����N�ϼ3�~.�썰���6�|e!�sm�{��o��ͩ�{�ϐg�N,u�����Oj{Q�X_&��/w}�%���}i���I����ܛBY�7e�����Oz=����ɶdG��J=b}B��LD�R��ke}%�3˿�D�n������u�}���"Q��?R�`�7�:�����J:�Z߽3k\GM�;L��k��&�kz�7L@�O�x�}8 -�5�g�z�	3WJMEi}#[��@�#�0w-}m+Z��q��	��c�������j�kY^��3����M^�r��(���'z��r%ݧ�'�6u��	�'��z��i5�'Y�e�S���ԕ�S�E0�v�=���l�E���<����V�w���D^���X��)9��j������R�ϊa�=��퓐���Dtf�,P��]�ZM��6��1z�]���ָ=O���:����o�A1��G�h�ˌ�#$�H����ʹ^����;�k����'��i<��'8���T����-S�і�5�ʹ~O{�*�h|��nO�N�&f��19J��Y���-��L�طfr�qr��W�����������)�>	J�s����o?��a�[���3�>�?�(�b��5e �o����r#�w���G~C�[a�)�;t!�ridH`��'�LJ�����*_�����!^?h�U�-F'��Ha/�W��~�U�C�̖&B��UV�=e�<U�V�����]V��Z`�ˉ-3�>I5z�BX}�]%�v�j�p�jӸ�}��'ز��3ɦ)����ĭ����'g��8���#�X�V4:͹m	!<5��^h� I��ܓo���X ��'���ny�H�
<�6)��܎�X�F.}Wb�z}�
��7q!�,zU��^�\J��K��8�J�&6E7���e�['Z9%0k!�r8�O-�UF�����ew�Y暡�U�qy ��2���[��Կ�lS٢����FQ����)�)vt���eKn�I�kq�ɪ^�Z���p�Υ�$~e*Nɟ|U�Q^۲�u��"��)Ubђ��뫠��Bo��R�c���Z%�<I{����ƌ��x����K|�K��'��X�U�إ����4?��'��@�#���L�<�/�)VrV���@L.��dG)���ƭ�Y#.�J�����o�[z/�.�f�Ķ�i���H��Ч.��mhQ6��מ�ˊ��߇-� ��Y�������^U\�$�\��ɨ3Ğ�>��a�]5	d�@��3������,��Q�R�aUi�
^U ?q�T�)��j��G����U(�1r����!��N����`q��:py%��qI��GR�}S�"��~�ъI�s�K��f��l��3������ݪ,�&~Ĥǿ4���xj=�;;O��k������Gw�?Gq��g���I6[��Dr��xP�!M����E��`�����;��Ż���\��\?��Q��AߣiuDLې��_�f�܏E���J�O�+
�0��}����co�3�z��)�əZ��[dgv�����wӜbuq�O�y�2�3�qդ�+q�-)��X~�W�[�C���&���x�1R;���!��0�꺮6�O����r���
_W+��[��K��re��G�10-����2e`�ư��7�Ҧ��y[R��/J��ʶ�*<�w
���$/wS��tƚ�T�g{w��p�� .u?e� J{�!�Sa�.[�-v��}~�*8~�����0��'����������D���Qb K"�8q�gҁ���&�?9�X�V���-U�Ɏ!���u��v���Q��V���A�#��F�/c߂�Gbh�|��R���;����Ǐ�V�,:���Z �gZUJЏ-i�-�ך��3�L�̂i��^��W�O����+W��ǉ�4M�<4�<��ђ� �Yp�HZ!$�\�5��?�����#:�d9�>����>�����b��}r�>�����i��p��L�R��nH�]`�i�bSA��08�e��GCR���{ٚ�&�f��G��}�N��dI��<��է���b����7̍Q�*�(J�lr&p�̮a*��L~6�5ڜ���ޛ�S�e�S.����,��)���3��X�UH�^�ʺ�a���R�l.�E���G�h��#PE��!���� �ϸ��uz�pg�S�#8�-�s�>W�bZƤ�4�O��2��#K��w���V��S{u��"�o�?7�}�VbG    ]��ܻ[]������q��Nl����W�[�S��>�Yɖ"d�8������@�sG����uՉ&ZdS��I�W�~�F_v����Ǯ��8J����t�}��H`�Qd|�4U�Z{R�%S�=B�5�Ң�%�+��^L�����6W�����jb����5��˻��]�ԃ��c��x�*�����Ȧ�z(��.�����u�ٌ�
�>���Q5:���>� G߭����^�3���_r�۔��)5.��L�%�M[�g�p�?:����z�W�O�v)�{r^�CS�l
������{���5%�Oqܜ#5y����$5�-����)Avq��s)�7�}4[�O�������hh���`�:�����$��G��TQ>�V:d���|228K��AH���9=LBj����os)��df�����p�tE����Wy0I�R[�j5=�ٓ���"��p}���ʆ�v������K�%�`�v����i})N��Y�ݻr�ž�SЋ{N����	z��#{��C#�۪�Cv�`�k��R�v}"��i7=��9�J��m�s�KLw����Y��3��0�H` �9��GooY?�Ĳ��=n\�����=���\����}�=��K��d�`K�~��d���l�Ï�c���k���<	cN~�M`���q������F��ǱGռnN�52o|pT9G<������h���zK^��vT�D�2�ٿ|M��c��'�~_�>L�XCH����C���o]O0�n����D.
{^�>��6Ө2[����3yǭn��H�=�tT9��=}>� ���p�z�!nuK���?���S�����
��)��sĐ�G��`< ��\����|h�z�(ގ�2��FߒR7bLya�-3������(6c
����5�L
p�'���r��6��q���'�^PH�I䨱���ߎ���!�+a��>����Wˍd�Z�i�Ǿ�ǖKM�c%�:vV�a�@`��4	��T�>y*�>�	���\���yYF0�?�Bć�3��ٰ�d<̰%H��)��{�4AW��w���ƍ\�p�c/�b� ƴ�]K���~�3!�q���#��$g�I��?~	.�<��q*̯�.�����UD��0�<]g�OZυ����l~����mm½H���a����_?v��<K��=5o�e;�0�����qzβ��Q�%���Gϲ/t��q�����;)5���x�51���yQ�q:k�&�@XI�s]���c i5�xhk6(Z�';��lE|��y��xfkr{q�Y0:���=�ؑ(�������2�]�'e��v?t@�� ��+���9��{���#��N�0�N�,���}i��_317�+�֎�Y��=s��t��N���'lY"G~��'�.����ۅdL	r�R�k���s~�k�2�$^rԗ4����OV����&:[/�&y�Ir��;����[&9��d��ǀ����F����j�s=|���j�)�O�{�`r�P�.,�z�C�+K9��n+]�˟I�w��>&�rO:}�5�wM���k�>br��]YN�´T�G�'�-]U�w��0Zxp���ƴ��$�o�����C���_,ü�e9�E��d���$%�=Ln����i$��>��Y��p��fF�\�%^�j��^��Gr�|G�Y��e\�^�0�://�>��C0��#L�ly	�1���D76%{���	]�}����I/�V�r�~��D�����q>5�q<0���g�}^�jI�rDG��	o7x}��~4���>v7/.�usH�	����������d\y[�n���h��VS�BH^&�򔉮��R�r�-3�=伒86�c���7EInK�Z��sRdx}Diů�$�s���c]:���>uP���|��@Z��
9�{]����W��ǆ���<zr�Z���+�/�L��D��LJ��ָ�wh5k��.�ԕlxNC��ЬG�
�>�p���7�ʲ��]���y�lx�������R3/��ܴ��}���5X9�L���e`���sD��K�/�/�ܚ�7�@�#g��p�k��-)*����PeϖTa�$�O�8f���Z��5�7��u5�����P*,K:���>���C�v�S�-���;Z��K�Ζ}���U/N�N�p�4mqA�n�vJJ\�����;�Ƹ	$�2��uC���N �'[��-�o�+ӽ����2\�p��8�q����:��jS b!=���I&)��ѭ0&�/�eE0JL���b�L��zl��ã	fɍ/���g��%_����/e?�B�>el�S-��ᵚ^���ET��>yquh�\3l��>b~h�Lt�^�0�㴴�Xp��%X36�]:�~@?&tx�j���sІj7��+�^���R6�����:�u	;.��'�N*�U�q�y�n�����^Lp�D�|o�ˀ%�*֥����{��a��;�m5�1�!j�>���?uq�j#+����3�Z�~�Lʵ�I�v�/�	h�u��㱱�"{5e�5��Q���j>7�8@q��*\��)S>��
��i��$|x���z�3��U4D�Ms�	X~��������ڹ4�I���&���MrJ��3�G�-P�3��,�p�5�PX?�m��o���V��n��o�`�nBw������ef:o>������h�����?)r���r&%��'����,�!p�\���emo�g��~��1'�{1MU}�8�����=]ʰ�8��OrGS��嵿�|����Q��{k�����E��r �����.��b�vI,��g��4��l_��降 �I�����=~���R�tY����O��Ԣv<^e�ݻ�ߢ�Ś7�I�bK�h��v�\�F��7���(�(.��[��;�}����a�O�t�SSZjJN����KǬS��-��{I@��~�RV�>޶FG�1)Q����E����L&	?oA��{B����=�ߓi�uPP�$-��M���>9�7��� <9{=�9���V�y�h����]�>\t{<Q5�v=Wq�����g��TR��QN%Ӧ��g[bNfb�"��%��
Þ]�Pn�9��g�o����{����ηhC�.ɺ?r��W� &����T\ޖg管����%�����SxV[�y�,�'Nʲ	p@VE�y&X�7c!-�\�xkf�a2����yW���>����x2���$8���T�#�eo-s���Z�k����H,̈0m�Ȇ�l>��(��9I�sC�.a�9���Ҧ�Ôݧ��&ế�6��d|�oTvI�a�S�}C�R����}D�����>��h*�z��~پ�� �+��Q�I�_��uT��Н����+O ?�hؗ��OlLO���ؿ	�עx��U�w�_�f�׺x?>v�p��R�zH�#5��4I쫦��E���[-���{֜��3�A��=�$q�Ⱦ��� ���s�I��F�*�Y�⸛	p���p�U|���$�wo���i5�k���;���]B��N�F����]*����&!\�Ѵ5�U!#�3���7��'�p�d/�28~$L�Q��ZG,���'�2����C�P�+������T�e�I�����㧈��_��ţþ��C��L�r��:W�\�7�Z�|+IM�/�|���#�������''��Wh�Z�oU�\�'I��Jn ��W�~N&�}KK�z?OiC����x+�DBF�7%߲"r�3{�.���>����`�}o�h��Mq�p�l�� i��{4?��-;�ߏ�c�~��l�j�`L��nO����.3p��|sO촋���Vz{J��v��}�-{�ZI~�{���WĘ�$٤"aE"�~.���=��w��w0��9��r��m�?~$�ge-Ǭ��,*9�����st{#Ïx(�kB�~{O=v�CR n���C�W$�xA+e�>
1!ŏXw����q�����Hl�����קv�@�� g�N��0�z��9\�@�#	b����=z�u�F���Gl��0����ϵH���zp���
���� ~�-�Z��(��eΖ�&p���    O�[��'����Y��r�_���u�qX|l>���h����Z���p{�%���9�S�����*I���e������S6�?���(��ǭ����Ï$�`�/UAO���G���|^B%O˵2�c���!RɁO�5���Tf���.�s��ǯ�OFDY�e�跕�����+����� W���#��.�r�c��Tփ���-k�"�.���V�S�	[�f0�o�L�]��	t�/�#[1�kѠ�y�B~5bܖ���X��_�wV�����[ekG�%��]�&���4bv����NPDH���{���#������S"��wc;��k�<:��>�mP��oI/���±_��
9Ԛ�)����LҘ��m	
a�@�)�q-�G����z�>!��>1���͋���uu�ބ�zħ���g�\g��;��D�*�Éw�*V/���k�Vս��	���>W�������o~n�W�+UJX}����n#�O}�k�c���&��k���0[�ݬ�D�ǠZ���k겢����砥k�⵼��KS�r�2����{�>R}#��Q�=��Pj��zQ����øNB�Z3�}$���K��3D%���H�O���xgO���rX������R�Tg�`��	9��&��뭳ĉ�/O���n��wZ�i3�iuv�[sN���:{|N�ɸ�f�U�d���p�q�zG�Ie�[B!gŒ4/�k�4�{0�.���Jd�V�ϣV�;��������|	,���k)ޮZ��GplyP��P�wx��50k���}���鵕*�;4��xl��_��Osʀr⹚R�S\T��>�O����|q�ʥ�Sq��똭�]cuk*��Sp(���'yS�!͏D�7���77i~joh�2���e�>6^�l����yi�s&�yHx~d���"e|��-�K��j��!�m���O�U9bd�I�ʣ�bv[U|�SR���xke�Ǔ�:e�'�){��g*ZDRܨlJ^��)�~2I�P�B٢��ƷL����,F� k�S݉3p��-�����vݲ'�g-�K�E�ZS��;Һ���O!ՏHfRRKBLo��/����7o��)}������l�w�2p)�/B�Z����(�d߷֞'�%�l�*m(Q7NɆ�@��'������+9#��5���ɻ��0��X��ή�b��q��������3-�X��p>b ���g\��:b`��|���5q)/��uÃ�'!s�O�JG���R��;2P�dЎ���ң' ��Tl>���q*ה����k�&D?�Hl+��;�>�E)�Z���f	����]�7�1p���fY/Ǿ[C�>���ǔ��p��\�ة��G`ػh��wӮ��s?_���Ie ��Q@�z�r
vz�f�.���r��e�)	�jj��)w3�_b�v���U�K�����_����Ɵ\s�
O�f�_�9�/�?�����ݽ>���	}K2�Ǔ�?ǡ�*g/�A�Q�����o�K�ӎ����!]y<�ѳf��@�s��oV�������2�q��G�`|�6p�jW������<�]�z��/W���#'v��a|��dKd�~ႩmI��g:�~rA8kR�$,0�H�f-�����&����n�@~_S19E��aa����[O3��ޛzj1�=�?�o6��$��_�O�s���.��MZL�\������.墉_6�W�����;�p��<��P�S�V��$A�Ȉ�������v�5�Ⱥ��񧣣[ӫWq?���Y��x�n�ya(��x�؛���$��|{ͭ�*ei|u�ANV�i�[9nw����X�.y�J�sr-T?ݖ;����yDym���7�exH��G��%���.����a]$��jy�8�������aA���o��cJ �nу���H�#�T��N<�G���Oؑ���Խ�9ԓ��S�� d1�j\�T��P)���x�P��p�Ŗ�?�	������"@�#d�l�G�:�p��+bZ��?r��cEp�~�_���}%���6�h�`ߢS�%L��t�x�Ď�I9g8�5�� ~h���Ͼ���EuTѾݓ�q"�{�w&�.=�ZG2�ުDc*�*%�����}�*$>�$b���h�W��,�:�T��G�<��s����_����#���@G9�������HJ��_��/rl$�z ����_�otӨ���p��I��=�d{
��!i�N��'3�p��h&8M���,��]�R���)�ܑ��X��ic����q�n\y̪�ɝ�v����7������� �m\Ӳks�{T���c23��AP�S
�Ap�H$��3�ۥ��X?[Ƴ(�ړȮ�Ƴ8�⎽]	��	��0c�����N�iX
J��T��pÐ
��fB���q�0K�ٸ��w� �us�?uha1���s໪�A��rTx~�F�!������3�ఁ����C��;��;�_�.p�Kǉ+� �j劖'��#$?����!NO\��
��q2Ŭ<}9ю����{I[8Ap����R5�_)�
��Yw��㉭K4%3Bݳd0m� L�y��l�����aG�^��rp�䍊�y
k����j��jU��N��L�h|j��?��ȥY� �[y�h�}�K��ujM���^�1�-o�X�Pj�L[
9��!��w�8S»��h���c:	%5JlvQc]e͏b�^W@~�u2���ą0�K�wU�!.��?�)U����xx��R���9Ҕ����E;���|�ޗ���@����طe���y20/8L?�A�����L��_�s6ur�D�}�sq�Q�f��g��'�Ο�A�����1��=�<���s�rU����B���T?���H�#�d߯S������Gc1�k�ɇ��;����� �O��y:��rH��Ř]K�D7�A�#�c,�-�>�&v]���\<­��<<�P����%_�,F���Ee�
����w�\�!�@��٧Z�n���G�Կ���LrM �B&��տ�'qn������q�']����C����=(>c3(�h��Ū��>��\E��b�VQw��HD�{����M���t4E���2�x�%��3�-�r�O܇��V���f_�����'�X�U�����7��e�	�͵j��;�i�H���VC���8���*v��j�����&j.9�����Q�7-��M�>�4��7'��bG�+	!�<?~x��Gp���|wyO>I?a�u�
.�b=	���_Z<[R��Ők���C�<�%7�H{ǯ��H=U�Ȑ4���<���������l�}q���][c�\pPS�w�V_�,�R�~\�Y/�:5��~9's���M��q�R���-1j1/C�ד�ϖ"�0��0Ò?�,��t��׍[^_���rN�u8d��Xɷ�#P�r��$��Z��'i (n�N��u��@���#p�۲��[���1�v�#�f�;&�>gI.@�O��@��G�Sli��vf����Һt�P[[/Β\�G���\׾��K�>�-ly��1L��H]�(9(��}]�G�_�%���^�0��ג����L0]R���b�@�h�8~��۰��V�(ېy+/���q<��J�,��je)�;?�4CL��1%5�G�X}�2�)�u�2W��?5{�ԗS�M�-�Z�}^��}$�ξ���[�E�Z�-C� ��9����*��f�����4�vL�zBˤ�I;�_;Br�I&qK���I���"�Ǳ�LP>����&�G�쓈K��k!F�YO�wsa�K]��9c�!�=1U%~c|?��%���ud�����2����%~vdʑ�l<)�7`�S�;Fc�C]����7��m;��/�������M�so�#�=�v�.
�>�$���%�>��4�J�=�,-G��Vѭ�[�V�c��#����Y鸔K�so��+�deu��˶��i���S��>5�1�Åw��A�PUA�#i짫������4%��-    �1�_��)����$��爇�@�s%b���*��iӤK=�>�����1[K\S�ҭ����~��v�
���w�Ki��}�
�����'�<�J�K��w�������@,�-����L=��)QȬ�g���&U�@b��hzy��T�����1/ �HjC�R�?vO�ܘ7�}�����x��^U���lx���D�*Z����a�IyB���	��:<�-\x��Uci���Y�.��pNZ}-l���s��w��T ��m>�\������mJ\΅�T�	s�}��*��#| ���G�7"�}ƻ����p�=A�5>7�����$�����kף���B��٣��ӟ�OT��
���4��{���{S�PoQ ��gv�P6�+�>�����'0�y�Х�[I<���}mM����uĶ�z�}�2���&)G�0Mw���G4ft����v�B�_0��}���~E_�j/���qd�p�{K@S�L*�q|���,��>�_�{����r#s
N�M���H�m/�C�����&v�������]���f8(~��1	26��}�E_MjK�������$�q�����
�Z�;��\%��t���<S8�M~�<�����4�*[�����&������o�v�D�����RѴ�zy>'�'�/6~�5�Z��x1?4�o��Wp����������~>�19��Tqg�K�Sy���ɳA�h�?�S?�v�"jˇ��ĲѸ�kiW���%�_l�S��ϭOr���}9]"[Ax��n�ei��G��R�W��=��f�M��?ۄ����!{�}�}JD66�}��6�&.���.	�_/j����aI��Mt&.mJ�cD}<ZV�O�U~>��7I(�0��N�2ed�� !�7��x\��ԇ#��e��rC$��=�h'gdL�@)&���4vn��� 2�5��O�h����_�r�p���eh�DOR�� �P�	�d>^~�������Rf^:a����Y�ꮴܡ���ۂ;.�HθW�h[�:XbW�Ǟ�h�����E4b+M��rb���|u-Vʹ�^Ï��ZT��w��Y��=��>�.�(Ч�������4t�}P��;v�v�|����w��L?�w��}��A���`���w/uPS�K����_�d�yvA�҉�@��M7���9��/��e+8��n����A�d�ҵ�]N��z��b}��0���On�<Q!��ɤ],f)M��Dj�̏)|����M��ˡ��x\���Q��{[�SNI/��ONN�R�����Mݑ��C{4�v�$a�������~�]N����vy��9�M�3��:���]���s�It�si?H�M~�s��hR��]/��8M��i���Z����t�\GR����q�$��|�H�;6~4\�a�$龡��|�8?ʥ�;�]��Y"'k��'�[\�sgZ�]�';\v��ny��٫�!+h���R�V�ck�軌����QfV����D���ܘ�v��>_@w��Hq�C`��������w8E��Hwm�H�rxOK�>�yua���D�6�}�2�I[�u�m�v����k+E���4h�I[<��(E�վ�����-�]$����n��u���^F��o	{�1&{h!�O��+�ُ�M;��!k���_۪��k[�U�'w�g/_ɛF��y����ޒ<xӏ-�|��@��>�W�ޮ�D��-U����5Ac�ǲ<�d;�}���8����-=LZ����[��	j���C����|\�O���$nIz���>״&�� ���CR�95�9��\9���e)!&5���ܵ��8�Z��i�M�_�[��rY}�on�Ƕ��W�T��@�8˪0�ѧ���0\
@����JM6%�2�6�7��ꩾÿ��e�Bؖ�@ػ0B��^oE������x}tg��.��~�.�o��_��O!�\�^hl�t_����._Xq�>b�aB�{�2��p�m0�<Yg����w��B����ߐ�T�~8Ջ�ɍ�ץ�XvZ����>!c��q6L�L��_*u^2�#>�ˈp����
�nJ�3�jm7��{c��^t�l��Q�t�n����$^��_W4�"�L��u0F�Աa�U���Aj�z'���.��97�}���]�z��E�Lw2T��AO������(L�o�5w�f^��~b��P�-�38I�ێ�U�s�p��'��=��������%��q���'���^���Mov��ޢG�4l_BL�\m_��ۧ���wh�nye��}C�iC���_iR�!�}��k�}O)ɿ	o��Z�fS�v+o_+j5p�E�~�5������������ߕ+ӏ�V�B�0�{�6	��鮂��>U��+��)��m��ũ���Dr�&���v��=	������@�Z+ϭ¦wkv4%���ۖ��gi�5�1�&�1��O�`�C��޶*�8��s�s� �(���|��i]�B�f�r��p�/��k�)Ί^g���Tq�{���6��}6�{ϑ5���#��!�7�y��	���ٻI�u%p��V�VҞL��~	����Yz7a��̺���2�}���R��k0�\���B^�s�(M���S�o%�vL�&%�(��&�)-ͳ���Ƣ�{�F��nɸ>�&П�s���q*;J�vG�ְ"��>���WLn �I��$}n����˦d-.��>�B���{K�����z�i�-�|+�Eu	+�������m?E�����:���n��tZ��mew�wF�Ϭ�{�����\M�$�׺|I�쓰]H	�}d���PN>3��H���6�hbF�~L]���^�Z��������w�so�~�ͻ�����)�#�ڏ�َ���SZ�SX�܃��uJ�/�>B׏ӢW-f�S��>��j�t��b����O�z��:)������Ks۩���=A�)�]��#��-���sw��$H?�L�71!�6z~F�g�!�����#��I�=�P��dJ�2�M���U0�����\�9~�0� ֳ,|�T��f����SC�Ζw?�i|(s�����.��o�2%_|Nrv]�P�/�����%�g(��ߛO�����0=�w���G�烎��ϼ�ı�����7Mu�`�S4r��z^�N"��T��Y	��P8�~�6�n]B�0J�V�vtD_i����\�&���O֒�*������4�d�R�r�f��@���+�l��R`G�3䉡��8,�g����������<���S���?���T��2�~v�e�y�;`p��U���lQj=��M����=�����,?���a�H�#6�F�C��R����H�Ӂ�l?�j�~��f-g܇h{�0!�}��G�^~-a����\�́�C�d}oM0q��(M<(�X�[�c�`��
T���;0��f��t��=����5����GO�`�wL�!û���>�u<�1���������{����@��!~-��Gx�1Ȗx+��G��q�Z�A���6~x4F�P,�)�h?�"{d}�p`�f��k�;1�~���PH?QG.|�h`�j!���h�>�7�ٮ�Tj�o��|�����w���L�V�{�ō~	Nj�R�+<�`�� �-��D����cR&�P�7Z���)�����̖�R���{LMl�f���ʙ:�c�p�	t?���CCb����mwN����,/�O=����q��W�����&Ꮰ0�ּ�?�v�2S2#@O�Ѡٔe��]gs|�LX3�ߥ�1<�����l�%��H��kz��5�4qM�t?��</�;�#�~�o\��8�\%�1�/��4	7"�~$-_[��C�ˀ�-�O�;���VԸN�� ��\���m�ݿ��-�{O�/��?����y~�7�>�������`��j�{�_ҚZ|L�|l���,fy<�8>g)jb*g�a�rj��b;��'=Uޒǉ��,9l�G�[<�z'��]/"p�~N��ݏ��w��~�S��b{@�#��DH�hI������M�[����    D��Sr�ؕJ	���>jq�ZZk�׏���He]w�����T��I�;o�I։=��E� RL��I��G��i~��=��$B�2���31\(�x݋P�yr2�1Sf^���g_r�d�`�S��,EG�t��0
�I��[�w��Ǯx��G�@*�.x	1g؇�zO��� �����u����c6��/���	���u �)AB'b��4�v�����E���Z5�~6���+\'�K~�r�c<8맜~�c}X?連)���+-�r6J-1�%��0��~h?W����P��@��C�%��c.�����L�A�W$H��p��#�c'NR�����U`��\l�t�6�E4]?4��%�5��W��R	�����ǰ~^����G��4�e��ċ�ڏI;$�2�N�,'���Kw�LI� �홞*�zW����<r�ދy�e��-7�q�|QE����!�
=����0Ї��!�y���m��9��&��U�r[p��y�YMK�5���ۣ~��9�L���/{T�=��1��M���ގvS~Yq_���^g�$�%y��~�����/��ּ��&5��%M)4܏Ԇ�b�B��5Tգ�[�y��x��D�{��#�����v�@��=>�csO���3�'�?O%��?��"("���E�:�,��u��c��U�z9��c��0�c��\����y_���ț��W����NX�^���.]tp�ͦ<��;ڇĬIyZ
U@�H�=o[��������g1�pm�?�]q��#ٝi�?R�e�q�,��� �tl̃���G�4�(_�5�Q k|f���f����=ˠen>PYw�ك�EC�fJP<z:�R� �ܪ��R0B^=.��.6+1X����+���q{�����::��ژ�n�\C��X]u�R{�+$`-�V�Vn�w�Q�ϝ��0߭�Ma��*�F��TO���κ�l�?�Tek*��W�ِB��7�#��(�*���$��_Wr�r[�i|���K�V������둑���SN@q��Y]�vNZᚍ�Y��\$�Ŷd	��3�C��'�P$�1�246��H����m�I�p]��dɡ[��>��6p��*��ʫ��������V�</!}�����ߞ��ӭj�`Hɀ0�{]$�Z��4}d�3�1t��H'*f����MB�:%�����ƘJݢ�`w�i^�fΦ˂��
�!�*r�TC���N i���uz�{��h�?��M����q��y��`K�b�
NY;�W��p��!i�K��>��5���T�\� ��A��!�e)�Z���E��F���d�a�(ć��h����̤`_�]�<�8�9� {�{e���LrR�)3�q���LZpK����Q�m��'۽7��X̧�zI�KRH��5�� �N.�z�93�0&vw�ؔk�uª@��y|�M�>�w����|j��z��k���Q@eY��v�X�k?��Ug��D�r��]9�,�u*3o�k��C�Q�K=Bؕ��s���B�;��L�6��b��F	ϩ�}@����dۂ����d�}^,�G~ly��+b�?R�J(��v��PXɷ�����M��'�o�I=�j�?��a�S+���z�c����"H����k��M)���JU�)���_)@�`�e�x%��)@��h��]�rmd���_w�f>r�?'����Cڙ��y��7ރK�V�j� �T�7�d�?Y6�w�3�j�?�*6$�7�N
u�(������ٚ������G0޹��Y3��?�]���������&XvOb
��#5�  1����'�V���
s*���Q"2��G�g=�b�?�Hf��� ��<���◴�o?#�ouC���2�h�â��i�o|moHS�p��䐶�4>�8=1y��
 �y��$ŧ�m���L����j�!~��ԇH	����7�J��cCZ���]��Ler�Ԥst��E��J�	B�#���"3	���zϓ�f�3_4�GMc��ػ���"��_u��q1��8>
6��v	-�oS��9��~�AR@�܏�V2'�������t8�y��Ί7w���0��h�<8������:�!�����Œ��i�u�@1�����?���YF�c�7~��Vo�q��OX���m�~�2�c�#��'��[�勖�Z�i����w������ý(�=YF+a[�]�'&�Ig�H����@O Vߖ�9����9���m�I������H�~����]���V/f/J#5Y��?xz�?F��/����ne�u�l���y|��v��n��h��;Z��V�wg%[�.0�l��3����E�Fw�(�6���6����w�3��N��r���k�$<T�,^D��z����:�������]OZ����>�@�Ϡ���|�X�������]��\9-G�6W�$�P�C0�An��.�G�C�Φ3���6�m�+ ��D�/���r�)<t��U.1r�l��$�����v�ps���g7����H�������n9a�Lg�[��\�4Z��ؾ7���O�h]�+ؗ#��;���Q�#�ܯ�Af��M��~Zv8����(�p�u��E���,�p��m�H�,���w����K9Q�|�݋F����NN ����ʬ��EvV3��w��2����� _S���2��H�-�=�����0�2��枑����s��yN�ʜ8�܄��}Y�q=AZvЦ^��iߵ��S)�3\�H%�{_q�*�;7� ��ϭ+���G�!�7�O��|B��=�F��e!m�t�?�L�]^���Y!F��௵�����UV#�M��Ӭ���t�7��y��Ѧ�0䪺t�1�[����Gk�:gA�Ѳ~G&jO�(�i�L��B���A?\�4�Y�Mf��?��f����CzjM>�}O����t��4ZP��"��1�U&�}�A-�i?��r2�4f����,�1a�����Ea�r����\��u�#�;�uH"�]ȷb�9�Ѻt�!�T�0�|Ńw����>������8N�K��]#eM���fU�ϕ<�O�3\�d����<�HS4�'s)��h�7�s��7��}��:�%�O�^Q�Ŵ�YN�yn��[#\v��V��<V�\k��H�~Ja����Q����m�^�ܦ7Z���uU�1�=�}7p�p��J[4.���,)�[@������VE�c��1z绐��=U~���jsi�
�48�������F�]xJV�E�]�Pv��䦷3�@�귱�V8�C��I1X����5�_�#�$�)X���Uph��}Ops�#���u,]�a̩%\���A%����g��p�=����8����B�0��Ȯ���н�Hǐ	F��Ԓ6���֦C.w�)IG�~�GiI$.���W_(��u�]1R��C�kM�8X��?������w�il?�[�t�M�w�ɖ�ZF*��\Ƌ���-dnA^�|K��>�d!iKuZ�c�:��k���Չ����
+y�蛗��c!��Um�� �La̯%]D(���h[E+{�W�f񹑂Z�΢.�z����I�N���b�9i�ٌ̩�Ijݐ�f4�0�'�ﾯ�.	l������z�pj"�^�Df	�тH慲fP\��k���4�p��[�_��Y7�C�E�D.��hS%.��BYHz>_�N�:/��ˋ�����}Iv���Ijq��i�0RQ�L!���E�@J�p�gg.Kz�g�?gp�LЖ�����t�?j��F��k.b�`c3I�n6����YE��U=�?Ner��Ud���s\gW jIrԸ+*��RE&��(UY��*^k7�k	L��+C܇�8nF"��-Z"W��Y�qQkۉ�n G[�����B�̇��� JO����#_ե�3�;8��F������(��_����;�ۺ{&����gк�Q0�6�+�ͯ9]�S��G]�i�yO�R��>~k���� �$`���0~,F��Id[C�l��_��R��4r�?������]E������{�hp�<=���HC�=�|�P��X    ��8iK��L!���|B��1�f�|V*�]ϨS���3G�6��ƻi.�a����_����c�A��@�F1@��z7���[M�"���j��v]��ŋM������lm�6n�Jd� �IQ��"��Ӹ���wS�
�������=���?�(l܂��?ЗD"uв�R�Lњ0�6HM:G�&��}��H�C��l -��V��8���-'�}9ܜE�h�����E��5 &QB�V��&��aH"M��KP�1�M �`�a O�+���v-zdz�	���Q��I}eG��I�ֆ8?q/*�0.�ZD�&���z�3Id����y_❲��$�צZ9���+.m��x�A�a�����*F�O�"/J���O��iy�N�*��7�4^A�ZO0��=y��?��8�0�i��$���$�矕�E��X� ��Q��f�����#�41�>C���%�.Gǀ[:��d#�}���M_��Qq�Cl���7��W���`�����X�;�MCh�����=�À�ĉ̯�HB.Ǭr�9��T��9�|�c���zћ�ul����G�U\bd+鍈�^9�p�����ZU�#��j��W�DN���?�z8��k����"a�v�HIW�B{Qd֢����4w5�\up��$�<|e��1l�^�(p�{��4��R��02?+�>�!:��)�������鎕�I�u����`��G��O'w���h+g������e"���s�s�����x�%��.Qd?P�wz����5��Y��wě!<���B��#)��EZH��J�g�2�F%ju�DY��܃�u��W�.f�r_��5��WU�qD��c�w����?�K^xy]�F���9�nU��-�I��ZVw1Ia\�H�У@&���9�F
1@66��e�K�d���^��cPU�q��2���"�!n|��7�R8��l6C���Cv��� �98�{=O�>7~���kap]�Q%��;/V��j|�>�*��L�X�
1A����}�;7~���r���Ϊ�	�p�Q���J&~6����$���>�*�X��N\�b�?�
�)� ��u�&Og�U5N�ϚF����k`�p5J�"k�ϊ�[!������"�$e̓��yV��]�u��[�y�A��a�1������}/�-��{�<�Ǒ�7�9J�3�GҴ�����IsI]��H!Ť��Y�#[?
7�D�Bs9��%���C}�VD��@�K9�#u�ɣ;��$�g�,���*�.nk9H%i���OJLq�U���!�˛k������.<C���I3�iKonj�n#դNߨ���$M�Ñ��,%[SS��]}<Z!���My�ϥ�w��kA��g-+��(�p�r=Z�Q��M�g�z��0��v1����I�������ы��y}�2G���&<���#����G��<�7z�"&���γ֧]8)��]8���� ��OL1�]J�t����A:��4Qszr�(�C��n6���y�P9A�V��/�B���y�&\{�p2����T��-3�&ɀ�N}�,ڜA�gK�K$�惿>[����ը!����-^��K=�<�E�������}Y+dD����ƫM�מ�=�X��C��G6��cr�[��bck�ǻ��܆�F���BD����o��O>V��T}3i~Q�W1�@k*�;H���61��g�$�q�� �`�q��qZ'����W�4q ����l�iBJ�K:���DCc�Su6��qR��-L����)�f]wG!2Z���T����j����7uoj�>�|)v~�͢��V����z�Bf̪ę�"���g�E�X���S���^4���)u��v�Bj"����Ւ\�d�&�QsVkEb�p�*��1�iV��0`�6�I1ޗ�u��l+���4��Az
���Ǒ>���^�y�U��V/�q��wC\���>���2;�?�E�j��e��a�C���F�P!8�꣟�����S|��S��]_'ⅸ�{l&��I�J(�}�b�f�l�WM$p�� ��\}�����WM�xN-��&0�3�O�����6���re����\MTi.�ʧ��𮄩�k�����3Vcm�H;�8)/��S������&'%	^��;��uh�}�p?�
i�m��
+%9?�z��Y)�aK�][����'�ϽnX�`kS�,\YK�ew���U�Ek9�+z��UK�E"��hPX�Z�.s����Be2���0)�,+3qKY������$��%�-�J���d%�`�BU278By[C������ W	�@����q����^g�X� c�K��*����� ��V>y�����'�a��|J�룀�&*��hY�I\�V���j5���!Ӷp�Z-$��>1�,������q7�,��H�0��B�Z�ͯbI)f�Up�{�97��J.66���K����2KLu��H���S64m��14m��Sld�Ǭ���Q�(v�cI�u;Ø��9Ŝk����}�f
�M�:�\d�Y�ʪ!h�>��-p.��5\�>ǿ�|{ Z������a8Z�'��,��*��U�5��W�G�U('�k��=�de~6��M�Y;k��j,��:v�C8R�ݔ��c� +��':�nU����:^�R��ekvQa[�\��Nj�Ꮖ���<o�Zb�w�j�w~ܾ����Ұ3���U@�"Tqv
6~fQ��Pr8�X%��L��y�6�C�z���$�����<����5����Z��C��wC[%dhY�1�_B& eP���%F��Y���Pt����U8��\z�c���q���U��q�wUWGV��|��V���&�ڂ�
+T��(�u���>g�5�F��nYH~֞@;\߂R��7	�{m����h�$����Ձv!I��M��������2K�~�s�z��=A]Sy��B>Z�Vǵ�7�%N{�U�dp-�r����97���<�]���r��E���-���Z�N&!t��Q'���V��u�M�[ӿ��(�����}�6U����C�5�{65G�-S29��r�G�5�c��l�:�]�P���c ����I�Ƭ��6�.���w]�N�.�����V!�Z?^��y^�j�*�=�a��qX:I�v�Vɼ��zk]m�J�d�g�{j���T��(��\��`�Xҥ���LiTg��y^�_I���!}B
գ*�io"�15�gב�����+#�h "�Z/G�@^��SÎ���-�q�XӍ��CzI������&-�Gq�4�kZHج ����-U"X�-_�++�L��Ӕ�^�L��RVP����]K�f�X���ny_�Z?)*V����\z'�S[��A�a�TBNu�������3Ֆ�Ǜ�W����\�:},�������C�A���s���Xަ	�\ʶ�z�X��+XK��j�[�sͱI�u�u��k�rzʗ'��똁�%�9[���-�E�p�F
aP�&���[5J��ch�iBZ���DG�]&����Y�U}�5$谵F��N��)ج�ꝓ�<��Y����������\�!o���!$�_���_I�7v�B�^ޚ��?}�*���17ɧ ���!��}�������V<���Nj�b�;�4?S�;WC��7a71�8�*�1���G�F{j��c��X�qck&�ޠ��5�f�T�c���%.�R���h���$���Ns{�69ߧ��<��
Dc�
�_�iΧ:��5��''(�B8��|��j.����_��_")�'+E�W���vE��}��,8^ȹ�۔��H�c0^z�yE3�q;/�r��f����! �U��"b�u;T_���:'����ޒ�Kb��c��������Z�IU���hLlh��{�����
���L�}�8^��{ȳ��{	���͎�՛Z%�zPNI?��������E��)HLj��D�_G�z�0F��9I��|�m�
en�E<@C!yu��f��^;�u*�,����ݙ    ���:_�v�79k0y;��o�x�s���i�X,�W/n�
�S�KD�$�-�����������ǜ�f�p��P{�����l����^,�]&���+�rgs�-��� ����n!o+$�d��fC�R�ӑ�U
��|�gI�?�)O�Q�?��\1�*6h�G��^{�L.!�ny�d�f���eC�ٺ��*{F�Q�AռIH� �"FS�WLY�%k�A&i�
�؁�7�$]��gH���J
ɏ��ͺ~wL)����Y�����0e^j@a��D�y4/kc�EO2� eܥ����R5_�c�A�c�*���?hM�碀!�|�g�@�4���`C����I`�Z�1�J+A�@{�y=�����l�J������*
̵� ���V�>�I��8=�q�YQ'	��c�)VN���ʰ�ӓ=�c����SIf�K�,N����P#�`� ��� ���q�)��/x��k�M�1������(C�r�0�6Cv{�Y�^ތ3@����e9�O�5�C��.D�xTg��c^"���+s�(C�*&~���\�U����?t.�$�CӒ�s.�����8�sy���*X��$�9���ʮ7D(/�}W���Ȥ$���������S�����!K������֔�ڹ!y}�٠�� �����k+�nU�@yyZ|�)� ���.פy:���%F0Q��לV��7��e����o8��?��\�w
�9?9�٠��w[#Hh?V+c��K�\0Q��==3W)V>�z�K�쐣�|Ѽ���3-Ki8��I��G�W�fh^�0��<lKmj]aU��
e�d��nx.[]j�s���r�-�����jh�mҪ�eW9jk"`��������EL8�b���E�@᪚�jC��("�ޗ�n�RVH/����%
����Y̬�2���$ζ/]v 8��P~v0B�f?JP$�بal����у�����{-	��g5��G��?��D�L��)<h©jŲ�G��9pS���X����S;��5-\�t$��4?�I�;�R�A2z���J|�����rYNai�'��z�5ZKe d[}H���Y����@��^|��x���S��Yݭ���U�	��n�`�s�Φ��u��&�@K
�a�^p��4�e}K�oI����N�R�d'�fpd-�~�N�"{���VF�@m9x!�m.Ck�x������HԖ�p��ę�B�ܲ����}�ف�r��/ffC���+���	����(�3(��	���G�l�M�w6ZQ�:S�Q���8���$e�5�8�W���n ,P�,�SC��[������>j��Ҵ\��M�fW��kM��%�-,d�rxSX)oMkZ�C-��rZI�;��KpK��X��5ꀶz��d���eC����U��\ݮ�]\��P�d�S�,<��7Z��^÷]f���Ї� ����<o#��_i�>c�!fZmnCA��>Z�Wn3D"q�k���:���3I����`r��:&y�!و7�lj���S���@6\/���3(K�
^v,���V�筳��oܥ�tq�VxՄo9�
X�7vf@�YS�n�@pf�0��,���[��sǲ4d�OrnZ�a��D�Q'�b�x���`'�g����C�c�m���� �%I���F�����l����ƿ��
iAl�Bi䴡{� �)��x�W���Y�jN*4�����=6ւ6A�zt�ӡ� �0%��{��Du��/{�w]����#@������\��)�=&cc�%��q�p��G���4L���_��#��ė�k���
P�ŭ]�#���Y0�	�	t�7~~��_��k̼�����4��-W~		]r���g�^"�0�k.??s�g��iݣ����(�t�^�ݫ� �G�g!���+v������=���3Q/�د�e���u����\"�>#�')N�AU���>4:�-]|��xo��ٰ�d}������ǚ��l��ɟ5`/�
�UO�G�9֧֧y���p�"���U"��3U�j�����nx.��{y��� ��־�R�뛍��nň۾�W��W�3��岡zIUI!���c�)Z��(��f�^��൹��1�ō}�����3�?�q7d/q��?GJ_���M�C����yh�:����_C�58ɰ�'!���������(\��:����h�^�:cG�Tp�x/7�t���/7f�s���͊;�5`/��᳗�u�i {�ɣ�����N.$5����z��p�$@W@�!0�D)~��r�jЮ1���~�jȃg5(��ھ��Q����r��k�x�x���r�R%��,b7��z9&v�{�G0�yZ��Ќ��-M��@�E��@�>���BF+�Q���0�^^�WMy�-�؃6��%��X�����Y��E�{���*Ѹ�^/�r(֦�sC�ʇ��@&Ä')8�1�
�������#�ؓ�5�I�d5����3T��^b%�K�@�"�=�M�E�u�;���wߒ�X�Odd��E,�ʪ�r[E,��j�G�4U�GAŲ���K
����'XN)[vפ�z	|,���	t�}���]��<"(��4��ٿF�P��J��֘��Y�ˍ~�ϔ��qf������}b��������MNyN���L��
hS�E����/�V�mѦ:��S�!W��Dl��#��3������)��D�H
�^Z�;-V�`�H���YP"�V"��Z��7������ )1K��'f��K9�Rн��8���<`jL��?k��y*���0�"�s��d>��S%�a��z���[ u���ٗ|��g�`W^"�����3@���,X��%���g�Φ\DNh��$mK�?�mOj����(��y���nSpD���iVV�6�#v�����<{���z|����.���Q�"��D�UC�n���?�
~^!i���K+�A<�n�L�`���p�4�S����<�^��fC� &�0<.@��C��/Pr�G������
OSp��Ieϝ�+��B�K�1G�BU�_!��̰^�٨��}l{ {�ӎ�%~Z����O�2:x�ا f
��mmG�6*Ĕ+I]�(VmM�bc���� �My��������u�o���%H���U�O�*�+H������ѹD ��a�d��C�E���q�֫�e\����3X/��/ )��l���@TM�8����%�=��w����"I��3�
0"8쫄ZY�YB�,gZB� �Z����壆����YT�0y)���{���k ���*E������jxR�]*|B�WSL�į���>2ǜgi�5I�>;K��G�.yN��$�{lנ�$��cK����R ����p}�1y�┈���q�%I��YFDf//S�$�%�Qg��X>�̥i^鴶4���nMn��{a��\ޡ%	<難�Y�a
�}t�Y8��d�1�3A6��-E��I�Ti�x0�'8�$��c�K.y��*�����>CQVQ*�ν��k����'�����k+�c� ��>��y�����!����e)"�'��=���9�Sjo�^�\�dw
�p|AD�5;���[���)}�E��`��*�q��|�DC�z��3�G��-�
��{�4, I������=7i��D�-�׍�j�^©�*&��p���D׃�5p/IAY+M9���A�{�K��PԂ��9��n��39\�Bi���;���1T��E��pY����T���Ǫ�켋�m��=M�^��?�jlX��~��]a!c6[���{rKy��U ���$5�V���g�1���(���+kk	��W)ܧm�^R������~cz;
eνuq@pq/��S����M6p/�gk!s��.�����B�G?�Q���yy^����~h�������Lk�y��=�_��F�eՠ����yn�Q5��_��8���L�&�ͅ5`�^�e�(��0��[Rx��冞��	0h����o�� �
  O�ק�ְ��`�,�^�1�����-�&��3�vd����!`�@�0l/I�EK��p�Lއֿʒ!{���'�^.0�K����y'�&��;@�a�;`��)��h�jǭ�"��e�q��BV��"b�1W���p�4��@���{�@�<�W-�'4M�H�,���x�KJ!�A�z�@�I�Ό�� p��t�	��]L<���S���PIL�()�;�_:2�\�Cx؋�zI��u�s�?��h�{��߿��nw�hvTƤis�`KHY��v�a���:r�?�{��� ��reޛ%I�M�����s b%���W,�)ITfO1T/qa�4��㢠^�y����E�'3��붾�WI����wj�O���܆��2����2������fI?)^%u��"�*1.Hei$��8��:�Cb��7��؇w0ybDĸS���EҨ�����Ѿ+i|�7Ea�������?�^��������%M8)k:�7��O`�pwb�fS/������15K�|�k�+)�mb�g,��8N��U`��z�ޏ	�')8�&����\����`T�)�q�b�O�Ki�_����݊��e�Rp[ї�j�a���-�n��V#��q3�����C3%I1��%�;\Q֚�zIF^)�;���� U��f���s��*��%����S8�dy�q������ᦷ��*�OYK(Ii��
f�ޣ��,���Az�A�@�\�̯�������"�5�W.���G�7=}�7g�')��� m���b#{"y�7��ɪ\��I�/�]��ٹC����R�
.o�p���`���?��b�^��F5���Tru����� {�!�2e��,�R�ح���V��Kid��Ϛ��/��Ϲ����T��Ln���Fv'S�]c��g/?';�\ci�D�FQH�y�TH/�s�ex[����{����]��ʣ���~
'�j}��h�eA����|��z��1��ѭO���`&��t;��+P�����&��ʞ$)%r��p�$O���~͑Mņ�ٛ�7P8��� ;�֯�q7�,6���~=ײhK����*yi¯�Q�:�ǎ4\��[?k#K�usVq\�W%��b�F>���$��KbR[C���՗[�����c�q[�yP"tx�$}�4�Ǆ[�p��ϣ�W��C�������+�j�㲔��s�gZ)��Z}����Fp���"����$�����l~|��@�D�⚉Ӻ���������t4L/q�,�T�.�c*:�/}��`峱�W�I��ll�-6`������I)r��r2���/�^�oar��X1�A�v8=�jھ�u	�f�v�����M�༤�� 6�g�{�3hMc�`�&�����5>[ O6f_���XJ�~
�څ���+~V���5����� ��U���?�đo�Z1,/1K�Ւ뜋��ƈ�RL`�a�9�0�iQFR���(�B���*(\I��~.�;��M�>����<�7�|#Ő���(�ב�e�-��75����p.�K�ǻ�R��ӱ�K�	��*�{�� ���jzX�-�)���1�'}�-jWߗ��塡R^�����=wJp�<�ɶ>F@�1���y]�t��o��`�aWc�� [�!��ZYf8^�'-��^@*b��Z�Ru������Ϻ�qX��X?)R�eF�`�Dd$��&ZV�0ǃ�z<_�>��m1��[eӋ���xŧ�p��}�U�P�B4/)g�LsH��5 /�V1��5�\ʢ���������Z�����GD<���Xj#��`_��5��>��8^1�RjAXL�~�rK��+Y�$�h���,d��<ǔ�zY�+E��1h}Cm��N�h���y�*�;��Ax]ސ���T���a x}D ��N�}��A�Ղk����Es=��i�jL�<�� � =���(���<6*d.H��{�}�0�0�F���#����G���u�O��ԡa@y��J y�N}���8B�_)(%'9�`\S��P��r��P:��ͦNb�N ���04���;Yַ4��?�+����Ksy�V�(���~�T`��2�g�p��'�r�zƺ�o>Q��z]}�wp5r)��ɝ�U���]PKIj��8v�9�Z�t;���w�fu��
R��� �xd�x���c�M$�[�
��ވ�ކ:30�.�����"�� �i�P{�P�K��0�}2�]�����=�� ��%�7���*����N�C�jY��<U|V\���*��5������&���1����+��]"7ؘ�*6�Ta��n-�����8z�����3���o�Vun/���f��04�O��
a���]"��YS�\\c-���Q(��RĻ�I6�.��u՝8��~"����:�Xk���m���A��O�Kcx�~*yF���1��O �I��e[G���Į�������G�5'��l4�UĲ[rMʟ��/@x���$��1n@xI6;�`��j}L٣v���V*�u\q_/�"PlmV�ܰn��M_����7\��sM�Ρ-�5�0��wry�9���͸~�h��R�=,MV�u��dw:4�Lv� ^�vu�W�\?�0^��_y���,v�:��K�H����b�[%�7z�y���'��&�i��9�y�!�k�k����w������?�Y�t      O   �   x�5��� �3�' .���:2���Ge�~D�hS�3U9��.;b��OWU"/=�n]F�U`&K:>(�4ЈN҅�t��@���0���w�C"e?�5�U���uţ� ���),@'���H��>���7.      A   `   x�M�;@PD�{#�ۍ���t4*Q(E���ݑG���̙񅎛�r&V����R���rU��0rZc�?	������[ca�����῟x�� -�F�      a   �   x�-��1���an��� �l7�1���K89tR����6r�!SL�8+���p��Oʞ��h$])oj<o/�E����2���'�U��8ɻ�
������I'G���*��`�{Mw5<��1�P�M�7"a���(��n咃�i������"���հ�ʴN�����1J��8���H�tS��yQ��75O      S   N  x���MN�0���)z�q���Q�h�B] ,��W�ZUKr���&B���ͤ���y�g��q�>q�{�g�����?��ڐ!��K~���g�سl2d��[���Wl65���u���P����V��Fx�QUW�"���t1B�P��wxͪ�{��6O���)�W���� �yT�N�>�@G1�>��#ɜ�+��z	/Gb�E	ɨ�T�t$�H�PɃr�s�_#����B4����~.�2p)\p���J�jHG|�9h��<8���^�e�r?'a��6>���o�	E�#�IE��NE�D��JrD�;��.���Xk/t�R      U   
  x�%�ɑE1��̔��8���h.j�F�lO�Ճ1�&�������c�!�������c���z��SR� zI� C�r������0�'O� �m�	�M�8a��aӛ�V��5r����b�%�;lz�a�Ê�	S���tX��;�41|�G��V~G^}$�������s�;��#�L����s�Ġ��s�>��s�7|�G����oZ✝��
V�Xj��v�b+Xb��C��ي�`�w�պC��ي�`��T�Y[k�      C      x��]Y��F�~��0̕�]�0Zܲ;Ba�%�!�m�1��~�K��%U�t�7j,I@�%��%������N�W˛������Z�<�[ޞ�/��_�.N��ƋpZ����,��5��\n�w���ͩ�/j�N�?�k�����������iy������[|i(��|Z~^.����;-��gޜ�ޞL�)5����=�^�xo{��S��º����i�	�p}~���������| �}���\�Of���%�$���_��<�ȥƬdvZ~\�`�۪�S��?8K���]����ur9�B��+H~p�=?�;?nJ� o��xZ�~��+��R.����J�
��?��`IO��S3�`U<����l�����A��IP,o�����u*�T���%��IgO�'� ������m���fR��������,�����5�S�<Cɮ*���6 -$�">�����.�%7����ӕ��-������RlQ;h���=�����|���Fa���m�����+xٻ&�7h� Ykj�V���-|-]�?i�j�aq|���<љ�j�wT�3����:{�h3�,
����?���=��f�/Oh�a�f� a��}��6X�|����I���D&��߽r�T��B6��IoW��8�o`��.�uo	�r��¥Q�(F��_�n/%�d��ea��ɶ��2AM	_���J�e7��{�����fSp�+.����=����n����֕Tz o����o���;}`��O��u�l������� �Kbu�L�;�`J�U��5�`l��^��}�ȏ�*6a���Q�O�s�耄~�X�נ��!&���μ{�� .{\	� +�T������y�g�@L6�'��՚$n�o�t�P���(�`-M���U�2������]�D6������/
��1 ��lٚ�M���e���w렌Dٺ��#� �N���4K'0���I���IIr�F�ַ��Y@��Q���������j�� m�=�hWP�KR.6j��vǋR;K�OX^F�(��ɠh�ts1C2(@*�Lt�Q�or��j'dd�h��X�5}����ڸ݅w2�Z\s��`�VǠ�:�!�����7p���ʚ��x����v��䥴��1Fc&*Y�c2&b�����t,�T9�� �@6V�Dp(h���])��"*B��-�K���(�|1�~�4�[Xd4���f@��p>^LQ�V0��M{��%]L(�F�h<��ًaJ��L���	^V��l��gBӞFU=p���{�P<oH/�+�dɓ���Ƞ���@i�;��z�6�as�Ȑ6-s<�T8A��1����֋9�r�]��\�T(��\���y����e��2j����0���>�]�G�o�y�Kzr��IN�/bg�a�Aժ�~�P>H�a�.���Wn�0����&�����0���\Z&�؂Bp���9�U}>�Yj��)i'#"�A'��`���M���Ά�C�ĘP�-��)�w��f�`�>�.�/cS���b�kI#Z�r��U!FST�?P��(3R�ʶ�l�R��bq��W�0?E"�V�����m��/�6E6�,8^ǣ8Q�� C�$/~���YQ�X[H��<§S_�p{$�C-jqR8���es
���|��bl*O6��׷V��|�'A�r��$������t��Pa�n�֦�eRG�l��[a��M��1[}��"�1��H��t}�Ӱ%hk渽Y�G�D>C��5�S,��j����V�`XB^m���a�e*="���)L;^^�*�uL�a��D�I)����ژ��SaCFz-�g��x�Π&s�㨈��������q�p��p�H���4ƀzP����Ym�â_ޚ�\`5h�B�/@9��(X�}C��5�*���ԫu��ߐi���l��b�"�s��A�l������]Ÿ&4cRղ^�-\��d�f��\�/k�Q"3�}/��_nF4���a�;Z�B.��t#%w���+m��$:3acF��c�QB6E�v�fÛ�r_�����Ǒ;k|�rv�:��C����ڭ��9KW���8ͪ�ӭ��{��}^�4�=�t4��� cNf �/����W:|u����~o":��{���6[�<�Xw��)���Ż�>!YtؾS!������y��}g���!���֭,_�N�`j�'��2�8��}�a2�O))�G��k�,����Q�8xT�H��?����՟4���tD����І��6�����9&�k���h>���+f�[o�θ�X��+Wt���򚪂{�9cI2"��-�R��py���$�b�����&���&Q��8��0�v��H��j�e,Q�k�����|lcG͙��;c{흃]�}��%�1��I�{D/I6in���^XF��>D6�fg��fbb<$�^o3��Z4wP&�%[?jeãY5~&�~.��F㴼��f1Ճ�����rC�n"��:m$�n���XyHӽ���f�<8��A%�U���ݩ��M�Q��І������04~��6S�k-������yc*��l�^ɖx<�����+[Ψ��sCU�e�̶kg�*���U=�d���yK�k��D��ܮa� �b]��К������"Ad(-�W�u&ޭiM��i���)z3����L�7'x�}�P(u�b���&�c������({��7n�\5��է)��D�	��=��k��wVVZ�ti���.�V7� �M�\d\��K#5Y"Rr5�)8%p�� 3�0���%|�c���g�?�h��EDw��j ��Y����#r�?���ŇX������71E�0�9�=:iY"��1�W��M����hw�9sx~��:���8Nr�z�s������*��/t�IV�T�q�y8=+,s0��l����t@�����
�"R�'b��>�σ"��$�����!�h�|��^6��!��9'�A�64]d؛������ѿ��V(��iL=�{+���I�/qX9_���:V�8�����Pӷ�k@�3�ӷ�s��HH A�P����r�)����G�»5��ޡ�hG�G�l'��Xu��T�Hz(Z��Mn��O@س�P���w�1����))�^������"!��7yĀ��X�1�g�P`��	����Ϩ9������0jJ�����'�,Ψ4��<Z@o7�Vy��L�G�a�~�{��L��>�n�"(Ju�!V���P<Ia-d��a%���`^�md���4Y�c�+#XEx���k6�gh��@m~��B��ߨ�@
��5�Ȫ��z�L��Z���;*��Մ�X��'��o��!�q�ȤJ�r\�E~m�#��>]cN7x��m�!�0l!���p�K���ɔ�R���2�e�}I��x�����J��FB¼r���&�xO��ƍ�LU_�I}��bp���k7��Ҹܦ�2����X��=;'eFI`B���5�&ax��z�$Λ�8�Y*C�RF�Ap{�G��Hou[��޴n%l��e��TJ}�b.���.;������)8��TT���'	+^M��!�y\�5//!�������Gq3�W/���Y�k0^r1v�4;^�b��r��� rD���)�`�E����5�rg��[J:��<��L	��h�7 SIq3N$���L�Y�\�4�s|�A���,m�T����}� lH5��0W�k����|�r��)�f����5�Z	k��p '#B�X���3��+ywp�My�Re�T����(~���q+3����b�_�І}Ĕe�m[��i�4a��j�>W!\�sW�؉5�w��=�$������:a�yt����ϳ'$�|�*lnH����YѺ'��Q�K9�V3,ҝ�D�66�U�f�Վ�;s�F殊�5�5XТ�����G������������4����^)�����![O��9�3�ѫ���h�Ԉ�z����5g�`fW�]�-�.u��X�C���hZζ&��� �  C�[I�I#t�Q�����T߯��I�T�H�d�_��;��O��!�C�#pɽ:�5�D5���r�
���@������	�E#[����8���[�e�#�l��2g��#�m��S&��g�
�8լ�k�d�LH�MaޖH�Oso��@i�,�[�1�J@�ʃ��@|��zQ�$|�;l�?gx��b�J����Z8��Mk�DxVly��~<�J����J`�y�zc�Ue,k�a�]^b���ei��g*���mw����Y$�[�D�, ��N�6���\�=�㗺�g�@I�Z�{l��F�q�r�>�6%]������Z�k��j2�]�#�?`3[����P��d%U�{/�K 𣩫��h��zD��9�#]*c�<��ԈE�u���'_-_�x08S��v�$�C���*���lpok׮5&XXw�5qL&@p{�Y�R��>�lUT6`i�u�_��i�/3�>jK��q�a�c�4Ý�7��5~+�x����X�:�`���&��(�QX�-hO��tz��ȃ -G�c��@�p������x��6�"ؙ�`�A����o�[ b�lO�eP�YW/|�Ue�J���N��:���c���\���
�8�K�}}��ZE����(��V/a���$�;���(L.�X�/$���3MR�ғ�5-�\޷�(�����e�*���~��6��C/��_K[�$�٭:��=!x��R��z�g<�T9W&�K�F���M�a�/���������;����R=)��S��3�iSNٳG.Q�:��r�
3��WB8��o.@.��/YE�5��<~�
~�$�DE3Rk�m�������0��J��Y��^S��1���H���`wwCJ7n�\��������O�Q���yy�u*�h{nO�~�S��Lf�Usǜs��hv�s�
����󚔸� 2��~�ԍ94OIT����(�)+���g&H�E�ֲR=�����T�0��A��O�|���&U��-�D/��f�ًq��΀�N���g{T~-ۿ�_j.=�Z���@e���jh�샧���b�?Q�$�Ǣ晑J�v
��c!m�`�%��B9$��;�c[��y�e�<�;���ԁ[�|�1fRDf��0>��A�;?>Sٲv�+=�U?�cs�٣�� jFwD{.Ȟל�vk.RO��FA��I-'<0�����eh��;2��7z�����O��x����[��}ޚ������a0���d�u���M�:�[�c��T�߮�	�KFTHjc����jxy�'SW���Nl9U��}&�DZ���[�+!
<ԧLN5���J����}��'i���9mU�e���.0��]p����Z����l���`����ŷ��#�"�������CYy�fW�ٵ�뻃s|�P�o/xJ{�,G�Hb�8M���it��ؤ
0�~R��Y�&U�d�J����J�쮫���G��Ӯ@J�%�J�~��j�lɻ-\4�K�ݜ�{��@[�.��w=P�PR��޾
)}�~*y�~69�tޞ�c&G�p����Y�v�V��Jj���en6{��3�M�ٻ��2Y��rW�V']&�&�T[�����q+�c��F�]Y�D��s�T�m�n�lQ�u��W����UArm2Y�1�`R�#�Q���t����<���nƛCN���$�ldE���\n7�r(����T�o^zg���Um�y�fx���ڧ�(�wTjh�n����)e�gU;.�M0������T_�Ȭ3�C���✫v���\d��~ؑ�{�L{�}y�����宋�v92$���E�9�0�����NJ��1�f���[�����ӸӬ��3�s΍gN�k�J��΍B�{��l���Q�������/�,��&ܲ ���̅s�SV�����o'{�Ћ׮)�4���f��-�N x�C�:P��4�9dv7$aYT����w�m7��ً�f��]�ho�����fy3���(�Z�䦒�����������;4��*f�۝�mO��`�넋�mGʏ[��)g���U�8S�C��jg�3�97�]R9������A�N�Q���;���r�`�{�Uu����}��`k�.�Re��=u�}c�S�ٱ/妁�/�,�����Z��$_��tt���0�CX5�ïN�Iau����=����8kG]���3����]\\��f�.      M   �   x�%O�!{K�d��K��#��Y�u!ۃ��������?�₞��
�ۑd/��k�I�}�'�'-�F1ĴD����������\R林Ҥ,�K)0�\j��2j�G�Z;&�]�Yk4���X6�5.K7�vVNz����4��������n&�      N   �   x�%��D!�R�>Q���_�r��O-_*w��qV4�ʆ�Ή�dP��n�dm:�v��#v	Cp���%��nG|O�u��Y�q�+�m G=�(��]M�퉞㛼K$.�w��Q���Jp�PF�pg��1!�[�ZIMME�&N��Jyƨ��L���&[t�t�E���T���E�4@�����D�{���H�Al �Z?�8t�fwk��]����-�M_      ?   �   x�u���0�\. !A(�b <�#��a�X1NZ��({R��X{��9�Aªw,��^_Y{����N;BE.zdH�,��� 4X��>0#IS�.�7�EƏ�����@���f�V,3�Ċ�7������V�f��Dd(�+      F   W   x�-���0�3����%�ב���i$�)[b2�lci��7:&��,L<w������%q{#/���w��ىl�'
���Q��NK      z   �   x�M���0Dϸ�� �O/鿎 M.����6
��A��B�����Csi�N��s\aQg�� iplx�����Exiy�z>�>0�486�"<F35�������&Kx]���i��W Z�K�;6pZ���[�ԌC0���v�`��:+��1H��M)��2�,Og��V�j~���o�S���=:��H�'�o駴NK��L��-7B[�/�kA�Z�Zc����y���]�      ]   �   x�}P[n�@��9 �P^w�aB�� ~�@E D@B�
�ճ�E�c�����f8�@��|��I�a�D�%�������@$K��✬�F����Y㒰��Cّ��8,¦�kA~�ܘUH>h�~I��)]��+��	؉�_7�/o*[q�s�����: +3�,8��oZcg��<4z���;�ўXΕ������9��L\w?���$ع&Uc[������?k"��      x   �   x�}���0D�l� �?�B1.��8��8	�e�q�1	��e5;�4koV��#�#�>РFB�w��2��l�����L�eg���h��;"�S��}��1�iF� /��?_(g���"4z4�d�J�����2�OI.F��{d��u׵�� �b      e      x�34�4�24�4����� x�      c      x�34�4�24������ c       I   n   x�%��0B�u�^4`�]��U���8�48�,V�cټ⓴��f�m��-��פ��r�w�3:�g�(H�۪	Q�(�g�p�o�e�Ӆ97T0!�
c�H��`N����?� �      G   9  x�%�˕!D�v0sDA!��C]7�t	�=װ���G5���1���x�nL�cS���7nxW�^��/d�|���A!�u$�.N�s���~��䴗��~�߁�Q��#K}�\��h���<�H{��_�1�)L���;&�5�Y\U�,�ٙ�9���y�=.����>�Mӗ�k�K��]���(&v�$/�%>YV�^�q'-�K Σ��*i&6�*�U,�����	�.f]t\T]ռ�	J��ٔO�G��'f������Of�F�iSnڔ��u��l��9�Z��1���'�|_X']�/������-�p7      Q   K   x�3�0���6\�va�ņ��{.캰��NN.#�.l��pa��� ��������M`5�F\1z\\\ :�)�     