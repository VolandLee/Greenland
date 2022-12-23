PGDMP     (                    z            ggg    14.5    14.5 �    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    28049    ggg    DATABASE     `   CREATE DATABASE ggg WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE ggg;
                postgres    false                        2615    28050    supplier    SCHEMA        CREATE SCHEMA supplier;
    DROP SCHEMA supplier;
                postgres    false                        1255    28051     accept_goodslist(bigint, bigint) 	   PROCEDURE     �  CREATE PROCEDURE supplier.accept_goodslist(IN s_r_id bigint, IN g_id bigint)
    LANGUAGE plpgsql
    AS $$

declare
vs_o_id INTEGER;
vt_p_id INTEGER;
vs_r_id integer;
vn_p_id integer;
vg_id integer;
begin


select supplier_route_id, next_point_id into vs_r_id, vn_p_id from supplier.supplier_routes 
		  where supplier_route_id = s_r_id limit 1;
select supplier_order_id, to_premise into vs_o_id, vt_p_id from supplier.supplier_order 
		  where current_supplier_route_id = s_r_id limit 1;
select goodslist_id into vg_id from supplier.goodslist
		  where goodslist_id = g_id limit 1;

if vs_r_id is Null THEN
raise exception 'supplier_route_id не найден';
end if;
if vs_o_id is Null Then
raise exception 'supplier_order_id с таким маршрутом не найдено';
end if;
if vg_id is Null then
raise exception 'goodlist_id не найден. Добавьте сначала товар на склад';
end if;
if vt_p_id = vn_p_id THEN
begin
UPDATE supplier.supplier_order
set delivery_date = now()
where supplier_order_id = vs_o_id;
end;
end if;
UPDATE  supplier.supplier_routes
set end_date = now(),
status = 3,
goodslist_id = g_id
where supplier_route_id = s_r_id;
end;

$$;
 L   DROP PROCEDURE supplier.accept_goodslist(IN s_r_id bigint, IN g_id bigint);
       supplier          postgres    false    4                       1255    28052 F   add_barcode_f_id(bigint, bigint, character varying, character varying)    FUNCTION     :  CREATE FUNCTION supplier.add_barcode_f_id(cat_id bigint, sup_id bigint, b_name character varying, country character varying) RETURNS integer
    LANGUAGE sql
    AS $$

insert into supplier.barcodes
(catalog_id, supplier_id, barcode_name, country)
values
(cat_id, sup_id, b_name, country)
returning barcode_id
$$;
 |   DROP FUNCTION supplier.add_barcode_f_id(cat_id bigint, sup_id bigint, b_name character varying, country character varying);
       supplier          postgres    false    4                       1255    28053 J   add_goodslist_f_id(bigint, bigint, bigint, bigint, bigint, bigint, bigint)    FUNCTION     R  CREATE FUNCTION supplier.add_goodslist_f_id(pr_id bigint, p_id bigint, quan bigint, sx bigint, sy bigint, sz bigint, w bigint) RETURNS integer
    LANGUAGE sql
    AS $$


insert into supplier.goodslist
(product_id, premise_id, quantity, sizex, sizey, sizez, weight)
values
(pr_id, p_id, quan, sx, sy, sz, w)
RETURNING goodslist_id;

$$;
 ~   DROP FUNCTION supplier.add_goodslist_f_id(pr_id bigint, p_id bigint, quan bigint, sx bigint, sy bigint, sz bigint, w bigint);
       supplier          postgres    false    4                       1255    28054 �   add_premise(bigint, double precision, double precision, character varying, bigint, bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE       CREATE PROCEDURE supplier.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint)
    LANGUAGE sql
    AS $$
insert into supplier.premises
(premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number)
values
(p_type, coord_long, coord_lat, email, phone, postcode, region, city, street, h_number)
$$;
 
  DROP PROCEDURE supplier.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint);
       supplier          postgres    false    4                       1255    28055 4   add_product_f_3val(bigint, numeric, numeric, bigint)    FUNCTION     �  CREATE FUNCTION supplier.add_product_f_3val(b_id bigint, sup_p numeric, c_p numeric, quan bigint) RETURNS TABLE(product_id bigint, supplier_price numeric, quantity bigint)
    LANGUAGE sql
    AS $$

insert into supplier.products
(barcode_id, supplier_price, client_price, quantity, available)
values
(b_id, sup_p, c_p, quan, False)
returning product_id, supplier_price, quantity
$$;
 a   DROP FUNCTION supplier.add_product_f_3val(b_id bigint, sup_p numeric, c_p numeric, quan bigint);
       supplier          postgres    false    4                       1255    28056 �   add_supplier_f_id(character varying, character varying, bigint, bigint, bigint, bigint, character varying, bigint, character varying)    FUNCTION       CREATE FUNCTION supplier.add_supplier_f_id(s_n character varying, email1 character varying, phone1 bigint, postcode1 bigint, region1 bigint, city1 bigint, street1 character varying, h_number1 bigint, website1 character varying DEFAULT NULL::character varying) RETURNS integer
    LANGUAGE sql
    AS $$

insert into supplier.suppliers
(supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website)
values
(s_n, email1, phone1, postcode1, region1, city1, street1, h_number1, website1)
RETURNING  supplier_id;
$$;
 �   DROP FUNCTION supplier.add_supplier_f_id(s_n character varying, email1 character varying, phone1 bigint, postcode1 bigint, region1 bigint, city1 bigint, street1 character varying, h_number1 bigint, website1 character varying);
       supplier          postgres    false    4                       1255    28057 7   add_supplier_route_f_id(bigint, bigint, bigint, bigint)    FUNCTION     L  CREATE FUNCTION supplier.add_supplier_route_f_id(s_o_id bigint, p_id bigint, n_p_id bigint, par_id bigint DEFAULT NULL::bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$


DECLARE vc_s_r_id bigint;
vs_o_id bigint;
vp_id bigint[];
vpar_id bigint;


vs_r_id bigint;
begin
select  supplier_order_id, current_supplier_route_id into vs_o_id, vc_s_r_id from supplier.supplier_order
where supplier_order_id = s_o_id limit 1;
if vs_o_id is NULL THEN
RAISE EXCEPTION 'supplier_id does not exist';
end if;
vp_id:= array(select  premise_id from supplier.premises
where premise_id in (p_id, n_p_id) limit 2);
if (vp_id[0] is NULL and vp_id[1] is NULL)  then
RAISE EXCEPTION 'premise_id с такими номерами не существуют';
end if;
if par_id is not NULL then
begin 
select supplier_route_id into vpar_id from supplier.supplier_routes
where supplier_route_id = par_id limit 1;
if vpar_id is NULL then
RAISE EXCEPTION 'parent_id с таким номером не существует';
end if;
end;
end if;

insert into supplier.supplier_routes
(parent_id, point_id, next_point_id, status)
values
(par_id, p_id, n_p_id, 0)
returning supplier_route_id into vs_r_id;
if vc_s_r_id is NULL THEN
begin

update supplier.supplier_order
set current_supplier_route_id = vs_r_id
where supplier_order_id = s_o_id;
end;
end if;
RETURN vs_r_id;

end;
$$;
 j   DROP FUNCTION supplier.add_supplier_route_f_id(s_o_id bigint, p_id bigint, n_p_id bigint, par_id bigint);
       supplier          postgres    false    4                       1255    28058 l   create_supplier_order_f_id(bigint, bigint, bigint, bigint, numeric, bigint, bigint, bigint, bigint, numeric)    FUNCTION       CREATE FUNCTION supplier.create_supplier_order_f_id(s_id bigint, p_id bigint, f_pr bigint, t_pr bigint, s_pr numeric, quan bigint, sx bigint, sy bigint, sz bigint, w numeric) RETURNS integer
    LANGUAGE sql
    AS $$

insert into supplier.supplier_order
(supplier_id, product_id, from_premise,
to_premise, current_supplier_route_id, supplier_price, quantity, order_date, delivery_date, sizex, sizey, sizez, weight)
values
(s_id, p_id, f_pr, t_pr, NULL, s_pr, quan, now(), NULL, sx, sy, sz, w)
returning supplier_order_id;
$$;
 �   DROP FUNCTION supplier.create_supplier_order_f_id(s_id bigint, p_id bigint, f_pr bigint, t_pr bigint, s_pr numeric, quan bigint, sx bigint, sy bigint, sz bigint, w numeric);
       supplier          postgres    false    4                       1255    28059    send_goodslist(bigint) 	   PROCEDURE     <  CREATE PROCEDURE supplier.send_goodslist(IN s_r_id bigint)
    LANGUAGE plpgsql
    AS $$
declare
vs_o_id INTEGER;
vs_r_id integer;
vp_id integer;
begin
select supplier_route_id, parent_id into vs_r_id, vp_id
from supplier.supplier_routes
where supplier_route_id = s_r_id limit 1;
select supplier_order_id into vs_o_id from supplier.supplier_order 
		  where current_supplier_route_id = vp_id limit 1;
if vs_r_id is Null THEN
raise exception 'supplier_route_id не найден';
end if;
if vs_o_id is Null Then
raise exception 'supplier_order_id с таким маршрутом не найдено';
end if;


update supplier.supplier_routes set status = 2, start_date = now()
where supplier_route_id = s_r_id;
update supplier.supplier_order set current_supplier_route_id = s_r_id
where supplier_order_id = vs_o_id;
end;
$$;
 :   DROP PROCEDURE supplier.send_goodslist(IN s_r_id bigint);
       supplier          postgres    false    4            �            1259    28060    actions    TABLE     r   CREATE TABLE supplier.actions (
    action_id integer NOT NULL,
    action_name character varying(45) NOT NULL
);
    DROP TABLE supplier.actions;
       supplier         heap    postgres    false    4            �            1259    28063 
   auth_group    TABLE     h   CREATE TABLE supplier.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
     DROP TABLE supplier.auth_group;
       supplier         heap    postgres    false    4            �            1259    28066    auth_group_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    211    4            �            1259    28067    auth_group_permissions    TABLE     �   CREATE TABLE supplier.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 ,   DROP TABLE supplier.auth_group_permissions;
       supplier         heap    postgres    false    4            �            1259    28070    auth_group_permissions_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    213            �            1259    28071    auth_permission    TABLE     �   CREATE TABLE supplier.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 %   DROP TABLE supplier.auth_permission;
       supplier         heap    postgres    false    4            �            1259    28074    auth_permission_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    215            �            1259    28075 	   auth_user    TABLE     �  CREATE TABLE supplier.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE supplier.auth_user;
       supplier         heap    postgres    false    4            �            1259    28080    auth_user_groups    TABLE     �   CREATE TABLE supplier.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 &   DROP TABLE supplier.auth_user_groups;
       supplier         heap    postgres    false    4            �            1259    28083    auth_user_groups_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    218    4            �            1259    28084    auth_user_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    217    4            �            1259    28085    auth_user_user_permissions    TABLE     �   CREATE TABLE supplier.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 0   DROP TABLE supplier.auth_user_user_permissions;
       supplier         heap    postgres    false    4            �            1259    28088 !   auth_user_user_permissions_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    221            �            1259    28089    barcodes_seq    SEQUENCE     w   CREATE SEQUENCE supplier.barcodes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE supplier.barcodes_seq;
       supplier          postgres    false    4            �            1259    28090    barcodes    TABLE       CREATE TABLE supplier.barcodes (
    barcode_id bigint DEFAULT nextval('supplier.barcodes_seq'::regclass) NOT NULL,
    catalog_id integer NOT NULL,
    supplier_id integer NOT NULL,
    barcode_name character varying(45) NOT NULL,
    country character varying(45) NOT NULL
);
    DROP TABLE supplier.barcodes;
       supplier         heap    postgres    false    223    4            �            1259    28094    catalog    TABLE     �   CREATE TABLE supplier.catalog (
    catalog_id integer NOT NULL,
    catalog_name character varying(45) NOT NULL,
    parent_id integer
);
    DROP TABLE supplier.catalog;
       supplier         heap    postgres    false    4            �            1259    28097    city    TABLE     �   CREATE TABLE supplier.city (
    city_id integer NOT NULL,
    city_name character varying(45) DEFAULT NULL::character varying
);
    DROP TABLE supplier.city;
       supplier         heap    postgres    false    4            �            1259    28101    client_order    TABLE     !  CREATE TABLE supplier.client_order (
    client_order_id integer NOT NULL,
    client_id integer NOT NULL,
    product_id integer NOT NULL,
    from_premise_id integer NOT NULL,
    to_premise_id integer NOT NULL,
    current_client_route_id integer,
    client_price numeric(10,2) NOT NULL,
    order_date timestamp without time zone NOT NULL,
    delivery_date timestamp without time zone,
    received_date timestamp without time zone,
    sizex integer,
    sizey integer,
    sizez integer,
    weight numeric(8,3) DEFAULT NULL::numeric
);
 "   DROP TABLE supplier.client_order;
       supplier         heap    postgres    false    4            �            1259    28105    client_routes    TABLE     N  CREATE TABLE supplier.client_routes (
    client_route_id integer NOT NULL,
    parent_id integer,
    delivery_id integer,
    goodslist_id integer,
    point_id integer NOT NULL,
    next_point_id integer NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status integer NOT NULL
);
 #   DROP TABLE supplier.client_routes;
       supplier         heap    postgres    false    4            �            1259    28108    clients    TABLE     b  CREATE TABLE supplier.clients (
    client_id integer NOT NULL,
    received_point_id integer,
    phone bigint NOT NULL,
    postcode integer NOT NULL,
    region_id integer NOT NULL,
    city_id integer NOT NULL,
    street character varying(45) NOT NULL,
    h_number integer NOT NULL,
    gender boolean NOT NULL,
    birth_date date NOT NULL,
    balance numeric(10,2) DEFAULT 0.00 NOT NULL,
    liked json,
    CONSTRAINT clients_chk_1 CHECK (((phone >= '70000000000'::bigint) AND (phone < '80000000000'::bigint))),
    CONSTRAINT clients_chk_2 CHECK (((postcode >= 100000) AND (postcode < 1000000)))
);
    DROP TABLE supplier.clients;
       supplier         heap    postgres    false    4            �            1259    28116    control_points    TABLE       CREATE TABLE supplier.control_points (
    control_points_id integer NOT NULL,
    employee_id integer NOT NULL,
    product_id integer NOT NULL,
    action_id integer NOT NULL,
    premise_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);
 $   DROP TABLE supplier.control_points;
       supplier         heap    postgres    false    4            �            1259    28119    delivery    TABLE     k  CREATE TABLE supplier.delivery (
    delivery_id integer NOT NULL,
    delivery_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone bigint NOT NULL,
    postcode integer NOT NULL,
    region_id integer NOT NULL,
    city_id integer NOT NULL,
    street character varying(45) NOT NULL,
    h_number integer NOT NULL,
    website character varying(45) DEFAULT NULL::character varying,
    CONSTRAINT delivery_chk_1 CHECK (((phone >= '70000000000'::bigint) AND (phone < '80000000000'::bigint))),
    CONSTRAINT delivery_chk_2 CHECK (((postcode >= 100000) AND (postcode < 1000000)))
);
    DROP TABLE supplier.delivery;
       supplier         heap    postgres    false    4            �            1259    28125    django_admin_log    TABLE     �  CREATE TABLE supplier.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 &   DROP TABLE supplier.django_admin_log;
       supplier         heap    postgres    false    4            �            1259    28131    django_admin_log_id_seq    SEQUENCE     �   ALTER TABLE supplier.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    232            �            1259    28132    django_content_type    TABLE     �   CREATE TABLE supplier.django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 )   DROP TABLE supplier.django_content_type;
       supplier         heap    postgres    false    4            �            1259    28135    django_content_type_id_seq    SEQUENCE     �   ALTER TABLE supplier.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    234            �            1259    28136    django_migrations    TABLE     �   CREATE TABLE supplier.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 '   DROP TABLE supplier.django_migrations;
       supplier         heap    postgres    false    4            �            1259    28141    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE supplier.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    236            �            1259    28142    django_session    TABLE     �   CREATE TABLE supplier.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 $   DROP TABLE supplier.django_session;
       supplier         heap    postgres    false    4            �            1259    28147 	   employees    TABLE     8  CREATE TABLE supplier.employees (
    employee_id integer NOT NULL,
    premise_id integer NOT NULL,
    fname character varying(45) NOT NULL,
    lname character varying(45) NOT NULL,
    patronymic character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    password character varying(45) NOT NULL,
    phone bigint NOT NULL,
    postcode integer NOT NULL,
    region_id integer NOT NULL,
    city_id integer NOT NULL,
    street character varying(45) NOT NULL,
    h_number integer NOT NULL,
    gender boolean NOT NULL,
    birth_date date NOT NULL,
    hire_date date NOT NULL,
    chief_id integer,
    CONSTRAINT employees_chk_1 CHECK (((phone >= '70000000000'::bigint) AND (phone < '80000000000'::bigint))),
    CONSTRAINT employees_chk_2 CHECK (((postcode >= 100000) AND (postcode < 1000000)))
);
    DROP TABLE supplier.employees;
       supplier         heap    postgres    false    4            �            1259    28152 	   goodslist    TABLE       CREATE TABLE supplier.goodslist (
    goodslist_id integer NOT NULL,
    product_id bigint NOT NULL,
    premise_id integer NOT NULL,
    quantity integer NOT NULL,
    sizex integer NOT NULL,
    sizey integer NOT NULL,
    sizez integer NOT NULL,
    weight numeric(8,3) NOT NULL
);
    DROP TABLE supplier.goodslist;
       supplier         heap    postgres    false    4            �            1259    28155    goodslist_seq    SEQUENCE     z   CREATE SEQUENCE supplier.goodslist_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE supplier.goodslist_seq;
       supplier          postgres    false    4            �            1259    28156    premise_type    TABLE     }   CREATE TABLE supplier.premise_type (
    premise_type_id integer NOT NULL,
    type_decryp character varying(45) NOT NULL
);
 "   DROP TABLE supplier.premise_type;
       supplier         heap    postgres    false    4            �            1259    28159    premises    TABLE     n  CREATE TABLE supplier.premises (
    premise_id integer NOT NULL,
    premise_type_id integer NOT NULL,
    coord_long double precision NOT NULL,
    coord_lat double precision NOT NULL,
    email character varying(45) NOT NULL,
    phone bigint NOT NULL,
    postcode integer NOT NULL,
    region_id integer NOT NULL,
    city_id integer NOT NULL,
    street character varying(45) NOT NULL,
    h_number integer NOT NULL,
    CONSTRAINT premises_chk_1 CHECK (((phone >= '70000000000'::bigint) AND (phone < '80000000000'::bigint))),
    CONSTRAINT premises_chk_2 CHECK (((postcode >= 100000) AND (postcode < 1000000)))
);
    DROP TABLE supplier.premises;
       supplier         heap    postgres    false    4            �            1259    28164    products_seq    SEQUENCE     w   CREATE SEQUENCE supplier.products_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE supplier.products_seq;
       supplier          postgres    false    4            �            1259    28165    products    TABLE     (  CREATE TABLE supplier.products (
    product_id bigint DEFAULT nextval('supplier.products_seq'::regclass) NOT NULL,
    barcode_id bigint NOT NULL,
    supplier_price numeric(10,2) NOT NULL,
    client_price numeric(10,2) NOT NULL,
    quantity bigint NOT NULL,
    available boolean NOT NULL
);
    DROP TABLE supplier.products;
       supplier         heap    postgres    false    244    4            �            1259    28169    region    TABLE     �   CREATE TABLE supplier.region (
    region_id integer NOT NULL,
    region_name character varying(90) DEFAULT NULL::character varying
);
    DROP TABLE supplier.region;
       supplier         heap    postgres    false    4            �            1259    28173    supplier_order_seq    SEQUENCE     }   CREATE SEQUENCE supplier.supplier_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE supplier.supplier_order_seq;
       supplier          postgres    false    4            �            1259    28174    supplier_order    TABLE     \  CREATE TABLE supplier.supplier_order (
    supplier_order_id integer DEFAULT nextval('supplier.supplier_order_seq'::regclass) NOT NULL,
    supplier_id integer NOT NULL,
    product_id integer NOT NULL,
    from_premise integer NOT NULL,
    to_premise integer NOT NULL,
    current_supplier_route_id integer,
    supplier_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    order_date timestamp without time zone NOT NULL,
    delivery_date timestamp without time zone,
    sizex integer NOT NULL,
    sizey integer NOT NULL,
    sizez integer NOT NULL,
    weight numeric(8,3) NOT NULL
);
 $   DROP TABLE supplier.supplier_order;
       supplier         heap    postgres    false    247    4            �            1259    28178    supplier_routes_seq    SEQUENCE     ~   CREATE SEQUENCE supplier.supplier_routes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE supplier.supplier_routes_seq;
       supplier          postgres    false    4            �            1259    28179    supplier_routes    TABLE     �  CREATE TABLE supplier.supplier_routes (
    supplier_route_id integer DEFAULT nextval('supplier.supplier_routes_seq'::regclass) NOT NULL,
    parent_id integer,
    delivery_id integer,
    goodslist_id integer,
    point_id integer,
    next_point_id integer NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status integer NOT NULL
);
 %   DROP TABLE supplier.supplier_routes;
       supplier         heap    postgres    false    249    4            �            1259    28183    supplier_seq    SEQUENCE     x   CREATE SEQUENCE supplier.supplier_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE supplier.supplier_seq;
       supplier          postgres    false    4            �            1259    28184 	   suppliers    TABLE     �  CREATE TABLE supplier.suppliers (
    supplier_id integer DEFAULT nextval('supplier.supplier_seq'::regclass) NOT NULL,
    supplier_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone bigint NOT NULL,
    postcode integer NOT NULL,
    region_id integer NOT NULL,
    city_id integer NOT NULL,
    street character varying(45) NOT NULL,
    h_number integer NOT NULL,
    website character varying(45) DEFAULT NULL::character varying
);
    DROP TABLE supplier.suppliers;
       supplier         heap    postgres    false    251    4                      0    28060    actions 
   TABLE DATA           ;   COPY supplier.actions (action_id, action_name) FROM stdin;
    supplier          postgres    false    210   ~.                0    28063 
   auth_group 
   TABLE DATA           0   COPY supplier.auth_group (id, name) FROM stdin;
    supplier          postgres    false    211   �.                0    28067    auth_group_permissions 
   TABLE DATA           O   COPY supplier.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    supplier          postgres    false    213   �.                0    28071    auth_permission 
   TABLE DATA           P   COPY supplier.auth_permission (id, name, content_type_id, codename) FROM stdin;
    supplier          postgres    false    215   �.      	          0    28075 	   auth_user 
   TABLE DATA           �   COPY supplier.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    supplier          postgres    false    217   �7      
          0    28080    auth_user_groups 
   TABLE DATA           C   COPY supplier.auth_user_groups (id, user_id, group_id) FROM stdin;
    supplier          postgres    false    218   �8                0    28085    auth_user_user_permissions 
   TABLE DATA           R   COPY supplier.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    supplier          postgres    false    221   �8                0    28090    barcodes 
   TABLE DATA           `   COPY supplier.barcodes (barcode_id, catalog_id, supplier_id, barcode_name, country) FROM stdin;
    supplier          postgres    false    224   9                0    28094    catalog 
   TABLE DATA           H   COPY supplier.catalog (catalog_id, catalog_name, parent_id) FROM stdin;
    supplier          postgres    false    225   d9                0    28097    city 
   TABLE DATA           4   COPY supplier.city (city_id, city_name) FROM stdin;
    supplier          postgres    false    226   �9                0    28101    client_order 
   TABLE DATA           �   COPY supplier.client_order (client_order_id, client_id, product_id, from_premise_id, to_premise_id, current_client_route_id, client_price, order_date, delivery_date, received_date, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    227   �?                0    28105    client_routes 
   TABLE DATA           �   COPY supplier.client_routes (client_route_id, parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    supplier          postgres    false    228   �?                0    28108    clients 
   TABLE DATA           �   COPY supplier.clients (client_id, received_point_id, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, balance, liked) FROM stdin;
    supplier          postgres    false    229   �?                0    28116    control_points 
   TABLE DATA           u   COPY supplier.control_points (control_points_id, employee_id, product_id, action_id, premise_id, "time") FROM stdin;
    supplier          postgres    false    230   Q@                0    28119    delivery 
   TABLE DATA           �   COPY supplier.delivery (delivery_id, delivery_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    supplier          postgres    false    231   n@                0    28125    django_admin_log 
   TABLE DATA           �   COPY supplier.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    supplier          postgres    false    232   	A                0    28132    django_content_type 
   TABLE DATA           K   COPY supplier.django_content_type (id, name, app_label, model) FROM stdin;
    supplier          postgres    false    234   bA                0    28136    django_migrations 
   TABLE DATA           E   COPY supplier.django_migrations (id, app, name, applied) FROM stdin;
    supplier          postgres    false    236   A                0    28142    django_session 
   TABLE DATA           R   COPY supplier.django_session (session_key, session_data, expire_date) FROM stdin;
    supplier          postgres    false    238   �A                0    28147 	   employees 
   TABLE DATA           �   COPY supplier.employees (employee_id, premise_id, fname, lname, patronymic, email, password, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, hire_date, chief_id) FROM stdin;
    supplier          postgres    false    239   C                 0    28152 	   goodslist 
   TABLE DATA           r   COPY supplier.goodslist (goodslist_id, product_id, premise_id, quantity, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    240   D      "          0    28156    premise_type 
   TABLE DATA           F   COPY supplier.premise_type (premise_type_id, type_decryp) FROM stdin;
    supplier          postgres    false    242   :D      #          0    28159    premises 
   TABLE DATA           �   COPY supplier.premises (premise_id, premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number) FROM stdin;
    supplier          postgres    false    243   �D      %          0    28165    products 
   TABLE DATA           o   COPY supplier.products (product_id, barcode_id, supplier_price, client_price, quantity, available) FROM stdin;
    supplier          postgres    false    245   VE      &          0    28169    region 
   TABLE DATA           :   COPY supplier.region (region_id, region_name) FROM stdin;
    supplier          postgres    false    246   �E      (          0    28174    supplier_order 
   TABLE DATA           �   COPY supplier.supplier_order (supplier_order_id, supplier_id, product_id, from_premise, to_premise, current_supplier_route_id, supplier_price, quantity, order_date, delivery_date, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    248   �I      *          0    28179    supplier_routes 
   TABLE DATA           �   COPY supplier.supplier_routes (supplier_route_id, parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    supplier          postgres    false    250   YJ      ,          0    28184 	   suppliers 
   TABLE DATA           �   COPY supplier.suppliers (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    supplier          postgres    false    252   L      3           0    0    auth_group_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('supplier.auth_group_id_seq', 1, false);
          supplier          postgres    false    212            4           0    0    auth_group_permissions_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('supplier.auth_group_permissions_id_seq', 1, false);
          supplier          postgres    false    214            5           0    0    auth_permission_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('supplier.auth_permission_id_seq', 256, true);
          supplier          postgres    false    216            6           0    0    auth_user_groups_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('supplier.auth_user_groups_id_seq', 1, false);
          supplier          postgres    false    219            7           0    0    auth_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('supplier.auth_user_id_seq', 2, true);
          supplier          postgres    false    220            8           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('supplier.auth_user_user_permissions_id_seq', 1, false);
          supplier          postgres    false    222            9           0    0    barcodes_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('supplier.barcodes_seq', 4, true);
          supplier          postgres    false    223            :           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('supplier.django_admin_log_id_seq', 1, true);
          supplier          postgres    false    233            ;           0    0    django_content_type_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('supplier.django_content_type_id_seq', 1, false);
          supplier          postgres    false    235            <           0    0    django_migrations_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('supplier.django_migrations_id_seq', 38, true);
          supplier          postgres    false    237            =           0    0    goodslist_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('supplier.goodslist_seq', 100, false);
          supplier          postgres    false    241            >           0    0    products_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('supplier.products_seq', 49, true);
          supplier          postgres    false    244            ?           0    0    supplier_order_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('supplier.supplier_order_seq', 2, true);
          supplier          postgres    false    247            @           0    0    supplier_routes_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('supplier.supplier_routes_seq', 55, true);
          supplier          postgres    false    249            A           0    0    supplier_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('supplier.supplier_seq', 112, true);
          supplier          postgres    false    251            �           2606    28190    actions actions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);
 @   ALTER TABLE ONLY supplier.actions DROP CONSTRAINT actions_pkey;
       supplier            postgres    false    210            �           2606    28192    auth_group auth_group_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 J   ALTER TABLE ONLY supplier.auth_group DROP CONSTRAINT auth_group_name_key;
       supplier            postgres    false    211            �           2606    28194 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 ~   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       supplier            postgres    false    213    213                        2606    28196 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       supplier            postgres    false    213            �           2606    28198    auth_group auth_group_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY supplier.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY supplier.auth_group DROP CONSTRAINT auth_group_pkey;
       supplier            postgres    false    211                       2606    28200 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 r   ALTER TABLE ONLY supplier.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       supplier            postgres    false    215    215                       2606    28202 $   auth_permission auth_permission_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY supplier.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY supplier.auth_permission DROP CONSTRAINT auth_permission_pkey;
       supplier            postgres    false    215                       2606    28204 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       supplier            postgres    false    218                       2606    28206 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 l   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       supplier            postgres    false    218    218                       2606    28208    auth_user auth_user_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY supplier.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY supplier.auth_user DROP CONSTRAINT auth_user_pkey;
       supplier            postgres    false    217                       2606    28210 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       supplier            postgres    false    221                       2606    28212 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       supplier            postgres    false    221    221            
           2606    28214     auth_user auth_user_username_key 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 L   ALTER TABLE ONLY supplier.auth_user DROP CONSTRAINT auth_user_username_key;
       supplier            postgres    false    217                       2606    28216    barcodes barcodes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT barcodes_pkey PRIMARY KEY (barcode_id);
 B   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT barcodes_pkey;
       supplier            postgres    false    224                       2606    28218    catalog catalog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY supplier.catalog
    ADD CONSTRAINT catalog_pkey PRIMARY KEY (catalog_id);
 @   ALTER TABLE ONLY supplier.catalog DROP CONSTRAINT catalog_pkey;
       supplier            postgres    false    225                       2606    28220    city city_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY supplier.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 :   ALTER TABLE ONLY supplier.city DROP CONSTRAINT city_pkey;
       supplier            postgres    false    226                       2606    28222    client_order client_order_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT client_order_pkey PRIMARY KEY (client_order_id);
 J   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT client_order_pkey;
       supplier            postgres    false    227                        2606    28224     client_routes client_routes_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT client_routes_pkey PRIMARY KEY (client_route_id);
 L   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT client_routes_pkey;
       supplier            postgres    false    228            "           2606    28226    clients clients_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 @   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT clients_pkey;
       supplier            postgres    false    229            $           2606    28228 "   control_points control_points_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT control_points_pkey PRIMARY KEY (control_points_id);
 N   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT control_points_pkey;
       supplier            postgres    false    230            &           2606    28230    delivery delivery_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY supplier.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (delivery_id);
 B   ALTER TABLE ONLY supplier.delivery DROP CONSTRAINT delivery_pkey;
       supplier            postgres    false    231            )           2606    28232 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY supplier.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY supplier.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       supplier            postgres    false    232            ,           2606    28234 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 q   ALTER TABLE ONLY supplier.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       supplier            postgres    false    234    234            .           2606    28236 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY supplier.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY supplier.django_content_type DROP CONSTRAINT django_content_type_pkey;
       supplier            postgres    false    234            0           2606    28238 (   django_migrations django_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY supplier.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY supplier.django_migrations DROP CONSTRAINT django_migrations_pkey;
       supplier            postgres    false    236            3           2606    28240 "   django_session django_session_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 N   ALTER TABLE ONLY supplier.django_session DROP CONSTRAINT django_session_pkey;
       supplier            postgres    false    238            6           2606    28242    employees employees_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 D   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT employees_pkey;
       supplier            postgres    false    239            8           2606    28244    goodslist goodslist_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT goodslist_pkey PRIMARY KEY (goodslist_id);
 D   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT goodslist_pkey;
       supplier            postgres    false    240            :           2606    28246    premise_type premise_type_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.premise_type
    ADD CONSTRAINT premise_type_pkey PRIMARY KEY (premise_type_id);
 J   ALTER TABLE ONLY supplier.premise_type DROP CONSTRAINT premise_type_pkey;
       supplier            postgres    false    242            <           2606    28248    premises premises_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT premises_pkey PRIMARY KEY (premise_id);
 B   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT premises_pkey;
       supplier            postgres    false    243            >           2606    28250    products products_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 B   ALTER TABLE ONLY supplier.products DROP CONSTRAINT products_pkey;
       supplier            postgres    false    245            @           2606    28252    region region_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY supplier.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY supplier.region DROP CONSTRAINT region_pkey;
       supplier            postgres    false    246            B           2606    28254 "   supplier_order supplier_order_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT supplier_order_pkey PRIMARY KEY (supplier_order_id);
 N   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT supplier_order_pkey;
       supplier            postgres    false    248            D           2606    28256 $   supplier_routes supplier_routes_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT supplier_routes_pkey PRIMARY KEY (supplier_route_id);
 P   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT supplier_routes_pkey;
       supplier            postgres    false    250            F           2606    28258    suppliers suppliers_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);
 D   ALTER TABLE ONLY supplier.suppliers DROP CONSTRAINT suppliers_pkey;
       supplier            postgres    false    252            �           1259    28259    auth_group_name_a6ea08ec_like    INDEX     j   CREATE INDEX auth_group_name_a6ea08ec_like ON supplier.auth_group USING btree (name varchar_pattern_ops);
 3   DROP INDEX supplier.auth_group_name_a6ea08ec_like;
       supplier            postgres    false    211            �           1259    28260 (   auth_group_permissions_group_id_b120cbf9    INDEX     q   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON supplier.auth_group_permissions USING btree (group_id);
 >   DROP INDEX supplier.auth_group_permissions_group_id_b120cbf9;
       supplier            postgres    false    213            �           1259    28261 -   auth_group_permissions_permission_id_84c5c92e    INDEX     {   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON supplier.auth_group_permissions USING btree (permission_id);
 C   DROP INDEX supplier.auth_group_permissions_permission_id_84c5c92e;
       supplier            postgres    false    213                       1259    28262 (   auth_permission_content_type_id_2f476e4b    INDEX     q   CREATE INDEX auth_permission_content_type_id_2f476e4b ON supplier.auth_permission USING btree (content_type_id);
 >   DROP INDEX supplier.auth_permission_content_type_id_2f476e4b;
       supplier            postgres    false    215                       1259    28263 "   auth_user_groups_group_id_97559544    INDEX     e   CREATE INDEX auth_user_groups_group_id_97559544 ON supplier.auth_user_groups USING btree (group_id);
 8   DROP INDEX supplier.auth_user_groups_group_id_97559544;
       supplier            postgres    false    218                       1259    28264 !   auth_user_groups_user_id_6a12ed8b    INDEX     c   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON supplier.auth_user_groups USING btree (user_id);
 7   DROP INDEX supplier.auth_user_groups_user_id_6a12ed8b;
       supplier            postgres    false    218                       1259    28265 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON supplier.auth_user_user_permissions USING btree (permission_id);
 G   DROP INDEX supplier.auth_user_user_permissions_permission_id_1fbb5f2c;
       supplier            postgres    false    221                       1259    28266 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     w   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON supplier.auth_user_user_permissions USING btree (user_id);
 A   DROP INDEX supplier.auth_user_user_permissions_user_id_a95ead1b;
       supplier            postgres    false    221                       1259    28267     auth_user_username_6821ab7c_like    INDEX     p   CREATE INDEX auth_user_username_6821ab7c_like ON supplier.auth_user USING btree (username varchar_pattern_ops);
 6   DROP INDEX supplier.auth_user_username_6821ab7c_like;
       supplier            postgres    false    217            '           1259    28268 )   django_admin_log_content_type_id_c4bce8eb    INDEX     s   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON supplier.django_admin_log USING btree (content_type_id);
 ?   DROP INDEX supplier.django_admin_log_content_type_id_c4bce8eb;
       supplier            postgres    false    232            *           1259    28269 !   django_admin_log_user_id_c564eba6    INDEX     c   CREATE INDEX django_admin_log_user_id_c564eba6 ON supplier.django_admin_log USING btree (user_id);
 7   DROP INDEX supplier.django_admin_log_user_id_c564eba6;
       supplier            postgres    false    232            1           1259    28270 #   django_session_expire_date_a5c62663    INDEX     g   CREATE INDEX django_session_expire_date_a5c62663 ON supplier.django_session USING btree (expire_date);
 9   DROP INDEX supplier.django_session_expire_date_a5c62663;
       supplier            postgres    false    238            4           1259    28271 (   django_session_session_key_c0390e0f_like    INDEX     �   CREATE INDEX django_session_session_key_c0390e0f_like ON supplier.django_session USING btree (session_key varchar_pattern_ops);
 >   DROP INDEX supplier.django_session_session_key_c0390e0f_like;
       supplier            postgres    false    238            [           2606    28272    control_points action_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT action_id_fk FOREIGN KEY (action_id) REFERENCES supplier.actions(action_id);
 G   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT action_id_fk;
       supplier          postgres    false    210    230    3317            G           2606    28277 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES supplier.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       supplier          postgres    false    3333    213    215            H           2606    28282 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES supplier.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       supplier          postgres    false    213    211    3322            I           2606    28287 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES supplier.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       supplier          postgres    false    3322    218    211            J           2606    28292 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES supplier.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       supplier          postgres    false    218    217    3335            K           2606    28297 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES supplier.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       supplier          postgres    false    221    215    3333            L           2606    28302 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES supplier.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       supplier          postgres    false    3335    217    221            k           2606    28307    products barcode_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.products
    ADD CONSTRAINT barcode_fk_p FOREIGN KEY (barcode_id) REFERENCES supplier.barcodes(barcode_id);
 A   ALTER TABLE ONLY supplier.products DROP CONSTRAINT barcode_fk_p;
       supplier          postgres    false    224    3352    245            M           2606    28312    barcodes category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT category_id_fk FOREIGN KEY (catalog_id) REFERENCES supplier.catalog(catalog_id);
 C   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT category_id_fk;
       supplier          postgres    false    3354    224    225            b           2606    28317    employees chief_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT chief_id_fk FOREIGN KEY (chief_id) REFERENCES supplier.employees(employee_id);
 A   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT chief_id_fk;
       supplier          postgres    false    239    239    3382            Z           2606    28503    clients city_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT city_id_fk_c FOREIGN KEY (city_id) REFERENCES supplier.city(city_id) NOT VALID;
 @   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT city_id_fk_c;
       supplier          postgres    false    3356    226    229            `           2606    28493    delivery city_id_fk_d    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.delivery
    ADD CONSTRAINT city_id_fk_d FOREIGN KEY (city_id) REFERENCES supplier.city(city_id) NOT VALID;
 A   ALTER TABLE ONLY supplier.delivery DROP CONSTRAINT city_id_fk_d;
       supplier          postgres    false    226    231    3356            e           2606    28508    employees city_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT city_id_fk_e FOREIGN KEY (city_id) REFERENCES supplier.city(city_id) NOT VALID;
 B   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT city_id_fk_e;
       supplier          postgres    false    239    3356    226            j           2606    28488    premises city_id_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT city_id_fk_p FOREIGN KEY (city_id) REFERENCES supplier.city(city_id) NOT VALID;
 A   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT city_id_fk_p;
       supplier          postgres    false    3356    226    243            v           2606    28498    suppliers city_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.suppliers
    ADD CONSTRAINT city_id_fk_s FOREIGN KEY (city_id) REFERENCES supplier.city(city_id) NOT VALID;
 B   ALTER TABLE ONLY supplier.suppliers DROP CONSTRAINT city_id_fk_s;
       supplier          postgres    false    252    226    3356            O           2606    28322    client_order client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES supplier.clients(client_id);
 B   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT client_fk;
       supplier          postgres    false    229    3362    227            T           2606    28327    client_routes delivery_ud_kf_cr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT delivery_ud_kf_cr FOREIGN KEY (delivery_id) REFERENCES supplier.delivery(delivery_id);
 K   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT delivery_ud_kf_cr;
       supplier          postgres    false    3366    228    231            q           2606    28332     supplier_routes delivey_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT delivey_id_fk_sr FOREIGN KEY (delivery_id) REFERENCES supplier.delivery(delivery_id);
 L   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT delivey_id_fk_sr;
       supplier          postgres    false    250    231    3366            a           2606    28337 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES supplier.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY supplier.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       supplier          postgres    false    232    217    3335            \           2606    28342     control_points employee_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT employee_id_cp_fk FOREIGN KEY (employee_id) REFERENCES supplier.employees(employee_id);
 L   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT employee_id_cp_fk;
       supplier          postgres    false    230    239    3382            P           2606    28347    client_order from_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT from_premise_co FOREIGN KEY (from_premise_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT from_premise_co;
       supplier          postgres    false    3388    227    243            l           2606    28352    supplier_order from_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT from_premise_so FOREIGN KEY (from_premise) REFERENCES supplier.premises(premise_id);
 J   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT from_premise_so;
       supplier          postgres    false    3388    243    248            U           2606    28357 !   client_routes next_point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT next_point_id_fk_co FOREIGN KEY (next_point_id) REFERENCES supplier.premises(premise_id);
 M   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT next_point_id_fk_co;
       supplier          postgres    false    3388    243    228            r           2606    28362 #   supplier_routes next_point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT next_point_id_fk_so FOREIGN KEY (next_point_id) REFERENCES supplier.premises(premise_id);
 O   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT next_point_id_fk_so;
       supplier          postgres    false    250    243    3388            V           2606    28367    client_routes parent_id_fk_cr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT parent_id_fk_cr FOREIGN KEY (parent_id) REFERENCES supplier.client_routes(client_route_id);
 I   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT parent_id_fk_cr;
       supplier          postgres    false    228    228    3360            s           2606    28372    supplier_routes parent_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT parent_id_fk_sr FOREIGN KEY (parent_id) REFERENCES supplier.supplier_routes(supplier_route_id);
 K   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT parent_id_fk_sr;
       supplier          postgres    false    250    250    3396            W           2606    28377    client_routes point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT point_id_fk_co FOREIGN KEY (point_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT point_id_fk_co;
       supplier          postgres    false    243    228    3388            t           2606    28382    supplier_routes point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT point_id_fk_so FOREIGN KEY (point_id) REFERENCES supplier.premises(premise_id);
 J   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT point_id_fk_so;
       supplier          postgres    false    3388    250    243            ]           2606    28387    control_points premise_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT premise_id_cp_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 K   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT premise_id_cp_fk;
       supplier          postgres    false    230    243    3388            c           2606    28392    employees premise_id_e_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT premise_id_e_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 E   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT premise_id_e_fk;
       supplier          postgres    false    239    243    3388            f           2606    28397    goodslist premise_id_g_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT premise_id_g_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 E   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT premise_id_g_fk;
       supplier          postgres    false    243    240    3388            h           2606    28402    premises premise_type_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT premise_type_fk FOREIGN KEY (premise_type_id) REFERENCES supplier.premise_type(premise_type_id);
 D   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT premise_type_fk;
       supplier          postgres    false    243    3386    242            Q           2606    28407    client_order product_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT product_fk_co FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 F   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT product_fk_co;
       supplier          postgres    false    3390    245    227            ^           2606    28412    control_points product_fk_cp    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT product_fk_cp FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 H   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT product_fk_cp;
       supplier          postgres    false    230    245    3390            g           2606    28417    goodslist product_fk_g    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT product_fk_g FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 B   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT product_fk_g;
       supplier          postgres    false    240    245    3390            m           2606    28422    supplier_order product_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT product_fk_so FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 H   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT product_fk_so;
       supplier          postgres    false    248    3390    245            X           2606    28427    clients received_point_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT received_point_id_fk FOREIGN KEY (received_point_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT received_point_id_fk;
       supplier          postgres    false    229    3388    243            Y           2606    28432    clients region_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT region_id_fk_c FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 B   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT region_id_fk_c;
       supplier          postgres    false    229    246    3392            _           2606    28478    delivery region_id_fk_d    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.delivery
    ADD CONSTRAINT region_id_fk_d FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 C   ALTER TABLE ONLY supplier.delivery DROP CONSTRAINT region_id_fk_d;
       supplier          postgres    false    3392    231    246            d           2606    28437    employees region_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT region_id_fk_e FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 D   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT region_id_fk_e;
       supplier          postgres    false    246    239    3392            i           2606    28483    premises region_id_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT region_id_fk_p FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 C   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT region_id_fk_p;
       supplier          postgres    false    3392    243    246            u           2606    28442    suppliers region_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.suppliers
    ADD CONSTRAINT region_id_fk_s FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 D   ALTER TABLE ONLY supplier.suppliers DROP CONSTRAINT region_id_fk_s;
       supplier          postgres    false    3392    246    252            R           2606    28447 %   client_order start_client_route_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT start_client_route_id_fk FOREIGN KEY (current_client_route_id) REFERENCES supplier.client_routes(client_route_id);
 Q   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT start_client_route_id_fk;
       supplier          postgres    false    3360    228    227            n           2606    28452 )   supplier_order start_supplier_route_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT start_supplier_route_id_fk FOREIGN KEY (current_supplier_route_id) REFERENCES supplier.supplier_routes(supplier_route_id);
 U   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT start_supplier_route_id_fk;
       supplier          postgres    false    3396    250    248            o           2606    28457    supplier_order supplier_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT supplier_fk FOREIGN KEY (supplier_id) REFERENCES supplier.suppliers(supplier_id);
 F   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT supplier_fk;
       supplier          postgres    false    248    252    3398            N           2606    28462    barcodes supplier_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES supplier.suppliers(supplier_id);
 C   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT supplier_id_fk;
       supplier          postgres    false    252    224    3398            S           2606    28467    client_order to_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT to_premise_co FOREIGN KEY (to_premise_id) REFERENCES supplier.premises(premise_id);
 F   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT to_premise_co;
       supplier          postgres    false    3388    227    243            p           2606    28472    supplier_order to_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT to_premise_so FOREIGN KEY (to_premise) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT to_premise_so;
       supplier          postgres    false    248    243    3388                  x������ � �            x������ � �            x������ � �         �  x��Z[n�H��N�,LJ-[�{����x��ۙEn���UŦ�3���i���j�������������t~ܾv������e�+������L�x���r~;?oU�_��l�QA�X�q�������NW��nD�����#l2��j"!W7+_o�Ϗ]�������ϓ]	"hS�$sD�)�Z��ł����V�?;���iz}|{��G�Xߝ����������՞_�]X-H��;��N~B�>هx�W3z5��R����WW��U����,0��
K��z�VH�����4O��!���S
�ɿ\�Q|WX��2B����!5��/���1�3�����i6dPD'@6a@<��������o����wS|y��z���&dEv�eC2⻂�9R��v~]>�<���U�SlWH2(�(�+*ٓP�qŬ�dD��󯏷���|�I\�ˍn�&`2�ǄM����������v������t��r,/���6 �]��j..�U��������t�
r %�
�bpɰ����jV��ȟٗ��eK��y��?aI��dZE�@�j\E�Y�z����.��N�J_nt���W�4#����a^2�'wח��y:˘�.^w�r�UX����9�*��]Fw��.�ꬸ~|�������2��{�ۍ4CZJސ�fK����a��i9q�2���f��H�ܻ���a�g�x��Xc����I��8������ǲ*ඒnvgs�1���4���p�m������D�=�Nf�ة$<�7��Sy6|�w⧲8�2G췉���&F�Q�/S��a�w�Ka�gI���*�%��l��t{��,��=._wG��KW$�ZD&K+f*�V+
��y�Ѵ�����{[|����9�i�y�ϖ縗ŧq[���v�|�L��]l�K���#�%L��٬
����hcK�қ�
l5<릣��:CcL�_v�#�!����}���u��@�+{m|g8M���y�(��"��o�	��Z�������x���C��3�Nأ�8#��	7�V�8�#�v��2����ѸQ��84�zǳ�?�̉|\�QlJ�Lld�n�jW�ͱ�/юe�͑��i�a��v}{��^���	e�o��FEa
)�j�f��,��0��*Ȩ+��?�!���_��E���qG���ۋ� ��x�\�X"�%1W9���G�E�%�iL��s�b�n��%�~p��tr����WKw�:Y�]^o�X��=�[�w�ҐK$g�+���%O�����7��[/�@��b�鄥��B�UVp<�UYc�p��ʨ�IR:�g����˚�������X�0��Z�ţ�А�$��I�� eDaE�F��� F���������d��Vz
���r� �K
V�qI�e0�A��&���&ڤ��L���|Z����$��ܟ6�~�Ψ%l�v��Rj	���ۜ:�5�⛜:���a��ԡ�'���S���`�FN=ڲ�YnN=�J!�ɩǶ:��&�ۊ c��z�U@F��zt2�����ԣ_ k#��� �9��@ss�ѫ��s�ϩ�7���ԇ�����r�[fx#}�S��Wđa`UFX�C��e��=�Z]FP�C 3Z^>}�	�w�2~�j ͑��<0:���s�a��~b����(n	�GB[��?M-imOQ��$(��5O���'
*n���OJ�ptDgaE������Nײ\�YP�k9��,S{";�L�������ͱ�Lι�`feڬ��[?O���a�~�����F�����9����W��������8{ ���!Ԟ *Jl�#@�7up���z��
�X~��{��%�_�뾭z��U��o�]�"�7*|����
_ūz-}��Wi_Kި�U��J�0���W3q��W��`�nU�*m5�L��WP�L�S�++l-ŭ����V��
[�q*|U��#���Cu��#�����l�v�?�h�?T�����F�P��@
��"T�~��p�ն/��-BA�JM8�?�BW�pˏ��Ua��(_U6�((U�5� a�Z��*��7(�U�oPԫ��@��s�����?���?��������607��u�ζ��n+(Z�Aa���j�i�PV��tH(�[5-�uk��[K7ڵƶ]K7��ƶ_K݆��6l)(a��g�M���FȦ�HY#p��(��4 )�`�h�IY�B�mARV�j{�u+r�_t]���õ      	   �   x�m��n�@E��]�3��ofH\�Z�BҒ�4P@A��y���.<w}s�������	0M!(�m����j�*�<�^���6
���c�U�!�|�	X�O�佘�d���������nu���{i���+r�ˮMjI0��c�zB`�I��m�����M`���b|��ܜ1��F�'���|n����ˈ�N�Fr��ֽ�N�8��,^�cf21Q�����4��Q(1������{�Q�e�aVW�      
      x������ � �            x������ � �         =   x�3�4�4�LII�.3##S3��1gzRRz���)�XQIjq	��2F㛠�c���� �	�         3   x�3�0�[/l�8c���@"/6_�t��Ӑ˘3##H��qqq 46�         �  x�U�Ir�8E׉S��8si�+�ly
˪��7PEA� ��4���^��+�w ���#z��_�o�v�zѣv�~r�H���v0{�F��d��\a���V"�{�(|mz�yN[�)�DA���Q��\��R���n�jozLˈ^�0�yիխ�'!czѮ2����m�T%d����^��h���ۣ�$�v��7����Y�����&Z�ݢ}K^Wʉ(�{��Ъ�QL?�]��nUefݔ�\3�<�эr���"��4��k?U �~Q"*���/���� L,�����qDOj��^��Q_yA���cz�Z%�ގS��>���4��"��z�:�9n���m�E\���׵"Y{����;�Dҍ��:��m�N$1m&/I�Qս-��}��Zӛޫ�d�l��ڴ"��qr]ت���_�*-����W��kר�֭���??Њh��V��4�$Gۊ4�����;)��68*�8��V"�C:�DZ ԃ�~��Fi�/�����Tdko>!��T��(Y�7jn�"��טQ��{���p�m�ki u-B��u79-��Ȁ������1"C$
�w�_��bh�9�8�yD��v�w|��Z�(�R�H
%�kY��E��ڛ;��������z=���Kzq�����u���ҳr�wp!a���G���(p��	l5����n̑��Q�l�>oUq??��O]���?�0�EQp���\=㪭(Jz��o(�r�iU�f,�/H2�Sʈ^�SJ�1��(�iE��C��)�؊�e�<�@�V���kjD�t��[�j�PA��{�(K\yq�;k��,*��.����B�Ћ��lW[X��Z_8T��M�z��sK� M����h(�NͰ�\��p�P���A��i?>? �ؙKWJ���V�1��0L΋%��-��ՈvJ����t T� ,���(�o�n�x�j�/�P-
⫓�-H�XgZO]I�m���	�07�t��Îs�/�*�v�R���ӱf���BP��P�pVo����$� q@,��Aǭv���" �ϕ�Y�
B�����	A�P��>�H'�38�{���	��'30Y+�6�S��|4���a1��w��{�P�`�/?��a �z?L�B�\�G�AU��I�/%A���������9=7#�C�kRc����,=�z����gHSz1��f�}ȶ�C�)�Z	}o��*��[��CD -C��L���a\ݵ&L�uhd[_��}�K~�@���^m�ρ=j�Jx���hW�`c�	�i���Ihs^�8�j_
@o I �s����/bH��׃K��o�������'��0��G�����Î��O���Q�2���ِt��́��,~�|��HQ�S�y�䛩�Z�4���"H�UM���γ���m�n���hg᩷+6y���@r����ڴ~�>2�B�%�`��?R[A�����Z�!���8�            x������ � �            x������ � �         y   x�]���0���<p $5�
�v� ���T�t9�O9fCG������{����<_�̜���a@7U�B�5��	��{uD|%)fb3�E��W#�4�cQ�u���R>�x#a            x������ � �         �   x�5�1
1D��]\������<�6B�-�<���PD��;|odR�k�a��JJ�|X"b�O5��x�WC9#li�&k��!wy�*Y7��^[x�,�����<F�3r�c��y�Ɠ��:p�J���~��� �/�         I   x�3�4202�54�52P04�2��24�36��0�60�4��L�5�4䌮VJLIIMQ�R������4����� ���            x������ � �         `   x�}�A
� е��}(3��k�"ʅ&e�n]��ҫ�.e>�M�)���]� �0��9�l'�-9-^�G�1���x�U������d��/i+�           x���n�0  �g���/5�!�[-�ȼ��f	a@S*��d_�sZ������[�F�J�r?�Ο�wt�`&�j�&������UƱf�]z��sl�+��fn�=ټ�5m��ɂJ�N�	R?�4��jS��q������� 6oYB�W"�7�pyos�;oCv�����M:��F|�(�0�,/Cɘ����j�q
� YO�U��d���_�JV!��X-h�m2:�V���h�!& " �rD��#ě�B���:���[�         �   x�͔�JA��o�����f��]c��9s�&��$Il�,| �!�`��^ak]>��+�SYDȭ<�Nd/ϲ���U奻��7W�{�׸���v9�������N�l>��-pT�6'�cF�)8��G��`8��Cw"�H`k���`u-sA����!�S��t��t?й��|�tì�B�tD�b�tz;�(��]_޴([�]jRj�f�>%8�;�N*���1j�x`�yd<.          #   x�3�4�4�42�4!CN#0a�g``����� QS�      "   ^   x�U���0�)2���)(�c !� P2ý���l�O.�Dn�-�Nx���I[^;�ʃ�Km�89y�=:���j
y�i?�      #   �   x���M�@���a�v��΃��� $�H�{�)�F��4,4��O�~O���-o]�����uHu>���E}Ac���(VU�`}����f&����7&���&+�e ^���f BW�X����U�d�� �4mޣ��:���:���D|2�R      %   S   x�m���@�P�D�ŷ�D�~΄a�U�� 7�!�mˤ����頩�)A�=�Y�'����}>�����Ym��3_s�L      &     x���_N�@Ɵ�S���
Jb�6w�=A����UM�P!�ZB���
�+�$��[��]�>������|���vC%-2���/I�ΓE�������b�����z��I�g��>�}�\�2���V��X��w�Q����Rf�!`D1��S(j�'}"3�IbMJ�X�Y^���+�����m��2��v��L�=�Wj"c>�.�e�R8���h@�K��|B�/`oTd5�${�~j��8q��U2/d�!�9J�C�L3��7,��xg\T�z�`Q旱r�4� �	����*���x0pE�OL��UmĿE�)�ք��`�r_��I���"6.R�O�h�6p���2\�Z6�6P�y�)\ii�#��:u1GU笩M?�O�ȓ�߲b�Ls_��)�@�ey�!���69aN}n�Y�œ��d1�q*��l({3!�����_Q��*O�%~k�����l=�(�N�:����g�̳:�P��2Q���zN���S�u�,��0}N�C����hEk�	^����N��ˇx�l��ܘ-ẈZ�Nk�@�3����.�CRٸUv�v�i}63�2���fñ�p[� %�a��X��%�B�Y9��,h��^�ck��&�Ml���L�!�y�#2_��mY�c�=D3��۶Ц�g(Ţb;v�{(�H�J��I�6�HF�&و+r'����M�֌�f�M�s3`a\�S-��6��y��.g�S0e��-q��)��iy��i�FM����	m_�p�ڄ����2������>A�ʊ��y���\/�c�S�k��l�pZ�"2!^k��E���fq���F�YmGw���N�:��3rK_fe��.�(�r�f_:���"�r�"���J2(�5"r�����B�>���r�@qͷ���i��Xy]{X;<G�WW���-C�0;��@���\�rs_���2s]B�+~���u ��0��P��c�x�������	�bW9��l�M�����#Q���=1�ĵ
�eS����n7�Ϳ�*�p      (   a   x�}��	�0D��] AϘg��sT��B���@�7�	N�ژ���
��%My�ȃ�F#rԳ�E���p�-7��s�:�������G~�R�(� �      *   �  x�����0��UlG�MJEl�GGRp��e�����E�)���A�q��������0H/O-�V��Ԍ��­�@6Ր�Ӯ�x��7��E�պ�(��t<�
����O���iL�=���9E!|�5@M겓��X�b^���g@i�S�a��<w�NY���g���K͠��?�L�E/5ic���b����[� !Z�ݸe���~:��7n_�Gc�o�8AD��7^޺:4�Ԙ�ƫ
uF ���ƫ_Q6�)�Ȏ�����#���l���� "o8�#�~�1/5�D���	ϋ�@4���&</�f3|�S6�Y|���o�s�	��2��mz.����Z���q0�pW��R-H�6��o����%3�b�x�(9�:����|�Ԯ�1r§��KM�R�.w��+����]��
|W���{����y�u�H�      ,   �  x���Mn�@���a��of��'�ư��h�k �$�^�(��*g�o�Im�ITC� @��G��v_��pz2;�@��H]����&9���  �䜁�C�"����&3;�E��*�h�&��& �8��O��|�]w;Z-盿o���d�^�ge����cBQɄ�߇����E,��b�*̴_�}����ޮf�o''3��\K��
�B����p��T;h��U;x�C�� �Xti�����M6��;!P��)��r��?O�_����l�>Z4������Ǻp���p���8�ӌ�Cx I�C��9-��`�0��Q{��)5���� �� g8+�Y力E��fvM3��
�X�PbJl@�(�Gɀ�d�Q2����� g8;���pv����� g8'�s8'�s8'�s&�O�=����3�sr-P���C��ͤi�?���     