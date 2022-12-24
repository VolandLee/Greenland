PGDMP     0    ,                z         	   greenland    14.4    14.4 �   x           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            {           1262    28914 	   greenland    DATABASE     f   CREATE DATABASE greenland WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE greenland;
                postgres    false                        2615    28915    supplier    SCHEMA        CREATE SCHEMA supplier;
    DROP SCHEMA supplier;
                postgres    false            $           1255    28916 �   add_premise(bigint, double precision, double precision, character varying, bigint, bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE       CREATE PROCEDURE public.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint)
    LANGUAGE sql
    AS $$insert into premises
(premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number)
values
(p_type, coord_long, coord_lat, email, phone, postcode, region, city, street, h_number)$$;
   DROP PROCEDURE public.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint);
       public          postgres    false            %           1255    28917 >   add_product(bigint, bigint, numeric, numeric, bigint, boolean) 	   PROCEDURE     1  CREATE PROCEDURE public.add_product(IN b_id bigint, IN g_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean)
    LANGUAGE sql
    AS $$insert into products
(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values
(b_id, g_id, sup_p, c_p, quan, ava)$$;
 �   DROP PROCEDURE public.add_product(IN b_id bigint, IN g_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean);
       public          postgres    false            -           1255    28918 @   add_product11(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     �   CREATE FUNCTION public.add_product11(b_id bigint, g_id bigint, sup_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS bigint
    LANGUAGE sql
    RETURN 1;
 t   DROP FUNCTION public.add_product11(b_id bigint, g_id bigint, sup_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            6           1255    28919 p   create_supplier_order(bigint, numeric, bigint, bigint, numeric, bigint, bigint, bigint, bigint, numeric, bigint) 	   PROCEDURE     -  CREATE PROCEDURE public.create_supplier_order(IN s_id bigint, IN c_pr numeric, IN f_pr bigint, IN t_pr bigint, IN s_pr numeric, IN quan bigint, IN sizex bigint, IN sizey bigint, IN sizez bigint, IN wieght numeric, IN b_id bigint)
    LANGUAGE sql
    AS $$

insert into supplier_order
(supplier_id, product_id, from_premise,
to_premise, client_price, supplier_price, quantity, order_date, sizex, sizey, sizez, wieght)
values
(s_id, (select ssuka11(b_id, t_pr, s_pr, c_pr, quan, '0')), f_pr, t_pr, c_pr, s_pr, quan, now(), sizex, sizey, sizez, wieght);

$$;
 �   DROP PROCEDURE public.create_supplier_order(IN s_id bigint, IN c_pr numeric, IN f_pr bigint, IN t_pr bigint, IN s_pr numeric, IN quan bigint, IN sizex bigint, IN sizey bigint, IN sizez bigint, IN wieght numeric, IN b_id bigint);
       public          postgres    false            7           1255    28920 6   create_supplier_order1(bigint, bigint, bigint, bigint) 	   PROCEDURE     �   CREATE PROCEDURE public.create_supplier_order1(IN sup_id bigint, IN bar_id bigint, IN f_p bigint, IN t_p bigint)
    LANGUAGE sql
    AS $$show time$$;
 p   DROP PROCEDURE public.create_supplier_order1(IN sup_id bigint, IN bar_id bigint, IN f_p bigint, IN t_p bigint);
       public          postgres    false            8           1255    28921 >   new_barcode(bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE     &  CREATE PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country bigint)
    LANGUAGE sql
    AS $$insert into barcodes
(barcode_id, catalog_id, supplier_id, barcode_name, country)
values
(b_id, cat_id, sup_id, b_name, country)$$;
 �   DROP PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country bigint);
       public          postgres    false            9           1255    28922 I   new_barcode(bigint, bigint, bigint, character varying, character varying) 	   PROCEDURE     1  CREATE PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$insert into barcodes
(barcode_id, catalog_id, supplier_id, barcode_name, country)
values
(b_id, cat_id, sup_id, b_name, country)$$;
 �   DROP PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       public          postgres    false            :           1255    28923 B   new_barcode1(bigint, bigint, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE public.new_barcode1(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$insert into barcodes
(catalog_id, supplier_id, barcode_name, country)
values
(cat_id, sup_id, b_name, country)$$;
 �   DROP PROCEDURE public.new_barcode1(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       public          postgres    false            ;           1255    28924    new_supplier_order(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.new_supplier_order(IN sup_name integer)
    LANGUAGE sql
    AS $$insert into ans
(
select * from suppliers s
where s.supplier_id = sup_name)
 $$;
 ?   DROP PROCEDURE public.new_supplier_order(IN sup_name integer);
       public          postgres    false            <           1255    28925 8   ssuka(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     H  CREATE FUNCTION public.ssuka(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
      BEGIN
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0');
      END;
  $$;
 j   DROP FUNCTION public.ssuka(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            =           1255    28926 9   ssuka1(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     a  CREATE FUNCTION public.ssuka1(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
      BEGIN
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0') RETURNING product_id;
      END;
  $$;
 k   DROP FUNCTION public.ssuka1(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            >           1255    28927 :   ssuka11(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     R  CREATE FUNCTION public.ssuka11(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS integer
    LANGUAGE sql
    AS $$
    
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0') RETURNING product_id;
     
  $$;
 l   DROP FUNCTION public.ssuka11(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            ?           1255    28928 #   accept_goodslist_details_sr(bigint)    FUNCTION     �  CREATE FUNCTION supplier.accept_goodslist_details_sr(s_o_id bigint) RETURNS TABLE(current_supplier_route_id bigint, product_id bigint, quantity bigint, sizex bigint, sizey bigint, sizez bigint, weight bigint, next_point_id bigint, status bigint, delivery_id bigint)
    LANGUAGE plpgsql COST 1 ROWS 1
    AS $$
begin
return QUERY  select  so.current_supplier_route_id, so.product_id, so.quantity, so.sizex, so.sizey, so.sizez, so.weight, sr.next_point_id, sr.status, sr.delivery_id from supplier.supplier_order so, supplier.supplier_routes so
where so.supplier_order_id = s_o_id and sr.supplier_route_id= so.current_supplier_route_id; 
end;

$$;
 C   DROP FUNCTION supplier.accept_goodslist_details_sr(s_o_id bigint);
       supplier          postgres    false    4            #           1255    28929 ,   accept_update_supplier_routes_status(bigint) 	   PROCEDURE     �   CREATE PROCEDURE supplier.accept_update_supplier_routes_status(IN s_r_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_routes set status =3 where supplier_route_id = s_r_id
$$;
 P   DROP PROCEDURE supplier.accept_update_supplier_routes_status(IN s_r_id bigint);
       supplier          postgres    false    4            &           1255    28930 A   add_barcode(bigint, bigint, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE supplier.add_barcode(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$
insert into supplier.barcodes
(catalog_id, supplier_id, barcode_name, country)
values
(cat_id, sup_id, b_name, country)
$$;
 �   DROP PROCEDURE supplier.add_barcode(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       supplier          postgres    false    4            '           1255    28931 E   add_goodslist(bigint, bigint, bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE     ;  CREATE PROCEDURE supplier.add_goodslist(IN pr_id bigint, IN p_id bigint, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w bigint)
    LANGUAGE sql
    AS $$

insert into supplier.goodslist
(product_id, premise_id, quantity, sizex, sizey, sizez, weight)
values
(pr_id, p_id, quan, sx, sy, sz, w);

$$;
 �   DROP PROCEDURE supplier.add_goodslist(IN pr_id bigint, IN p_id bigint, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w bigint);
       supplier          postgres    false    4            (           1255    28932 �   add_premise(bigint, double precision, double precision, character varying, bigint, bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE       CREATE PROCEDURE supplier.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint)
    LANGUAGE sql
    AS $$
insert into supplier.premises
(premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number)
values
(p_type, coord_long, coord_lat, email, phone, postcode, region, city, street, h_number)
$$;
 
  DROP PROCEDURE supplier.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint);
       supplier          postgres    false    4            )           1255    28933 6   add_product(bigint, numeric, numeric, bigint, boolean) 	   PROCEDURE       CREATE PROCEDURE supplier.add_product(IN b_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean)
    LANGUAGE sql
    AS $$
insert into supplier.products
(barcode_id, supplier_price, client_price, quantity, available)
values
(b_id, sup_p, c_p, quan, ava)
$$;
 w   DROP PROCEDURE supplier.add_product(IN b_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean);
       supplier          postgres    false    4            @           1255    28934 C   add_supplier_routes(bigint, bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE       CREATE PROCEDURE supplier.add_supplier_routes(IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint, IN par_id bigint DEFAULT NULL::bigint, IN st bigint DEFAULT 0)
    LANGUAGE sql
    AS $$

insert into supplier.supplier_routes
(parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, status)
values
(par_id, d_id, g_id, p_id, n_p_id, now(), st);

$$;
 �   DROP PROCEDURE supplier.add_supplier_routes(IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint, IN par_id bigint, IN st bigint);
       supplier          postgres    false    4            A           1255    28935 o   create_supplier_order(bigint, bigint, bigint, bigint, bigint, numeric, bigint, bigint, bigint, bigint, numeric) 	   PROCEDURE       CREATE PROCEDURE supplier.create_supplier_order(IN s_id bigint, IN p_id bigint, IN f_pr bigint, IN t_pr bigint, IN st_s_r_id bigint, IN s_pr numeric, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w numeric)
    LANGUAGE sql
    AS $$

insert into supplier.supplier_order
(supplier_id, product_id, from_premise,
to_premise, start_supplier_route_id, supplier_price, quantity, order_date, sizex, sizey, sizez, wieght)
values
(s_id, p_id, f_pr, t_pr, st_s_r_id, s_pr, quan, now(), sx, sy, sz, w);

$$;
 �   DROP PROCEDURE supplier.create_supplier_order(IN s_id bigint, IN p_id bigint, IN f_pr bigint, IN t_pr bigint, IN st_s_r_id bigint, IN s_pr numeric, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w numeric);
       supplier          postgres    false    4            B           1255    28936 >   create_supplier_routes(bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE     <  CREATE PROCEDURE supplier.create_supplier_routes(IN pr_id bigint, IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint)
    LANGUAGE sql
    AS $$
insert into supplier.supplier_routes
(parent_id, delivery_id, goodslist_id, point_id, next_point_id, status)
values
(pr_id, d_id, g_id, p_id, n_p_id, 0)
$$;
 �   DROP PROCEDURE supplier.create_supplier_routes(IN pr_id bigint, IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint);
       supplier          postgres    false    4            C           1255    28937 !   send_goodslist_details_sr(bigint)    FUNCTION     �  CREATE FUNCTION supplier.send_goodslist_details_sr(s_o_id bigint) RETURNS TABLE(current_supplier_route_id bigint, product_id bigint, quantity bigint, sizex bigint, sizey bigint, sizez bigint, weight bigint, next_point_id bigint, status bigint, delivery_id bigint, goodslist_id bigint)
    LANGUAGE plpgsql COST 1 ROWS 1
    AS $$
begin
return QUERY  select  so.current_supplier_route_id, so.product_id, so.quantity, so.sizex, so.sizey, so.sizez, so.weight, sr.next_point_id, sr.status, sr.delivery_id, sr.goodslist_id from supplier.supplier_order so, 
supplier.supplier_routes so
where so.supplier_order_id = s_o_id and sr.supplier_route_id= so.current_supplier_route_id; 
end;

$$;
 A   DROP FUNCTION supplier.send_goodslist_details_sr(s_o_id bigint);
       supplier          postgres    false    4            D           1255    28938 *   send_update_supplier_routes_status(bigint) 	   PROCEDURE     �   CREATE PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_routes set status = 2 where supplier_route_id = s_r_id
$$;
 N   DROP PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint);
       supplier          postgres    false    4            E           1255    28939 2   send_update_supplier_routes_status(bigint, bigint) 	   PROCEDURE     9  CREATE PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint, IN s_o_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_order set current_supplier_route_id = s_r_id where supplier_order_id = s_o_id ;
update supplier.supplier_routes set status =2 where supplier_route_id = s_r_id;
$$;
 `   DROP PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint, IN s_o_id bigint);
       supplier          postgres    false    4            �            1259    28940    actions    TABLE     p   CREATE TABLE public.actions (
    action_id integer NOT NULL,
    action_name character varying(45) NOT NULL
);
    DROP TABLE public.actions;
       public         heap    postgres    false            �            1259    28943    ans    TABLE       CREATE TABLE public.ans (
    supplier_id integer NOT NULL,
    supplier_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone bigint NOT NULL,
    postcode integer NOT NULL,
    region_id integer NOT NULL,
    city_id integer NOT NULL,
    street character varying(45) NOT NULL,
    h_number integer NOT NULL,
    website character varying(45)
);
    DROP TABLE public.ans;
       public         heap    postgres    false            �            1259    28946 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    28949    auth_group_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    28950    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    28953    auth_group_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    28954    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    28957    auth_permission_id_seq    SEQUENCE     �   ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    28958 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    28963    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    28966    auth_user_groups_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    28967    auth_user_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    28968    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    28971 !   auth_user_user_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    28972    barcodes    TABLE     �   CREATE TABLE public.barcodes (
    barcode_id bigint NOT NULL,
    catalog_id integer NOT NULL,
    supplier_id integer NOT NULL,
    barcode_name character varying(45) NOT NULL,
    country character varying(45) NOT NULL
);
    DROP TABLE public.barcodes;
       public         heap    postgres    false            �            1259    28975    barcodes_sequence    SEQUENCE     {   CREATE SEQUENCE public.barcodes_sequence
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.barcodes_sequence;
       public          postgres    false            �            1259    28976    catalog    TABLE     �   CREATE TABLE public.catalog (
    catalog_id integer NOT NULL,
    catalog_name character varying(45) NOT NULL,
    parent_id integer
);
    DROP TABLE public.catalog;
       public         heap    postgres    false            �            1259    28979    city    TABLE     �   CREATE TABLE public.city (
    city_id integer NOT NULL,
    city_name character varying(45) DEFAULT NULL::character varying
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    28983    client_order    TABLE     �  CREATE TABLE public.client_order (
    client_order_id integer NOT NULL,
    client_id integer NOT NULL,
    product_id integer NOT NULL,
    from_premise_id integer NOT NULL,
    to_premise_id integer NOT NULL,
    client_price numeric(10,2) NOT NULL,
    order_date timestamp without time zone NOT NULL,
    delivery_date timestamp without time zone,
    received_date timestamp without time zone,
    sizex integer,
    sizey integer,
    sizez integer,
    weight numeric(8,3) DEFAULT NULL::numeric
);
     DROP TABLE public.client_order;
       public         heap    postgres    false            �            1259    28987    client_routes    TABLE     A  CREATE TABLE public.client_routes (
    client_route_id integer NOT NULL,
    delivery_id integer,
    client_order_id integer NOT NULL,
    point_id integer NOT NULL,
    next_point_id integer NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status integer NOT NULL
);
 !   DROP TABLE public.client_routes;
       public         heap    postgres    false            �            1259    28990    clients    TABLE     `  CREATE TABLE public.clients (
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
    DROP TABLE public.clients;
       public         heap    postgres    false            �            1259    28998    control_points    TABLE       CREATE TABLE public.control_points (
    control_points_id integer NOT NULL,
    employee_id integer NOT NULL,
    product_id integer NOT NULL,
    action_id integer NOT NULL,
    premise_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);
 "   DROP TABLE public.control_points;
       public         heap    postgres    false            �            1259    29001    delivery    TABLE     i  CREATE TABLE public.delivery (
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
    DROP TABLE public.delivery;
       public         heap    postgres    false            �            1259    29007    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    29013    django_admin_log_id_seq    SEQUENCE     �   ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    29014    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    29017    django_content_type_id_seq    SEQUENCE     �   ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    29018    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    29023    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    29024    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    29029 	   employees    TABLE     6  CREATE TABLE public.employees (
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
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    29034    goodslist11    TABLE       CREATE TABLE public.goodslist11 (
    goodslist_id integer NOT NULL,
    product_id bigint NOT NULL,
    premise_id integer NOT NULL,
    quantity integer NOT NULL,
    sizex integer NOT NULL,
    sizey integer NOT NULL,
    sizez integer NOT NULL,
    weight numeric(8,3) NOT NULL
);
    DROP TABLE public.goodslist11;
       public         heap    postgres    false            �            1259    29037    premise_type    TABLE     {   CREATE TABLE public.premise_type (
    premise_type_id integer NOT NULL,
    type_decryp character varying(45) NOT NULL
);
     DROP TABLE public.premise_type;
       public         heap    postgres    false            �            1259    29040    premises_sequence    SEQUENCE     {   CREATE SEQUENCE public.premises_sequence
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.premises_sequence;
       public          postgres    false            �            1259    29041    premises    TABLE     �  CREATE TABLE public.premises (
    premise_id integer DEFAULT nextval('public.premises_sequence'::regclass) NOT NULL,
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
    DROP TABLE public.premises;
       public         heap    postgres    false    243            �            1259    29047    product_sequence    SEQUENCE     z   CREATE SEQUENCE public.product_sequence
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.product_sequence;
       public          postgres    false            �            1259    29048    products    TABLE     L  CREATE TABLE public.products (
    product_id integer DEFAULT nextval('public.product_sequence'::regclass) NOT NULL,
    barcode_id bigint NOT NULL,
    goodslist_id bigint NOT NULL,
    supplier_price numeric(10,2) NOT NULL,
    client_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    available boolean NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false    245            �            1259    29052    region    TABLE     �   CREATE TABLE public.region (
    region_id integer NOT NULL,
    region_name character varying(90) DEFAULT NULL::character varying
);
    DROP TABLE public.region;
       public         heap    postgres    false            �            1259    29056    supplier_order_sequence    SEQUENCE     �   CREATE SEQUENCE public.supplier_order_sequence
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.supplier_order_sequence;
       public          postgres    false            �            1259    29057    supplier_order    TABLE     _  CREATE TABLE public.supplier_order (
    supplier_order_id integer DEFAULT nextval('public.supplier_order_sequence'::regclass) NOT NULL,
    supplier_id integer NOT NULL,
    product_id integer NOT NULL,
    from_premise integer NOT NULL,
    to_premise integer NOT NULL,
    client_price numeric(10,2) NOT NULL,
    supplier_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    order_date timestamp without time zone NOT NULL,
    delivery_date timestamp without time zone,
    sizex integer NOT NULL,
    sizey integer NOT NULL,
    sizez integer NOT NULL,
    wieght numeric(8,3) NOT NULL
);
 "   DROP TABLE public.supplier_order;
       public         heap    postgres    false    248            �            1259    29061    supplier_routes    TABLE     O  CREATE TABLE public.supplier_routes (
    supplier_route_id integer NOT NULL,
    delivey_id integer NOT NULL,
    supplier_order_id integer NOT NULL,
    point_id integer,
    next_point_id integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    status integer NOT NULL
);
 #   DROP TABLE public.supplier_routes;
       public         heap    postgres    false            �            1259    29064    supplier_routes_seq    SEQUENCE     |   CREATE SEQUENCE public.supplier_routes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.supplier_routes_seq;
       public          postgres    false            �            1259    29065 	   suppliers    TABLE     l  CREATE TABLE public.suppliers (
    supplier_id integer NOT NULL,
    supplier_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone bigint NOT NULL,
    postcode integer NOT NULL,
    region_id integer NOT NULL,
    city_id integer NOT NULL,
    street character varying(45) NOT NULL,
    h_number integer NOT NULL,
    website character varying(45) DEFAULT NULL::character varying,
    CONSTRAINT suppliers_chk_1 CHECK (((phone >= '70000000000'::bigint) AND (phone < '80000000000'::bigint))),
    CONSTRAINT suppliers_chk_2 CHECK (((postcode >= 100000) AND (postcode < 1000000)))
);
    DROP TABLE public.suppliers;
       public         heap    postgres    false            �            1259    29074    actions    TABLE     r   CREATE TABLE supplier.actions (
    action_id integer NOT NULL,
    action_name character varying(45) NOT NULL
);
    DROP TABLE supplier.actions;
       supplier         heap    postgres    false    4            �            1259    29077 
   auth_group    TABLE     h   CREATE TABLE supplier.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
     DROP TABLE supplier.auth_group;
       supplier         heap    postgres    false    4            �            1259    29080    auth_group_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    254                        1259    29081    auth_group_permissions    TABLE     �   CREATE TABLE supplier.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 ,   DROP TABLE supplier.auth_group_permissions;
       supplier         heap    postgres    false    4                       1259    29084    auth_group_permissions_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    256    4                       1259    29085    auth_permission    TABLE     �   CREATE TABLE supplier.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 %   DROP TABLE supplier.auth_permission;
       supplier         heap    postgres    false    4                       1259    29088    auth_permission_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    258    4                       1259    29089 	   auth_user    TABLE     �  CREATE TABLE supplier.auth_user (
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
       supplier         heap    postgres    false    4                       1259    29094    auth_user_groups    TABLE     �   CREATE TABLE supplier.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 &   DROP TABLE supplier.auth_user_groups;
       supplier         heap    postgres    false    4                       1259    29097    auth_user_groups_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    261                       1259    29098    auth_user_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    260                       1259    29099    auth_user_user_permissions    TABLE     �   CREATE TABLE supplier.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 0   DROP TABLE supplier.auth_user_user_permissions;
       supplier         heap    postgres    false    4            	           1259    29102 !   auth_user_user_permissions_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    264            
           1259    29103    barcodes    TABLE     �   CREATE TABLE supplier.barcodes (
    barcode_id bigint NOT NULL,
    catalog_id integer NOT NULL,
    supplier_id integer NOT NULL,
    barcode_name character varying(45) NOT NULL,
    country character varying(45) NOT NULL
);
    DROP TABLE supplier.barcodes;
       supplier         heap    postgres    false    4                       1259    29106    catalog    TABLE     �   CREATE TABLE supplier.catalog (
    catalog_id integer NOT NULL,
    catalog_name character varying(45) NOT NULL,
    parent_id integer
);
    DROP TABLE supplier.catalog;
       supplier         heap    postgres    false    4                       1259    29109    city    TABLE     �   CREATE TABLE supplier.city (
    city_id integer NOT NULL,
    city_name character varying(45) DEFAULT NULL::character varying
);
    DROP TABLE supplier.city;
       supplier         heap    postgres    false    4                       1259    29113    client_order    TABLE     !  CREATE TABLE supplier.client_order (
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
       supplier         heap    postgres    false    4                       1259    29117    client_routes    TABLE     N  CREATE TABLE supplier.client_routes (
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
       supplier         heap    postgres    false    4                       1259    29120    clients    TABLE     b  CREATE TABLE supplier.clients (
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
       supplier         heap    postgres    false    4                       1259    29128    control_points    TABLE       CREATE TABLE supplier.control_points (
    control_points_id integer NOT NULL,
    employee_id integer NOT NULL,
    product_id integer NOT NULL,
    action_id integer NOT NULL,
    premise_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);
 $   DROP TABLE supplier.control_points;
       supplier         heap    postgres    false    4                       1259    29131    delivery    TABLE     k  CREATE TABLE supplier.delivery (
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
       supplier         heap    postgres    false    4                       1259    29137    django_admin_log    TABLE     �  CREATE TABLE supplier.django_admin_log (
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
       supplier         heap    postgres    false    4                       1259    29143    django_admin_log_id_seq    SEQUENCE     �   ALTER TABLE supplier.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    274                       1259    29144    django_content_type    TABLE     �   CREATE TABLE supplier.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 )   DROP TABLE supplier.django_content_type;
       supplier         heap    postgres    false    4                       1259    29147    django_content_type_id_seq    SEQUENCE     �   ALTER TABLE supplier.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    276    4                       1259    29148    django_migrations    TABLE     �   CREATE TABLE supplier.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 '   DROP TABLE supplier.django_migrations;
       supplier         heap    postgres    false    4                       1259    29153    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE supplier.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    4    278                       1259    29154    django_session    TABLE     �   CREATE TABLE supplier.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 $   DROP TABLE supplier.django_session;
       supplier         heap    postgres    false    4                       1259    29159 	   employees    TABLE     8  CREATE TABLE supplier.employees (
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
       supplier         heap    postgres    false    4                       1259    29164 	   goodslist    TABLE       CREATE TABLE supplier.goodslist (
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
       supplier         heap    postgres    false    4                       1259    29167    goodslist_seq    SEQUENCE     z   CREATE SEQUENCE supplier.goodslist_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE supplier.goodslist_seq;
       supplier          postgres    false    4                       1259    29168    premise_type    TABLE     }   CREATE TABLE supplier.premise_type (
    premise_type_id integer NOT NULL,
    type_decryp character varying(45) NOT NULL
);
 "   DROP TABLE supplier.premise_type;
       supplier         heap    postgres    false    4                       1259    29171    premises    TABLE     n  CREATE TABLE supplier.premises (
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
       supplier         heap    postgres    false    4                       1259    29176    products    TABLE     �   CREATE TABLE supplier.products (
    product_id integer NOT NULL,
    barcode_id bigint NOT NULL,
    supplier_price numeric(10,2) NOT NULL,
    client_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    available boolean NOT NULL
);
    DROP TABLE supplier.products;
       supplier         heap    postgres    false    4                       1259    29179    region    TABLE     �   CREATE TABLE supplier.region (
    region_id integer NOT NULL,
    region_name character varying(90) DEFAULT NULL::character varying
);
    DROP TABLE supplier.region;
       supplier         heap    postgres    false    4                        1259    29183    supplier_order    TABLE     #  CREATE TABLE supplier.supplier_order (
    supplier_order_id integer NOT NULL,
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
       supplier         heap    postgres    false    4            !           1259    29186    supplier_routes    TABLE     �  CREATE TABLE supplier.supplier_routes (
    supplier_route_id integer DEFAULT nextval('public.supplier_routes_seq'::regclass) NOT NULL,
    parent_id integer,
    delivery_id integer NOT NULL,
    goodslist_id integer,
    point_id integer,
    next_point_id integer NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status integer NOT NULL
);
 %   DROP TABLE supplier.supplier_routes;
       supplier         heap    postgres    false    251    4            "           1259    29190 	   suppliers    TABLE     n  CREATE TABLE supplier.suppliers (
    supplier_id integer NOT NULL,
    supplier_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone bigint NOT NULL,
    postcode integer NOT NULL,
    region_id integer NOT NULL,
    city_id integer NOT NULL,
    street character varying(45) NOT NULL,
    h_number integer NOT NULL,
    website character varying(45) DEFAULT NULL::character varying,
    CONSTRAINT suppliers_chk_1 CHECK (((phone >= '70000000000'::bigint) AND (phone < '80000000000'::bigint))),
    CONSTRAINT suppliers_chk_2 CHECK (((postcode >= 100000) AND (postcode < 1000000)))
);
    DROP TABLE supplier.suppliers;
       supplier         heap    postgres    false    4            %          0    28940    actions 
   TABLE DATA           9   COPY public.actions (action_id, action_name) FROM stdin;
    public          postgres    false    210   �H      &          0    28943    ans 
   TABLE DATA           �   COPY public.ans (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    211   �H      '          0    28946 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    212   I      )          0    28950    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    214   *I      +          0    28954    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    216   GI      -          0    28958 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    218   �N      .          0    28963    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    219   �O      1          0    28968    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    222   �O      3          0    28972    barcodes 
   TABLE DATA           ^   COPY public.barcodes (barcode_id, catalog_id, supplier_id, barcode_name, country) FROM stdin;
    public          postgres    false    224   �O      5          0    28976    catalog 
   TABLE DATA           F   COPY public.catalog (catalog_id, catalog_name, parent_id) FROM stdin;
    public          postgres    false    226   VP      6          0    28979    city 
   TABLE DATA           2   COPY public.city (city_id, city_name) FROM stdin;
    public          postgres    false    227   +Q      7          0    28983    client_order 
   TABLE DATA           �   COPY public.client_order (client_order_id, client_id, product_id, from_premise_id, to_premise_id, client_price, order_date, delivery_date, received_date, sizex, sizey, sizez, weight) FROM stdin;
    public          postgres    false    228   W      8          0    28987    client_routes 
   TABLE DATA           �   COPY public.client_routes (client_route_id, delivery_id, client_order_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    public          postgres    false    229   /W      9          0    28990    clients 
   TABLE DATA           �   COPY public.clients (client_id, received_point_id, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, balance, liked) FROM stdin;
    public          postgres    false    230   LW      :          0    28998    control_points 
   TABLE DATA           s   COPY public.control_points (control_points_id, employee_id, product_id, action_id, premise_id, "time") FROM stdin;
    public          postgres    false    231   �W      ;          0    29001    delivery 
   TABLE DATA           �   COPY public.delivery (delivery_id, delivery_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    232   �W      <          0    29007    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    233   yX      >          0    29014    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    235   �X      @          0    29018    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    237   �Y      B          0    29024    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    239   �\      C          0    29029 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, premise_id, fname, lname, patronymic, email, password, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, hire_date, chief_id) FROM stdin;
    public          postgres    false    240   _      D          0    29034    goodslist11 
   TABLE DATA           r   COPY public.goodslist11 (goodslist_id, product_id, premise_id, quantity, sizex, sizey, sizez, weight) FROM stdin;
    public          postgres    false    241   `      E          0    29037    premise_type 
   TABLE DATA           D   COPY public.premise_type (premise_type_id, type_decryp) FROM stdin;
    public          postgres    false    242   D`      G          0    29041    premises 
   TABLE DATA           �   COPY public.premises (premise_id, premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number) FROM stdin;
    public          postgres    false    244   �`      I          0    29048    products 
   TABLE DATA           {   COPY public.products (product_id, barcode_id, goodslist_id, supplier_price, client_price, quantity, available) FROM stdin;
    public          postgres    false    246   �a      J          0    29052    region 
   TABLE DATA           8   COPY public.region (region_id, region_name) FROM stdin;
    public          postgres    false    247   b      L          0    29057    supplier_order 
   TABLE DATA           �   COPY public.supplier_order (supplier_order_id, supplier_id, product_id, from_premise, to_premise, client_price, supplier_price, quantity, order_date, delivery_date, sizex, sizey, sizez, wieght) FROM stdin;
    public          postgres    false    249   Df      M          0    29061    supplier_routes 
   TABLE DATA           �   COPY public.supplier_routes (supplier_route_id, delivey_id, supplier_order_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    public          postgres    false    250   af      O          0    29065 	   suppliers 
   TABLE DATA           �   COPY public.suppliers (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    252   ~f      P          0    29074    actions 
   TABLE DATA           ;   COPY supplier.actions (action_id, action_name) FROM stdin;
    supplier          postgres    false    253   0g      Q          0    29077 
   auth_group 
   TABLE DATA           0   COPY supplier.auth_group (id, name) FROM stdin;
    supplier          postgres    false    254   Mg      S          0    29081    auth_group_permissions 
   TABLE DATA           O   COPY supplier.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    supplier          postgres    false    256   jg      U          0    29085    auth_permission 
   TABLE DATA           P   COPY supplier.auth_permission (id, name, content_type_id, codename) FROM stdin;
    supplier          postgres    false    258   �g      W          0    29089 	   auth_user 
   TABLE DATA           �   COPY supplier.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    supplier          postgres    false    260   �l      X          0    29094    auth_user_groups 
   TABLE DATA           C   COPY supplier.auth_user_groups (id, user_id, group_id) FROM stdin;
    supplier          postgres    false    261   �m      [          0    29099    auth_user_user_permissions 
   TABLE DATA           R   COPY supplier.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    supplier          postgres    false    264   n      ]          0    29103    barcodes 
   TABLE DATA           `   COPY supplier.barcodes (barcode_id, catalog_id, supplier_id, barcode_name, country) FROM stdin;
    supplier          postgres    false    266   %n      ^          0    29106    catalog 
   TABLE DATA           H   COPY supplier.catalog (catalog_id, catalog_name, parent_id) FROM stdin;
    supplier          postgres    false    267   'o      _          0    29109    city 
   TABLE DATA           4   COPY supplier.city (city_id, city_name) FROM stdin;
    supplier          postgres    false    268   !p      `          0    29113    client_order 
   TABLE DATA           �   COPY supplier.client_order (client_order_id, client_id, product_id, from_premise_id, to_premise_id, current_client_route_id, client_price, order_date, delivery_date, received_date, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    269   v      a          0    29117    client_routes 
   TABLE DATA           �   COPY supplier.client_routes (client_route_id, parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    supplier          postgres    false    270   %v      b          0    29120    clients 
   TABLE DATA           �   COPY supplier.clients (client_id, received_point_id, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, balance, liked) FROM stdin;
    supplier          postgres    false    271   Bv      c          0    29128    control_points 
   TABLE DATA           u   COPY supplier.control_points (control_points_id, employee_id, product_id, action_id, premise_id, "time") FROM stdin;
    supplier          postgres    false    272   �v      d          0    29131    delivery 
   TABLE DATA           �   COPY supplier.delivery (delivery_id, delivery_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    supplier          postgres    false    273   �v      e          0    29137    django_admin_log 
   TABLE DATA           �   COPY supplier.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    supplier          postgres    false    274   �w      g          0    29144    django_content_type 
   TABLE DATA           E   COPY supplier.django_content_type (id, app_label, model) FROM stdin;
    supplier          postgres    false    276   �w      i          0    29148    django_migrations 
   TABLE DATA           E   COPY supplier.django_migrations (id, app, name, applied) FROM stdin;
    supplier          postgres    false    278   y      k          0    29154    django_session 
   TABLE DATA           R   COPY supplier.django_session (session_key, session_data, expire_date) FROM stdin;
    supplier          postgres    false    280   �z      l          0    29159 	   employees 
   TABLE DATA           �   COPY supplier.employees (employee_id, premise_id, fname, lname, patronymic, email, password, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, hire_date, chief_id) FROM stdin;
    supplier          postgres    false    281   }      m          0    29164 	   goodslist 
   TABLE DATA           r   COPY supplier.goodslist (goodslist_id, product_id, premise_id, quantity, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    282   ~      o          0    29168    premise_type 
   TABLE DATA           F   COPY supplier.premise_type (premise_type_id, type_decryp) FROM stdin;
    supplier          postgres    false    284   T~      p          0    29171    premises 
   TABLE DATA           �   COPY supplier.premises (premise_id, premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number) FROM stdin;
    supplier          postgres    false    285   �~      q          0    29176    products 
   TABLE DATA           o   COPY supplier.products (product_id, barcode_id, supplier_price, client_price, quantity, available) FROM stdin;
    supplier          postgres    false    286   p      r          0    29179    region 
   TABLE DATA           :   COPY supplier.region (region_id, region_name) FROM stdin;
    supplier          postgres    false    287   �      s          0    29183    supplier_order 
   TABLE DATA           �   COPY supplier.supplier_order (supplier_order_id, supplier_id, product_id, from_premise, to_premise, current_supplier_route_id, supplier_price, quantity, order_date, delivery_date, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    288   F�      t          0    29186    supplier_routes 
   TABLE DATA           �   COPY supplier.supplier_routes (supplier_route_id, parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    supplier          postgres    false    289   c�      u          0    29190 	   suppliers 
   TABLE DATA           �   COPY supplier.suppliers (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    supplier          postgres    false    290   Ą      |           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    213            }           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    215            ~           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 148, true);
          public          postgres    false    217                       0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    220            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          postgres    false    221            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    223            �           0    0    barcodes_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.barcodes_sequence', 20, true);
          public          postgres    false    225            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    234            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 37, true);
          public          postgres    false    236            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 33, true);
          public          postgres    false    238            �           0    0    premises_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.premises_sequence', 17, true);
          public          postgres    false    243            �           0    0    product_sequence    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.product_sequence', 34, true);
          public          postgres    false    245            �           0    0    supplier_order_sequence    SEQUENCE SET     F   SELECT pg_catalog.setval('public.supplier_order_sequence', 23, true);
          public          postgres    false    248            �           0    0    supplier_routes_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.supplier_routes_seq', 6, true);
          public          postgres    false    251            �           0    0    auth_group_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('supplier.auth_group_id_seq', 1, false);
          supplier          postgres    false    255            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('supplier.auth_group_permissions_id_seq', 1, false);
          supplier          postgres    false    257            �           0    0    auth_permission_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('supplier.auth_permission_id_seq', 140, true);
          supplier          postgres    false    259            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('supplier.auth_user_groups_id_seq', 1, false);
          supplier          postgres    false    262            �           0    0    auth_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('supplier.auth_user_id_seq', 2, true);
          supplier          postgres    false    263            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('supplier.auth_user_user_permissions_id_seq', 1, false);
          supplier          postgres    false    265            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('supplier.django_admin_log_id_seq', 1, true);
          supplier          postgres    false    275            �           0    0    django_content_type_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('supplier.django_content_type_id_seq', 35, true);
          supplier          postgres    false    277            �           0    0    django_migrations_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('supplier.django_migrations_id_seq', 35, true);
          supplier          postgres    false    279            �           0    0    goodslist_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('supplier.goodslist_seq', 100, false);
          supplier          postgres    false    283            �           2606    29197    actions actions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);
 >   ALTER TABLE ONLY public.actions DROP CONSTRAINT actions_pkey;
       public            postgres    false    210            �           2606    29199    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    212            �           2606    29201 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    214    214            �           2606    29203 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    214            �           2606    29205    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    212            �           2606    29207 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    216    216            �           2606    29209 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    216            �           2606    29211 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    219            �           2606    29213 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    219    219            �           2606    29215    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    218            �           2606    29217 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    222            �           2606    29219 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    222    222            �           2606    29221     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    218            �           2606    29223    barcodes barcodes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.barcodes
    ADD CONSTRAINT barcodes_pkey PRIMARY KEY (barcode_id);
 @   ALTER TABLE ONLY public.barcodes DROP CONSTRAINT barcodes_pkey;
       public            postgres    false    224            �           2606    29225    catalog catalog_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.catalog
    ADD CONSTRAINT catalog_pkey PRIMARY KEY (catalog_id);
 >   ALTER TABLE ONLY public.catalog DROP CONSTRAINT catalog_pkey;
       public            postgres    false    226            �           2606    29227    city city_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    227            �           2606    29229    client_order client_order_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT client_order_pkey PRIMARY KEY (client_order_id);
 H   ALTER TABLE ONLY public.client_order DROP CONSTRAINT client_order_pkey;
       public            postgres    false    228            �           2606    29231     client_routes client_routes_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT client_routes_pkey PRIMARY KEY (client_route_id);
 J   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT client_routes_pkey;
       public            postgres    false    229            �           2606    29233    clients clients_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    230            �           2606    29235 "   control_points control_points_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT control_points_pkey PRIMARY KEY (control_points_id);
 L   ALTER TABLE ONLY public.control_points DROP CONSTRAINT control_points_pkey;
       public            postgres    false    231            �           2606    29237    delivery delivery_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (delivery_id);
 @   ALTER TABLE ONLY public.delivery DROP CONSTRAINT delivery_pkey;
       public            postgres    false    232            �           2606    29239 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    233            �           2606    29241 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    235    235            �           2606    29243 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    235            �           2606    29245 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    237            �           2606    29247 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    239            �           2606    29249    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    240            �           2606    29251    goodslist11 goodslist11_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.goodslist11
    ADD CONSTRAINT goodslist11_pkey PRIMARY KEY (goodslist_id);
 F   ALTER TABLE ONLY public.goodslist11 DROP CONSTRAINT goodslist11_pkey;
       public            postgres    false    241            �           2606    29253    premise_type premise_type_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.premise_type
    ADD CONSTRAINT premise_type_pkey PRIMARY KEY (premise_type_id);
 H   ALTER TABLE ONLY public.premise_type DROP CONSTRAINT premise_type_pkey;
       public            postgres    false    242            �           2606    29255    premises premises_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT premises_pkey PRIMARY KEY (premise_id);
 @   ALTER TABLE ONLY public.premises DROP CONSTRAINT premises_pkey;
       public            postgres    false    244            �           2606    29257    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    246            �           2606    29259    region region_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);
 <   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pkey;
       public            postgres    false    247            �           2606    29261 "   supplier_order supplier_order_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT supplier_order_pkey PRIMARY KEY (supplier_order_id);
 L   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT supplier_order_pkey;
       public            postgres    false    249            �           2606    29263 $   supplier_routes supplier_routes_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT supplier_routes_pkey PRIMARY KEY (supplier_route_id);
 N   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT supplier_routes_pkey;
       public            postgres    false    250            �           2606    29265    suppliers suppliers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public            postgres    false    252            �           2606    29269    actions actions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);
 @   ALTER TABLE ONLY supplier.actions DROP CONSTRAINT actions_pkey;
       supplier            postgres    false    253            �           2606    29271    auth_group auth_group_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 J   ALTER TABLE ONLY supplier.auth_group DROP CONSTRAINT auth_group_name_key;
       supplier            postgres    false    254            �           2606    29273 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 ~   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       supplier            postgres    false    256    256            �           2606    29275 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       supplier            postgres    false    256            �           2606    29277    auth_group auth_group_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY supplier.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY supplier.auth_group DROP CONSTRAINT auth_group_pkey;
       supplier            postgres    false    254            �           2606    29279 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 r   ALTER TABLE ONLY supplier.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       supplier            postgres    false    258    258            �           2606    29281 $   auth_permission auth_permission_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY supplier.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY supplier.auth_permission DROP CONSTRAINT auth_permission_pkey;
       supplier            postgres    false    258            �           2606    29283 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       supplier            postgres    false    261                       2606    29285 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 l   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       supplier            postgres    false    261    261            �           2606    29287    auth_user auth_user_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY supplier.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY supplier.auth_user DROP CONSTRAINT auth_user_pkey;
       supplier            postgres    false    260                       2606    29289 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       supplier            postgres    false    264                       2606    29291 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       supplier            postgres    false    264    264            �           2606    29293     auth_user auth_user_username_key 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 L   ALTER TABLE ONLY supplier.auth_user DROP CONSTRAINT auth_user_username_key;
       supplier            postgres    false    260            	           2606    29295    barcodes barcodes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT barcodes_pkey PRIMARY KEY (barcode_id);
 B   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT barcodes_pkey;
       supplier            postgres    false    266                       2606    29297    catalog catalog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY supplier.catalog
    ADD CONSTRAINT catalog_pkey PRIMARY KEY (catalog_id);
 @   ALTER TABLE ONLY supplier.catalog DROP CONSTRAINT catalog_pkey;
       supplier            postgres    false    267                       2606    29299    city city_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY supplier.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 :   ALTER TABLE ONLY supplier.city DROP CONSTRAINT city_pkey;
       supplier            postgres    false    268                       2606    29301    client_order client_order_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT client_order_pkey PRIMARY KEY (client_order_id);
 J   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT client_order_pkey;
       supplier            postgres    false    269                       2606    29303     client_routes client_routes_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT client_routes_pkey PRIMARY KEY (client_route_id);
 L   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT client_routes_pkey;
       supplier            postgres    false    270                       2606    29305    clients clients_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 @   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT clients_pkey;
       supplier            postgres    false    271                       2606    29307 "   control_points control_points_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT control_points_pkey PRIMARY KEY (control_points_id);
 N   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT control_points_pkey;
       supplier            postgres    false    272                       2606    29309    delivery delivery_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY supplier.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (delivery_id);
 B   ALTER TABLE ONLY supplier.delivery DROP CONSTRAINT delivery_pkey;
       supplier            postgres    false    273                       2606    29311 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY supplier.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY supplier.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       supplier            postgres    false    274                       2606    29313 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 q   ALTER TABLE ONLY supplier.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       supplier            postgres    false    276    276                       2606    29315 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY supplier.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY supplier.django_content_type DROP CONSTRAINT django_content_type_pkey;
       supplier            postgres    false    276            !           2606    29317 (   django_migrations django_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY supplier.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY supplier.django_migrations DROP CONSTRAINT django_migrations_pkey;
       supplier            postgres    false    278            $           2606    29319 "   django_session django_session_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 N   ALTER TABLE ONLY supplier.django_session DROP CONSTRAINT django_session_pkey;
       supplier            postgres    false    280            '           2606    29321    employees employees_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 D   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT employees_pkey;
       supplier            postgres    false    281            )           2606    29323    goodslist goodslist_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT goodslist_pkey PRIMARY KEY (goodslist_id);
 D   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT goodslist_pkey;
       supplier            postgres    false    282            +           2606    29325    premise_type premise_type_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.premise_type
    ADD CONSTRAINT premise_type_pkey PRIMARY KEY (premise_type_id);
 J   ALTER TABLE ONLY supplier.premise_type DROP CONSTRAINT premise_type_pkey;
       supplier            postgres    false    284            -           2606    29327    premises premises_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT premises_pkey PRIMARY KEY (premise_id);
 B   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT premises_pkey;
       supplier            postgres    false    285            /           2606    29329    products products_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 B   ALTER TABLE ONLY supplier.products DROP CONSTRAINT products_pkey;
       supplier            postgres    false    286            1           2606    29331    region region_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY supplier.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY supplier.region DROP CONSTRAINT region_pkey;
       supplier            postgres    false    287            3           2606    29333 "   supplier_order supplier_order_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT supplier_order_pkey PRIMARY KEY (supplier_order_id);
 N   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT supplier_order_pkey;
       supplier            postgres    false    288            5           2606    29335 $   supplier_routes supplier_routes_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT supplier_routes_pkey PRIMARY KEY (supplier_route_id);
 P   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT supplier_routes_pkey;
       supplier            postgres    false    289            7           2606    29337    suppliers suppliers_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);
 D   ALTER TABLE ONLY supplier.suppliers DROP CONSTRAINT suppliers_pkey;
       supplier            postgres    false    290            �           1259    29338    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    212            �           1259    29339 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    214            �           1259    29340 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    214            �           1259    29341 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    216            �           1259    29342 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    219            �           1259    29343 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    219            �           1259    29344 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    222            �           1259    29345 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    222            �           1259    29346     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    218            �           1259    29347 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    233            �           1259    29348 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    233            �           1259    29349 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    239            �           1259    29350 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    239            �           1259    29353    auth_group_name_a6ea08ec_like    INDEX     j   CREATE INDEX auth_group_name_a6ea08ec_like ON supplier.auth_group USING btree (name varchar_pattern_ops);
 3   DROP INDEX supplier.auth_group_name_a6ea08ec_like;
       supplier            postgres    false    254            �           1259    29354 (   auth_group_permissions_group_id_b120cbf9    INDEX     q   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON supplier.auth_group_permissions USING btree (group_id);
 >   DROP INDEX supplier.auth_group_permissions_group_id_b120cbf9;
       supplier            postgres    false    256            �           1259    29355 -   auth_group_permissions_permission_id_84c5c92e    INDEX     {   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON supplier.auth_group_permissions USING btree (permission_id);
 C   DROP INDEX supplier.auth_group_permissions_permission_id_84c5c92e;
       supplier            postgres    false    256            �           1259    29356 (   auth_permission_content_type_id_2f476e4b    INDEX     q   CREATE INDEX auth_permission_content_type_id_2f476e4b ON supplier.auth_permission USING btree (content_type_id);
 >   DROP INDEX supplier.auth_permission_content_type_id_2f476e4b;
       supplier            postgres    false    258            �           1259    29357 "   auth_user_groups_group_id_97559544    INDEX     e   CREATE INDEX auth_user_groups_group_id_97559544 ON supplier.auth_user_groups USING btree (group_id);
 8   DROP INDEX supplier.auth_user_groups_group_id_97559544;
       supplier            postgres    false    261            �           1259    29358 !   auth_user_groups_user_id_6a12ed8b    INDEX     c   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON supplier.auth_user_groups USING btree (user_id);
 7   DROP INDEX supplier.auth_user_groups_user_id_6a12ed8b;
       supplier            postgres    false    261                       1259    29359 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON supplier.auth_user_user_permissions USING btree (permission_id);
 G   DROP INDEX supplier.auth_user_user_permissions_permission_id_1fbb5f2c;
       supplier            postgres    false    264                       1259    29360 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     w   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON supplier.auth_user_user_permissions USING btree (user_id);
 A   DROP INDEX supplier.auth_user_user_permissions_user_id_a95ead1b;
       supplier            postgres    false    264            �           1259    29361     auth_user_username_6821ab7c_like    INDEX     p   CREATE INDEX auth_user_username_6821ab7c_like ON supplier.auth_user USING btree (username varchar_pattern_ops);
 6   DROP INDEX supplier.auth_user_username_6821ab7c_like;
       supplier            postgres    false    260                       1259    29362 )   django_admin_log_content_type_id_c4bce8eb    INDEX     s   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON supplier.django_admin_log USING btree (content_type_id);
 ?   DROP INDEX supplier.django_admin_log_content_type_id_c4bce8eb;
       supplier            postgres    false    274                       1259    29363 !   django_admin_log_user_id_c564eba6    INDEX     c   CREATE INDEX django_admin_log_user_id_c564eba6 ON supplier.django_admin_log USING btree (user_id);
 7   DROP INDEX supplier.django_admin_log_user_id_c564eba6;
       supplier            postgres    false    274            "           1259    29364 #   django_session_expire_date_a5c62663    INDEX     g   CREATE INDEX django_session_expire_date_a5c62663 ON supplier.django_session USING btree (expire_date);
 9   DROP INDEX supplier.django_session_expire_date_a5c62663;
       supplier            postgres    false    280            %           1259    29365 (   django_session_session_key_c0390e0f_like    INDEX     �   CREATE INDEX django_session_session_key_c0390e0f_like ON supplier.django_session USING btree (session_key varchar_pattern_ops);
 >   DROP INDEX supplier.django_session_session_key_c0390e0f_like;
       supplier            postgres    false    280            L           2606    29366    control_points action_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT action_id_fk FOREIGN KEY (action_id) REFERENCES public.actions(action_id);
 E   ALTER TABLE ONLY public.control_points DROP CONSTRAINT action_id_fk;
       public          postgres    false    210    3475    231            8           2606    29371 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    3491    214    216            9           2606    29376 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3480    212    214            :           2606    29381 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    235    3532    216            ;           2606    29386 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    212    3480    219            <           2606    29391 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    3493    219    218            =           2606    29396 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    222    216    3491            >           2606    29401 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    3493    218    222            ]           2606    29406    products barcode_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT barcode_fk_p FOREIGN KEY (barcode_id) REFERENCES public.barcodes(barcode_id);
 ?   ALTER TABLE ONLY public.products DROP CONSTRAINT barcode_fk_p;
       public          postgres    false    246    224    3510            ?           2606    29411    barcodes category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.barcodes
    ADD CONSTRAINT category_id_fk FOREIGN KEY (catalog_id) REFERENCES public.catalog(catalog_id);
 A   ALTER TABLE ONLY public.barcodes DROP CONSTRAINT category_id_fk;
       public          postgres    false    3512    226    224            T           2606    29416    employees chief_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT chief_id_fk FOREIGN KEY (chief_id) REFERENCES public.employees(employee_id);
 ?   ALTER TABLE ONLY public.employees DROP CONSTRAINT chief_id_fk;
       public          postgres    false    240    240    3540            I           2606    29421    clients city_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT city_id_fk_c FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT city_id_fk_c;
       public          postgres    false    227    230    3514            P           2606    29426    delivery city_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT city_id_fk_c FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 ?   ALTER TABLE ONLY public.delivery DROP CONSTRAINT city_id_fk_c;
       public          postgres    false    227    3514    232            U           2606    29431    employees city_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT city_id_fk_e FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 @   ALTER TABLE ONLY public.employees DROP CONSTRAINT city_id_fk_e;
       public          postgres    false    227    240    3514            Z           2606    29436    premises city_id_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT city_id_fk_p FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 ?   ALTER TABLE ONLY public.premises DROP CONSTRAINT city_id_fk_p;
       public          postgres    false    227    3514    244            f           2606    29441    suppliers city_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT city_id_fk_s FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 @   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT city_id_fk_s;
       public          postgres    false    3514    227    252            A           2606    29446    client_order client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES public.clients(client_id);
 @   ALTER TABLE ONLY public.client_order DROP CONSTRAINT client_fk;
       public          postgres    false    230    228    3520            E           2606    29451     client_routes client_order_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT client_order_id_fk FOREIGN KEY (client_order_id) REFERENCES public.client_order(client_order_id);
 J   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT client_order_id_fk;
       public          postgres    false    3516    229    228            F           2606    29456    client_routes delivery_ud_kf_cr    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT delivery_ud_kf_cr FOREIGN KEY (delivery_id) REFERENCES public.delivery(delivery_id);
 I   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT delivery_ud_kf_cr;
       public          postgres    false    3524    229    232            b           2606    29461     supplier_routes delivey_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT delivey_id_fk_sr FOREIGN KEY (delivey_id) REFERENCES public.delivery(delivery_id);
 J   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT delivey_id_fk_sr;
       public          postgres    false    232    250    3524            R           2606    29466 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    233    3532    235            S           2606    29471 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    218    233    3493            M           2606    29476     control_points employee_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT employee_id_cp_fk FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);
 J   ALTER TABLE ONLY public.control_points DROP CONSTRAINT employee_id_cp_fk;
       public          postgres    false    240    3540    231            B           2606    29481    client_order from_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT from_premise_co FOREIGN KEY (from_premise_id) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.client_order DROP CONSTRAINT from_premise_co;
       public          postgres    false    244    228    3546            ^           2606    29486    supplier_order from_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT from_premise_so FOREIGN KEY (from_premise) REFERENCES public.premises(premise_id);
 H   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT from_premise_so;
       public          postgres    false    249    3546    244            G           2606    29491 !   client_routes next_point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT next_point_id_fk_co FOREIGN KEY (next_point_id) REFERENCES public.premises(premise_id);
 K   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT next_point_id_fk_co;
       public          postgres    false    229    244    3546            c           2606    29496 #   supplier_routes next_point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT next_point_id_fk_so FOREIGN KEY (next_point_id) REFERENCES public.premises(premise_id);
 M   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT next_point_id_fk_so;
       public          postgres    false    250    3546    244            H           2606    29501    client_routes point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT point_id_fk_co FOREIGN KEY (point_id) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT point_id_fk_co;
       public          postgres    false    3546    229    244            d           2606    29506    supplier_routes point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT point_id_fk_so FOREIGN KEY (point_id) REFERENCES public.premises(premise_id);
 H   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT point_id_fk_so;
       public          postgres    false    244    3546    250            N           2606    29511    control_points premise_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT premise_id_cp_fk FOREIGN KEY (premise_id) REFERENCES public.premises(premise_id);
 I   ALTER TABLE ONLY public.control_points DROP CONSTRAINT premise_id_cp_fk;
       public          postgres    false    3546    231    244            V           2606    29516    employees premise_id_e_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT premise_id_e_fk FOREIGN KEY (premise_id) REFERENCES public.premises(premise_id);
 C   ALTER TABLE ONLY public.employees DROP CONSTRAINT premise_id_e_fk;
       public          postgres    false    240    3546    244            X           2606    29521    goodslist11 premise_id_g_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.goodslist11
    ADD CONSTRAINT premise_id_g_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 E   ALTER TABLE ONLY public.goodslist11 DROP CONSTRAINT premise_id_g_fk;
       public          postgres    false    241    3629    285            [           2606    29526    premises premise_type_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT premise_type_fk FOREIGN KEY (premise_type_id) REFERENCES public.premise_type(premise_type_id);
 B   ALTER TABLE ONLY public.premises DROP CONSTRAINT premise_type_fk;
       public          postgres    false    242    3544    244            C           2606    29531    client_order product_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT product_fk_co FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 D   ALTER TABLE ONLY public.client_order DROP CONSTRAINT product_fk_co;
       public          postgres    false    228    246    3548            O           2606    29536    control_points product_fk_cp    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT product_fk_cp FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 F   ALTER TABLE ONLY public.control_points DROP CONSTRAINT product_fk_cp;
       public          postgres    false    246    231    3548            Y           2606    29541    goodslist11 product_fk_g    FK CONSTRAINT     �   ALTER TABLE ONLY public.goodslist11
    ADD CONSTRAINT product_fk_g FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 B   ALTER TABLE ONLY public.goodslist11 DROP CONSTRAINT product_fk_g;
       public          postgres    false    3631    241    286            _           2606    29546    supplier_order product_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT product_fk_so FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 F   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT product_fk_so;
       public          postgres    false    246    249    3548            J           2606    29551    clients received_point_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT received_point_id_fk FOREIGN KEY (received_point_id) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.clients DROP CONSTRAINT received_point_id_fk;
       public          postgres    false    230    244    3546            K           2606    29556    clients region_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT region_id_fk_c FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 @   ALTER TABLE ONLY public.clients DROP CONSTRAINT region_id_fk_c;
       public          postgres    false    247    3550    230            Q           2606    29561    delivery region_id_fk_d    FK CONSTRAINT     �   ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT region_id_fk_d FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 A   ALTER TABLE ONLY public.delivery DROP CONSTRAINT region_id_fk_d;
       public          postgres    false    247    232    3550            W           2606    29566    employees region_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT region_id_fk_e FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT region_id_fk_e;
       public          postgres    false    247    240    3550            \           2606    29571    premises region_id_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT region_id_fk_p FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 A   ALTER TABLE ONLY public.premises DROP CONSTRAINT region_id_fk_p;
       public          postgres    false    247    244    3550            g           2606    29576    suppliers region_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT region_id_fk_s FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT region_id_fk_s;
       public          postgres    false    247    252    3550            `           2606    29581    supplier_order supplier_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT supplier_fk FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);
 D   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT supplier_fk;
       public          postgres    false    3556    249    252            @           2606    29586    barcodes supplier_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.barcodes
    ADD CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);
 A   ALTER TABLE ONLY public.barcodes DROP CONSTRAINT supplier_id_fk;
       public          postgres    false    224    3556    252            e           2606    29591 $   supplier_routes supplier_order_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT supplier_order_id_fk FOREIGN KEY (supplier_order_id) REFERENCES public.supplier_order(supplier_order_id);
 N   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT supplier_order_id_fk;
       public          postgres    false    250    249    3552            D           2606    29596    client_order to_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT to_premise_co FOREIGN KEY (to_premise_id) REFERENCES public.premises(premise_id);
 D   ALTER TABLE ONLY public.client_order DROP CONSTRAINT to_premise_co;
       public          postgres    false    244    228    3546            a           2606    29601    supplier_order to_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT to_premise_so FOREIGN KEY (to_premise) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT to_premise_so;
       public          postgres    false    249    244    3546            ~           2606    29616    control_points action_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT action_id_fk FOREIGN KEY (action_id) REFERENCES supplier.actions(action_id);
 G   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT action_id_fk;
       supplier          postgres    false    272    3558    253            h           2606    29621 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES supplier.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       supplier          postgres    false    258    256    3574            i           2606    29626 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES supplier.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       supplier          postgres    false    256    3563    254            j           2606    29631 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES supplier.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY supplier.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       supplier          postgres    false    3615    276    258            k           2606    29636 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES supplier.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       supplier          postgres    false    3563    254    261            l           2606    29641 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES supplier.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       supplier          postgres    false    261    260    3576            m           2606    29646 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES supplier.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       supplier          postgres    false    258    3574    264            n           2606    29651 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES supplier.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       supplier          postgres    false    264    260    3576            �           2606    29656    products barcode_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.products
    ADD CONSTRAINT barcode_fk_p FOREIGN KEY (barcode_id) REFERENCES supplier.barcodes(barcode_id);
 A   ALTER TABLE ONLY supplier.products DROP CONSTRAINT barcode_fk_p;
       supplier          postgres    false    286    3593    266            o           2606    29661    barcodes category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT category_id_fk FOREIGN KEY (catalog_id) REFERENCES supplier.catalog(catalog_id);
 C   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT category_id_fk;
       supplier          postgres    false    267    266    3595            �           2606    29666    employees chief_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT chief_id_fk FOREIGN KEY (chief_id) REFERENCES supplier.employees(employee_id);
 A   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT chief_id_fk;
       supplier          postgres    false    281    3623    281            q           2606    29671    city city_id    FK CONSTRAINT     {   ALTER TABLE ONLY supplier.city
    ADD CONSTRAINT city_id FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 8   ALTER TABLE ONLY supplier.city DROP CONSTRAINT city_id;
       supplier          postgres    false    227    3514    268            {           2606    29676    clients city_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT city_id_fk_c FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 @   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT city_id_fk_c;
       supplier          postgres    false    3514    271    227            �           2606    29681    delivery city_id_fk_d    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.delivery
    ADD CONSTRAINT city_id_fk_d FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 A   ALTER TABLE ONLY supplier.delivery DROP CONSTRAINT city_id_fk_d;
       supplier          postgres    false    227    3514    273            �           2606    29686    employees city_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT city_id_fk_e FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 B   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT city_id_fk_e;
       supplier          postgres    false    281    3514    227            �           2606    29691    premises city_id_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT city_id_fk_p FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 A   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT city_id_fk_p;
       supplier          postgres    false    285    3514    227            �           2606    29696    suppliers city_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.suppliers
    ADD CONSTRAINT city_id_fk_s FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 B   ALTER TABLE ONLY supplier.suppliers DROP CONSTRAINT city_id_fk_s;
       supplier          postgres    false    227    290    3514            r           2606    29701    client_order client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES supplier.clients(client_id);
 B   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT client_fk;
       supplier          postgres    false    271    269    3603            w           2606    29706    client_routes delivery_ud_kf_cr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT delivery_ud_kf_cr FOREIGN KEY (delivery_id) REFERENCES supplier.delivery(delivery_id);
 K   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT delivery_ud_kf_cr;
       supplier          postgres    false    270    273    3607            �           2606    29711     supplier_routes delivey_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT delivey_id_fk_sr FOREIGN KEY (delivery_id) REFERENCES supplier.delivery(delivery_id);
 L   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT delivey_id_fk_sr;
       supplier          postgres    false    289    273    3607            �           2606    29716 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES supplier.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY supplier.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       supplier          postgres    false    276    3615    274            �           2606    29721 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES supplier.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY supplier.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       supplier          postgres    false    274    3576    260                       2606    29726     control_points employee_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT employee_id_cp_fk FOREIGN KEY (employee_id) REFERENCES supplier.employees(employee_id);
 L   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT employee_id_cp_fk;
       supplier          postgres    false    272    281    3623            s           2606    29731    client_order from_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT from_premise_co FOREIGN KEY (from_premise_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT from_premise_co;
       supplier          postgres    false    285    269    3629            �           2606    29736    supplier_order from_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT from_premise_so FOREIGN KEY (from_premise) REFERENCES supplier.premises(premise_id);
 J   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT from_premise_so;
       supplier          postgres    false    285    288    3629            x           2606    29741 !   client_routes next_point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT next_point_id_fk_co FOREIGN KEY (next_point_id) REFERENCES supplier.premises(premise_id);
 M   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT next_point_id_fk_co;
       supplier          postgres    false    270    285    3629            �           2606    29746 #   supplier_routes next_point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT next_point_id_fk_so FOREIGN KEY (next_point_id) REFERENCES supplier.premises(premise_id);
 O   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT next_point_id_fk_so;
       supplier          postgres    false    285    3629    289            y           2606    29751    client_routes parent_id_fk_cr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT parent_id_fk_cr FOREIGN KEY (parent_id) REFERENCES supplier.client_routes(client_route_id);
 I   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT parent_id_fk_cr;
       supplier          postgres    false    270    270    3601            �           2606    29756    supplier_routes parent_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT parent_id_fk_sr FOREIGN KEY (parent_id) REFERENCES supplier.supplier_routes(supplier_route_id);
 K   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT parent_id_fk_sr;
       supplier          postgres    false    289    3637    289            z           2606    29761    client_routes point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT point_id_fk_co FOREIGN KEY (point_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT point_id_fk_co;
       supplier          postgres    false    3629    285    270            �           2606    29766    supplier_routes point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT point_id_fk_so FOREIGN KEY (point_id) REFERENCES supplier.premises(premise_id);
 J   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT point_id_fk_so;
       supplier          postgres    false    3629    289    285            �           2606    29771    control_points premise_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT premise_id_cp_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 K   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT premise_id_cp_fk;
       supplier          postgres    false    272    285    3629            �           2606    29776    employees premise_id_e_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT premise_id_e_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 E   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT premise_id_e_fk;
       supplier          postgres    false    281    3629    285            �           2606    29781    goodslist premise_id_g_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT premise_id_g_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 E   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT premise_id_g_fk;
       supplier          postgres    false    282    285    3629            �           2606    29786    premises premise_type_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT premise_type_fk FOREIGN KEY (premise_type_id) REFERENCES supplier.premise_type(premise_type_id);
 D   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT premise_type_fk;
       supplier          postgres    false    3627    284    285            t           2606    29791    client_order product_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT product_fk_co FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 F   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT product_fk_co;
       supplier          postgres    false    286    3631    269            �           2606    29796    control_points product_fk_cp    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT product_fk_cp FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 H   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT product_fk_cp;
       supplier          postgres    false    286    272    3631            �           2606    29801    goodslist product_fk_g    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT product_fk_g FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 B   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT product_fk_g;
       supplier          postgres    false    282    3631    286            �           2606    29806    supplier_order product_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT product_fk_so FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 H   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT product_fk_so;
       supplier          postgres    false    286    3631    288            |           2606    29811    clients received_point_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT received_point_id_fk FOREIGN KEY (received_point_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT received_point_id_fk;
       supplier          postgres    false    271    285    3629            }           2606    29816    clients region_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT region_id_fk_c FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 B   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT region_id_fk_c;
       supplier          postgres    false    271    287    3633            �           2606    29821    delivery region_id_fk_d    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.delivery
    ADD CONSTRAINT region_id_fk_d FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 C   ALTER TABLE ONLY supplier.delivery DROP CONSTRAINT region_id_fk_d;
       supplier          postgres    false    247    3550    273            �           2606    29826    employees region_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT region_id_fk_e FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 D   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT region_id_fk_e;
       supplier          postgres    false    287    3633    281            �           2606    29831    suppliers region_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.suppliers
    ADD CONSTRAINT region_id_fk_s FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 D   ALTER TABLE ONLY supplier.suppliers DROP CONSTRAINT region_id_fk_s;
       supplier          postgres    false    287    290    3633            u           2606    29836 %   client_order start_client_route_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT start_client_route_id_fk FOREIGN KEY (current_client_route_id) REFERENCES supplier.client_routes(client_route_id);
 Q   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT start_client_route_id_fk;
       supplier          postgres    false    3601    269    270            �           2606    29841 )   supplier_order start_supplier_route_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT start_supplier_route_id_fk FOREIGN KEY (current_supplier_route_id) REFERENCES supplier.supplier_routes(supplier_route_id);
 U   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT start_supplier_route_id_fk;
       supplier          postgres    false    3637    289    288            �           2606    29846    supplier_order supplier_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT supplier_fk FOREIGN KEY (supplier_id) REFERENCES supplier.suppliers(supplier_id);
 F   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT supplier_fk;
       supplier          postgres    false    288    3639    290            p           2606    29851    barcodes supplier_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES supplier.suppliers(supplier_id);
 C   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT supplier_id_fk;
       supplier          postgres    false    3639    266    290            v           2606    29856    client_order to_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT to_premise_co FOREIGN KEY (to_premise_id) REFERENCES supplier.premises(premise_id);
 F   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT to_premise_co;
       supplier          postgres    false    269    3629    285            �           2606    29861    supplier_order to_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT to_premise_so FOREIGN KEY (to_premise) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT to_premise_so;
       supplier          postgres    false    285    3629    288            %      x������ � �      &   O   x�3���,J�/�O+���L.��,���\NsKScc3#scCSNc##CN#SN3��/6\�qa#��	g�W� P^v      '      x������ � �      )      x������ � �      +   �  x�u�]��(���*��Q����ƕ�Lb�f��#۹���`��� �Э�c�2U`��ߗ��r����0��廲��>�kij�\_^�	��$`�����6C��'�yL��7�Fg�i�z��c~U��&��� $w���?`ɠb�����1��/��]5ޠ�m�Q��~�E�՞!;��b����NKu���ƞ���V?� zx :y6u�G��>>�:�67j���=U�w@M{���6��d�Q�Jx���(6���F��F����Ԑ�ψA�F�"�r] �*"����vqP���+SC��o�1�o���1�R[�����>��jv�O�@NS/� d4l�*��;<�wJ6_�7fk5���+�@N�����0��[�`���e�����zw�L�-b
2Z(�C�I�0������9O�Z�0a�s��l)�X2�X��@z��Ss�2��r�h�ks[a<qG�mE�I=k+.LڑSwg?Y�F;�m�=\F����F:&E����vN�T�庹�p�9�.M%� �9�ő�ȩ"Q��\��y~Ϗ���,�j�lE@�Z�*[P�����5q��
�2w�ǟi�<	�_�jLc�]H�0M�_!U}i�{J��>Ϸ��X�ʆ%#6��@�*X�V���D8]e��s�_�@�M�T�`���L�J�XQLB5	G�ĔT��y��\�����plXo���PS��?TX��o�D��-ׄO�D�gѬU}�@\�C)&�;��{61�����$Xu�TUX\��vs3tm�O�f�����GTZ���?jT�e
�%�6�Ԙ:�芹#�4yX��Gti��n(䏨0�X3�c�n�Єl����8)la\���u6*�׃B�T�?��:��Hâ��f�
�9�V��THU�����꼸����iF�H��Uz�*�~^�]�=�ң�,�N���g�M��:�c{�R��e3��C��)ZU���"ۂ[��v���\�9yW"�Cޤ/ǖ�$�o2�BNo���F|��a��@�AX<h(�TԠ�Y��S���NBDU�4F��1����@�m�Y��.q�d�J\���V�̆V'���*q�cѿ&a�Pw�dS�Bd�����B���f��?�(	;�W>��x��M��J��/'��:�	{�m�Z�ch�`���L�����L�����7�F�c�Bf�ۿ���~~=^��kՄ�=��������NI�ۛTsIIȻ�T�&��,l~RQ�F�~�I'�x~�BDy[�2�C�(�XS�
�}���\�v�iU���TC!\B����"�Z}�UT�0Ag�(�д�T�|tj�+�@p�j
�)�%�S�Ҩ�D����0���)�o�<,�x�D�ҹXT�I)����&O����?��\      -   �   x�E��
�@ ��Sx�&���B��n�Aa?����"����0�az_�-�s������Ø�ۗ{�7�ra�o+n��5��F����YGAUH<Y(up�v��Td�,� � == �o3�ap�71E5z�*�WU��8C5������<N3��.�3BuB}`���xh7�N��i_��9*      .      x������ � �      1      x������ � �      3   m   x�3�4�4�LII�.3##S3��1gzRRz���)���!^�qa�ņ��;.캰��¬;.6]�pa'��������e�@��ɛq��3�����%b���� �K�      5   �   x�}�Q
�@��gO�	�5K�D'� �\� A��)�n��&����Q#� �,����7�h�j4���Ԝ�("�\�5�9A�gؿA��+Q-J�x�%W-��ON9���G��+>����P񎓞��y#���`��SrT@8	�V��p����>د�����Q7�n��.{Imp������n��	�J�7�UБ      6   �  x�U�Ir�8E׉S��8si�+�ly
˪��7PEA� ��4���^��+�w ���#z��_�o�v�zѣv�~r�H���v0{�F��d��\a���V"�{�(|mz�yN[�)�DA���Q��\��R���n�jozLˈ^�0�yիխ�'!czѮ2����m�T%d����^��h���ۣ�$�v��7����Y�����&Z�ݢ}K^Wʉ(�{��Ъ�QL?�]��nUefݔ�\3�<�эr���"��4��k?U �~Q"*���/���� L,�����qDOj��^��Q_yA���cz�Z%�ގS��>���4��"��z�:�9n���m�E\���׵"Y{����;�Dҍ��:��m�N$1m&/I�Qս-��}��Zӛޫ�d�l��ڴ"��qr]ت���_�*-����W��kר�֭���??Њh��V��4�$Gۊ4�����;)��68*�8��V"�C:�DZ ԃ�~��Fi�/�����Tdko>!��T��(Y�7jn�"��טQ��{���p�m�ki u-B��u79-��Ȁ������1"C$
�w�_��bh�9�8�yD��v�w|��Z�(�R�H
%�kY��E��ڛ;��������z=���Kzq�����u���ҳr�wp!a���G���(p��	l5����n̑��Q�l�>oUq??��O]���?�0�EQp���\=㪭(Jz��o(�r�iU�f,�/H2�Sʈ^�SJ�1��(�iE��C��)�؊�e�<�@�V���kjD�t��[�j�PA��{�(K\yq�;k��,*��.����B�Ћ��lW[X��Z_8T��M�z��sK� M����h(�NͰ�\��p�P���A��i?>? �ؙKWJ���V�1��0L΋%��-��ՈvJ����t T� ,���(�o�n�x�j�/�P-
⫓�-H�XgZO]I�m���	�07�t��Îs�/�*�v�R���ӱf���BP��P�pVo����$� q@,��Aǭv���" �ϕ�Y�
B�����	A�P��>�H'�38�{���	��'30Y+�6�S��|4���a1��w��{�P�`�/?��a �z?L�B�\�G�AU��I�/%A���������9=7#�C�kRc����,=�z����gHSz1��f�}ȶ�C�)�Z	}o��*��[��CD -C��L���a\ݵ&L�uhd[_��}�K~�@���^m�ρ=j�Jx���hW�`c�	�i���Ihs^�8�j_
@o I �s����/bH��׃K��o�������'��0��G�����Î��O���Q�2���ِt��́��,~�|��HQ�S�y�䛩�Z�4���"H�UM���γ���m�n���hg᩷+6y���@r����ڴ~�>2�B�%�`��?R[A�����Z�!���8�      7      x������ � �      8      x������ � �      9   e   x�U˱�0D�����t"�%2��L�	2H��Fa�&���c!���LCp_K �p}��~�}OЌ��)�f��ш�Ú���W�	��dw�^W?zl��/���      :      x������ � �      ;   �   x�5�1
1D��]\������<�6B�-�<���PD��;|odR�k�a��JJ�|X"b�O5��x�WC9#li�&k��!wy�*Y7��^[x�,�����<F�3r�c��y�Ɠ��:p�J���~��� �/�      <      x������ � �      >   ?  x�mRێ� }f>fS���;�u�
q٨�M���Ʃ���9����Ùғ���3���`jI?̛0���An���ق%� Wֻ9aZZ��4��ES���7��x߹�Y��p'�M+<H<Z��_,�!�����G��Ł�`p��
��|�9է<(�+i�Z�;�l��=(mF�gpS�(��q�1�ӖN/}�'�"����\���T�ϫ�p�	%	����*�ل��V�w:�&z�Dd>�vpq{��������x��k�K���T�h;)�+=�$�z����kg���LQ��뙝���
ٞ����V����� ��-�      @   �  x����n�0������j+{6�k��J���`֘�y��C��H
��f���g�{�|} �Pe;�n@ ~S��/�<?�*8PV�"�2+Pg�;&�d�2�΍5]�7��
H��̸P�	Ư����C���2#�ʴ}�������Q�ڛ�f�O0�xF��Lզ1�d�
��E�YE��r��ʬ�<�[0;1SdF�J��cX�Ń���w�ꝍ�n?��*�ժu{N*��d���w�?����_�?<���@�C3?t�{7��N�;�JH�`Y�S�C��e�9LIr6��7�ϮދH2!y�+��0�xx<��������	gb�?躵�&at�"n6�w�P�K�1ݧQ�S��w ��"A��� h87�zo�E�?�=�HVI�8K0�M2X����t{�l��"�����2����1�P��R��.��]F��@W�Y��j�<�`�NX1�/) ׇ�I(D��
��(��F!�o1���_z��/R�X)�7Z�*��WQ�68M�[�.��S7����N�`�w^�f�e����>�:|�Uw�y�s!i�z�J��4z
U�M	Ղ�=8�.����0�VS/ʕB�أBqٻ��%w��Hj���)l�z��٬� ,	�����ׇCJ r2�w,�0~zbP�$�MR��f��\ /N@O��R^��S�s�N�8W��|qR2�"��9�
��4p_���F�1      B   6  x���W��@  ���S��5e�?�ƀ)�
F�,:�x���>q�(g�;��
=�l�ǎ)�G�=c~I|o?V�9]�rG,���Vn�zz�Uu�r�k]*z�ٻ�O�Z�Bg�~�(��ٟ��ش6\��r�I�TKO�~X� 5�]�%@���j�[tg|�I�U�V������������;>4X(U��9��NȻm�����h��{��Dw\}���1�T(>�5���hK�m�y�as�v-���
r�� B���hN�H��� �~ �����L��KA��p�@]E%z$wR���w����	
n�6���}������/F�*�����d-�m��xƆ��F�à���N���^��\��N�Dx˓�擔v�7<o����μ[F�����ݽ�����48��nDU�����pvJ��*p&ٕ��U&�D�ŧ�9�B��O���ar�i��%��b(@S�����1@+$ Z�E�cn- �ԬP�y�����a�?	N��������eT�א_GR���h8+����dr����+� �$�hEA�]�s������q      C   �   x�͔�JA��o�����f��]c��9s�&��$Il�,| �!�`��^ak]>��+�SYDȭ<�Nd/ϲ���U奻��7W�{�׸���v9�������N�l>��-pT�6'�cF�)8��G��`8��Cw"�H`k���`u-sA����!�S��t��t?й��|�tì�B�tD�b�tz;�(��]_޴([�]jRj�f�>%8�;�N*���1j�x`�yd<.      D   (   x�3�4��46�44�420�426�45�300������ M�      E   ^   x�U���0�)2���)(�c !� P2ý���l�O.�Dn�-�Nx���I[^;�ʃ�Km�89y�=:���j
y�i?�      G   �   x���M�0�����-�y7�!5`p�A<���9����i�M�73�,�6iHCӎ箬��Зm�U�|pΣc�98
E ���x�4g2����3��n�.+ ��� 4�Ds`�F:���L��=�X�`�Q�	.,e�1�-3iPU�TO_&iHފ1�A���[�f�>3Ƽ ��{{      I   �   x�u�A1����&�K�}A��諾�Rb�	"�@?���xD|3紗��@p=I��h�4$�mW������QdjZ}��VYP�[:��>v����E�J=�΄!t�BC�e��2Z��ş�� �6�      J     x���_N�@Ɵ�S���
Jb�6w�=A����UM�P!�ZB���
�+�$��[��]�>������|���vC%-2���/I�ΓE�������b�����z��I�g��>�}�\�2���V��X��w�Q����Rf�!`D1��S(j�'}"3�IbMJ�X�Y^���+�����m��2��v��L�=�Wj"c>�.�e�R8���h@�K��|B�/`oTd5�${�~j��8q��U2/d�!�9J�C�L3��7,��xg\T�z�`Q旱r�4� �	����*���x0pE�OL��UmĿE�)�ք��`�r_��I���"6.R�O�h�6p���2\�Z6�6P�y�)\ii�#��:u1GU笩M?�O�ȓ�߲b�Ls_��)�@�ey�!���69aN}n�Y�œ��d1�q*��l({3!�����_Q��*O�%~k�����l=�(�N�:����g�̳:�P��2Q���zN���S�u�,��0}N�C����hEk�	^����N��ˇx�l��ܘ-ẈZ�Nk�@�3����.�CRٸUv�v�i}63�2���fñ�p[� %�a��X��%�B�Y9��,h��^�ck��&�Ml���L�!�y�#2_��mY�c�=D3��۶Ц�g(Ţb;v�{(�H�J��I�6�HF�&و+r'����M�֌�f�M�s3`a\�S-��6��y��.g�S0e��-q��)��iy��i�FM����	m_�p�ڄ����2������>A�ʊ��y���\/�c�S�k��l�pZ�"2!^k��E���fq���F�YmGw���N�:��3rK_fe��.�(�r�f_:���"�r�"���J2(�5"r�����B�>���r�@qͷ���i��Xy]{X;<G�WW���-C�0;��@���\�rs_���2s]B�+~���u ��0��P��c�x�������	�bW9��l�M�����#Q���=1�ĵ
�eS����n7�Ϳ�*�p      L      x������ � �      M      x������ � �      O   �   x���M
�@���ÔN�ɴ�^@OЍT�ց����FV]Hx�g�h���9�kC�N�7e!v�cV�l����T0���>\��zih�
3Nq�9�N��V��#�z�L>i!�`�`~-�p� ɂK4Y��B1)��	`^���f��?����V5��      P      x������ � �      Q      x������ � �      S      x������ � �      U   <  x�u�A��8E��)��Ȏ{=�h��I�t�8����GI�_R-�K�۟%�雿O�����q����|7�	ן�:^�6"�ߧ�u���"x���ARp�?��?������9-_�u�͏���t��9 ٝa���lа�Z2z4ܘ\^���l�h0�v~g��<�b�[O��FZ�"@t��]r�^���G�O����<ˏ'��Og�N�A�����4yLO>ϏWX����sj�耇��k$����������Nmft��O�׉V��k!ߕa�	�lW��%��B�UB4�ϧ�)l��H���\I���9� ��&�Im��=	�Y}�����섟����Y1�h�BL>�4=<Nj6�ﷰfk3����u��ʈ� �#���V���Y�L�m�¶�ѕ� �aCBAF+�~�ڛ<V&�B�w�z���iZOvp{Ha ٖa!��es�5�d�h8sv/S8*7��n�v{<�&w"��6�ۉ������N�f���
o50tl��!����n86�8�򆊶��Է?�V�0�k�C�[��)	�oI��������]p���z�����I�\{@�z� V�_bf_ IuP9o�n���a;��]�C�y�X�;!;�;%S�	��y��P�+���Η�s^.��z:�q�`��)H�
vK�������)5T�2�XDb ��w�"����9�lf:�m�7�`5py=�4��S��t�Jq1�1IS�4F'i��c��$�Xf���(�j�(Oэ��Q]�>�v��Q&�h|�6�p��KC�6���I8.+�ʺ$.+�Ū$�.
Ӻ��9-���EJ5N�� ;�b�XIص�d�J��j��P)S�B�i���:3bm�I�k�<�4��z���ZF�TǶ9�m���7��TŶ�da�!)N�����R�l,Dɣ�ǊS���ѵ�s�P �A�c�Ǖ�#�����v�x�[`�x���~��0߻~�������u&P���Q�bM�Q�O������ݡ�D@��½��7�C�X�䕹�tIVm �4�<vj��y��#��H¶��ALI�U"��Af���rӗ�ď7��.�U�"?�+{��C��;��)���e�<���	��R%��`��.
JL#Ū�^
�L;Ũ�
jRS�*�$���������5���*:������RS�gM.���&���\h���>zrQ�G=��5�A�6?h!D�+Q�r�Ck.6�t�#��]�}�v��Wǝ��PU���WbE-D
ڶ�&L�uy�Ҡ��&Di�yl=�NU}%2���Tu(b2�*�4�N/so�.��س�q쿰N�\�}R�^V��~L�����q      W     x�m�Ao�0�3|
�I�o�B����H��L�%
��l	|��e���{������]�X�A\�b���_V�o�1�f0���������)i���J$7��L���a~�;�,M7���� �)�)�	�<@&&q0!���^��t��Tz՛="U0��0B�^���u�V�>���>��s�je#I�1W�e����S�i�����8��a���(Z�@a���z�;��_h'����h��?,xع~��k_�o����\�      X      x������ � �      [      x������ � �      ]   �   x�U�AJQD��O�	�of&�]\����P��B6Bz��a�0��+T���VA�g�j^}-���h�g͂�=���c}�]���wK�q�k�'�u[!��'"z�{�@�_�`)cn��io8`���j&��P��Ԟ��+΃�h��6�e�\�7t���lz��+�N��K��g�2�X��gBͽ��k�lRHJ�&�@�C��|!eQ�%��^ش�sd;�ڛ�#��2������      ^   �   x�uO;��P�gN�	���p����QPQD">
\�s��K��R�'���N��9
����홣�p��ǡ`��b�����N;��9n�v[d��`���-�)a X��;q�y�IGN�ԙ���Y�u�_��q����x�@̼��hO��P#��(mH&�~�i��x Q�A�֬��/G>-�C�C�2R�d\P�8��yژuk�SOyg�Wԓ=4U�P��Q      _   �  x�U�Ir�8E׉S��8si�+�ly
˪��7PEA� ��4���^��+�w ���#z��_�o�v�zѣv�~r�H���v0{�F��d��\a���V"�{�(|mz�yN[�)�DA���Q��\��R���n�jozLˈ^�0�yիխ�'!czѮ2����m�T%d����^��h���ۣ�$�v��7����Y�����&Z�ݢ}K^Wʉ(�{��Ъ�QL?�]��nUefݔ�\3�<�эr���"��4��k?U �~Q"*���/���� L,�����qDOj��^��Q_yA���cz�Z%�ގS��>���4��"��z�:�9n���m�E\���׵"Y{����;�Dҍ��:��m�N$1m&/I�Qս-��}��Zӛޫ�d�l��ڴ"��qr]ت���_�*-����W��kר�֭���??Њh��V��4�$Gۊ4�����;)��68*�8��V"�C:�DZ ԃ�~��Fi�/�����Tdko>!��T��(Y�7jn�"��טQ��{���p�m�ki u-B��u79-��Ȁ������1"C$
�w�_��bh�9�8�yD��v�w|��Z�(�R�H
%�kY��E��ڛ;��������z=���Kzq�����u���ҳr�wp!a���G���(p��	l5����n̑��Q�l�>oUq??��O]���?�0�EQp���\=㪭(Jz��o(�r�iU�f,�/H2�Sʈ^�SJ�1��(�iE��C��)�؊�e�<�@�V���kjD�t��[�j�PA��{�(K\yq�;k��,*��.����B�Ћ��lW[X��Z_8T��M�z��sK� M����h(�NͰ�\��p�P���A��i?>? �ؙKWJ���V�1��0L΋%��-��ՈvJ����t T� ,���(�o�n�x�j�/�P-
⫓�-H�XgZO]I�m���	�07�t��Îs�/�*�v�R���ӱf���BP��P�pVo����$� q@,��Aǭv���" �ϕ�Y�
B�����	A�P��>�H'�38�{���	��'30Y+�6�S��|4���a1��w��{�P�`�/?��a �z?L�B�\�G�AU��I�/%A���������9=7#�C�kRc����,=�z����gHSz1��f�}ȶ�C�)�Z	}o��*��[��CD -C��L���a\ݵ&L�uhd[_��}�K~�@���^m�ρ=j�Jx���hW�`c�	�i���Ihs^�8�j_
@o I �s����/bH��׃K��o�������'��0��G�����Î��O���Q�2���ِt��́��,~�|��HQ�S�y�䛩�Z�4���"H�UM���γ���m�n���hg᩷+6y���@r����ڴ~�>2�B�%�`��?R[A�����Z�!���8�      `      x������ � �      a      x������ � �      b   y   x�]���0���<p $5�
�v� ���T�t9�O9fCG������{����<_�̜���a@7U�B�5��	��{uD|%)fb3�E��W#�4�cQ�u���R>�x#a      c      x������ � �      d   �   x�5�1
1D��]\������<�6B�-�<���PD��;|odR�k�a��JJ�|X"b�O5��x�WC9#li�&k��!wy�*Y7��^[x�,�����<F�3r�c��y�Ɠ��:p�J���~��� �/�      e   I   x�3�4202�54�52P04�2��24�36��0�60�4��L�5�4䌮VJLIIMQ�R������4����� ���      g   2  x�mR�n� |�3H��;�:�beLI��L���$�p�>D�w���'����ň��s\A	��\�|Jg�;2D\4{�$�=Ι��\�t"��;���%�F+z�=7��գ'��R��"$e��F\�����!:������e�MŬ��#ײ���h��S�qM�K_&bFh�X
�!�v���d�A�2�x��F���kD1��&�h�mn�L*f�,l_�jߠu���=_`)P�gjK����M���g�|�9����D��v���_3�Ŵ�F�W�O�Wv�C4��u�J���)=��� �=�      i   �  x����n� E��Wt�tP�����%Q��M��I��������l���.��!��L0�+� �Px�D��gGN���g"�,�>�T��"U���d���L�f ;�Ʈ�N��Kcl`Q5��^!l�� �s0v��N�x���-l��L�����Y6p��A�z�E+r-4KT]�G�z��\j`����C��aAf��5���^�nà�,aX��[̼�Bvw����)f�&�m궯^p	P%�Ȕ2
���ˆ�z��mCPq���i�T�R�iT�Χ	��Y���^��._p*������v�<�$�I�G��Z
�P�/���:;���0�1�1*�8:�}���;~��u���@S�=ջq�keA�����?FK��0Q�N��5wc '�N\+R�s��x8~ ٮhc      k   0  x���Y��@  ����?������(��d�,R��,���{2I�a�����s`ͣ�u�s�F@.���8=A���U�M���/Ms32��e1E��rG+�K`܎V����� �%�z�υX�#���(!6��y
��d�0r;�N|F��G���_�\�k��)�c���퉺ǭ�M���v^ޭ��CcZ�N��M`F�׌z�\i-$l�\j+N#�ѽs��ෑ���Bq���Ӷ��J#�W4�o , ( �E�)�1��_@���b( +3u������:�������n3��;�bfU5FRm�l�C6���^%a�_���m�]R=ې�v�ɗ�� �kj�C�V6�%��@8>_�_D���c�di�Z����u=P[��b�/sN(um��7/=:?���zc+��tu����z_5龈�&W}�}N�Eۗ1<�up�C�\��̰��j�||f���!"�i�[i
U ��M$=��\u�E-9�	�b��J}�=�I�\7�Է��v�޻��
׏0Ul^�QT�5�=�{�d.B/=���_������~O'���      l   �   x�͔�JA��o�����f��]c��9s�&��$Il�,| �!�`��^ak]>��+�SYDȭ<�Nd/ϲ���U奻��7W�{�׸���v9�������N�l>��-pT�6'�cF�)8��G��`8��Cw"�H`k���`u-sA����!�S��t��t?й��|�tì�B�tD�b�tz;�(��]_޴([�]jRj�f�>%8�;�N*���1j�x`�yd<.      m   6   x����0���0�ݥ��s �,?lc.�cr�KR�pӍ�H_�̜���z��      o   ^   x�U���0�)2���)(�c !� P2ý���l�O.�Dn�-�Nx���I[^;�ʃ�Km�89y�=:���j
y�i?�      p   �   x���M�@���a�v��΃��� $�H�{�)�F��4,4��O�~O���-o]�����uHu>���E}Ac���(VU�`}����f&����7&���&+�e ^���f BW�X����U�d�� �4mޣ��:���:���D|2�R      q   �   x�m�K!C��0#'s��{��_5�E���g�G����́O��4�`��^�bD�o����v#�Y�6Δ}"a��~�!���4���W�R��T$��Ä��gs��9Tm��(������9��:u�q�g+��ܓr/����^�45      r     x���_N�@Ɵ�S���
Jb�6w�=A����UM�P!�ZB���
�+�$��[��]�>������|���vC%-2���/I�ΓE�������b�����z��I�g��>�}�\�2���V��X��w�Q����Rf�!`D1��S(j�'}"3�IbMJ�X�Y^���+�����m��2��v��L�=�Wj"c>�.�e�R8���h@�K��|B�/`oTd5�${�~j��8q��U2/d�!�9J�C�L3��7,��xg\T�z�`Q旱r�4� �	����*���x0pE�OL��UmĿE�)�ք��`�r_��I���"6.R�O�h�6p���2\�Z6�6P�y�)\ii�#��:u1GU笩M?�O�ȓ�߲b�Ls_��)�@�ey�!���69aN}n�Y�œ��d1�q*��l({3!�����_Q��*O�%~k�����l=�(�N�:����g�̳:�P��2Q���zN���S�u�,��0}N�C����hEk�	^����N��ˇx�l��ܘ-ẈZ�Nk�@�3����.�CRٸUv�v�i}63�2���fñ�p[� %�a��X��%�B�Y9��,h��^�ck��&�Ml���L�!�y�#2_��mY�c�=D3��۶Ц�g(Ţb;v�{(�H�J��I�6�HF�&و+r'����M�֌�f�M�s3`a\�S-��6��y��.g�S0e��-q��)��iy��i�FM����	m_�p�ڄ����2������>A�ʊ��y���\/�c�S�k��l�pZ�"2!^k��E���fq���F�YmGw���N�:��3rK_fe��.�(�r�f_:���"�r�"���J2(�5"r�����B�>���r�@qͷ���i��Xy]{X;<G�WW���-C�0;��@���\�rs_���2s]B�+~���u ��0��P��c�x�������	�bW9��l�M�����#Q���=1�ĵ
�eS����n7�Ϳ�*�p      s      x������ � �      t   Q   x�u��� �3L�J��E�����l��i�rJ���ƒ��>ԥ5M�nʱ�9�Tß�c��^�;Oa��O?      u   �   x���M
�@���ÔN�ɴ�^@OЍT�ց����FV]Hx�g�h���9�kC�N�7e!v�cV�l����T0���>\��zih�
3Nq�9�N��V��#�z�L>i!�`�`~-�p� ɂK4Y��B1)��	`^���f��?����V5��     