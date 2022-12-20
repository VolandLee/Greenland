PGDMP     '                    z         	   greenland    14.5    14.5 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16808 	   greenland    DATABASE     f   CREATE DATABASE greenland WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE greenland;
                postgres    false                        2615    18635    supplier    SCHEMA        CREATE SCHEMA supplier;
    DROP SCHEMA supplier;
                postgres    false            %           1255    18596 �   add_premise(bigint, double precision, double precision, character varying, bigint, bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE       CREATE PROCEDURE public.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint)
    LANGUAGE sql
    AS $$insert into premises
(premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number)
values
(p_type, coord_long, coord_lat, email, phone, postcode, region, city, street, h_number)$$;
   DROP PROCEDURE public.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint);
       public          postgres    false            ,           1255    18609 >   add_product(bigint, bigint, numeric, numeric, bigint, boolean) 	   PROCEDURE     1  CREATE PROCEDURE public.add_product(IN b_id bigint, IN g_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean)
    LANGUAGE sql
    AS $$insert into products
(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values
(b_id, g_id, sup_p, c_p, quan, ava)$$;
 �   DROP PROCEDURE public.add_product(IN b_id bigint, IN g_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean);
       public          postgres    false            8           1255    18619 @   add_product11(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     �   CREATE FUNCTION public.add_product11(b_id bigint, g_id bigint, sup_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS bigint
    LANGUAGE sql
    RETURN 1;
 t   DROP FUNCTION public.add_product11(b_id bigint, g_id bigint, sup_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            @           1255    18633 p   create_supplier_order(bigint, numeric, bigint, bigint, numeric, bigint, bigint, bigint, bigint, numeric, bigint) 	   PROCEDURE     -  CREATE PROCEDURE public.create_supplier_order(IN s_id bigint, IN c_pr numeric, IN f_pr bigint, IN t_pr bigint, IN s_pr numeric, IN quan bigint, IN sizex bigint, IN sizey bigint, IN sizez bigint, IN wieght numeric, IN b_id bigint)
    LANGUAGE sql
    AS $$

insert into supplier_order
(supplier_id, product_id, from_premise,
to_premise, client_price, supplier_price, quantity, order_date, sizex, sizey, sizez, wieght)
values
(s_id, (select ssuka11(b_id, t_pr, s_pr, c_pr, quan, '0')), f_pr, t_pr, c_pr, s_pr, quan, now(), sizex, sizey, sizez, wieght);

$$;
 �   DROP PROCEDURE public.create_supplier_order(IN s_id bigint, IN c_pr numeric, IN f_pr bigint, IN t_pr bigint, IN s_pr numeric, IN quan bigint, IN sizex bigint, IN sizey bigint, IN sizez bigint, IN wieght numeric, IN b_id bigint);
       public          postgres    false            -           1255    18605 6   create_supplier_order1(bigint, bigint, bigint, bigint) 	   PROCEDURE     �   CREATE PROCEDURE public.create_supplier_order1(IN sup_id bigint, IN bar_id bigint, IN f_p bigint, IN t_p bigint)
    LANGUAGE sql
    AS $$show time$$;
 p   DROP PROCEDURE public.create_supplier_order1(IN sup_id bigint, IN bar_id bigint, IN f_p bigint, IN t_p bigint);
       public          postgres    false            '           1255    18602 >   new_barcode(bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE     &  CREATE PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country bigint)
    LANGUAGE sql
    AS $$insert into barcodes
(barcode_id, catalog_id, supplier_id, barcode_name, country)
values
(b_id, cat_id, sup_id, b_name, country)$$;
 �   DROP PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country bigint);
       public          postgres    false            (           1255    18603 I   new_barcode(bigint, bigint, bigint, character varying, character varying) 	   PROCEDURE     1  CREATE PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$insert into barcodes
(barcode_id, catalog_id, supplier_id, barcode_name, country)
values
(b_id, cat_id, sup_id, b_name, country)$$;
 �   DROP PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       public          postgres    false            &           1255    18599 B   new_barcode1(bigint, bigint, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE public.new_barcode1(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$insert into barcodes
(catalog_id, supplier_id, barcode_name, country)
values
(cat_id, sup_id, b_name, country)$$;
 �   DROP PROCEDURE public.new_barcode1(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       public          postgres    false            $           1255    18577    new_supplier_order(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.new_supplier_order(IN sup_name integer)
    LANGUAGE sql
    AS $$insert into ans
(
select * from suppliers s
where s.supplier_id = sup_name)
 $$;
 ?   DROP PROCEDURE public.new_supplier_order(IN sup_name integer);
       public          postgres    false            :           1255    18629 8   ssuka(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     H  CREATE FUNCTION public.ssuka(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
      BEGIN
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0');
      END;
  $$;
 j   DROP FUNCTION public.ssuka(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            ;           1255    18630 9   ssuka1(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     a  CREATE FUNCTION public.ssuka1(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
      BEGIN
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0') RETURNING product_id;
      END;
  $$;
 k   DROP FUNCTION public.ssuka1(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            <           1255    18631 :   ssuka11(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     R  CREATE FUNCTION public.ssuka11(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS integer
    LANGUAGE sql
    AS $$
    
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0') RETURNING product_id;
     
  $$;
 l   DROP FUNCTION public.ssuka11(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            7           1255    26829 #   accept_goodslist_details_sr(bigint)    FUNCTION     �  CREATE FUNCTION supplier.accept_goodslist_details_sr(s_o_id bigint) RETURNS TABLE(current_supplier_route_id bigint, product_id bigint, quantity bigint, sizex bigint, sizey bigint, sizez bigint, weight bigint, next_point_id bigint, status bigint, delivery_id bigint)
    LANGUAGE plpgsql COST 1 ROWS 1
    AS $$
begin
return QUERY  select  so.current_supplier_route_id, so.product_id, so.quantity, so.sizex, so.sizey, so.sizez, so.weight, sr.next_point_id, sr.status, sr.delivery_id from supplier.supplier_order so, supplier.supplier_routes so
where so.supplier_order_id = s_o_id and sr.supplier_route_id= so.current_supplier_route_id; 
end;

$$;
 C   DROP FUNCTION supplier.accept_goodslist_details_sr(s_o_id bigint);
       supplier          postgres    false    6            D           1255    26835 ,   accept_update_supplier_routes_status(bigint) 	   PROCEDURE     �   CREATE PROCEDURE supplier.accept_update_supplier_routes_status(IN s_r_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_routes set status =3 where supplier_route_id = s_r_id
$$;
 P   DROP PROCEDURE supplier.accept_update_supplier_routes_status(IN s_r_id bigint);
       supplier          postgres    false    6            >           1255    19197 A   add_barcode(bigint, bigint, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE supplier.add_barcode(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$
insert into supplier.barcodes
(catalog_id, supplier_id, barcode_name, country)
values
(cat_id, sup_id, b_name, country)
$$;
 �   DROP PROCEDURE supplier.add_barcode(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       supplier          postgres    false    6            9           1255    19210 E   add_goodslist(bigint, bigint, bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE     ;  CREATE PROCEDURE supplier.add_goodslist(IN pr_id bigint, IN p_id bigint, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w bigint)
    LANGUAGE sql
    AS $$

insert into supplier.goodslist
(product_id, premise_id, quantity, sizex, sizey, sizez, weight)
values
(pr_id, p_id, quan, sx, sy, sz, w);

$$;
 �   DROP PROCEDURE supplier.add_goodslist(IN pr_id bigint, IN p_id bigint, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w bigint);
       supplier          postgres    false    6            ?           1255    19198 �   add_premise(bigint, double precision, double precision, character varying, bigint, bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE       CREATE PROCEDURE supplier.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint)
    LANGUAGE sql
    AS $$
insert into supplier.premises
(premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number)
values
(p_type, coord_long, coord_lat, email, phone, postcode, region, city, street, h_number)
$$;
 
  DROP PROCEDURE supplier.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint);
       supplier          postgres    false    6            =           1255    19196 6   add_product(bigint, numeric, numeric, bigint, boolean) 	   PROCEDURE       CREATE PROCEDURE supplier.add_product(IN b_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean)
    LANGUAGE sql
    AS $$
insert into supplier.products
(barcode_id, supplier_price, client_price, quantity, available)
values
(b_id, sup_p, c_p, quan, ava)
$$;
 w   DROP PROCEDURE supplier.add_product(IN b_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean);
       supplier          postgres    false    6            6           1255    19206 C   add_supplier_routes(bigint, bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE       CREATE PROCEDURE supplier.add_supplier_routes(IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint, IN par_id bigint DEFAULT NULL::bigint, IN st bigint DEFAULT 0)
    LANGUAGE sql
    AS $$

insert into supplier.supplier_routes
(parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, status)
values
(par_id, d_id, g_id, p_id, n_p_id, now(), st);

$$;
 �   DROP PROCEDURE supplier.add_supplier_routes(IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint, IN par_id bigint, IN st bigint);
       supplier          postgres    false    6            A           1255    19199 o   create_supplier_order(bigint, bigint, bigint, bigint, bigint, numeric, bigint, bigint, bigint, bigint, numeric) 	   PROCEDURE       CREATE PROCEDURE supplier.create_supplier_order(IN s_id bigint, IN p_id bigint, IN f_pr bigint, IN t_pr bigint, IN st_s_r_id bigint, IN s_pr numeric, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w numeric)
    LANGUAGE sql
    AS $$

insert into supplier.supplier_order
(supplier_id, product_id, from_premise,
to_premise, start_supplier_route_id, supplier_price, quantity, order_date, sizex, sizey, sizez, wieght)
values
(s_id, p_id, f_pr, t_pr, st_s_r_id, s_pr, quan, now(), sx, sy, sz, w);

$$;
 �   DROP PROCEDURE supplier.create_supplier_order(IN s_id bigint, IN p_id bigint, IN f_pr bigint, IN t_pr bigint, IN st_s_r_id bigint, IN s_pr numeric, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w numeric);
       supplier          postgres    false    6            C           1255    26832 >   create_supplier_routes(bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE     <  CREATE PROCEDURE supplier.create_supplier_routes(IN pr_id bigint, IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint)
    LANGUAGE sql
    AS $$
insert into supplier.supplier_routes
(parent_id, delivery_id, goodslist_id, point_id, next_point_id, status)
values
(pr_id, d_id, g_id, p_id, n_p_id, 0)
$$;
 �   DROP PROCEDURE supplier.create_supplier_routes(IN pr_id bigint, IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint);
       supplier          postgres    false    6            B           1255    26831 !   send_goodslist_details_sr(bigint)    FUNCTION     �  CREATE FUNCTION supplier.send_goodslist_details_sr(s_o_id bigint) RETURNS TABLE(current_supplier_route_id bigint, product_id bigint, quantity bigint, sizex bigint, sizey bigint, sizez bigint, weight bigint, next_point_id bigint, status bigint, delivery_id bigint, goodslist_id bigint)
    LANGUAGE plpgsql COST 1 ROWS 1
    AS $$
begin
return QUERY  select  so.current_supplier_route_id, so.product_id, so.quantity, so.sizex, so.sizey, so.sizez, so.weight, sr.next_point_id, sr.status, sr.delivery_id, sr.goodslist_id from supplier.supplier_order so, 
supplier.supplier_routes so
where so.supplier_order_id = s_o_id and sr.supplier_route_id= so.current_supplier_route_id; 
end;

$$;
 A   DROP FUNCTION supplier.send_goodslist_details_sr(s_o_id bigint);
       supplier          postgres    false    6            E           1255    26836 *   send_update_supplier_routes_status(bigint) 	   PROCEDURE     �   CREATE PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_routes set status = 2 where supplier_route_id = s_r_id
$$;
 N   DROP PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint);
       supplier          postgres    false    6            F           1255    26838 2   send_update_supplier_routes_status(bigint, bigint) 	   PROCEDURE     9  CREATE PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint, IN s_o_id bigint)
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
            public          postgres    false    234            �            1259    18405    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
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
            public          postgres    false    236            �            1259    18391    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
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
            public          postgres    false    232            �            1259    18411 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
            public          postgres    false    240            �            1259    18410    auth_user_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            �            1259    18425    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
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
            public          postgres    false    242            �            1259    18134    barcodes    TABLE     �   CREATE TABLE public.barcodes (
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
       public         heap    postgres    false            �            1259    18251    client_routes    TABLE     A  CREATE TABLE public.client_routes (
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
       public         heap    postgres    false            �            1259    18349    control_points    TABLE       CREATE TABLE public.control_points (
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
            public          postgres    false    244            �            1259    18383    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
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
            public          postgres    false    230            �            1259    18375    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
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
            public          postgres    false    228            �            1259    18511    django_session    TABLE     �   CREATE TABLE public.django_session (
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
       public         heap    postgres    false            "           1259    27817    goodslist11    TABLE       CREATE TABLE public.goodslist11 (
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
       public         heap    postgres    false    247            �            1259    18606    product_sequence    SEQUENCE     z   CREATE SEQUENCE public.product_sequence
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
       public         heap    postgres    false    249            �            1259    18293    region    TABLE     �   CREATE TABLE public.region (
    region_id integer NOT NULL,
    region_name character varying(90) DEFAULT NULL::character varying
);
    DROP TABLE public.region;
       public         heap    postgres    false            �            1259    18611    supplier_order_sequence    SEQUENCE     �   CREATE SEQUENCE public.supplier_order_sequence
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
       public         heap    postgres    false    250            �            1259    18324    supplier_routes    TABLE     O  CREATE TABLE public.supplier_routes (
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
       public         heap    postgres    false                       1259    19203    supplier_routes_seq    SEQUENCE     |   CREATE SEQUENCE public.supplier_routes_seq
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
       public         heap    postgres    false            #           1259    27832    Supp_ord_goodslist    TABLE     )  CREATE TABLE supplier."Supp_ord_goodslist" (
    goodslist_id integer NOT NULL,
    quantity integer NOT NULL,
    sizex integer NOT NULL,
    sizey integer NOT NULL,
    sizez integer NOT NULL,
    weight numeric(8,3) NOT NULL,
    premise_id integer NOT NULL,
    product_id integer NOT NULL
);
 *   DROP TABLE supplier."Supp_ord_goodslist";
       supplier         heap    postgres    false    6            �            1259    18922    actions    TABLE     r   CREATE TABLE supplier.actions (
    action_id integer NOT NULL,
    action_name character varying(45) NOT NULL
);
    DROP TABLE supplier.actions;
       supplier         heap    postgres    false    6                       1259    27647 
   auth_group    TABLE     h   CREATE TABLE supplier.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
     DROP TABLE supplier.auth_group;
       supplier         heap    postgres    false    6                       1259    27646    auth_group_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    276    6                       1259    27655    auth_group_permissions    TABLE     �   CREATE TABLE supplier.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 ,   DROP TABLE supplier.auth_group_permissions;
       supplier         heap    postgres    false    6                       1259    27654    auth_group_permissions_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    6    278                       1259    27641    auth_permission    TABLE     �   CREATE TABLE supplier.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 %   DROP TABLE supplier.auth_permission;
       supplier         heap    postgres    false    6                       1259    27640    auth_permission_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    274    6                       1259    27661 	   auth_user    TABLE     �  CREATE TABLE supplier.auth_user (
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
       supplier         heap    postgres    false    6                       1259    27669    auth_user_groups    TABLE     �   CREATE TABLE supplier.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 &   DROP TABLE supplier.auth_user_groups;
       supplier         heap    postgres    false    6                       1259    27668    auth_user_groups_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    282    6                       1259    27660    auth_user_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    280    6                       1259    27675    auth_user_user_permissions    TABLE     �   CREATE TABLE supplier.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 0   DROP TABLE supplier.auth_user_user_permissions;
       supplier         heap    postgres    false    6                       1259    27674 !   auth_user_user_permissions_id_seq    SEQUENCE     �   ALTER TABLE supplier.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    6    284            �            1259    18940    barcodes    TABLE     �   CREATE TABLE supplier.barcodes (
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
       supplier         heap    postgres    false    6                       1259    19012    city    TABLE     �   CREATE TABLE supplier.city (
    city_id integer NOT NULL,
    city_name character varying(45) DEFAULT NULL::character varying
);
    DROP TABLE supplier.city;
       supplier         heap    postgres    false    6                       1259    19086    client_order    TABLE     !  CREATE TABLE supplier.client_order (
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
       supplier         heap    postgres    false    6                       1259    19026    client_routes    TABLE     N  CREATE TABLE supplier.client_routes (
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
       supplier         heap    postgres    false    6                       1259    18997    clients    TABLE     b  CREATE TABLE supplier.clients (
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
       supplier         heap    postgres    false    6                       1259    19170    control_points    TABLE       CREATE TABLE supplier.control_points (
    control_points_id integer NOT NULL,
    employee_id integer NOT NULL,
    product_id integer NOT NULL,
    action_id integer NOT NULL,
    premise_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);
 $   DROP TABLE supplier.control_points;
       supplier         heap    postgres    false    6                       1259    19018    delivery    TABLE     k  CREATE TABLE supplier.delivery (
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
       supplier         heap    postgres    false    6                       1259    27733    django_admin_log    TABLE     �  CREATE TABLE supplier.django_admin_log (
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
       supplier         heap    postgres    false    6                       1259    27732    django_admin_log_id_seq    SEQUENCE     �   ALTER TABLE supplier.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    6    286                       1259    27633    django_content_type    TABLE     �   CREATE TABLE supplier.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 )   DROP TABLE supplier.django_content_type;
       supplier         heap    postgres    false    6                       1259    27632    django_content_type_id_seq    SEQUENCE     �   ALTER TABLE supplier.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    272    6                       1259    27625    django_migrations    TABLE     �   CREATE TABLE supplier.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 '   DROP TABLE supplier.django_migrations;
       supplier         heap    postgres    false    6                       1259    27624    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE supplier.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME supplier.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            supplier          postgres    false    6    270                       1259    27761    django_session    TABLE     �   CREATE TABLE supplier.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 $   DROP TABLE supplier.django_session;
       supplier         heap    postgres    false    6                       1259    19117 	   employees    TABLE     8  CREATE TABLE supplier.employees (
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
       supplier         heap    postgres    false    6            !           1259    27802 	   goodslist    TABLE       CREATE TABLE supplier.goodslist (
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
       supplier         heap    postgres    false    6                        1259    27800    goodslist_seq    SEQUENCE     z   CREATE SEQUENCE supplier.goodslist_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE supplier.goodslist_seq;
       supplier          postgres    false    6            �            1259    18955    premise_type    TABLE     }   CREATE TABLE supplier.premise_type (
    premise_type_id integer NOT NULL,
    type_decryp character varying(45) NOT NULL
);
 "   DROP TABLE supplier.premise_type;
       supplier         heap    postgres    false    6                        1259    18960    premises    TABLE     n  CREATE TABLE supplier.premises (
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
       supplier         heap    postgres    false    6                       1259    18972    products    TABLE     �   CREATE TABLE supplier.products (
    product_id integer NOT NULL,
    barcode_id bigint NOT NULL,
    supplier_price numeric(10,2) NOT NULL,
    client_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    available boolean NOT NULL
);
    DROP TABLE supplier.products;
       supplier         heap    postgres    false    6            	           1259    19134    region    TABLE     �   CREATE TABLE supplier.region (
    region_id integer NOT NULL,
    region_name character varying(90) DEFAULT NULL::character varying
);
    DROP TABLE supplier.region;
       supplier         heap    postgres    false    6            
           1259    19140    supplier_order    TABLE     #  CREATE TABLE supplier.supplier_order (
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
       supplier         heap    postgres    false    6                       1259    19056    supplier_routes    TABLE     �  CREATE TABLE supplier.supplier_routes (
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
       supplier         heap    postgres    false    268    6            �            1259    18932 	   suppliers    TABLE     n  CREATE TABLE supplier.suppliers (
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
       supplier         heap    postgres    false    6            /          0    18116    actions 
   TABLE DATA           9   COPY public.actions (action_id, action_name) FROM stdin;
    public          postgres    false    210   hT      S          0    18581    ans 
   TABLE DATA           �   COPY public.ans (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    246   �T      G          0    18397 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    234   �T      I          0    18405    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    236   U      E          0    18391    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    232   U      K          0    18411 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    238   �Z      M          0    18419    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    240   p[      O          0    18425    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    242   �[      2          0    18134    barcodes 
   TABLE DATA           ^   COPY public.barcodes (barcode_id, catalog_id, supplier_id, barcode_name, country) FROM stdin;
    public          postgres    false    213   �[      0          0    18121    catalog 
   TABLE DATA           F   COPY public.catalog (catalog_id, catalog_name, parent_id) FROM stdin;
    public          postgres    false    211   \      7          0    18211    city 
   TABLE DATA           2   COPY public.city (city_id, city_name) FROM stdin;
    public          postgres    false    218   W\      8          0    18217    client_order 
   TABLE DATA           �   COPY public.client_order (client_order_id, client_id, product_id, from_premise_id, to_premise_id, client_price, order_date, delivery_date, received_date, sizex, sizey, sizez, weight) FROM stdin;
    public          postgres    false    219   >b      :          0    18251    client_routes 
   TABLE DATA           �   COPY public.client_routes (client_route_id, delivery_id, client_order_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    public          postgres    false    221   [b      6          0    18196    clients 
   TABLE DATA           �   COPY public.clients (client_id, received_point_id, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, balance, liked) FROM stdin;
    public          postgres    false    217   xb      ?          0    18349    control_points 
   TABLE DATA           s   COPY public.control_points (control_points_id, employee_id, product_id, action_id, premise_id, "time") FROM stdin;
    public          postgres    false    226   �b      9          0    18243    delivery 
   TABLE DATA           �   COPY public.delivery (delivery_id, delivery_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    220   
c      Q          0    18483    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    244   �c      C          0    18383    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    230   �c      A          0    18375    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    228   e      R          0    18511    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    245   �g      ;          0    18276 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, premise_id, fname, lname, patronymic, email, password, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, hire_date, chief_id) FROM stdin;
    public          postgres    false    222   i                0    27817    goodslist11 
   TABLE DATA           r   COPY public.goodslist11 (goodslist_id, product_id, premise_id, quantity, sizex, sizey, sizez, weight) FROM stdin;
    public          postgres    false    290   j      3          0    18149    premise_type 
   TABLE DATA           D   COPY public.premise_type (premise_type_id, type_decryp) FROM stdin;
    public          postgres    false    214   *j      4          0    18154    premises 
   TABLE DATA           �   COPY public.premises (premise_id, premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number) FROM stdin;
    public          postgres    false    215   �j      5          0    18181    products 
   TABLE DATA           {   COPY public.products (product_id, barcode_id, goodslist_id, supplier_price, client_price, quantity, available) FROM stdin;
    public          postgres    false    216   hk      <          0    18293    region 
   TABLE DATA           8   COPY public.region (region_id, region_name) FROM stdin;
    public          postgres    false    223   �k      =          0    18299    supplier_order 
   TABLE DATA           �   COPY public.supplier_order (supplier_order_id, supplier_id, product_id, from_premise, to_premise, client_price, supplier_price, quantity, order_date, delivery_date, sizex, sizey, sizez, wieght) FROM stdin;
    public          postgres    false    224   p      >          0    18324    supplier_routes 
   TABLE DATA           �   COPY public.supplier_routes (supplier_route_id, delivey_id, supplier_order_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    public          postgres    false    225   +p      1          0    18126 	   suppliers 
   TABLE DATA           �   COPY public.suppliers (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    212   Hp      �          0    27832    Supp_ord_goodslist 
   TABLE DATA           }   COPY supplier."Supp_ord_goodslist" (goodslist_id, quantity, sizex, sizey, sizez, weight, premise_id, product_id) FROM stdin;
    supplier          postgres    false    291   �p      X          0    18922    actions 
   TABLE DATA           ;   COPY supplier.actions (action_id, action_name) FROM stdin;
    supplier          postgres    false    251   q      q          0    27647 
   auth_group 
   TABLE DATA           0   COPY supplier.auth_group (id, name) FROM stdin;
    supplier          postgres    false    276   4q      s          0    27655    auth_group_permissions 
   TABLE DATA           O   COPY supplier.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    supplier          postgres    false    278   Qq      o          0    27641    auth_permission 
   TABLE DATA           P   COPY supplier.auth_permission (id, name, content_type_id, codename) FROM stdin;
    supplier          postgres    false    274   nq      u          0    27661 	   auth_user 
   TABLE DATA           �   COPY supplier.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    supplier          postgres    false    280   �v      w          0    27669    auth_user_groups 
   TABLE DATA           C   COPY supplier.auth_user_groups (id, user_id, group_id) FROM stdin;
    supplier          postgres    false    282   �w      y          0    27675    auth_user_user_permissions 
   TABLE DATA           R   COPY supplier.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    supplier          postgres    false    284   �w      [          0    18940    barcodes 
   TABLE DATA           `   COPY supplier.barcodes (barcode_id, catalog_id, supplier_id, barcode_name, country) FROM stdin;
    supplier          postgres    false    254   �w      Y          0    18927    catalog 
   TABLE DATA           H   COPY supplier.catalog (catalog_id, catalog_name, parent_id) FROM stdin;
    supplier          postgres    false    252   <x      `          0    19012    city 
   TABLE DATA           4   COPY supplier.city (city_id, city_name) FROM stdin;
    supplier          postgres    false    259   x      d          0    19086    client_order 
   TABLE DATA           �   COPY supplier.client_order (client_order_id, client_id, product_id, from_premise_id, to_premise_id, current_client_route_id, client_price, order_date, delivery_date, received_date, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    263   f~      b          0    19026    client_routes 
   TABLE DATA           �   COPY supplier.client_routes (client_route_id, parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    supplier          postgres    false    261   �~      _          0    18997    clients 
   TABLE DATA           �   COPY supplier.clients (client_id, received_point_id, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, balance, liked) FROM stdin;
    supplier          postgres    false    258   �~      h          0    19170    control_points 
   TABLE DATA           u   COPY supplier.control_points (control_points_id, employee_id, product_id, action_id, premise_id, "time") FROM stdin;
    supplier          postgres    false    267   )      a          0    19018    delivery 
   TABLE DATA           �   COPY supplier.delivery (delivery_id, delivery_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    supplier          postgres    false    260   F      {          0    27733    django_admin_log 
   TABLE DATA           �   COPY supplier.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    supplier          postgres    false    286   �      m          0    27633    django_content_type 
   TABLE DATA           E   COPY supplier.django_content_type (id, app_label, model) FROM stdin;
    supplier          postgres    false    272   :�      k          0    27625    django_migrations 
   TABLE DATA           E   COPY supplier.django_migrations (id, app, name, applied) FROM stdin;
    supplier          postgres    false    270   |�      |          0    27761    django_session 
   TABLE DATA           R   COPY supplier.django_session (session_key, session_data, expire_date) FROM stdin;
    supplier          postgres    false    287   ,�      e          0    19117 	   employees 
   TABLE DATA           �   COPY supplier.employees (employee_id, premise_id, fname, lname, patronymic, email, password, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, hire_date, chief_id) FROM stdin;
    supplier          postgres    false    264   D�      ~          0    27802 	   goodslist 
   TABLE DATA           r   COPY supplier.goodslist (goodslist_id, product_id, premise_id, quantity, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    289   D�      \          0    18955    premise_type 
   TABLE DATA           F   COPY supplier.premise_type (premise_type_id, type_decryp) FROM stdin;
    supplier          postgres    false    255   w�      ]          0    18960    premises 
   TABLE DATA           �   COPY supplier.premises (premise_id, premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number) FROM stdin;
    supplier          postgres    false    256   �      ^          0    18972    products 
   TABLE DATA           o   COPY supplier.products (product_id, barcode_id, supplier_price, client_price, quantity, available) FROM stdin;
    supplier          postgres    false    257   ��      f          0    19134    region 
   TABLE DATA           :   COPY supplier.region (region_id, region_name) FROM stdin;
    supplier          postgres    false    265   �      g          0    19140    supplier_order 
   TABLE DATA           �   COPY supplier.supplier_order (supplier_order_id, supplier_id, product_id, from_premise, to_premise, current_supplier_route_id, supplier_price, quantity, order_date, delivery_date, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    266   �      c          0    19056    supplier_routes 
   TABLE DATA           �   COPY supplier.supplier_routes (supplier_route_id, parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    supplier          postgres    false    262   6�      Z          0    18932 	   suppliers 
   TABLE DATA           �   COPY supplier.suppliers (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    supplier          postgres    false    253   ��      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    233            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    235            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 148, true);
          public          postgres    false    231            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    239            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          postgres    false    237            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    241            �           0    0    barcodes_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.barcodes_sequence', 20, true);
          public          postgres    false    248            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    243            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 37, true);
          public          postgres    false    229            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 33, true);
          public          postgres    false    227            �           0    0    premises_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.premises_sequence', 17, true);
          public          postgres    false    247            �           0    0    product_sequence    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.product_sequence', 34, true);
          public          postgres    false    249            �           0    0    supplier_order_sequence    SEQUENCE SET     F   SELECT pg_catalog.setval('public.supplier_order_sequence', 23, true);
          public          postgres    false    250            �           0    0    supplier_routes_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.supplier_routes_seq', 6, true);
          public          postgres    false    268            �           0    0    auth_group_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('supplier.auth_group_id_seq', 1, false);
          supplier          postgres    false    275            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('supplier.auth_group_permissions_id_seq', 1, false);
          supplier          postgres    false    277            �           0    0    auth_permission_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('supplier.auth_permission_id_seq', 140, true);
          supplier          postgres    false    273            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('supplier.auth_user_groups_id_seq', 1, false);
          supplier          postgres    false    281            �           0    0    auth_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('supplier.auth_user_id_seq', 2, true);
          supplier          postgres    false    279            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('supplier.auth_user_user_permissions_id_seq', 1, false);
          supplier          postgres    false    283            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('supplier.django_admin_log_id_seq', 1, true);
          supplier          postgres    false    285            �           0    0    django_content_type_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('supplier.django_content_type_id_seq', 35, true);
          supplier          postgres    false    271            �           0    0    django_migrations_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('supplier.django_migrations_id_seq', 35, true);
          supplier          postgres    false    269            �           0    0    goodslist_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('supplier.goodslist_seq', 100, false);
          supplier          postgres    false    288            �           2606    18120    actions actions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);
 >   ALTER TABLE ONLY public.actions DROP CONSTRAINT actions_pkey;
       public            postgres    false    210            �           2606    18509    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    234            �           2606    18440 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    236    236            �           2606    18409 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    236            �           2606    18401    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    234            �           2606    18431 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    232    232            �           2606    18395 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    232            �           2606    18423 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    240            �           2606    18455 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    240    240            �           2606    18415    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    238            �           2606    18429 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    242            �           2606    18469 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    242    242            �           2606    18504     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    238            �           2606    18138    barcodes barcodes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.barcodes
    ADD CONSTRAINT barcodes_pkey PRIMARY KEY (barcode_id);
 @   ALTER TABLE ONLY public.barcodes DROP CONSTRAINT barcodes_pkey;
       public            postgres    false    213            �           2606    18125    catalog catalog_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.catalog
    ADD CONSTRAINT catalog_pkey PRIMARY KEY (catalog_id);
 >   ALTER TABLE ONLY public.catalog DROP CONSTRAINT catalog_pkey;
       public            postgres    false    211            �           2606    18216    city city_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    218            �           2606    18222    client_order client_order_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT client_order_pkey PRIMARY KEY (client_order_id);
 H   ALTER TABLE ONLY public.client_order DROP CONSTRAINT client_order_pkey;
       public            postgres    false    219            �           2606    18255     client_routes client_routes_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT client_routes_pkey PRIMARY KEY (client_route_id);
 J   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT client_routes_pkey;
       public            postgres    false    221            �           2606    18205    clients clients_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    217            �           2606    18353 "   control_points control_points_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT control_points_pkey PRIMARY KEY (control_points_id);
 L   ALTER TABLE ONLY public.control_points DROP CONSTRAINT control_points_pkey;
       public            postgres    false    226            �           2606    18250    delivery delivery_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (delivery_id);
 @   ALTER TABLE ONLY public.delivery DROP CONSTRAINT delivery_pkey;
       public            postgres    false    220            �           2606    18490 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    244            �           2606    18389 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    230    230            �           2606    18387 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    230            �           2606    18381 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    228            �           2606    18517 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    245            �           2606    18282    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    222            ;           2606    27821    goodslist11 goodslist11_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.goodslist11
    ADD CONSTRAINT goodslist11_pkey PRIMARY KEY (goodslist_id);
 F   ALTER TABLE ONLY public.goodslist11 DROP CONSTRAINT goodslist11_pkey;
       public            postgres    false    290            �           2606    18153    premise_type premise_type_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.premise_type
    ADD CONSTRAINT premise_type_pkey PRIMARY KEY (premise_type_id);
 H   ALTER TABLE ONLY public.premise_type DROP CONSTRAINT premise_type_pkey;
       public            postgres    false    214            �           2606    18160    premises premises_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT premises_pkey PRIMARY KEY (premise_id);
 @   ALTER TABLE ONLY public.premises DROP CONSTRAINT premises_pkey;
       public            postgres    false    215            �           2606    18185    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    216            �           2606    18298    region region_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);
 <   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pkey;
       public            postgres    false    223            �           2606    18303 "   supplier_order supplier_order_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT supplier_order_pkey PRIMARY KEY (supplier_order_id);
 L   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT supplier_order_pkey;
       public            postgres    false    224            �           2606    18328 $   supplier_routes supplier_routes_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT supplier_routes_pkey PRIMARY KEY (supplier_route_id);
 N   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT supplier_routes_pkey;
       public            postgres    false    225            �           2606    18133    suppliers suppliers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public            postgres    false    212            =           2606    27836 *   Supp_ord_goodslist Supp_ord_goodslist_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY supplier."Supp_ord_goodslist"
    ADD CONSTRAINT "Supp_ord_goodslist_pkey" PRIMARY KEY (goodslist_id);
 Z   ALTER TABLE ONLY supplier."Supp_ord_goodslist" DROP CONSTRAINT "Supp_ord_goodslist_pkey";
       supplier            postgres    false    291            �           2606    18926    actions actions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);
 @   ALTER TABLE ONLY supplier.actions DROP CONSTRAINT actions_pkey;
       supplier            postgres    false    251                       2606    27759    auth_group auth_group_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 J   ALTER TABLE ONLY supplier.auth_group DROP CONSTRAINT auth_group_name_key;
       supplier            postgres    false    276                       2606    27690 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 ~   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       supplier            postgres    false    278    278                       2606    27659 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       supplier            postgres    false    278                       2606    27651    auth_group auth_group_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY supplier.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY supplier.auth_group DROP CONSTRAINT auth_group_pkey;
       supplier            postgres    false    276                       2606    27681 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 r   ALTER TABLE ONLY supplier.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       supplier            postgres    false    274    274                       2606    27645 $   auth_permission auth_permission_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY supplier.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY supplier.auth_permission DROP CONSTRAINT auth_permission_pkey;
       supplier            postgres    false    274            &           2606    27673 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       supplier            postgres    false    282            )           2606    27705 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 l   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       supplier            postgres    false    282    282                        2606    27665    auth_user auth_user_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY supplier.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY supplier.auth_user DROP CONSTRAINT auth_user_pkey;
       supplier            postgres    false    280            ,           2606    27679 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       supplier            postgres    false    284            /           2606    27719 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       supplier            postgres    false    284    284            #           2606    27754     auth_user auth_user_username_key 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 L   ALTER TABLE ONLY supplier.auth_user DROP CONSTRAINT auth_user_username_key;
       supplier            postgres    false    280            �           2606    18944    barcodes barcodes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT barcodes_pkey PRIMARY KEY (barcode_id);
 B   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT barcodes_pkey;
       supplier            postgres    false    254            �           2606    18931    catalog catalog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY supplier.catalog
    ADD CONSTRAINT catalog_pkey PRIMARY KEY (catalog_id);
 @   ALTER TABLE ONLY supplier.catalog DROP CONSTRAINT catalog_pkey;
       supplier            postgres    false    252            �           2606    19017    city city_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY supplier.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 :   ALTER TABLE ONLY supplier.city DROP CONSTRAINT city_pkey;
       supplier            postgres    false    259                        2606    19091    client_order client_order_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT client_order_pkey PRIMARY KEY (client_order_id);
 J   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT client_order_pkey;
       supplier            postgres    false    263            �           2606    19030     client_routes client_routes_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT client_routes_pkey PRIMARY KEY (client_route_id);
 L   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT client_routes_pkey;
       supplier            postgres    false    261            �           2606    19006    clients clients_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 @   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT clients_pkey;
       supplier            postgres    false    258                       2606    19174 "   control_points control_points_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT control_points_pkey PRIMARY KEY (control_points_id);
 N   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT control_points_pkey;
       supplier            postgres    false    267            �           2606    19025    delivery delivery_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY supplier.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (delivery_id);
 B   ALTER TABLE ONLY supplier.delivery DROP CONSTRAINT delivery_pkey;
       supplier            postgres    false    260            2           2606    27740 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY supplier.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY supplier.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       supplier            postgres    false    286                       2606    27639 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY supplier.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 q   ALTER TABLE ONLY supplier.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       supplier            postgres    false    272    272                       2606    27637 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY supplier.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY supplier.django_content_type DROP CONSTRAINT django_content_type_pkey;
       supplier            postgres    false    272            
           2606    27631 (   django_migrations django_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY supplier.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY supplier.django_migrations DROP CONSTRAINT django_migrations_pkey;
       supplier            postgres    false    270            6           2606    27767 "   django_session django_session_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 N   ALTER TABLE ONLY supplier.django_session DROP CONSTRAINT django_session_pkey;
       supplier            postgres    false    287                       2606    19123    employees employees_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 D   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT employees_pkey;
       supplier            postgres    false    264            9           2606    27806    goodslist goodslist_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT goodslist_pkey PRIMARY KEY (goodslist_id);
 D   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT goodslist_pkey;
       supplier            postgres    false    289            �           2606    18959    premise_type premise_type_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY supplier.premise_type
    ADD CONSTRAINT premise_type_pkey PRIMARY KEY (premise_type_id);
 J   ALTER TABLE ONLY supplier.premise_type DROP CONSTRAINT premise_type_pkey;
       supplier            postgres    false    255            �           2606    18966    premises premises_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT premises_pkey PRIMARY KEY (premise_id);
 B   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT premises_pkey;
       supplier            postgres    false    256            �           2606    18976    products products_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY supplier.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 B   ALTER TABLE ONLY supplier.products DROP CONSTRAINT products_pkey;
       supplier            postgres    false    257                       2606    19139    region region_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY supplier.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY supplier.region DROP CONSTRAINT region_pkey;
       supplier            postgres    false    265                       2606    19144 "   supplier_order supplier_order_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT supplier_order_pkey PRIMARY KEY (supplier_order_id);
 N   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT supplier_order_pkey;
       supplier            postgres    false    266            �           2606    19060 $   supplier_routes supplier_routes_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT supplier_routes_pkey PRIMARY KEY (supplier_route_id);
 P   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT supplier_routes_pkey;
       supplier            postgres    false    262            �           2606    18939    suppliers suppliers_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY supplier.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);
 D   ALTER TABLE ONLY supplier.suppliers DROP CONSTRAINT suppliers_pkey;
       supplier            postgres    false    253            �           1259    18510    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    234            �           1259    18451 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    236            �           1259    18452 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    236            �           1259    18437 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    232            �           1259    18467 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    240            �           1259    18466 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    240            �           1259    18481 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    242            �           1259    18480 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    242            �           1259    18505     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    238            �           1259    18501 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    244            �           1259    18502 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    244            �           1259    18519 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    245            �           1259    18518 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    245            >           1259    27847 &   Supp_ord_goodslist_premise_id_1e6f48c9    INDEX     q   CREATE INDEX "Supp_ord_goodslist_premise_id_1e6f48c9" ON supplier."Supp_ord_goodslist" USING btree (premise_id);
 >   DROP INDEX supplier."Supp_ord_goodslist_premise_id_1e6f48c9";
       supplier            postgres    false    291            ?           1259    27848 &   Supp_ord_goodslist_product_id_2ffb6f66    INDEX     q   CREATE INDEX "Supp_ord_goodslist_product_id_2ffb6f66" ON supplier."Supp_ord_goodslist" USING btree (product_id);
 >   DROP INDEX supplier."Supp_ord_goodslist_product_id_2ffb6f66";
       supplier            postgres    false    291                       1259    27760    auth_group_name_a6ea08ec_like    INDEX     j   CREATE INDEX auth_group_name_a6ea08ec_like ON supplier.auth_group USING btree (name varchar_pattern_ops);
 3   DROP INDEX supplier.auth_group_name_a6ea08ec_like;
       supplier            postgres    false    276                       1259    27701 (   auth_group_permissions_group_id_b120cbf9    INDEX     q   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON supplier.auth_group_permissions USING btree (group_id);
 >   DROP INDEX supplier.auth_group_permissions_group_id_b120cbf9;
       supplier            postgres    false    278                       1259    27702 -   auth_group_permissions_permission_id_84c5c92e    INDEX     {   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON supplier.auth_group_permissions USING btree (permission_id);
 C   DROP INDEX supplier.auth_group_permissions_permission_id_84c5c92e;
       supplier            postgres    false    278                       1259    27687 (   auth_permission_content_type_id_2f476e4b    INDEX     q   CREATE INDEX auth_permission_content_type_id_2f476e4b ON supplier.auth_permission USING btree (content_type_id);
 >   DROP INDEX supplier.auth_permission_content_type_id_2f476e4b;
       supplier            postgres    false    274            $           1259    27717 "   auth_user_groups_group_id_97559544    INDEX     e   CREATE INDEX auth_user_groups_group_id_97559544 ON supplier.auth_user_groups USING btree (group_id);
 8   DROP INDEX supplier.auth_user_groups_group_id_97559544;
       supplier            postgres    false    282            '           1259    27716 !   auth_user_groups_user_id_6a12ed8b    INDEX     c   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON supplier.auth_user_groups USING btree (user_id);
 7   DROP INDEX supplier.auth_user_groups_user_id_6a12ed8b;
       supplier            postgres    false    282            *           1259    27731 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON supplier.auth_user_user_permissions USING btree (permission_id);
 G   DROP INDEX supplier.auth_user_user_permissions_permission_id_1fbb5f2c;
       supplier            postgres    false    284            -           1259    27730 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     w   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON supplier.auth_user_user_permissions USING btree (user_id);
 A   DROP INDEX supplier.auth_user_user_permissions_user_id_a95ead1b;
       supplier            postgres    false    284            !           1259    27755     auth_user_username_6821ab7c_like    INDEX     p   CREATE INDEX auth_user_username_6821ab7c_like ON supplier.auth_user USING btree (username varchar_pattern_ops);
 6   DROP INDEX supplier.auth_user_username_6821ab7c_like;
       supplier            postgres    false    280            0           1259    27751 )   django_admin_log_content_type_id_c4bce8eb    INDEX     s   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON supplier.django_admin_log USING btree (content_type_id);
 ?   DROP INDEX supplier.django_admin_log_content_type_id_c4bce8eb;
       supplier            postgres    false    286            3           1259    27752 !   django_admin_log_user_id_c564eba6    INDEX     c   CREATE INDEX django_admin_log_user_id_c564eba6 ON supplier.django_admin_log USING btree (user_id);
 7   DROP INDEX supplier.django_admin_log_user_id_c564eba6;
       supplier            postgres    false    286            4           1259    27769 #   django_session_expire_date_a5c62663    INDEX     g   CREATE INDEX django_session_expire_date_a5c62663 ON supplier.django_session USING btree (expire_date);
 9   DROP INDEX supplier.django_session_expire_date_a5c62663;
       supplier            postgres    false    287            7           1259    27768 (   django_session_session_key_c0390e0f_like    INDEX     �   CREATE INDEX django_session_session_key_c0390e0f_like ON supplier.django_session USING btree (session_key varchar_pattern_ops);
 >   DROP INDEX supplier.django_session_session_key_c0390e0f_like;
       supplier            postgres    false    287            a           2606    18354    control_points action_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT action_id_fk FOREIGN KEY (action_id) REFERENCES public.actions(action_id);
 E   ALTER TABLE ONLY public.control_points DROP CONSTRAINT action_id_fk;
       public          postgres    false    226    210    3479            g           2606    18446 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    232    236    3522            f           2606    18441 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    236    3527    234            e           2606    18432 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    230    232    3517            i           2606    18461 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    3527    240    234            h           2606    18456 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    3535    240    238            k           2606    18475 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    242    232    3522            j           2606    18470 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    238    242    3535            G           2606    18186    products barcode_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT barcode_fk_p FOREIGN KEY (barcode_id) REFERENCES public.barcodes(barcode_id);
 ?   ALTER TABLE ONLY public.products DROP CONSTRAINT barcode_fk_p;
       public          postgres    false    216    3485    213            B           2606    18139    barcodes category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.barcodes
    ADD CONSTRAINT category_id_fk FOREIGN KEY (catalog_id) REFERENCES public.catalog(catalog_id);
 A   ALTER TABLE ONLY public.barcodes DROP CONSTRAINT category_id_fk;
       public          postgres    false    211    3481    213            W           2606    18283    employees chief_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT chief_id_fk FOREIGN KEY (chief_id) REFERENCES public.employees(employee_id);
 ?   ALTER TABLE ONLY public.employees DROP CONSTRAINT chief_id_fk;
       public          postgres    false    222    3503    222            I           2606    18552    clients city_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT city_id_fk_c FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT city_id_fk_c;
       public          postgres    false    218    3495    217            P           2606    18557    delivery city_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT city_id_fk_c FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 ?   ALTER TABLE ONLY public.delivery DROP CONSTRAINT city_id_fk_c;
       public          postgres    false    3495    218    220            V           2606    18562    employees city_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT city_id_fk_e FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 @   ALTER TABLE ONLY public.employees DROP CONSTRAINT city_id_fk_e;
       public          postgres    false    222    218    3495            E           2606    18567    premises city_id_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT city_id_fk_p FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 ?   ALTER TABLE ONLY public.premises DROP CONSTRAINT city_id_fk_p;
       public          postgres    false    3495    215    218            A           2606    18572    suppliers city_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT city_id_fk_s FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 @   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT city_id_fk_s;
       public          postgres    false    212    218    3495            K           2606    18223    client_order client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES public.clients(client_id);
 @   ALTER TABLE ONLY public.client_order DROP CONSTRAINT client_fk;
       public          postgres    false    219    217    3493            Q           2606    18256     client_routes client_order_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT client_order_id_fk FOREIGN KEY (client_order_id) REFERENCES public.client_order(client_order_id);
 J   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT client_order_id_fk;
       public          postgres    false    219    3497    221            R           2606    18261    client_routes delivery_ud_kf_cr    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT delivery_ud_kf_cr FOREIGN KEY (delivery_id) REFERENCES public.delivery(delivery_id);
 I   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT delivery_ud_kf_cr;
       public          postgres    false    220    221    3499            `           2606    18329     supplier_routes delivey_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT delivey_id_fk_sr FOREIGN KEY (delivey_id) REFERENCES public.delivery(delivery_id);
 J   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT delivey_id_fk_sr;
       public          postgres    false    220    225    3499            l           2606    18491 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    244    3517    230            m           2606    18496 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    3535    238    244            b           2606    18359     control_points employee_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT employee_id_cp_fk FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);
 J   ALTER TABLE ONLY public.control_points DROP CONSTRAINT employee_id_cp_fk;
       public          postgres    false    222    226    3503            L           2606    18228    client_order from_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT from_premise_co FOREIGN KEY (from_premise_id) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.client_order DROP CONSTRAINT from_premise_co;
       public          postgres    false    3489    219    215            Y           2606    18304    supplier_order from_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT from_premise_so FOREIGN KEY (from_premise) REFERENCES public.premises(premise_id);
 H   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT from_premise_so;
       public          postgres    false    215    3489    224            S           2606    18266 !   client_routes next_point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT next_point_id_fk_co FOREIGN KEY (next_point_id) REFERENCES public.premises(premise_id);
 K   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT next_point_id_fk_co;
       public          postgres    false    215    3489    221            ]           2606    18334 #   supplier_routes next_point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT next_point_id_fk_so FOREIGN KEY (next_point_id) REFERENCES public.premises(premise_id);
 M   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT next_point_id_fk_so;
       public          postgres    false    225    3489    215            T           2606    18271    client_routes point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_routes
    ADD CONSTRAINT point_id_fk_co FOREIGN KEY (point_id) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.client_routes DROP CONSTRAINT point_id_fk_co;
       public          postgres    false    221    3489    215            ^           2606    18339    supplier_routes point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT point_id_fk_so FOREIGN KEY (point_id) REFERENCES public.premises(premise_id);
 H   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT point_id_fk_so;
       public          postgres    false    3489    215    225            c           2606    18364    control_points premise_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT premise_id_cp_fk FOREIGN KEY (premise_id) REFERENCES public.premises(premise_id);
 I   ALTER TABLE ONLY public.control_points DROP CONSTRAINT premise_id_cp_fk;
       public          postgres    false    3489    215    226            X           2606    18288    employees premise_id_e_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT premise_id_e_fk FOREIGN KEY (premise_id) REFERENCES public.premises(premise_id);
 C   ALTER TABLE ONLY public.employees DROP CONSTRAINT premise_id_e_fk;
       public          postgres    false    222    215    3489            �           2606    27827    goodslist11 premise_id_g_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.goodslist11
    ADD CONSTRAINT premise_id_g_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 E   ALTER TABLE ONLY public.goodslist11 DROP CONSTRAINT premise_id_g_fk;
       public          postgres    false    3570    256    290            F           2606    18161    premises premise_type_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT premise_type_fk FOREIGN KEY (premise_type_id) REFERENCES public.premise_type(premise_type_id);
 B   ALTER TABLE ONLY public.premises DROP CONSTRAINT premise_type_fk;
       public          postgres    false    215    214    3487            M           2606    18233    client_order product_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT product_fk_co FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 D   ALTER TABLE ONLY public.client_order DROP CONSTRAINT product_fk_co;
       public          postgres    false    216    3491    219            d           2606    18369    control_points product_fk_cp    FK CONSTRAINT     �   ALTER TABLE ONLY public.control_points
    ADD CONSTRAINT product_fk_cp FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 F   ALTER TABLE ONLY public.control_points DROP CONSTRAINT product_fk_cp;
       public          postgres    false    3491    226    216            �           2606    27822    goodslist11 product_fk_g    FK CONSTRAINT     �   ALTER TABLE ONLY public.goodslist11
    ADD CONSTRAINT product_fk_g FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 B   ALTER TABLE ONLY public.goodslist11 DROP CONSTRAINT product_fk_g;
       public          postgres    false    290    3572    257            Z           2606    18309    supplier_order product_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT product_fk_so FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 F   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT product_fk_so;
       public          postgres    false    216    3491    224            J           2606    18206    clients received_point_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT received_point_id_fk FOREIGN KEY (received_point_id) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.clients DROP CONSTRAINT received_point_id_fk;
       public          postgres    false    217    215    3489            H           2606    18547    clients region_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT region_id_fk_c FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 @   ALTER TABLE ONLY public.clients DROP CONSTRAINT region_id_fk_c;
       public          postgres    false    3505    223    217            O           2606    18542    delivery region_id_fk_d    FK CONSTRAINT     �   ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT region_id_fk_d FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 A   ALTER TABLE ONLY public.delivery DROP CONSTRAINT region_id_fk_d;
       public          postgres    false    223    220    3505            U           2606    18537    employees region_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT region_id_fk_e FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT region_id_fk_e;
       public          postgres    false    3505    222    223            D           2606    18527    premises region_id_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.premises
    ADD CONSTRAINT region_id_fk_p FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 A   ALTER TABLE ONLY public.premises DROP CONSTRAINT region_id_fk_p;
       public          postgres    false    223    3505    215            @           2606    18532    suppliers region_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT region_id_fk_s FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT region_id_fk_s;
       public          postgres    false    3505    212    223            [           2606    18314    supplier_order supplier_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT supplier_fk FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);
 D   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT supplier_fk;
       public          postgres    false    224    212    3483            C           2606    18144    barcodes supplier_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.barcodes
    ADD CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);
 A   ALTER TABLE ONLY public.barcodes DROP CONSTRAINT supplier_id_fk;
       public          postgres    false    3483    213    212            _           2606    18344 $   supplier_routes supplier_order_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_routes
    ADD CONSTRAINT supplier_order_id_fk FOREIGN KEY (supplier_order_id) REFERENCES public.supplier_order(supplier_order_id);
 N   ALTER TABLE ONLY public.supplier_routes DROP CONSTRAINT supplier_order_id_fk;
       public          postgres    false    225    3507    224            N           2606    18238    client_order to_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_order
    ADD CONSTRAINT to_premise_co FOREIGN KEY (to_premise_id) REFERENCES public.premises(premise_id);
 D   ALTER TABLE ONLY public.client_order DROP CONSTRAINT to_premise_co;
       public          postgres    false    219    215    3489            \           2606    18319    supplier_order to_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_order
    ADD CONSTRAINT to_premise_so FOREIGN KEY (to_premise) REFERENCES public.premises(premise_id);
 F   ALTER TABLE ONLY public.supplier_order DROP CONSTRAINT to_premise_so;
       public          postgres    false    3489    224    215            �           2606    27837 P   Supp_ord_goodslist Supp_ord_goodslist_premise_id_1e6f48c9_fk_premises_premise_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier."Supp_ord_goodslist"
    ADD CONSTRAINT "Supp_ord_goodslist_premise_id_1e6f48c9_fk_premises_premise_id" FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY supplier."Supp_ord_goodslist" DROP CONSTRAINT "Supp_ord_goodslist_premise_id_1e6f48c9_fk_premises_premise_id";
       supplier          postgres    false    3570    291    256            �           2606    27842 P   Supp_ord_goodslist Supp_ord_goodslist_product_id_2ffb6f66_fk_products_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier."Supp_ord_goodslist"
    ADD CONSTRAINT "Supp_ord_goodslist_product_id_2ffb6f66_fk_products_product_id" FOREIGN KEY (product_id) REFERENCES supplier.products(product_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY supplier."Supp_ord_goodslist" DROP CONSTRAINT "Supp_ord_goodslist_product_id_2ffb6f66_fk_products_product_id";
       supplier          postgres    false    291    257    3572            �           2606    19175    control_points action_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT action_id_fk FOREIGN KEY (action_id) REFERENCES supplier.actions(action_id);
 G   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT action_id_fk;
       supplier          postgres    false    267    3560    251            �           2606    27696 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES supplier.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       supplier          postgres    false    274    278    3603            �           2606    27691 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES supplier.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY supplier.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       supplier          postgres    false    276    278    3608            �           2606    27682 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES supplier.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY supplier.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       supplier          postgres    false    3598    274    272            �           2606    27711 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES supplier.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       supplier          postgres    false    276    282    3608            �           2606    27706 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES supplier.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY supplier.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       supplier          postgres    false    280    282    3616            �           2606    27725 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES supplier.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       supplier          postgres    false    274    3603    284            �           2606    27720 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES supplier.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY supplier.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       supplier          postgres    false    3616    284    280            t           2606    18977    products barcode_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.products
    ADD CONSTRAINT barcode_fk_p FOREIGN KEY (barcode_id) REFERENCES supplier.barcodes(barcode_id);
 A   ALTER TABLE ONLY supplier.products DROP CONSTRAINT barcode_fk_p;
       supplier          postgres    false    257    3566    254            p           2606    18945    barcodes category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT category_id_fk FOREIGN KEY (catalog_id) REFERENCES supplier.catalog(catalog_id);
 C   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT category_id_fk;
       supplier          postgres    false    254    252    3562            �           2606    19124    employees chief_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT chief_id_fk FOREIGN KEY (chief_id) REFERENCES supplier.employees(employee_id);
 A   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT chief_id_fk;
       supplier          postgres    false    264    3586    264            x           2606    27602    city city_id    FK CONSTRAINT     {   ALTER TABLE ONLY supplier.city
    ADD CONSTRAINT city_id FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 8   ALTER TABLE ONLY supplier.city DROP CONSTRAINT city_id;
       supplier          postgres    false    218    3495    259            w           2606    27795    clients city_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT city_id_fk_c FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 @   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT city_id_fk_c;
       supplier          postgres    false    218    3495    258            y           2606    27607    delivery city_id_fk_d    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.delivery
    ADD CONSTRAINT city_id_fk_d FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 A   ALTER TABLE ONLY supplier.delivery DROP CONSTRAINT city_id_fk_d;
       supplier          postgres    false    218    260    3495            �           2606    27612    employees city_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT city_id_fk_e FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 B   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT city_id_fk_e;
       supplier          postgres    false    218    264    3495            r           2606    27617    premises city_id_fk_p    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT city_id_fk_p FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 A   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT city_id_fk_p;
       supplier          postgres    false    256    3495    218            n           2606    27770    suppliers city_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.suppliers
    ADD CONSTRAINT city_id_fk_s FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 B   ALTER TABLE ONLY supplier.suppliers DROP CONSTRAINT city_id_fk_s;
       supplier          postgres    false    3495    218    253            �           2606    19092    client_order client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES supplier.clients(client_id);
 B   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT client_fk;
       supplier          postgres    false    3574    263    258            {           2606    19031    client_routes delivery_ud_kf_cr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT delivery_ud_kf_cr FOREIGN KEY (delivery_id) REFERENCES supplier.delivery(delivery_id);
 K   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT delivery_ud_kf_cr;
       supplier          postgres    false    261    260    3578                       2606    19061     supplier_routes delivey_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT delivey_id_fk_sr FOREIGN KEY (delivery_id) REFERENCES supplier.delivery(delivery_id);
 L   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT delivey_id_fk_sr;
       supplier          postgres    false    260    262    3578            �           2606    27741 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES supplier.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY supplier.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       supplier          postgres    false    272    286    3598            �           2606    27746 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES supplier.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY supplier.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       supplier          postgres    false    280    286    3616            �           2606    19180     control_points employee_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT employee_id_cp_fk FOREIGN KEY (employee_id) REFERENCES supplier.employees(employee_id);
 L   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT employee_id_cp_fk;
       supplier          postgres    false    264    3586    267            �           2606    19097    client_order from_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT from_premise_co FOREIGN KEY (from_premise_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT from_premise_co;
       supplier          postgres    false    256    3570    263            �           2606    19145    supplier_order from_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT from_premise_so FOREIGN KEY (from_premise) REFERENCES supplier.premises(premise_id);
 J   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT from_premise_so;
       supplier          postgres    false    266    256    3570            |           2606    19036 !   client_routes next_point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT next_point_id_fk_co FOREIGN KEY (next_point_id) REFERENCES supplier.premises(premise_id);
 M   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT next_point_id_fk_co;
       supplier          postgres    false    256    261    3570            �           2606    19066 #   supplier_routes next_point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT next_point_id_fk_so FOREIGN KEY (next_point_id) REFERENCES supplier.premises(premise_id);
 O   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT next_point_id_fk_so;
       supplier          postgres    false    256    3570    262            ~           2606    19051    client_routes parent_id_fk_cr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT parent_id_fk_cr FOREIGN KEY (parent_id) REFERENCES supplier.client_routes(client_route_id);
 I   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT parent_id_fk_cr;
       supplier          postgres    false    261    3580    261            �           2606    19081    supplier_routes parent_id_fk_sr    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT parent_id_fk_sr FOREIGN KEY (parent_id) REFERENCES supplier.supplier_routes(supplier_route_id);
 K   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT parent_id_fk_sr;
       supplier          postgres    false    262    262    3582            }           2606    19041    client_routes point_id_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_routes
    ADD CONSTRAINT point_id_fk_co FOREIGN KEY (point_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.client_routes DROP CONSTRAINT point_id_fk_co;
       supplier          postgres    false    261    256    3570            �           2606    19071    supplier_routes point_id_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_routes
    ADD CONSTRAINT point_id_fk_so FOREIGN KEY (point_id) REFERENCES supplier.premises(premise_id);
 J   ALTER TABLE ONLY supplier.supplier_routes DROP CONSTRAINT point_id_fk_so;
       supplier          postgres    false    3570    256    262            �           2606    19185    control_points premise_id_cp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT premise_id_cp_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 K   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT premise_id_cp_fk;
       supplier          postgres    false    267    3570    256            �           2606    19129    employees premise_id_e_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT premise_id_e_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 E   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT premise_id_e_fk;
       supplier          postgres    false    264    3570    256            �           2606    27812    goodslist premise_id_g_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT premise_id_g_fk FOREIGN KEY (premise_id) REFERENCES supplier.premises(premise_id);
 E   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT premise_id_g_fk;
       supplier          postgres    false    3570    256    289            s           2606    18967    premises premise_type_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.premises
    ADD CONSTRAINT premise_type_fk FOREIGN KEY (premise_type_id) REFERENCES supplier.premise_type(premise_type_id);
 D   ALTER TABLE ONLY supplier.premises DROP CONSTRAINT premise_type_fk;
       supplier          postgres    false    256    3568    255            �           2606    19102    client_order product_fk_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT product_fk_co FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 F   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT product_fk_co;
       supplier          postgres    false    257    263    3572            �           2606    19190    control_points product_fk_cp    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.control_points
    ADD CONSTRAINT product_fk_cp FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 H   ALTER TABLE ONLY supplier.control_points DROP CONSTRAINT product_fk_cp;
       supplier          postgres    false    257    267    3572            �           2606    27807    goodslist product_fk_g    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.goodslist
    ADD CONSTRAINT product_fk_g FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 B   ALTER TABLE ONLY supplier.goodslist DROP CONSTRAINT product_fk_g;
       supplier          postgres    false    3572    257    289            �           2606    19150    supplier_order product_fk_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT product_fk_so FOREIGN KEY (product_id) REFERENCES supplier.products(product_id);
 H   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT product_fk_so;
       supplier          postgres    false    266    3572    257            u           2606    19007    clients received_point_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT received_point_id_fk FOREIGN KEY (received_point_id) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT received_point_id_fk;
       supplier          postgres    false    258    3570    256            v           2606    27790    clients region_id_fk_c    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.clients
    ADD CONSTRAINT region_id_fk_c FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 B   ALTER TABLE ONLY supplier.clients DROP CONSTRAINT region_id_fk_c;
       supplier          postgres    false    258    265    3588            z           2606    27775    delivery region_id_fk_d    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.delivery
    ADD CONSTRAINT region_id_fk_d FOREIGN KEY (region_id) REFERENCES public.region(region_id) NOT VALID;
 C   ALTER TABLE ONLY supplier.delivery DROP CONSTRAINT region_id_fk_d;
       supplier          postgres    false    260    3505    223            �           2606    27780    employees region_id_fk_e    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.employees
    ADD CONSTRAINT region_id_fk_e FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 D   ALTER TABLE ONLY supplier.employees DROP CONSTRAINT region_id_fk_e;
       supplier          postgres    false    3588    264    265            o           2606    27785    suppliers region_id_fk_s    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.suppliers
    ADD CONSTRAINT region_id_fk_s FOREIGN KEY (region_id) REFERENCES supplier.region(region_id) NOT VALID;
 D   ALTER TABLE ONLY supplier.suppliers DROP CONSTRAINT region_id_fk_s;
       supplier          postgres    false    253    265    3588            �           2606    19112 %   client_order start_client_route_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT start_client_route_id_fk FOREIGN KEY (current_client_route_id) REFERENCES supplier.client_routes(client_route_id);
 Q   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT start_client_route_id_fk;
       supplier          postgres    false    261    263    3580            �           2606    19165 )   supplier_order start_supplier_route_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT start_supplier_route_id_fk FOREIGN KEY (current_supplier_route_id) REFERENCES supplier.supplier_routes(supplier_route_id);
 U   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT start_supplier_route_id_fk;
       supplier          postgres    false    3582    262    266            �           2606    19155    supplier_order supplier_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT supplier_fk FOREIGN KEY (supplier_id) REFERENCES supplier.suppliers(supplier_id);
 F   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT supplier_fk;
       supplier          postgres    false    3564    253    266            q           2606    18950    barcodes supplier_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.barcodes
    ADD CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES supplier.suppliers(supplier_id);
 C   ALTER TABLE ONLY supplier.barcodes DROP CONSTRAINT supplier_id_fk;
       supplier          postgres    false    253    3564    254            �           2606    19107    client_order to_premise_co    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.client_order
    ADD CONSTRAINT to_premise_co FOREIGN KEY (to_premise_id) REFERENCES supplier.premises(premise_id);
 F   ALTER TABLE ONLY supplier.client_order DROP CONSTRAINT to_premise_co;
       supplier          postgres    false    3570    263    256            �           2606    19160    supplier_order to_premise_so    FK CONSTRAINT     �   ALTER TABLE ONLY supplier.supplier_order
    ADD CONSTRAINT to_premise_so FOREIGN KEY (to_premise) REFERENCES supplier.premises(premise_id);
 H   ALTER TABLE ONLY supplier.supplier_order DROP CONSTRAINT to_premise_so;
       supplier          postgres    false    3570    256    266            /      x������ � �      S   O   x�3���,J�/�O+���L.��,���\NsKScc3#scCSNc##CN#SN3��/6\�qa#��	g�W� P^v      G      x������ � �      I      x������ � �      E   �  x�u�]��(���*��Q����ƕ�Lb�f��#۹���`��� �Э�c�2U`��ߗ��r����0��廲��>�kij�\_^�	��$`�����6C��'�yL��7�Fg�i�z��c~U��&��� $w���?`ɠb�����1��/��]5ޠ�m�Q��~�E�՞!;��b����NKu���ƞ���V?� zx :y6u�G��>>�:�67j���=U�w@M{���6��d�Q�Jx���(6���F��F����Ԑ�ψA�F�"�r] �*"����vqP���+SC��o�1�o���1�R[�����>��jv�O�@NS/� d4l�*��;<�wJ6_�7fk5���+�@N�����0��[�`���e�����zw�L�-b
2Z(�C�I�0������9O�Z�0a�s��l)�X2�X��@z��Ss�2��r�h�ks[a<qG�mE�I=k+.LڑSwg?Y�F;�m�=\F����F:&E����vN�T�庹�p�9�.M%� �9�ő�ȩ"Q��\��y~Ϗ���,�j�lE@�Z�*[P�����5q��
�2w�ǟi�<	�_�jLc�]H�0M�_!U}i�{J��>Ϸ��X�ʆ%#6��@�*X�V���D8]e��s�_�@�M�T�`���L�J�XQLB5	G�ĔT��y��\�����plXo���PS��?TX��o�D��-ׄO�D�gѬU}�@\�C)&�;��{61�����$Xu�TUX\��vs3tm�O�f�����GTZ���?jT�e
�%�6�Ԙ:�芹#�4yX��Gti��n(䏨0�X3�c�n�Єl����8)la\���u6*�׃B�T�?��:��Hâ��f�
�9�V��THU�����꼸����iF�H��Uz�*�~^�]�=�ң�,�N���g�M��:�c{�R��e3��C��)ZU���"ۂ[��v���\�9yW"�Cޤ/ǖ�$�o2�BNo���F|��a��@�AX<h(�TԠ�Y��S���NBDU�4F��1����@�m�Y��.q�d�J\���V�̆V'���*q�cѿ&a�Pw�dS�Bd�����B���f��?�(	;�W>��x��M��J��/'��:�	{�m�Z�ch�`���L�����L�����7�F�c�Bf�ۿ���~~=^��kՄ�=��������NI�ۛTsIIȻ�T�&��,l~RQ�F�~�I'�x~�BDy[�2�C�(�XS�
�}���\�v�iU���TC!\B����"�Z}�UT�0Ag�(�д�T�|tj�+�@p�j
�)�%�S�Ҩ�D����0���)�o�<,�x�D�ҹXT�I)����&O����?��\      K   �   x�e��
�@F��S�p��O�$E�B)a�y�}�Zt�8���Q���1<�$ ��D�gD���0�Z��g�%c~�7"	���>d^����u�M��,�ǑLnl�N?�F÷d��G���t�%B(S��LQ���Qۦ�

����|�i�)���B^���?F@R7�t�	I�/4E9�      M      x������ � �      O      x������ � �      2   Z   x�3�4�4�LII�.3##S3��1gzRRz���)���!^�qa�ņ��;.캰��¬;.6]�pa'��������e1z\\\ ��.�      0   3   x�3�0�[/l�8c���@"/6_�t��Ӑ˘3##H��qqq 46�      7   �  x�U�Ir�8E׉S��8si�+�ly
˪��7PEA� ��4���^��+�w ���#z��_�o�v�zѣv�~r�H���v0{�F��d��\a���V"�{�(|mz�yN[�)�DA���Q��\��R���n�jozLˈ^�0�yիխ�'!czѮ2����m�T%d����^��h���ۣ�$�v��7����Y�����&Z�ݢ}K^Wʉ(�{��Ъ�QL?�]��nUefݔ�\3�<�эr���"��4��k?U �~Q"*���/���� L,�����qDOj��^��Q_yA���cz�Z%�ގS��>���4��"��z�:�9n���m�E\���׵"Y{����;�Dҍ��:��m�N$1m&/I�Qս-��}��Zӛޫ�d�l��ڴ"��qr]ت���_�*-����W��kר�֭���??Њh��V��4�$Gۊ4�����;)��68*�8��V"�C:�DZ ԃ�~��Fi�/�����Tdko>!��T��(Y�7jn�"��טQ��{���p�m�ki u-B��u79-��Ȁ������1"C$
�w�_��bh�9�8�yD��v�w|��Z�(�R�H
%�kY��E��ڛ;��������z=���Kzq�����u���ҳr�wp!a���G���(p��	l5����n̑��Q�l�>oUq??��O]���?�0�EQp���\=㪭(Jz��o(�r�iU�f,�/H2�Sʈ^�SJ�1��(�iE��C��)�؊�e�<�@�V���kjD�t��[�j�PA��{�(K\yq�;k��,*��.����B�Ћ��lW[X��Z_8T��M�z��sK� M����h(�NͰ�\��p�P���A��i?>? �ؙKWJ���V�1��0L΋%��-��ՈvJ����t T� ,���(�o�n�x�j�/�P-
⫓�-H�XgZO]I�m���	�07�t��Îs�/�*�v�R���ӱf���BP��P�pVo����$� q@,��Aǭv���" �ϕ�Y�
B�����	A�P��>�H'�38�{���	��'30Y+�6�S��|4���a1��w��{�P�`�/?��a �z?L�B�\�G�AU��I�/%A���������9=7#�C�kRc����,=�z����gHSz1��f�}ȶ�C�)�Z	}o��*��[��CD -C��L���a\ݵ&L�uhd[_��}�K~�@���^m�ρ=j�Jx���hW�`c�	�i���Ihs^�8�j_
@o I �s����/bH��׃K��o�������'��0��G�����Î��O���Q�2���ِt��́��,~�|��HQ�S�y�䛩�Z�4���"H�UM���γ���m�n���hg᩷+6y���@r����ڴ~�>2�B�%�`��?R[A�����Z�!���8�      8      x������ � �      :      x������ � �      6   e   x�U˱�0D�����t"�%2��L�	2H��Fa�&���c!���LCp_K �p}��~�}OЌ��)�f��ш�Ú���W�	��dw�^W?zl��/���      ?      x������ � �      9   �   x�5�1
1D��]\������<�6B�-�<���PD��;|odR�k�a��JJ�|X"b�O5��x�WC9#li�&k��!wy�*Y7��^[x�,�����<F�3r�c��y�Ɠ��:p�J���~��� �/�      Q      x������ � �      C   ?  x�mRێ� }f>fS���;�u�
q٨�M���Ʃ���9����Ùғ���3���`jI?̛0���An���ق%� Wֻ9aZZ��4��ES���7��x߹�Y��p'�M+<H<Z��_,�!�����G��Ł�`p��
��|�9է<(�+i�Z�;�l��=(mF�gpS�(��q�1�ӖN/}�'�"����\���T�ϫ�p�	%	����*�ل��V�w:�&z�Dd>�vpq{��������x��k�K���T�h;)�+=�$�z����kg���LQ��뙝���
ٞ����V����� ��-�      A   �  x����n�0������j+{6�k��J���`֘�y��C��H
��f���g�{�|} �Pe;�n@ ~S��/�<?�*8PV�"�2+Pg�;&�d�2�΍5]�7��
H��̸P�	Ư����C���2#�ʴ}�������Q�ڛ�f�O0�xF��Lզ1�d�
��E�YE��r��ʬ�<�[0;1SdF�J��cX�Ń���w�ꝍ�n?��*�ժu{N*��d���w�?����_�?<���@�C3?t�{7��N�;�JH�`Y�S�C��e�9LIr6��7�ϮދH2!y�+��0�xx<��������	gb�?躵�&at�"n6�w�P�K�1ݧQ�S��w ��"A��� h87�zo�E�?�=�HVI�8K0�M2X����t{�l��"�����2����1�P��R��.��]F��@W�Y��j�<�`�NX1�/) ׇ�I(D��
��(��F!�o1���_z��/R�X)�7Z�*��WQ�68M�[�.��S7����N�`�w^�f�e����>�:|�Uw�y�s!i�z�J��4z
U�M	Ղ�=8�.����0�VS/ʕB�أBqٻ��%w��Hj���)l�z��٬� ,	�����ׇCJ r2�w,�0~zbP�$�MR��f��\ /N@O��R^��S�s�N�8W��|qR2�"��9�
��4p_���F�1      R     x���r�0  �s���;8�An�F�b��#�H�����=�4�n/>0��A�MSE������~�J<�Ȫ	b�vy������5L��V������I�m-���;��\%���}M} �(
���5�-S�IZb�C�J���?���/��.w�5��Y��x���5�z�Ã���.��u�����>�Q���p�#]S,Se�=�&���<�]Ն���6N���C/�`;J2��ѽ�?���,>UhdBu�i�/J�3I��P�^�      ;   �   x�͔�JA��o�����f��]c��9s�&��$Il�,| �!�`��^ak]>��+�SYDȭ<�Nd/ϲ���U奻��7W�{�׸���v9�������N�l>��-pT�6'�cF�)8��G��`8��Cw"�H`k���`u-sA����!�S��t��t?й��|�tì�B�tD�b�tz;�(��]_޴([�]jRj�f�>%8�;�N*���1j�x`�yd<.            x������ � �      3   ^   x�U���0�)2���)(�c !� P2ý���l�O.�Dn�-�Nx���I[^;�ʃ�Km�89y�=:���j
y�i?�      4   �   x���M�0�����-�y7�!5`p�A<���9����i�M�73�,�6iHCӎ箬��Зm�U�|pΣc�98
E ���x�4g2����3��n�.+ ��� 4�Ds`�F:���L��=�X�`�Q�	.,e�1�-3iPU�TO_&iHފ1�A���[�f�>3Ƽ ��{{      5   g   x�u���@D�P�3dCz���e!Rr!�f���K(��a��̔K�3��Rg7��o�����}k��܊do�3����#(ʑ>�9��D9�p��x�*�      <     x���_N�@Ɵ�S���
Jb�6w�=A����UM�P!�ZB���
�+�$��[��]�>������|���vC%-2���/I�ΓE�������b�����z��I�g��>�}�\�2���V��X��w�Q����Rf�!`D1��S(j�'}"3�IbMJ�X�Y^���+�����m��2��v��L�=�Wj"c>�.�e�R8���h@�K��|B�/`oTd5�${�~j��8q��U2/d�!�9J�C�L3��7,��xg\T�z�`Q旱r�4� �	����*���x0pE�OL��UmĿE�)�ք��`�r_��I���"6.R�O�h�6p���2\�Z6�6P�y�)\ii�#��:u1GU笩M?�O�ȓ�߲b�Ls_��)�@�ey�!���69aN}n�Y�œ��d1�q*��l({3!�����_Q��*O�%~k�����l=�(�N�:����g�̳:�P��2Q���zN���S�u�,��0}N�C����hEk�	^����N��ˇx�l��ܘ-ẈZ�Nk�@�3����.�CRٸUv�v�i}63�2���fñ�p[� %�a��X��%�B�Y9��,h��^�ck��&�Ml���L�!�y�#2_��mY�c�=D3��۶Ц�g(Ţb;v�{(�H�J��I�6�HF�&و+r'����M�֌�f�M�s3`a\�S-��6��y��.g�S0e��-q��)��iy��i�FM����	m_�p�ڄ����2������>A�ʊ��y���\/�c�S�k��l�pZ�"2!^k��E���fq���F�YmGw���N�:��3rK_fe��.�(�r�f_:���"�r�"���J2(�5"r�����B�>���r�@qͷ���i��Xy]{X;<G�WW���-C�0;��@���\�rs_���2s]B�+~���u ��0��P��c�x�������	�bW9��l�M�����#Q���=1�ĵ
�eS����n7�Ϳ�*�p      =      x������ � �      >      x������ � �      1   �   x���M
�@���ÔN�ɴ�^@OЍT�ց����FV]Hx�g�h���9�kC�N�7e!v�cV�l����T0���>\��zih�
3Nq�9�N��V��#�z�L>i!�`�`~-�p� ɂK4Y��B1)��	`^���f��?����V5��      �      x������ � �      X      x������ � �      q      x������ � �      s      x������ � �      o   <  x�u�A��8E��)��Ȏ{=�h��I�t�8����GI�_R-�K�۟%�雿O�����q����|7�	ן�:^�6"�ߧ�u���"x���ARp�?��?������9-_�u�͏���t��9 ٝa���lа�Z2z4ܘ\^���l�h0�v~g��<�b�[O��FZ�"@t��]r�^���G�O����<ˏ'��Og�N�A�����4yLO>ϏWX����sj�耇��k$����������Nmft��O�׉V��k!ߕa�	�lW��%��B�UB4�ϧ�)l��H���\I���9� ��&�Im��=	�Y}�����섟����Y1�h�BL>�4=<Nj6�ﷰfk3����u��ʈ� �#���V���Y�L�m�¶�ѕ� �aCBAF+�~�ڛ<V&�B�w�z���iZOvp{Ha ٖa!��es�5�d�h8sv/S8*7��n�v{<�&w"��6�ۉ������N�f���
o50tl��!����n86�8�򆊶��Է?�V�0�k�C�[��)	�oI��������]p���z�����I�\{@�z� V�_bf_ IuP9o�n���a;��]�C�y�X�;!;�;%S�	��y��P�+���Η�s^.��z:�q�`��)H�
vK�������)5T�2�XDb ��w�"����9�lf:�m�7�`5py=�4��S��t�Jq1�1IS�4F'i��c��$�Xf���(�j�(Oэ��Q]�>�v��Q&�h|�6�p��KC�6���I8.+�ʺ$.+�Ū$�.
Ӻ��9-���EJ5N�� ;�b�XIص�d�J��j��P)S�B�i���:3bm�I�k�<�4��z���ZF�TǶ9�m���7��TŶ�da�!)N�����R�l,Dɣ�ǊS���ѵ�s�P �A�c�Ǖ�#�����v�x�[`�x���~��0߻~�������u&P���Q�bM�Q�O������ݡ�D@��½��7�C�X�䕹�tIVm �4�<vj��y��#��H¶��ALI�U"��Af���rӗ�ď7��.�U�"?�+{��C��;��)���e�<���	��R%��`��.
JL#Ū�^
�L;Ũ�
jRS�*�$���������5���*:������RS�gM.���&���\h���>zrQ�G=��5�A�6?h!D�+Q�r�Ck.6�t�#��]�}�v��Wǝ��PU���WbE-D
ڶ�&L�uy�Ҡ��&Di�yl=�NU}%2���Tu(b2�*�4�N/so�.��س�q쿰N�\�}R�^V��~L�����q      u   �   x�m��n�@E��]�3��ofH\�Z�BҒ�4P@A��y���.<w}s�������	0M!(�m����j�*�<�^���6
���c�U�!�|�	X�O�佘�d���������nu���{i���+r�ˮMjI0��c�zB`�I��m�����M`���b|��ܜ1��F�'���|n����ˈ�N�Fr��ֽ�N�8��,^�cf21Q�����4��Q(1������{�Q�e�aVW�      w      x������ � �      y      x������ � �      [   .   x�3�4�4�LII�.3##S3��1gzRRz���)W� ���      Y   3   x�3�0�[/l�8c���@"/6_�t��Ӑ˘3##H��qqq 46�      `   �  x�U�Ir�8E׉S��8si�+�ly
˪��7PEA� ��4���^��+�w ���#z��_�o�v�zѣv�~r�H���v0{�F��d��\a���V"�{�(|mz�yN[�)�DA���Q��\��R���n�jozLˈ^�0�yիխ�'!czѮ2����m�T%d����^��h���ۣ�$�v��7����Y�����&Z�ݢ}K^Wʉ(�{��Ъ�QL?�]��nUefݔ�\3�<�эr���"��4��k?U �~Q"*���/���� L,�����qDOj��^��Q_yA���cz�Z%�ގS��>���4��"��z�:�9n���m�E\���׵"Y{����;�Dҍ��:��m�N$1m&/I�Qս-��}��Zӛޫ�d�l��ڴ"��qr]ت���_�*-����W��kר�֭���??Њh��V��4�$Gۊ4�����;)��68*�8��V"�C:�DZ ԃ�~��Fi�/�����Tdko>!��T��(Y�7jn�"��טQ��{���p�m�ki u-B��u79-��Ȁ������1"C$
�w�_��bh�9�8�yD��v�w|��Z�(�R�H
%�kY��E��ڛ;��������z=���Kzq�����u���ҳr�wp!a���G���(p��	l5����n̑��Q�l�>oUq??��O]���?�0�EQp���\=㪭(Jz��o(�r�iU�f,�/H2�Sʈ^�SJ�1��(�iE��C��)�؊�e�<�@�V���kjD�t��[�j�PA��{�(K\yq�;k��,*��.����B�Ћ��lW[X��Z_8T��M�z��sK� M����h(�NͰ�\��p�P���A��i?>? �ؙKWJ���V�1��0L΋%��-��ՈvJ����t T� ,���(�o�n�x�j�/�P-
⫓�-H�XgZO]I�m���	�07�t��Îs�/�*�v�R���ӱf���BP��P�pVo����$� q@,��Aǭv���" �ϕ�Y�
B�����	A�P��>�H'�38�{���	��'30Y+�6�S��|4���a1��w��{�P�`�/?��a �z?L�B�\�G�AU��I�/%A���������9=7#�C�kRc����,=�z����gHSz1��f�}ȶ�C�)�Z	}o��*��[��CD -C��L���a\ݵ&L�uhd[_��}�K~�@���^m�ρ=j�Jx���hW�`c�	�i���Ihs^�8�j_
@o I �s����/bH��׃K��o�������'��0��G�����Î��O���Q�2���ِt��́��,~�|��HQ�S�y�䛩�Z�4���"H�UM���γ���m�n���hg᩷+6y���@r����ڴ~�>2�B�%�`��?R[A�����Z�!���8�      d      x������ � �      b      x������ � �      _   y   x�]���0���<p $5�
�v� ���T�t9�O9fCG������{����<_�̜���a@7U�B�5��	��{uD|%)fb3�E��W#�4�cQ�u���R>�x#a      h      x������ � �      a   �   x�5�1
1D��]\������<�6B�-�<���PD��;|odR�k�a��JJ�|X"b�O5��x�WC9#li�&k��!wy�*Y7��^[x�,�����<F�3r�c��y�Ɠ��:p�J���~��� �/�      {   I   x�3�4202�54�52P04�2��24�36��0�60�4��L�5�4䌮VJLIIMQ�R������4����� ���      m   2  x�mR�n� |�3H��;�:�beLI��L���$�p�>D�w���'����ň��s\A	��\�|Jg�;2D\4{�$�=Ι��\�t"��;���%�F+z�=7��գ'��R��"$e��F\�����!:������e�MŬ��#ײ���h��S�qM�K_&bFh�X
�!�v���d�A�2�x��F���kD1��&�h�mn�L*f�,l_�jߠu���=_`)P�gjK����M���g�|�9����D��v���_3�Ŵ�F�W�O�Wv�C4��u�J���)=��� �=�      k   �  x����n� E��Wt�tP�����%Q��M��I��������l���.��!��L0�+� �Px�D��gGN���g"�,�>�T��"U���d���L�f ;�Ʈ�N��Kcl`Q5��^!l�� �s0v��N�x���-l��L�����Y6p��A�z�E+r-4KT]�G�z��\j`����C��aAf��5���^�nà�,aX��[̼�Bvw����)f�&�m궯^p	P%�Ȕ2
���ˆ�z��mCPq���i�T�R�iT�Χ	��Y���^��._p*������v�<�$�I�G��Z
�P�/���:;���0�1�1*�8:�}���;~��u���@S�=ջq�keA�����?FK��0Q�N��5wc '�N\+R�s��x8~ ٮhc      |     x���n�0  �g���/5�!�[-�ȼ��f	a@S*��d_�sZ������[�F�J�r?�Ο�wt�`&�j�&������UƱf�]z��sl�+��fn�=ټ�5m��ɂJ�N�	R?�4��jS��q������� 6oYB�W"�7�pyos�;oCv�����M:��F|�(�0�,/Cɘ����j�q
� YO�U��d���_�JV!��X-h�m2:�V���h�!& " �rD��#ě�B���:���[�      e   �   x�͔�JA��o�����f��]c��9s�&��$Il�,| �!�`��^ak]>��+�SYDȭ<�Nd/ϲ���U奻��7W�{�׸���v9�������N�l>��-pT�6'�cF�)8��G��`8��Cw"�H`k���`u-sA����!�S��t��t?й��|�tì�B�tD�b�tz;�(��]_޴([�]jRj�f�>%8�;�N*���1j�x`�yd<.      ~   #   x�3�4�4�42�4!CN#0a�g``����� QS�      \   ^   x�U���0�)2���)(�c !� P2ý���l�O.�Dn�-�Nx���I[^;�ʃ�Km�89y�=:���j
y�i?�      ]   �   x���M�@���a�v��΃��� $�H�{�)�F��4,4��O�~O���-o]�����uHu>���E}Ac���(VU�`}����f&����7&���&+�e ^���f BW�X����U�d�� �4mޣ��:���:���D|2�R      ^   G   x�3�4�0225�4161�30����i\F0ic#c K�ICC��1�!���X�	��,�2�*���� %��      f     x���_N�@Ɵ�S���
Jb�6w�=A����UM�P!�ZB���
�+�$��[��]�>������|���vC%-2���/I�ΓE�������b�����z��I�g��>�}�\�2���V��X��w�Q����Rf�!`D1��S(j�'}"3�IbMJ�X�Y^���+�����m��2��v��L�=�Wj"c>�.�e�R8���h@�K��|B�/`oTd5�${�~j��8q��U2/d�!�9J�C�L3��7,��xg\T�z�`Q旱r�4� �	����*���x0pE�OL��UmĿE�)�ք��`�r_��I���"6.R�O�h�6p���2\�Z6�6P�y�)\ii�#��:u1GU笩M?�O�ȓ�߲b�Ls_��)�@�ey�!���69aN}n�Y�œ��d1�q*��l({3!�����_Q��*O�%~k�����l=�(�N�:����g�̳:�P��2Q���zN���S�u�,��0}N�C����hEk�	^����N��ˇx�l��ܘ-ẈZ�Nk�@�3����.�CRٸUv�v�i}63�2���fñ�p[� %�a��X��%�B�Y9��,h��^�ck��&�Ml���L�!�y�#2_��mY�c�=D3��۶Ц�g(Ţb;v�{(�H�J��I�6�HF�&و+r'����M�֌�f�M�s3`a\�S-��6��y��.g�S0e��-q��)��iy��i�FM����	m_�p�ڄ����2������>A�ʊ��y���\/�c�S�k��l�pZ�"2!^k��E���fq���F�YmGw���N�:��3rK_fe��.�(�r�f_:���"�r�"���J2(�5"r�����B�>���r�@qͷ���i��Xy]{X;<G�WW���-C�0;��@���\�rs_���2s]B�+~���u ��0��P��c�x�������	�bW9��l�M�����#Q���=1�ĵ
�eS����n7�Ϳ�*�p      g      x������ � �      c   Q   x�u��� �3L�J��E�����l��i�rJ���ƒ��>ԥ5M�nʱ�9�Tß�c��^�;Oa��O?      Z   �   x���M
�@���ÔN�ɴ�^@OЍT�ց����FV]Hx�g�h���9�kC�N�7e!v�cV�l����T0���>\��zih�
3Nq�9�N��V��#�z�L>i!�`�`~-�p� ɂK4Y��B1)��	`^���f��?����V5��     