PGDMP     1    0                z         	   greenland    14.5    14.5 .   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16808 	   greenland    DATABASE     f   CREATE DATABASE greenland WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE greenland;
                postgres    false                        2615    18635    supplier    SCHEMA        CREATE SCHEMA supplier;
    DROP SCHEMA supplier;
                postgres    false                       1255    18596 �   add_premise(bigint, double precision, double precision, character varying, bigint, bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE       CREATE PROCEDURE public.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint)
    LANGUAGE sql
    AS $$insert into premises
(premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number)
values
(p_type, coord_long, coord_lat, email, phone, postcode, region, city, street, h_number)$$;
   DROP PROCEDURE public.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint);
       public          postgres    false                       1255    18609 >   add_product(bigint, bigint, numeric, numeric, bigint, boolean) 	   PROCEDURE     1  CREATE PROCEDURE public.add_product(IN b_id bigint, IN g_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean)
    LANGUAGE sql
    AS $$insert into products
(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values
(b_id, g_id, sup_p, c_p, quan, ava)$$;
 �   DROP PROCEDURE public.add_product(IN b_id bigint, IN g_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean);
       public          postgres    false            #           1255    18619 @   add_product11(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     �   CREATE FUNCTION public.add_product11(b_id bigint, g_id bigint, sup_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS bigint
    LANGUAGE sql
    RETURN 1;
 t   DROP FUNCTION public.add_product11(b_id bigint, g_id bigint, sup_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            +           1255    18633 p   create_supplier_order(bigint, numeric, bigint, bigint, numeric, bigint, bigint, bigint, bigint, numeric, bigint) 	   PROCEDURE     -  CREATE PROCEDURE public.create_supplier_order(IN s_id bigint, IN c_pr numeric, IN f_pr bigint, IN t_pr bigint, IN s_pr numeric, IN quan bigint, IN sizex bigint, IN sizey bigint, IN sizez bigint, IN wieght numeric, IN b_id bigint)
    LANGUAGE sql
    AS $$

insert into supplier_order
(supplier_id, product_id, from_premise,
to_premise, client_price, supplier_price, quantity, order_date, sizex, sizey, sizez, wieght)
values
(s_id, (select ssuka11(b_id, t_pr, s_pr, c_pr, quan, '0')), f_pr, t_pr, c_pr, s_pr, quan, now(), sizex, sizey, sizez, wieght);

$$;
 �   DROP PROCEDURE public.create_supplier_order(IN s_id bigint, IN c_pr numeric, IN f_pr bigint, IN t_pr bigint, IN s_pr numeric, IN quan bigint, IN sizex bigint, IN sizey bigint, IN sizez bigint, IN wieght numeric, IN b_id bigint);
       public          postgres    false                       1255    18605 6   create_supplier_order1(bigint, bigint, bigint, bigint) 	   PROCEDURE     �   CREATE PROCEDURE public.create_supplier_order1(IN sup_id bigint, IN bar_id bigint, IN f_p bigint, IN t_p bigint)
    LANGUAGE sql
    AS $$show time$$;
 p   DROP PROCEDURE public.create_supplier_order1(IN sup_id bigint, IN bar_id bigint, IN f_p bigint, IN t_p bigint);
       public          postgres    false                       1255    18602 >   new_barcode(bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE     &  CREATE PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country bigint)
    LANGUAGE sql
    AS $$insert into barcodes
(barcode_id, catalog_id, supplier_id, barcode_name, country)
values
(b_id, cat_id, sup_id, b_name, country)$$;
 �   DROP PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country bigint);
       public          postgres    false                       1255    18603 I   new_barcode(bigint, bigint, bigint, character varying, character varying) 	   PROCEDURE     1  CREATE PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$insert into barcodes
(barcode_id, catalog_id, supplier_id, barcode_name, country)
values
(b_id, cat_id, sup_id, b_name, country)$$;
 �   DROP PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       public          postgres    false                       1255    18599 B   new_barcode1(bigint, bigint, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE public.new_barcode1(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$insert into barcodes
(catalog_id, supplier_id, barcode_name, country)
values
(cat_id, sup_id, b_name, country)$$;
 �   DROP PROCEDURE public.new_barcode1(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       public          postgres    false                       1255    18577    new_supplier_order(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.new_supplier_order(IN sup_name integer)
    LANGUAGE sql
    AS $$insert into ans
(
select * from suppliers s
where s.supplier_id = sup_name)
 $$;
 ?   DROP PROCEDURE public.new_supplier_order(IN sup_name integer);
       public          postgres    false            %           1255    18629 8   ssuka(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     H  CREATE FUNCTION public.ssuka(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
      BEGIN
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0');
      END;
  $$;
 j   DROP FUNCTION public.ssuka(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            &           1255    18630 9   ssuka1(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     a  CREATE FUNCTION public.ssuka1(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
      BEGIN
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0') RETURNING product_id;
      END;
  $$;
 k   DROP FUNCTION public.ssuka1(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            '           1255    18631 :   ssuka11(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     R  CREATE FUNCTION public.ssuka11(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS integer
    LANGUAGE sql
    AS $$
    
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0') RETURNING product_id;
     
  $$;
 l   DROP FUNCTION public.ssuka11(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            "           1255    26829 #   accept_goodslist_details_sr(bigint)    FUNCTION     �  CREATE FUNCTION supplier.accept_goodslist_details_sr(s_o_id bigint) RETURNS TABLE(current_supplier_route_id bigint, product_id bigint, quantity bigint, sizex bigint, sizey bigint, sizez bigint, weight bigint, next_point_id bigint, status bigint, delivery_id bigint)
    LANGUAGE plpgsql COST 1 ROWS 1
    AS $$
begin
return QUERY  select  so.current_supplier_route_id, so.product_id, so.quantity, so.sizex, so.sizey, so.sizez, so.weight, sr.next_point_id, sr.status, sr.delivery_id from supplier.supplier_order so, supplier.supplier_routes so
where so.supplier_order_id = s_o_id and sr.supplier_route_id= so.current_supplier_route_id; 
end;

$$;
 C   DROP FUNCTION supplier.accept_goodslist_details_sr(s_o_id bigint);
       supplier          postgres    false    6            /           1255    26835 ,   accept_update_supplier_routes_status(bigint) 	   PROCEDURE     �   CREATE PROCEDURE supplier.accept_update_supplier_routes_status(IN s_r_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_routes set status =3 where supplier_route_id = s_r_id
$$;
 P   DROP PROCEDURE supplier.accept_update_supplier_routes_status(IN s_r_id bigint);
       supplier          postgres    false    6            )           1255    19197 A   add_barcode(bigint, bigint, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE supplier.add_barcode(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$
insert into supplier.barcodes
(catalog_id, supplier_id, barcode_name, country)
values
(cat_id, sup_id, b_name, country)
$$;
 �   DROP PROCEDURE supplier.add_barcode(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       supplier          postgres    false    6            $           1255    19210 E   add_goodslist(bigint, bigint, bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE     ;  CREATE PROCEDURE supplier.add_goodslist(IN pr_id bigint, IN p_id bigint, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w bigint)
    LANGUAGE sql
    AS $$

insert into supplier.goodslist
(product_id, premise_id, quantity, sizex, sizey, sizez, weight)
values
(pr_id, p_id, quan, sx, sy, sz, w);

$$;
 �   DROP PROCEDURE supplier.add_goodslist(IN pr_id bigint, IN p_id bigint, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w bigint);
       supplier          postgres    false    6            *           1255    19198 �   add_premise(bigint, double precision, double precision, character varying, bigint, bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE       CREATE PROCEDURE supplier.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint)
    LANGUAGE sql
    AS $$
insert into supplier.premises
(premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number)
values
(p_type, coord_long, coord_lat, email, phone, postcode, region, city, street, h_number)
$$;
 
  DROP PROCEDURE supplier.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint);
       supplier          postgres    false    6            (           1255    19196 6   add_product(bigint, numeric, numeric, bigint, boolean) 	   PROCEDURE       CREATE PROCEDURE supplier.add_product(IN b_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean)
    LANGUAGE sql
    AS $$
insert into supplier.products
(barcode_id, supplier_price, client_price, quantity, available)
values
(b_id, sup_p, c_p, quan, ava)
$$;
 w   DROP PROCEDURE supplier.add_product(IN b_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean);
       supplier          postgres    false    6            !           1255    19206 C   add_supplier_routes(bigint, bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE       CREATE PROCEDURE supplier.add_supplier_routes(IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint, IN par_id bigint DEFAULT NULL::bigint, IN st bigint DEFAULT 0)
    LANGUAGE sql
    AS $$

insert into supplier.supplier_routes
(parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, status)
values
(par_id, d_id, g_id, p_id, n_p_id, now(), st);

$$;
 �   DROP PROCEDURE supplier.add_supplier_routes(IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint, IN par_id bigint, IN st bigint);
       supplier          postgres    false    6            ,           1255    19199 o   create_supplier_order(bigint, bigint, bigint, bigint, bigint, numeric, bigint, bigint, bigint, bigint, numeric) 	   PROCEDURE       CREATE PROCEDURE supplier.create_supplier_order(IN s_id bigint, IN p_id bigint, IN f_pr bigint, IN t_pr bigint, IN st_s_r_id bigint, IN s_pr numeric, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w numeric)
    LANGUAGE sql
    AS $$

insert into supplier.supplier_order
(supplier_id, product_id, from_premise,
to_premise, start_supplier_route_id, supplier_price, quantity, order_date, sizex, sizey, sizez, wieght)
values
(s_id, p_id, f_pr, t_pr, st_s_r_id, s_pr, quan, now(), sx, sy, sz, w);

$$;
 �   DROP PROCEDURE supplier.create_supplier_order(IN s_id bigint, IN p_id bigint, IN f_pr bigint, IN t_pr bigint, IN st_s_r_id bigint, IN s_pr numeric, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w numeric);
       supplier          postgres    false    6            .           1255    26832 >   create_supplier_routes(bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE     <  CREATE PROCEDURE supplier.create_supplier_routes(IN pr_id bigint, IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint)
    LANGUAGE sql
    AS $$
insert into supplier.supplier_routes
(parent_id, delivery_id, goodslist_id, point_id, next_point_id, status)
values
(pr_id, d_id, g_id, p_id, n_p_id, 0)
$$;
 �   DROP PROCEDURE supplier.create_supplier_routes(IN pr_id bigint, IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint);
       supplier          postgres    false    6            -           1255    26831 !   send_goodslist_details_sr(bigint)    FUNCTION     �  CREATE FUNCTION supplier.send_goodslist_details_sr(s_o_id bigint) RETURNS TABLE(current_supplier_route_id bigint, product_id bigint, quantity bigint, sizex bigint, sizey bigint, sizez bigint, weight bigint, next_point_id bigint, status bigint, delivery_id bigint, goodslist_id bigint)
    LANGUAGE plpgsql COST 1 ROWS 1
    AS $$
begin
return QUERY  select  so.current_supplier_route_id, so.product_id, so.quantity, so.sizex, so.sizey, so.sizez, so.weight, sr.next_point_id, sr.status, sr.delivery_id, sr.goodslist_id from supplier.supplier_order so, 
supplier.supplier_routes so
where so.supplier_order_id = s_o_id and sr.supplier_route_id= so.current_supplier_route_id; 
end;

$$;
 A   DROP FUNCTION supplier.send_goodslist_details_sr(s_o_id bigint);
       supplier          postgres    false    6            0           1255    26836 *   send_update_supplier_routes_status(bigint) 	   PROCEDURE     �   CREATE PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_routes set status = 2 where supplier_route_id = s_r_id
$$;
 N   DROP PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint);
       supplier          postgres    false    6            1           1255    26838 2   send_update_supplier_routes_status(bigint, bigint) 	   PROCEDURE     9  CREATE PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint, IN s_o_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_order set current_supplier_route_id = s_r_id where supplier_order_id = s_o_id ;
update supplier.supplier_routes set status =2 where supplier_route_id = s_r_id;
$$;
 `   DROP PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint, IN s_o_id bigint);
       supplier          postgres    false    6            �            1259    18116    actions    TABLE     p   CREATE TABLE public.actions (
    action_id integer NOT NULL,
    action_name character varying(45) NOT NULL
);
    DROP TABLE public.actions;
       public         heap    postgres    false            �            1259    18581    ans    TABLE       CREATE TABLE public.ans (
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
       public         heap    postgres    false            �            1259    18397 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    18396    auth_group_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    18405    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    18404    auth_group_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    18391    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    18390    auth_permission_id_seq    SEQUENCE     �   ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    18411 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         heap    postgres    false            �            1259    18419    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    18418    auth_user_groups_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    18410    auth_user_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    18425    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    18424 !   auth_user_user_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    243            �            1259    18134    barcodes    TABLE     �   CREATE TABLE public.barcodes (
    barcode_id bigint NOT NULL,
    catalog_id integer NOT NULL,
    supplier_id integer NOT NULL,
    barcode_name character varying(45) NOT NULL,
    country character varying(45) NOT NULL
);
    DROP TABLE public.barcodes;
       public         heap    postgres    false            �            1259    18597    barcodes_sequence    SEQUENCE     {   CREATE SEQUENCE public.barcodes_sequence
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.barcodes_sequence;
       public          postgres    false            �            1259    18121    catalog    TABLE     �   CREATE TABLE public.catalog (
    catalog_id integer NOT NULL,
    catalog_name character varying(45) NOT NULL,
    parent_id integer
);
    DROP TABLE public.catalog;
       public         heap    postgres    false            �            1259    18211    city    TABLE     �   CREATE TABLE public.city (
    city_id integer NOT NULL,
    city_name character varying(45) DEFAULT NULL::character varying
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    18217    client_order    TABLE     �  CREATE TABLE public.client_order (
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
       public         heap    postgres    false            �           0    0    TABLE client_order    ACL     5   GRANT SELECT ON TABLE public.client_order TO client;
          public          postgres    false    220            �            1259    18251    client_routes    TABLE     A  CREATE TABLE public.client_routes (
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
       public         heap    postgres    false            �            1259    18196    clients    TABLE     `  CREATE TABLE public.clients (
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
       public         heap    postgres    false            �           0    0    TABLE clients    ACL     0   GRANT SELECT ON TABLE public.clients TO client;
          public          postgres    false    218            �            1259    18349    control_points    TABLE       CREATE TABLE public.control_points (
    control_points_id integer NOT NULL,
    employee_id integer NOT NULL,
    product_id integer NOT NULL,
    action_id integer NOT NULL,
    premise_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);
 "   DROP TABLE public.control_points;
       public         heap    postgres    false            �            1259    18243    delivery    TABLE     i  CREATE TABLE public.delivery (
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
       public         heap    postgres    false            �            1259    18483    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false            �            1259    18482    django_admin_log_id_seq    SEQUENCE     �   ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    245            �            1259    18383    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    18382    django_content_type_id_seq    SEQUENCE     �   ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            �            1259    18375    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    18374    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    18511    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    18276 	   employees    TABLE     6  CREATE TABLE public.employees (
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
       public         heap    postgres    false            �            1259    18166 	   goodslist    TABLE       CREATE TABLE public.goodslist (
    goodslist_id integer NOT NULL,
    barcode_id bigint NOT NULL,
    premise_id integer NOT NULL,
    quantity integer NOT NULL,
    sizex integer NOT NULL,
    sizey integer NOT NULL,
    sizez integer NOT NULL,
    weight numeric(8,3) NOT NULL
);
    DROP TABLE public.goodslist;
       public         heap    postgres    false            �            1259    18149    premise_type    TABLE     {   CREATE TABLE public.premise_type (
    premise_type_id integer NOT NULL,
    type_decryp character varying(45) NOT NULL
);
     DROP TABLE public.premise_type;
       public         heap    postgres    false            �            1259    18590    premises_sequence    SEQUENCE     {   CREATE SEQUENCE public.premises_sequence
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.premises_sequence;
       public          postgres    false            �            1259    18154    premises    TABLE     �  CREATE TABLE public.premises (
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
       public         heap    postgres    false    248            �            1259    18606    product_sequence    SEQUENCE     z   CREATE SEQUENCE public.product_sequence
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.product_sequence;
       public          postgres    false            �            1259    18181    products    TABLE     L  CREATE TABLE public.products (
    product_id integer DEFAULT nextval('public.product_sequence'::regclass) NOT NULL,
    barcode_id bigint NOT NULL,
    goodslist_id bigint NOT NULL,
    supplier_price numeric(10,2) NOT NULL,
    client_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    available boolean NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false    250            �            1259    18293    region    TABLE     �   CREATE TABLE public.region (
    region_id integer NOT NULL,
    region_name character varying(90) DEFAULT NULL::character varying
);
    DROP TABLE public.region;
       public         heap    postgres    false            �           0    0    TABLE region    ACL     /   GRANT SELECT ON TABLE public.region TO client;
          public          postgres    false    224            �            1259    18611    supplier_order_sequence    SEQUENCE     �   CREATE SEQUENCE public.supplier_order_sequence
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.supplier_order_sequence;
       public          postgres    false            �            1259    18299    supplier_order    TABLE     _  CREATE TABLE public.supplier_order (
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
       public         heap    postgres    false    251            �            1259    18324    supplier_routes    TABLE     O  CREATE TABLE public.supplier_routes (
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
       public         heap    postgres    false                       1259    19203    supplier_routes_seq    SEQUENCE     |   CREATE SEQUENCE public.supplier_routes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.supplier_routes_seq;
       public          postgres    false            �            1259    18126 	   suppliers    TABLE     l  CREATE TABLE public.suppliers (
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
       public         heap    postgres    false            �            1259    18922    actions    TABLE     r   CREATE TABLE supplier.actions (
    action_id integer NOT NULL,
    action_name character varying(45) NOT NULL
);
    DROP TABLE supplier.actions;
       supplier         heap    postgres    false    6            �            1259    18940    barcodes    TABLE     �   CREATE TABLE supplier.barcodes (
    barcode_id bigint NOT NULL,
    catalog_id integer NOT NULL,
    supplier_id integer NOT NULL,
    barcode_name character varying(45) NOT NULL,
    country character varying(45) NOT NULL
);
    DROP TABLE supplier.barcodes;
       supplier         heap    postgres    false    6            �            1259    18927    catalog    TABLE     �   CREATE TABLE supplier.catalog (
    catalog_id integer NOT NULL,
    catalog_name character varying(45) NOT NULL,
    parent_id integer
);
    DROP TABLE supplier.catalog;
       supplier         heap    postgres    false    6                       1259    19012    city    TABLE     �   CREATE TABLE supplier.city (
    city_id integer NOT NULL,
    city_name character varying(45) DEFAULT NULL::character varying
);
    DROP TABLE supplier.city;
       supplier         heap    postgres    false    6            	           1259    19086    client_order    TABLE       CREATE TABLE supplier.client_order (
    client_order_id integer NOT NULL,
    client_id integer NOT NULL,
    product_id integer NOT NULL,
    from_premise_id integer NOT NULL,
    to_premise_id integer NOT NULL,
    start_client_route_id integer,
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
       supplier         heap    postgres    false    6                       1259    19026    client_routes    TABLE     N  CREATE TABLE supplier.client_routes (
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
       supplier         heap    postgres    false    6                       1259    18997    clients    TABLE     b  CREATE TABLE supplier.clients (
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
       supplier         heap    postgres    false    6                       1259    19170    control_points    TABLE       CREATE TABLE supplier.control_points (
    control_points_id integer NOT NULL,
    employee_id integer NOT NULL,
    product_id integer NOT NULL,
    action_id integer NOT NULL,
    premise_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);
 $   DROP TABLE supplier.control_points;
       supplier         heap    postgres    false    6                       1259    19018    delivery    TABLE     k  CREATE TABLE supplier.delivery (
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
       supplier         heap    postgres    false    6            
           1259    19117 	   employees    TABLE     8  CREATE TABLE supplier.employees (
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
       supplier         heap    postgres    false    6                       1259    18982 	   goodslist    TABLE       CREATE TABLE supplier.goodslist (
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
       supplier         heap    postgres    false    6                        1259    18955    premise_type    TABLE     }   CREATE TABLE supplier.premise_type (
    premise_type_id integer NOT NULL,
    type_decryp character varying(45) NOT NULL
);
 "   DROP TABLE supplier.premise_type;
       supplier         heap    postgres    false    6                       1259    18960    premises    TABLE     n  CREATE TABLE supplier.premises (
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
       supplier         heap    postgres    false    6                       1259    18972    products    TABLE     �   CREATE TABLE supplier.products (
    product_id integer NOT NULL,
    barcode_id bigint NOT NULL,
    supplier_price numeric(10,2) NOT NULL,
    client_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    available boolean NOT NULL
);
    DROP TABLE supplier.products;
       supplier         heap    postgres    false    6                       1259    19134    region    TABLE     �   CREATE TABLE supplier.region (
    region_id integer NOT NULL,
    region_name character varying(90) DEFAULT NULL::character varying
);
    DROP TABLE supplier.region;
       supplier         heap    postgres    false    6                       1259    19140    supplier_order    TABLE     #  CREATE TABLE supplier.supplier_order (
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
       supplier         heap    postgres    false    6                       1259    19056    supplier_routes    TABLE     �  CREATE TABLE supplier.supplier_routes (
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
       supplier         heap    postgres    false    270    6            �            1259    18932 	   suppliers    TABLE     n  CREATE TABLE supplier.suppliers (
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
       supplier         heap    postgres    false    6            �          0    18116    actions 
   TABLE DATA           9   COPY public.actions (action_id, action_name) FROM stdin;
    public          postgres    false    210   2�      �          0    18581    ans 
   TABLE DATA           �   COPY public.ans (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    247   O�      �          0    18397 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    235   ��      �          0    18405    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    237   ��      �          0    18391    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    233   ��      �          0    18411 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    239   ��      �          0    18419    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    241   H�      �          0    18425    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    243   e�      �          0    18134    barcodes 
   TABLE DATA           ^   COPY public.barcodes (barcode_id, catalog_id, supplier_id, barcode_name, country) FROM stdin;
    public          postgres    false    213   ��      �          0    18121    catalog 
   TABLE DATA           F   COPY public.catalog (catalog_id, catalog_name, parent_id) FROM stdin;
    public          postgres    false    211   ��      �          0    18211    city 
   TABLE DATA           2   COPY public.city (city_id, city_name) FROM stdin;
    public          postgres    false    219   /�      �          0    18217    client_order 
   TABLE DATA           �   COPY public.client_order (client_order_id, client_id, product_id, from_premise_id, to_premise_id, client_price, order_date, delivery_date, received_date, sizex, sizey, sizez, weight) FROM stdin;
    public          postgres    false    220   �      �          0    18251    client_routes 
   TABLE DATA           �   COPY public.client_routes (client_route_id, delivery_id, client_order_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    public          postgres    false    222   3�      �          0    18196    clients 
   TABLE DATA           �   COPY public.clients (client_id, received_point_id, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, balance, liked) FROM stdin;
    public          postgres    false    218   P�      �          0    18349    control_points 
   TABLE DATA           s   COPY public.control_points (control_points_id, employee_id, product_id, action_id, premise_id, "time") FROM stdin;
    public          postgres    false    227   ��      �          0    18243    delivery 
   TABLE DATA           �   COPY public.delivery (delivery_id, delivery_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    221   ��      �          0    18483    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    245   }�      �          0    18383    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    231   ��      �          0    18375    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    229   ��      �          0    18511    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    246   6�      �          0    18276 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, premise_id, fname, lname, patronymic, email, password, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, hire_date, chief_id) FROM stdin;
    public          postgres    false    223   Q�      �          0    18166 	   goodslist 
   TABLE DATA           p   COPY public.goodslist (goodslist_id, barcode_id, premise_id, quantity, sizex, sizey, sizez, weight) FROM stdin;
    public          postgres    false    216   Q�      �          0    18149    premise_type 
   TABLE DATA           D   COPY public.premise_type (premise_type_id, type_decryp) FROM stdin;
    public          postgres    false    214   ��      �          0    18154    premises 
   TABLE DATA           �   COPY public.premises (premise_id, premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number) FROM stdin;
    public          postgres    false    215   ��      �          0    18181    products 
   TABLE DATA           {   COPY public.products (product_id, barcode_id, goodslist_id, supplier_price, client_price, quantity, available) FROM stdin;
    public          postgres    false    217   ��      �          0    18293    region 
   TABLE DATA           8   COPY public.region (region_id, region_name) FROM stdin;
    public          postgres    false    224   A�      �          0    18299    supplier_order 
   TABLE DATA           �   COPY public.supplier_order (supplier_order_id, supplier_id, product_id, from_premise, to_premise, client_price, supplier_price, quantity, order_date, delivery_date, sizex, sizey, sizez, wieght) FROM stdin;
    public          postgres    false    225   p�      �          0    18324    supplier_routes 
   TABLE DATA           �   COPY public.supplier_routes (supplier_route_id, delivey_id, supplier_order_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    public          postgres    false    226   ��      �          0    18126 	   suppliers 
   TABLE DATA           �   COPY public.suppliers (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    212   ��      �          0    18922    actions 
   TABLE DATA           ;   COPY supplier.actions (action_id, action_name) FROM stdin;
    supplier          postgres    false    252   \�      �          0    18940    barcodes 
   TABLE DATA           `   COPY supplier.barcodes (barcode_id, catalog_id, supplier_id, barcode_name, country) FROM stdin;
    supplier          postgres    false    255   y�      �          0    18927    catalog 
   TABLE DATA           H   COPY supplier.catalog (catalog_id, catalog_name, parent_id) FROM stdin;
    supplier          postgres    false    253   ��      �          0    19012    city 
   TABLE DATA           4   COPY supplier.city (city_id, city_name) FROM stdin;
    supplier          postgres    false    261   ��      �          0    19086    client_order 
   TABLE DATA           �   COPY supplier.client_order (client_order_id, client_id, product_id, from_premise_id, to_premise_id, start_client_route_id, client_price, order_date, delivery_date, received_date, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    265   ��      �          0    19026    client_routes 
   TABLE DATA           �   COPY supplier.client_routes (client_route_id, parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    supplier          postgres    false    263   ��      �          0    18997    clients 
   TABLE DATA           �   COPY supplier.clients (client_id, received_point_id, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, balance, liked) FROM stdin;
    supplier          postgres    false    260   �      �          0    19170    control_points 
   TABLE DATA           u   COPY supplier.control_points (control_points_id, employee_id, product_id, action_id, premise_id, "time") FROM stdin;
    supplier          postgres    false    269   ��      �          0    19018    delivery 
   TABLE DATA           �   COPY supplier.delivery (delivery_id, delivery_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    supplier          postgres    false    262   ��      �          0    19117 	   employees 
   TABLE DATA           �   COPY supplier.employees (employee_id, premise_id, fname, lname, patronymic, email, password, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, hire_date, chief_id) FROM stdin;
    supplier          postgres    false    266   F�      �          0    18982 	   goodslist 
   TABLE DATA           r   COPY supplier.goodslist (goodslist_id, product_id, premise_id, quantity, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    259   F�      �          0    18955    premise_type 
   TABLE DATA           F   COPY supplier.premise_type (premise_type_id, type_decryp) FROM stdin;
    supplier          postgres    false    256   }�      �          0    18960    premises 
   TABLE DATA           �   COPY supplier.premises (premise_id, premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number) FROM stdin;
    supplier          postgres    false    257   ��      �          0    18972    products 
   TABLE DATA           o   COPY supplier.products (product_id, barcode_id, supplier_price, client_price, quantity, available) FROM stdin;
    supplier          postgres    false    258   ��      �          0    19134    region 
   TABLE DATA           :   COPY supplier.region (region_id, region_name) FROM stdin;
    supplier          postgres    false    267   ��      �          0    19140    supplier_order 
   TABLE DATA           �   COPY supplier.supplier_order (supplier_order_id, supplier_id, product_id, from_premise, to_premise, current_supplier_route_id, supplier_price, quantity, order_date, delivery_date, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    268   �      �          0    19056    supplier_routes 
   TABLE DATA           �   COPY supplier.supplier_routes (supplier_route_id, parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    supplier          postgres    false    264   <�      �          0    18932 	   suppliers 
   TABLE DATA           �   COPY supplier.suppliers (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    supplier          postgres    false    254   ��      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    234            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    236            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);
          public          postgres    false    232            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    240            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          postgres    false    238            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    242            �           0    0    barcodes_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.barcodes_sequence', 20, true);
          public          postgres    false    249                        0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    244                       0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);
          public          postgres    false    230                       0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);
          public          postgres    false    228                       0    0    premises_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.premises_sequence', 17, true);
          public          postgres    false    248                       0    0    product_sequence    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.product_sequence', 34, true);
          public          postgres    false    250                       0    0    supplier_order_sequence    SEQUENCE SET     F   SELECT pg_catalog.setval('public.supplier_order_sequence', 23, true);
          public          postgres    false    251                       0    0    supplier_routes_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.supplier_routes_seq', 6, true);
          public          postgres    false    270            `           2606    18120    actions actions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);
 >   ALTER TABLE ONLY public.actions DROP CONSTRAINT actions_pkey;
       public            postgres    false    210            �           2606    18509    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    235            �           2606    18440 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    237    237            �           2606    18409 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    237            �           2606    18401    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    235            �           2606    18431 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    233    233            �           2606    18395 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    233            �           2606    18423 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    241            �           2606    18455 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    241    241            �           2606    18415    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    239            �           2606    18429 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    243            �           2606    18469 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    243    243            �           2606    18504     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    239            f           2606    18138    barcodes barcodes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.barcodes
    ADD CONSTRAINT barcodes_pkey PRIMARY KEY (barcode_id);
 @   ALTER TABLE ONLY public.barcodes DROP CONSTRAINT barcodes_pkey;
       public            postgres    false    213            b           2606    18125    catalog catalog_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.catalog
    ADD CONSTRAINT catalog_pkey PRIMARY KEY (catalog_id);
 >   ALTER TABLE ONLY public.catalog DROP CONSTRAINT catalog_pkey;
       public            postgres    false    211            r           2606    18216    city city_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    219            t           2606    18222    client_order client_order_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT client_order_pkey PRIMARY KEY (client_order_id);
 H   ALTER TABLE ONLY public.client_order DROP CONSTRAINT client_order_pkey;
       public            postgres    false    220            x           2606    18255     client_routes client_routes_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT client_routes_pkey PRIMARY KEY (client_route_id);
 J   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT client_routes_pkey;
       public            postgres    false    222            p           2606    18205    clients clients_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    218            �           2606    18353 "   control_points control_points_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT control_points_pkey PRIMARY KEY (control_points_id);
 L   ALTER TABLE ONLY public.control_points DROP CONSTRAINT control_points_pkey;
       public            postgres    false    227            v           2606    18250    delivery delivery_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (delivery_id);
 @   ALTER TABLE ONLY public.delivery DROP CONSTRAINT delivery_pkey;
       public            postgres    false    221            �           2606    18490 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    245            �           2606    18389 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    231    231            �           2606    18387 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    231            �           2606    18381 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    229            �           2606    18517 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    246            z           2606    18282    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    223            l           2606    18170    goodslist goodslist_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.goodslist
    ADD CONSTRAINT goodslist_pkey PRIMARY KEY (goodslist_id);
 B   ALTER TABLE ONLY public.goodslist DROP CONSTRAINT goodslist_pkey;
       public            postgres    false    216            h           2606    18153    premise_type premise_type_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.premise_type
    ADD CONSTRAINT premise_type_pkey PRIMARY KEY (premise_type_id);
 H   ALTER TABLE ONLY public.premise_type DROP CONSTRAINT premise_type_pkey;
       public            postgres    false    214            j           2606    18160    premises premises_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT premises_pkey PRIMARY KEY (premise_id);
 @   ALTER TABLE ONLY public.premises DROP CONSTRAINT premises_pkey;
       public            postgres    false    215            n           2606    18185    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    217            |           2606    18298    region region_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);
 <   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pkey;
       public            postgres    false    224            ~           2606    18303 "   supplier_order supplier_order_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT supplier_order_pkey PRIMARY KEY (supplier_order_id);
 L   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT supplier_order_pkey;
       public            postgres    false    225            �           2606    18328 $   supplier_routes supplier_routes_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT supplier_routes_pkey PRIMARY KEY (supplier_route_id);
 N   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT supplier_routes_pkey;
       public            postgres    false    226            d           2606    18133    suppliers suppliers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public            postgres    false    212            �           2606    18926    actions actions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);
 @   ALTER TABLE ONLY supplier.actions DROP CONSTRAINT actions_pkey;
       supplier            postgres    false    252            �           2606    18944    barcodes barcodes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT barcodes_pkey PRIMARY KEY (barcode_id);
 B   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT barcodes_pkey;
       supplier            postgres    false    255            �           2606    18931    catalog catalog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY supplier.catalog
    ADD CONSTRAINT catalog_pkey PRIMARY KEY (catalog_id);
 @   ALTER TABLE ONLY supplier.catalog DROP CONSTRAINT catalog_pkey;
       supplier            postgres    false    253            �           2606    19017    city city_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY supplier.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 :   ALTER TABLE ONLY supplier.city DROP CONSTRAINT city_pkey;
       supplier            postgres    false    261            �           2606    19091    client_order client_order_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT client_order_pkey PRIMARY KEY (client_order_id);
 J   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT client_order_pkey;
       supplier            postgres    false    265            �           2606    19030     client_routes client_routes_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT client_routes_pkey PRIMARY KEY (client_route_id);
 L   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT client_routes_pkey;
       supplier            postgres    false    263            �           2606    19006    clients clients_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 @   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT clients_pkey;
       supplier            postgres    false    260            �           2606    19174 "   control_points control_points_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT control_points_pkey PRIMARY KEY (control_points_id);
 N   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT control_points_pkey;
       supplier            postgres    false    269            �           2606    19025    delivery delivery_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY supplier.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (delivery_id);
 B   ALTER TABLE ONLY supplier.delivery DROP CONSTRAINT delivery_pkey;
       supplier            postgres    false    262            �           2606    19123    employees employees_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 D   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT employees_pkey;
       supplier            postgres    false    266            �           2606    18986    goodslist goodslist_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT goodslist_pkey PRIMARY KEY (goodslist_id);
 D   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT goodslist_pkey;
       supplier            postgres    false    259            �           2606    18959    premise_type premise_type_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.premise_type
    ADD CONSTRAINT premise_type_pkey PRIMARY KEY (premise_type_id);
 J   ALTER TABLE ONLY supplier.premise_type DROP CONSTRAINT premise_type_pkey;
       supplier            postgres    false    256            �           2606    18966    premises premises_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT premises_pkey PRIMARY KEY (premise_id);
 B   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT premises_pkey;
       supplier            postgres    false    257            �           2606    18976    products products_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 B   ALTER TABLE ONLY supplier.products DROP CONSTRAINT products_pkey;
       supplier            postgres    false    258            �           2606    19139    region region_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY supplier.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY supplier.region DROP CONSTRAINT region_pkey;
       supplier            postgres    false    267            �           2606    19144 "   supplier_order supplier_order_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT supplier_order_pkey PRIMARY KEY (supplier_order_id);
 N   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT supplier_order_pkey;
       supplier            postgres    false    268            �           2606    19060 $   supplier_routes supplier_routes_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT supplier_routes_pkey PRIMARY KEY (supplier_route_id);
 P   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT supplier_routes_pkey;
       supplier            postgres    false    264            �           2606    18939    suppliers suppliers_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);
 D   ALTER TABLE ONLY supplier.suppliers DROP CONSTRAINT suppliers_pkey;
       supplier            postgres    false    254            �           1259    18510    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    235            �           1259    18451 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    237            �           1259    18452 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    237            �           1259    18437 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    233            �           1259    18467 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    241            �           1259    18466 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    241            �           1259    18481 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    243            �           1259    18480 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    243            �           1259    18505     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    239            �           1259    18501 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    245            �           1259    18502 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    245            �           1259    18519 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    246            �           1259    18518 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    246            �           2606    18354    control_points action_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT action_id_fk FOREIGN KEY (action_id) REFERENCES public.actions(action_id);
 E   ALTER TABLE ONLY public.control_points DROP CONSTRAINT action_id_fk;
       public          postgres    false    210    227    3424                        2606    18446 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    233    237    3469            �           2606    18441 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    237    235    3474            �           2606    18432 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    231    233    3464                       2606    18461 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    241    235    3474                       2606    18456 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    239    241    3482                       2606    18475 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    3469    243    233                       2606    18470 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    243    239    3482            �           2606    18171    goodslist barcode_fk_g    FK CONSTRAINT     �   ALTER TABLE ONLY public.goodslist
    ADD CONSTRAINT barcode_fk_g FOREIGN KEY (barcode_id) REFERENCES public.barcodes(barcode_id);
 @   ALTER TABLE ONLY public.goodslist DROP CONSTRAINT barcode_fk_g;
       public          postgres    false    216    213    3430            �           2606    18186    products barcode_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT barcode_fk_p FOREIGN KEY (barcode_id) REFERENCES public.barcodes(barcode_id);
 ?   ALTER TABLE ONLY public.products DROP CONSTRAINT barcode_fk_p;
       public          postgres    false    3430    213    217            �           2606    18139    barcodes category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.barcodes
    ADD CONSTRAINT category_id_fk FOREIGN KEY (catalog_id) REFERENCES public.catalog(catalog_id);
 A   ALTER TABLE ONLY public.barcodes DROP CONSTRAINT category_id_fk;
       public          postgres    false    213    3426    211            �           2606    18283    employees chief_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT chief_id_fk FOREIGN KEY (chief_id) REFERENCES public.employees(employee_id);
 ?   ALTER TABLE ONLY public.employees DROP CONSTRAINT chief_id_fk;
       public          postgres    false    223    3450    223            �           2606    18552    clients city_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT city_id_fk_c FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT city_id_fk_c;
       public          postgres    false    3442    218    219            �           2606    18557    delivery city_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT city_id_fk_c FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 ?   ALTER TABLE ONLY public.delivery DROP CONSTRAINT city_id_fk_c;
       public          postgres    false    219    221    3442            �           2606    18562    employees city_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT city_id_fk_e FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 @   ALTER TABLE ONLY public.employees DROP CONSTRAINT city_id_fk_e;
       public          postgres    false    223    219    3442            �           2606    18567    premises city_id_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT city_id_fk_p FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 ?   ALTER TABLE ONLY public.premises DROP CONSTRAINT city_id_fk_p;
       public          postgres    false    3442    219    215            �           2606    18572    suppliers city_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT city_id_fk_s FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 @   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT city_id_fk_s;
       public          postgres    false    212    3442    219            �           2606    18223    client_order client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES public.clients(client_id);
 @   ALTER TABLE ONLY public.client_order DROP CONSTRAINT client_fk;
       public          postgres    false    3440    218    220            �           2606    18256     client_routes client_order_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT client_order_id_fk FOREIGN KEY (client_order_id) REFERENCES public.client_order(client_order_id);
 J   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT client_order_id_fk;
       public          postgres    false    3444    220    222            �           2606    18261    client_routes delivery_ud_kf_cr    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT delivery_ud_kf_cr FOREIGN KEY (delivery_id) REFERENCES public.delivery(delivery_id);
 I   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT delivery_ud_kf_cr;
       public          postgres    false    3446    222    221            �           2606    18329     supplier_routes delivey_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT delivey_id_fk_sr FOREIGN KEY (delivey_id) REFERENCES public.delivery(delivery_id);
 J   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT delivey_id_fk_sr;
       public          postgres    false    3446    221    226                       2606    18491 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    231    3464    245                       2606    18496 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    245    3482    239            �           2606    18359     control_points employee_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT employee_id_cp_fk FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);
 J   ALTER TABLE ONLY public.control_points DROP CONSTRAINT employee_id_cp_fk;
       public          postgres    false    3450    223    227            �           2606    18228    client_order from_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT from_premise_co FOREIGN KEY (from_premise_id) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.client_order DROP CONSTRAINT from_premise_co;
       public          postgres    false    3434    215    220            �           2606    18304    supplier_order from_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT from_premise_so FOREIGN KEY (from_premise) REFERENCES public.premises(premise_id);
 H   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT from_premise_so;
       public          postgres    false    215    3434    225            �           2606    18620    products goodslist_fk_g    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT goodslist_fk_g FOREIGN KEY (goodslist_id) REFERENCES public.goodslist(goodslist_id);
 A   ALTER TABLE ONLY public.products DROP CONSTRAINT goodslist_fk_g;
       public          postgres    false    217    216    3436            �           2606    18266 !   client_routes next_point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT next_point_id_fk_co FOREIGN KEY (next_point_id) REFERENCES public.premises(premise_id);
 K   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT next_point_id_fk_co;
       public          postgres    false    222    3434    215            �           2606    18334 #   supplier_routes next_point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT next_point_id_fk_so FOREIGN KEY (next_point_id) REFERENCES public.premises(premise_id);
 M   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT next_point_id_fk_so;
       public          postgres    false    226    3434    215            �           2606    18271    client_routes point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT point_id_fk_co FOREIGN KEY (point_id) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT point_id_fk_co;
       public          postgres    false    3434    222    215            �           2606    18339    supplier_routes point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT point_id_fk_so FOREIGN KEY (point_id) REFERENCES public.premises(premise_id);
 H   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT point_id_fk_so;
       public          postgres    false    226    215    3434            �           2606    18364    control_points premise_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT premise_id_cp_fk FOREIGN KEY (premise_id) REFERENCES public.premises(premise_id);
 I   ALTER TABLE ONLY public.control_points DROP CONSTRAINT premise_id_cp_fk;
       public          postgres    false    215    227    3434            �           2606    18288    employees premise_id_e_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT premise_id_e_fk FOREIGN KEY (premise_id) REFERENCES public.premises(premise_id);
 C   ALTER TABLE ONLY public.employees DROP CONSTRAINT premise_id_e_fk;
       public          postgres    false    223    3434    215            �           2606    18176    goodslist premise_id_g_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.goodslist
    ADD CONSTRAINT premise_id_g_fk FOREIGN KEY (premise_id) REFERENCES public.premises(premise_id);
 C   ALTER TABLE ONLY public.goodslist DROP CONSTRAINT premise_id_g_fk;
       public          postgres    false    216    215    3434            �           2606    18161    premises premise_type_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT premise_type_fk FOREIGN KEY (premise_type_id) REFERENCES public.premise_type(premise_type_id);
 B   ALTER TABLE ONLY public.premises DROP CONSTRAINT premise_type_fk;
       public          postgres    false    215    214    3432            �           2606    18233    client_order product_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT product_fk_co FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 D   ALTER TABLE ONLY public.client_order DROP CONSTRAINT product_fk_co;
       public          postgres    false    220    217    3438            �           2606    18369    control_points product_fk_cp    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT product_fk_cp FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 F   ALTER TABLE ONLY public.control_points DROP CONSTRAINT product_fk_cp;
       public          postgres    false    217    227    3438            �           2606    18309    supplier_order product_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT product_fk_so FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 F   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT product_fk_so;
       public          postgres    false    225    3438    217            �           2606    18206    clients received_point_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT received_point_id_fk FOREIGN KEY (received_point_id) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.clients DROP CONSTRAINT received_point_id_fk;
       public          postgres    false    218    3434    215            �           2606    18547    clients region_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT region_id_fk_c FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 @   ALTER TABLE ONLY public.clients DROP CONSTRAINT region_id_fk_c;
       public          postgres    false    3452    224    218            �           2606    18542    delivery region_id_fk_d    FK CONSTRAINT     �   ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT region_id_fk_d FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 A   ALTER TABLE ONLY public.delivery DROP CONSTRAINT region_id_fk_d;
       public          postgres    false    3452    221    224            �           2606    18537    employees region_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT region_id_fk_e FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT region_id_fk_e;
       public          postgres    false    3452    224    223            �           2606    18527    premises region_id_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT region_id_fk_p FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 A   ALTER TABLE ONLY public.premises DROP CONSTRAINT region_id_fk_p;
       public          postgres    false    224    3452    215            �           2606    18532    suppliers region_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT region_id_fk_s FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT region_id_fk_s;
       public          postgres    false    212    3452    224            �           2606    18314    supplier_order supplier_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT supplier_fk FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);
 D   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT supplier_fk;
       public          postgres    false    225    212    3428            �           2606    18144    barcodes supplier_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.barcodes
    ADD CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);
 A   ALTER TABLE ONLY public.barcodes DROP CONSTRAINT supplier_id_fk;
       public          postgres    false    212    213    3428            �           2606    18344 $   supplier_routes supplier_order_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT supplier_order_id_fk FOREIGN KEY (supplier_order_id) REFERENCES public.supplier_order(supplier_order_id);
 N   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT supplier_order_id_fk;
       public          postgres    false    225    226    3454            �           2606    18238    client_order to_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT to_premise_co FOREIGN KEY (to_premise_id) REFERENCES public.premises(premise_id);
 D   ALTER TABLE ONLY public.client_order DROP CONSTRAINT to_premise_co;
       public          postgres    false    220    3434    215            �           2606    18319    supplier_order to_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT to_premise_so FOREIGN KEY (to_premise) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT to_premise_so;
       public          postgres    false    225    3434    215            $           2606    19175    control_points action_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT action_id_fk FOREIGN KEY (action_id) REFERENCES supplier.actions(action_id);
 G   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT action_id_fk;
       supplier          postgres    false    252    3507    269            
           2606    18977    products barcode_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.products
    ADD CONSTRAINT barcode_fk_p FOREIGN KEY (barcode_id) REFERENCES supplier.barcodes(barcode_id);
 A   ALTER TABLE ONLY supplier.products DROP CONSTRAINT barcode_fk_p;
       supplier          postgres    false    255    3513    258                       2606    18945    barcodes category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT category_id_fk FOREIGN KEY (catalog_id) REFERENCES supplier.catalog(catalog_id);
 C   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT category_id_fk;
       supplier          postgres    false    3509    255    253                       2606    19124    employees chief_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT chief_id_fk FOREIGN KEY (chief_id) REFERENCES supplier.employees(employee_id);
 A   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT chief_id_fk;
       supplier          postgres    false    266    266    3535                       2606    19092    client_order client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES supplier.clients(client_id);
 B   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT client_fk;
       supplier          postgres    false    265    260    3523                       2606    19031    client_routes delivery_ud_kf_cr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT delivery_ud_kf_cr FOREIGN KEY (delivery_id) REFERENCES supplier.delivery(delivery_id);
 K   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT delivery_ud_kf_cr;
       supplier          postgres    false    3527    262    263                       2606    19061     supplier_routes delivey_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT delivey_id_fk_sr FOREIGN KEY (delivery_id) REFERENCES supplier.delivery(delivery_id);
 L   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT delivey_id_fk_sr;
       supplier          postgres    false    3527    264    262            %           2606    19180     control_points employee_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT employee_id_cp_fk FOREIGN KEY (employee_id) REFERENCES supplier.employees(employee_id);
 L   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT employee_id_cp_fk;
       supplier          postgres    false    3535    266    269                       2606    19097    client_order from_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT from_premise_co FOREIGN KEY (from_premise_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT from_premise_co;
       supplier          postgres    false    265    3517    257                       2606    19145    supplier_order from_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT from_premise_so FOREIGN KEY (from_premise) REFERENCES supplier.premises(premise_id);
 J   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT from_premise_so;
       supplier          postgres    false    257    268    3517                       2606    19046     client_routes goodslist_id_fk_cr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT goodslist_id_fk_cr FOREIGN KEY (goodslist_id) REFERENCES supplier.goodslist(goodslist_id);
 L   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT goodslist_id_fk_cr;
       supplier          postgres    false    3521    263    259                       2606    19076 "   supplier_routes goodslist_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT goodslist_id_fk_sr FOREIGN KEY (goodslist_id) REFERENCES supplier.goodslist(goodslist_id);
 N   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT goodslist_id_fk_sr;
       supplier          postgres    false    3521    259    264                       2606    19036 !   client_routes next_point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT next_point_id_fk_co FOREIGN KEY (next_point_id) REFERENCES supplier.premises(premise_id);
 M   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT next_point_id_fk_co;
       supplier          postgres    false    257    263    3517                       2606    19066 #   supplier_routes next_point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT next_point_id_fk_so FOREIGN KEY (next_point_id) REFERENCES supplier.premises(premise_id);
 O   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT next_point_id_fk_so;
       supplier          postgres    false    3517    257    264                       2606    19051    client_routes parent_id_fk_cr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT parent_id_fk_cr FOREIGN KEY (parent_id) REFERENCES supplier.client_routes(client_route_id);
 I   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT parent_id_fk_cr;
       supplier          postgres    false    263    3529    263                       2606    19081    supplier_routes parent_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT parent_id_fk_sr FOREIGN KEY (parent_id) REFERENCES supplier.supplier_routes(supplier_route_id);
 K   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT parent_id_fk_sr;
       supplier          postgres    false    3531    264    264                       2606    19041    client_routes point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT point_id_fk_co FOREIGN KEY (point_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT point_id_fk_co;
       supplier          postgres    false    263    3517    257                       2606    19071    supplier_routes point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT point_id_fk_so FOREIGN KEY (point_id) REFERENCES supplier.premises(premise_id);
 J   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT point_id_fk_so;
       supplier          postgres    false    264    3517    257            &           2606    19185    control_points premise_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT premise_id_cp_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 K   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT premise_id_cp_fk;
       supplier          postgres    false    257    3517    269                       2606    19129    employees premise_id_e_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT premise_id_e_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 E   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT premise_id_e_fk;
       supplier          postgres    false    3517    257    266                       2606    18992    goodslist premise_id_g_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT premise_id_g_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 E   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT premise_id_g_fk;
       supplier          postgres    false    3517    257    259            	           2606    18967    premises premise_type_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT premise_type_fk FOREIGN KEY (premise_type_id) REFERENCES supplier.premise_type(premise_type_id);
 D   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT premise_type_fk;
       supplier          postgres    false    257    3515    256                       2606    19102    client_order product_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT product_fk_co FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 F   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT product_fk_co;
       supplier          postgres    false    3519    265    258            '           2606    19190    control_points product_fk_cp    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT product_fk_cp FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 H   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT product_fk_cp;
       supplier          postgres    false    3519    269    258                       2606    18987    goodslist product_fk_g    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT product_fk_g FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 B   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT product_fk_g;
       supplier          postgres    false    258    3519    259                        2606    19150    supplier_order product_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT product_fk_so FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 H   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT product_fk_so;
       supplier          postgres    false    258    268    3519                       2606    19007    clients received_point_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT received_point_id_fk FOREIGN KEY (received_point_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT received_point_id_fk;
       supplier          postgres    false    260    257    3517                       2606    19112 %   client_order start_client_route_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT start_client_route_id_fk FOREIGN KEY (start_client_route_id) REFERENCES supplier.client_routes(client_route_id);
 Q   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT start_client_route_id_fk;
       supplier          postgres    false    3529    265    263            #           2606    19165 )   supplier_order start_supplier_route_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT start_supplier_route_id_fk FOREIGN KEY (current_supplier_route_id) REFERENCES supplier.supplier_routes(supplier_route_id);
 U   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT start_supplier_route_id_fk;
       supplier          postgres    false    3531    264    268            !           2606    19155    supplier_order supplier_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT supplier_fk FOREIGN KEY (supplier_id) REFERENCES supplier.suppliers(supplier_id);
 F   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT supplier_fk;
       supplier          postgres    false    3511    254    268                       2606    18950    barcodes supplier_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES supplier.suppliers(supplier_id);
 C   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT supplier_id_fk;
       supplier          postgres    false    255    254    3511                       2606    19107    client_order to_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT to_premise_co FOREIGN KEY (to_premise_id) REFERENCES supplier.premises(premise_id);
 F   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT to_premise_co;
       supplier          postgres    false    257    265    3517            "           2606    19160    supplier_order to_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT to_premise_so FOREIGN KEY (to_premise) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT to_premise_so;
       supplier          postgres    false    257    3517    268            �      x������ � �      �   O   x�3���,J�/�O+���L.��,���\NsKScc3#scCSNc##CN#SN3��/6\�qa#��	g�W� P^v      �      x������ � �      �      x������ � �      �   �  x�m�K��0D�xYA+���6��`����Z�}�~�؜���6�ݽ.�0\����^���l��w?C���۽NQq��"��{�M�q��[ F�Oa�C%)���=��8��<H�	SIq
u���>ł@�6,Q�A��ZR�X���A`�m�U���+5!r �Y
A<.H�{uKv���������@)W �@�k��t|X�������]���2(��}��F
I`��V�Jx�'���2:�U�%ի��Z�02��;3��0�v�@a��U����n�| �:~�82�293��S�f?b�������O�D9��)���)
	�r4 (! ���8.������l�ڸx�By����r6c(1�o��D��{���c�+�#S(o3��R�f
� u>f&�A������qn�l<�i�ܔ���|�X'XafE��g���Q�Spt�����-0<���� ��&R�ڂ��6Qm��[H�aΔ���k�PaO�R�V�A5�R9М��߼'��3��T�%NeDp �8Ai��^�L��<�{�,��5�#��dա/�*�DU�t]CBVp��_�?n���.�cS��I�3�&I�ˤȗ�F�8]�i��n��-�&L��@��0��X��0+2��x'aN�l����HX�:Ic�,$�T1I�BR��9HR���=���_��2����FϚZe�X����J%�X�w��J��X�IE}x�5˯�E�;7g��D�g�3�MD����RI��*6׻��n��έh�0i��C���T��v�Q͟jD��&@|yt��:XQ�z��R�`]}��K�u͉�Jk�to���BnMt[{=����@�=�����aW���4��O��Ӱ�il�86�J��@1�*���L��J.($��1�?�wE�      �   �   x�e��
�@F��S�p��O�$E�B)a�y�}�Zt�8���Q���1<�$ ��D�gD���0�Z��g�%c~�7"	���>d^����u�M��,�ǑLnl�N?�F÷d��G���t�%B(S��LQ���Qۦ�

����|�i�)���B^���?F@R7�t�	I�/4E9�      �      x������ � �      �      x������ � �      �   Z   x�3�4�4�LII�.3##S3��1gzRRz���)���!^�qa�ņ��;.캰��¬;.6]�pa'��������e1z\\\ ��.�      �   3   x�3�0�[/l�8c���@"/6_�t��Ӑ˘3##H��qqq 46�      �   �  x�U�Ir�8E׉S��8si�+�ly
˪��7PEA� ��4���^��+�w ���#z��_�o�v�zѣv�~r�H���v0{�F��d��\a���V"�{�(|mz�yN[�)�DA���Q��\��R���n�jozLˈ^�0�yիխ�'!czѮ2����m�T%d����^��h���ۣ�$�v��7����Y�����&Z�ݢ}K^Wʉ(�{��Ъ�QL?�]��nUefݔ�\3�<�эr���"��4��k?U �~Q"*���/���� L,�����qDOj��^��Q_yA���cz�Z%�ގS��>���4��"��z�:�9n���m�E\���׵"Y{����;�Dҍ��:��m�N$1m&/I�Qս-��}��Zӛޫ�d�l��ڴ"��qr]ت���_�*-����W��kר�֭���??Њh��V��4�$Gۊ4�����;)��68*�8��V"�C:�DZ ԃ�~��Fi�/�����Tdko>!��T��(Y�7jn�"��טQ��{���p�m�ki u-B��u79-��Ȁ������1"C$
�w�_��bh�9�8�yD��v�w|��Z�(�R�H
%�kY��E��ڛ;��������z=���Kzq�����u���ҳr�wp!a���G���(p��	l5����n̑��Q�l�>oUq??��O]���?�0�EQp���\=㪭(Jz��o(�r�iU�f,�/H2�Sʈ^�SJ�1��(�iE��C��)�؊�e�<�@�V���kjD�t��[�j�PA��{�(K\yq�;k��,*��.����B�Ћ��lW[X��Z_8T��M�z��sK� M����h(�NͰ�\��p�P���A��i?>? �ؙKWJ���V�1��0L΋%��-��ՈvJ����t T� ,���(�o�n�x�j�/�P-
⫓�-H�XgZO]I�m���	�07�t��Îs�/�*�v�R���ӱf���BP��P�pVo����$� q@,��Aǭv���" �ϕ�Y�
B�����	A�P��>�H'�38�{���	��'30Y+�6�S��|4���a1��w��{�P�`�/?��a �z?L�B�\�G�AU��I�/%A���������9=7#�C�kRc����,=�z����gHSz1��f�}ȶ�C�)�Z	}o��*��[��CD -C��L���a\ݵ&L�uhd[_��}�K~�@���^m�ρ=j�Jx���hW�`c�	�i���Ihs^�8�j_
@o I �s����/bH��׃K��o�������'��0��G�����Î��O���Q�2���ِt��́��,~�|��HQ�S�y�䛩�Z�4���"H�UM���γ���m�n���hg᩷+6y���@r����ڴ~�>2�B�%�`��?R[A�����Z�!���8�      �      x������ � �      �      x������ � �      �   e   x�U˱�0D�����t"�%2��L�	2H��Fa�&���c!���LCp_K �p}��~�}OЌ��)�f��ш�Ú���W�	��dw�^W?zl��/���      �      x������ � �      �   �   x�5�1
1D��]\������<�6B�-�<���PD��;|odR�k�a��JJ�|X"b�O5��x�WC9#li�&k��!wy�*Y7��^[x�,�����<F�3r�c��y�Ɠ��:p�J���~��� �/�      �      x������ � �      �   �   x�mP�n� }�3�v�w�uR��ʐH�0L��Ϥ�����Ǘs���9,*҄K�+ek�Q	��-0ܑ)SMp�7�1�E9Z���5!�\�v͏��gMi�앳�
!�:(�>�>�ŠO;�qj���!�S�Q͎��"���7}���+M(�KG/^2�1Q�T\���~Q�ҝ���s\@�zJ�յ��K!�rk$Ds:��~�b���X2�ū�l8\��tv�mv�e�� � �+��      �   �  x����n� �������V0��{��1�"a�Ťj�~����M�Ȓ�7Ù����8*��B�l��U@ ~Q�5?h�
�+!/�ʚ��9@�u��#i��VH�::k�8�`N�;bD$q]�k�]4aCD���A.囂�(ӏ�_���Lo'��e4��t��a���M2�g�)p;�����*��Yo�D��:���P�B�E*}�8�i�_$���wj�6=D��0��Щ���,���*���0����Y�\O�9�	ˋu��uhQ�������@�����gXr
e����M߷)�J.�e�M����:���6��*�O�7� t-�T��>!i�g�V�����DF�*����	[Ŕ`0��Q؀W��v -�u��+�]!(\©ޝ>��_o�;�	IY�2L~��~��tl��#9]@6aݫ&���RS	�z���N��]F��@7[X�	/���=�`Fgl���.�!?��I�y�Slc4����췸���?z������(-��l��p�^%�v p�!ה���v���㙐`B�A�f��ig���?�;�w�y�s-i�3	|#�/=�jAs"A�(<g�	ϣ�9LKŜE�Q�:��P:����&�;�pDd�ٖg
��z���UqNX6��
�5�)��,��r8���j�      �     x���r�0  �s���;8�An�F�b��#�H�����=�4�n/>0��A�MSE������~�J<�Ȫ	b�vy������5L��V������I�m-���;��\%���}M} �(
���5�-S�IZb�C�J���?���/��.w�5��Y��x���5�z�Ã���.��u�����>�Q���p�#]S,Se�=�&���<�]Ն���6N���C/�`;J2��ѽ�?���,>UhdBu�i�/J�3I��P�^�      �   �   x�͔�JA��o�����f��]c��9s�&��$Il�,| �!�`��^ak]>��+�SYDȭ<�Nd/ϲ���U奻��7W�{�׸���v9�������N�l>��-pT�6'�cF�)8��G��`8��Cw"�H`k���`u-sA����!�S��t��t?й��|�tì�B�tD�b�tz;�(��]_޴([�]jRj�f�>%8�;�N*���1j�x`�yd<.      �   +   x�3�4�0225�44��5��F� l�	�@����W� ���      �   ^   x�U���0�)2���)(�c !� P2ý���l�O.�Dn�-�Nx���I[^;�ʃ�Km�89y�=:���j
y�i?�      �   �   x���M�0�����-�y7�!5`p�A<���9����i�M�73�,�6iHCӎ箬��Зm�U�|pΣc�98
E ���x�4g2����3��n�.+ ��� 4�Ds`�F:���L��=�X�`�Q�	.,e�1�-3iPU�TO_&iHފ1�A���[�f�>3Ƽ ��{{      �   g   x�u���@D�P�3dCz���e!Rr!�f���K(��a��̔K�3��Rg7��o�����}k��܊do�3����#(ʑ>�9��D9�p��x�*�      �     x���_N�@Ɵ�S���
Jb�6w�=A����UM�P!�ZB���
�+�$��[��]�>������|���vC%-2���/I�ΓE�������b�����z��I�g��>�}�\�2���V��X��w�Q����Rf�!`D1��S(j�'}"3�IbMJ�X�Y^���+�����m��2��v��L�=�Wj"c>�.�e�R8���h@�K��|B�/`oTd5�${�~j��8q��U2/d�!�9J�C�L3��7,��xg\T�z�`Q旱r�4� �	����*���x0pE�OL��UmĿE�)�ք��`�r_��I���"6.R�O�h�6p���2\�Z6�6P�y�)\ii�#��:u1GU笩M?�O�ȓ�߲b�Ls_��)�@�ey�!���69aN}n�Y�œ��d1�q*��l({3!�����_Q��*O�%~k�����l=�(�N�:����g�̳:�P��2Q���zN���S�u�,��0}N�C����hEk�	^����N��ˇx�l��ܘ-ẈZ�Nk�@�3����.�CRٸUv�v�i}63�2���fñ�p[� %�a��X��%�B�Y9��,h��^�ck��&�Ml���L�!�y�#2_��mY�c�=D3��۶Ц�g(Ţb;v�{(�H�J��I�6�HF�&و+r'����M�֌�f�M�s3`a\�S-��6��y��.g�S0e��-q��)��iy��i�FM����	m_�p�ڄ����2������>A�ʊ��y���\/�c�S�k��l�pZ�"2!^k��E���fq���F�YmGw���N�:��3rK_fe��.�(�r�f_:���"�r�"���J2(�5"r�����B�>���r�@qͷ���i��Xy]{X;<G�WW���-C�0;��@���\�rs_���2s]B�+~���u ��0��P��c�x�������	�bW9��l�M�����#Q���=1�ĵ
�eS����n7�Ϳ�*�p      �      x������ � �      �      x������ � �      �   �   x���M
�@���ÔN�ɴ�^@OЍT�ց����FV]Hx�g�h���9�kC�N�7e!v�cV�l����T0���>\��zih�
3Nq�9�N��V��#�z�L>i!�`�`~-�p� ɂK4Y��B1)��	`^���f��?����V5��      �      x������ � �      �   .   x�3�4�4�LII�.3##S3��1gzRRz���)W� ���      �   3   x�3�0�[/l�8c���@"/6_�t��Ӑ˘3##H��qqq 46�      �   �  x�U�Ir�8E׉S��8si�+�ly
˪��7PEA� ��4���^��+�w ���#z��_�o�v�zѣv�~r�H���v0{�F��d��\a���V"�{�(|mz�yN[�)�DA���Q��\��R���n�jozLˈ^�0�yիխ�'!czѮ2����m�T%d����^��h���ۣ�$�v��7����Y�����&Z�ݢ}K^Wʉ(�{��Ъ�QL?�]��nUefݔ�\3�<�эr���"��4��k?U �~Q"*���/���� L,�����qDOj��^��Q_yA���cz�Z%�ގS��>���4��"��z�:�9n���m�E\���׵"Y{����;�Dҍ��:��m�N$1m&/I�Qս-��}��Zӛޫ�d�l��ڴ"��qr]ت���_�*-����W��kר�֭���??Њh��V��4�$Gۊ4�����;)��68*�8��V"�C:�DZ ԃ�~��Fi�/�����Tdko>!��T��(Y�7jn�"��טQ��{���p�m�ki u-B��u79-��Ȁ������1"C$
�w�_��bh�9�8�yD��v�w|��Z�(�R�H
%�kY��E��ڛ;��������z=���Kzq�����u���ҳr�wp!a���G���(p��	l5����n̑��Q�l�>oUq??��O]���?�0�EQp���\=㪭(Jz��o(�r�iU�f,�/H2�Sʈ^�SJ�1��(�iE��C��)�؊�e�<�@�V���kjD�t��[�j�PA��{�(K\yq�;k��,*��.����B�Ћ��lW[X��Z_8T��M�z��sK� M����h(�NͰ�\��p�P���A��i?>? �ؙKWJ���V�1��0L΋%��-��ՈvJ����t T� ,���(�o�n�x�j�/�P-
⫓�-H�XgZO]I�m���	�07�t��Îs�/�*�v�R���ӱf���BP��P�pVo����$� q@,��Aǭv���" �ϕ�Y�
B�����	A�P��>�H'�38�{���	��'30Y+�6�S��|4���a1��w��{�P�`�/?��a �z?L�B�\�G�AU��I�/%A���������9=7#�C�kRc����,=�z����gHSz1��f�}ȶ�C�)�Z	}o��*��[��CD -C��L���a\ݵ&L�uhd[_��}�K~�@���^m�ρ=j�Jx���hW�`c�	�i���Ihs^�8�j_
@o I �s����/bH��׃K��o�������'��0��G�����Î��O���Q�2���ِt��́��,~�|��HQ�S�y�䛩�Z�4���"H�UM���γ���m�n���hg᩷+6y���@r����ڴ~�>2�B�%�`��?R[A�����Z�!���8�      �      x������ � �      �      x������ � �      �   c   x�U���0D�����x�4�
(#�
�
�q���K�1�kDz4�!��!M8��~po�4c5U
��a�"���"�����#��^}^�t[J)7�D�      �      x������ � �      �   �   x�5�1
1D��]\������<�6B�-�<���PD��;|odR�k�a��JJ�|X"b�O5��x�WC9#li�&k��!wy�*Y7��^[x�,�����<F�3r�c��y�Ɠ��:p�J���~��� �/�      �   �   x�͔�JA��o�����f��]c��9s�&��$Il�,| �!�`��^ak]>��+�SYDȭ<�Nd/ϲ���U奻��7W�{�׸���v9�������N�l>��-pT�6'�cF�)8��G��`8��Cw"�H`k���`u-sA����!�S��t��t?й��|�tì�B�tD�b�tz;�(��]_޴([�]jRj�f�>%8�;�N*���1j�x`�yd<.      �   '   x�3�4�44��545�462a#N2��b���� q��      �   ^   x�U���0�)2���)(�c !� P2ý���l�O.�Dn�-�Nx���I[^;�ʃ�Km�89y�=:���j
y�i?�      �   �   x���M�@���a�v��΃��� $�H�{�)�F��4,4��O�~O���-o]�����uHu>���E}Ac���(VU�`}����f&����7&���&+�e ^���f BW�X����U�d�� �4mޣ��:���:���D|2�R      �   G   x�3�4�0225�4161�30����i\F0ic#c K�ICC��1�!���X�	��,�2�*���� %��      �     x���_N�@Ɵ�S���
Jb�6w�=A����UM�P!�ZB���
�+�$��[��]�>������|���vC%-2���/I�ΓE�������b�����z��I�g��>�}�\�2���V��X��w�Q����Rf�!`D1��S(j�'}"3�IbMJ�X�Y^���+�����m��2��v��L�=�Wj"c>�.�e�R8���h@�K��|B�/`oTd5�${�~j��8q��U2/d�!�9J�C�L3��7,��xg\T�z�`Q旱r�4� �	����*���x0pE�OL��UmĿE�)�ք��`�r_��I���"6.R�O�h�6p���2\�Z6�6P�y�)\ii�#��:u1GU笩M?�O�ȓ�߲b�Ls_��)�@�ey�!���69aN}n�Y�œ��d1�q*��l({3!�����_Q��*O�%~k�����l=�(�N�:����g�̳:�P��2Q���zN���S�u�,��0}N�C����hEk�	^����N��ˇx�l��ܘ-ẈZ�Nk�@�3����.�CRٸUv�v�i}63�2���fñ�p[� %�a��X��%�B�Y9��,h��^�ck��&�Ml���L�!�y�#2_��mY�c�=D3��۶Ц�g(Ţb;v�{(�H�J��I�6�HF�&و+r'����M�֌�f�M�s3`a\�S-��6��y��.g�S0e��-q��)��iy��i�FM����	m_�p�ڄ����2������>A�ʊ��y���\/�c�S�k��l�pZ�"2!^k��E���fq���F�YmGw���N�:��3rK_fe��.�(�r�f_:���"�r�"���J2(�5"r�����B�>���r�@qͷ���i��Xy]{X;<G�WW���-C�0;��@���\�rs_���2s]B�+~���u ��0��P��c�x�������	�bW9��l�M�����#Q���=1�ĵ
�eS����n7�Ϳ�*�p      �      x������ � �      �   Q   x�u��� �3L�J��E�����l��i�rJ���ƒ��>ԥ5M�nʱ�9�Tß�c��^�;Oa��O?      �   �   x���M
�@���ÔN�ɴ�^@OЍT�ց����FV]Hx�g�h���9�kC�N�7e!v�cV�l����T0���>\��zih�
3Nq�9�N��V��#�z�L>i!�`�`~-�p� ɂK4Y��B1)��	`^���f��?����V5��     