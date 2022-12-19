    LANGUAGE sql
    AS $$insert into premises
(premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number)
values
(p_type, coord_long, coord_lat, email, phone, postcode, region, city, street, h_number)$$;
   DROP PROCEDURE public.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint);
       public          postgres    false                       1255    18609 >   add_product(bigint, bigint, numeric, numeric, bigint, boolean) 	   PROCEDURE     1  CREATE PROCEDURE public.add_product(IN b_id bigint, IN g_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean)
    LANGUAGE sql
    AS $$insert into products
(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values
(b_id, g_id, sup_p, c_p, quan, ava)$$;
 …   DROP PROCEDURE public.add_product(IN b_id bigint, IN g_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean);
       public          postgres    false            #           1255    18619 @   add_product11(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     £   CREATE FUNCTION public.add_product11(b_id bigint, g_id bigint, sup_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS bigint
    LANGUAGE sql
    RETURN 1;
 t   DROP FUNCTION public.add_product11(b_id bigint, g_id bigint, sup_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            +           1255    18633 p   create_supplier_order(bigint, numeric, bigint, bigint, numeric, bigint, bigint, bigint, bigint, numeric, bigint) 	   PROCEDURE     -  CREATE PROCEDURE public.create_supplier_order(IN s_id bigint, IN c_pr numeric, IN f_pr bigint, IN t_pr bigint, IN s_pr numeric, IN quan bigint, IN sizex bigint, IN sizey bigint, IN sizez bigint, IN wieght numeric, IN b_id bigint)
    LANGUAGE sql
    AS $$

insert into supplier_order
(supplier_id, product_id, from_premise,
to_premise, client_price, supplier_price, quantity, order_date, sizex, sizey, sizez, wieght)
values
(s_id, (select ssuka11(b_id, t_pr, s_pr, c_pr, quan, '0')), f_pr, t_pr, c_pr, s_pr, quan, now(), sizex, sizey, sizez, wieght);

$$;
 å   DROP PROCEDURE public.create_supplier_order(IN s_id bigint, IN c_pr numeric, IN f_pr bigint, IN t_pr bigint, IN s_pr numeric, IN quan bigint, IN sizex bigint, IN sizey bigint, IN sizez bigint, IN wieght numeric, IN b_id bigint);
       public          postgres    false                       1255    18605 6   create_supplier_order1(bigint, bigint, bigint, bigint) 	   PROCEDURE     ˜   CREATE PROCEDURE public.create_supplier_order1(IN sup_id bigint, IN bar_id bigint, IN f_p bigint, IN t_p bigint)
    LANGUAGE sql
    AS $$show time$$;
 p   DROP PROCEDURE public.create_supplier_order1(IN sup_id bigint, IN bar_id bigint, IN f_p bigint, IN t_p bigint);
       public          postgres    false                       1255    18602 >   new_barcode(bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE     &  CREATE PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country bigint)
    LANGUAGE sql
    AS $$insert into barcodes
(barcode_id, catalog_id, supplier_id, barcode_name, country)
values
(b_id, cat_id, sup_id, b_name, country)$$;
 ‡   DROP PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country bigint);
       public          postgres    false                       1255    18603 I   new_barcode(bigint, bigint, bigint, character varying, character varying) 	   PROCEDURE     1  CREATE PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$insert into barcodes
(barcode_id, catalog_id, supplier_id, barcode_name, country)
values
(b_id, cat_id, sup_id, b_name, country)$$;
 ’   DROP PROCEDURE public.new_barcode(IN b_id bigint, IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       public          postgres    false                       1255    18599 B   new_barcode1(bigint, bigint, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE public.new_barcode1(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$insert into barcodes
(catalog_id, supplier_id, barcode_name, country)
values
(cat_id, sup_id, b_name, country)$$;
 ƒ   DROP PROCEDURE public.new_barcode1(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       public          postgres    false                       1255    18577    new_supplier_order(integer) 	   PROCEDURE     «   CREATE PROCEDURE public.new_supplier_order(IN sup_name integer)
    LANGUAGE sql
    AS $$insert into ans
(
select * from suppliers s
where s.supplier_id = sup_name)
 $$;
 ?   DROP PROCEDURE public.new_supplier_order(IN sup_name integer);
       public          postgres    false            %           1255    18629 8   ssuka(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     H  CREATE FUNCTION public.ssuka(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
      BEGIN
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0');
      END;
  $$;
 j   DROP FUNCTION public.ssuka(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            &           1255    18630 9   ssuka1(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     a  CREATE FUNCTION public.ssuka1(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
      BEGIN
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0') RETURNING product_id;
      END;
  $$;
 k   DROP FUNCTION public.ssuka1(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            '           1255    18631 :   ssuka11(bigint, bigint, numeric, numeric, bigint, boolean)    FUNCTION     R  CREATE FUNCTION public.ssuka11(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean) RETURNS integer
    LANGUAGE sql
    AS $$
    
        insert into products(barcode_id, goodslist_id, supplier_price, client_price, quantity, available)
values (b_id, g_id, s_p, c_p, quan, '0') RETURNING product_id;
     
  $$;
 l   DROP FUNCTION public.ssuka11(b_id bigint, g_id bigint, s_p numeric, c_p numeric, quan bigint, ava boolean);
       public          postgres    false            "           1255    26829 #   accept_goodslist_details_sr(bigint)    FUNCTION     †  CREATE FUNCTION supplier.accept_goodslist_details_sr(s_o_id bigint) RETURNS TABLE(current_supplier_route_id bigint, product_id bigint, quantity bigint, sizex bigint, sizey bigint, sizez bigint, weight bigint, next_point_id bigint, status bigint, delivery_id bigint)
    LANGUAGE plpgsql COST 1 ROWS 1
    AS $$
begin
return QUERY  select  so.current_supplier_route_id, so.product_id, so.quantity, so.sizex, so.sizey, so.sizez, so.weight, sr.next_point_id, sr.status, sr.delivery_id from supplier.supplier_order so, supplier.supplier_routes so
where so.supplier_order_id = s_o_id and sr.supplier_route_id= so.current_supplier_route_id; 
end;

$$;
 C   DROP FUNCTION supplier.accept_goodslist_details_sr(s_o_id bigint);
       supplier          postgres    false    6            /           1255    26835 ,   accept_update_supplier_routes_status(bigint) 	   PROCEDURE     ¿   CREATE PROCEDURE supplier.accept_update_supplier_routes_status(IN s_r_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_routes set status =3 where supplier_route_id = s_r_id
$$;
 P   DROP PROCEDURE supplier.accept_update_supplier_routes_status(IN s_r_id bigint);
       supplier          postgres    false    6            )           1255    19197 A   add_barcode(bigint, bigint, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE supplier.add_barcode(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying)
    LANGUAGE sql
    AS $$
insert into supplier.barcodes
(catalog_id, supplier_id, barcode_name, country)
values
(cat_id, sup_id, b_name, country)
$$;
 „   DROP PROCEDURE supplier.add_barcode(IN cat_id bigint, IN sup_id bigint, IN b_name character varying, IN country character varying);
       supplier          postgres    false    6            $           1255    19210 E   add_goodslist(bigint, bigint, bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE     ;  CREATE PROCEDURE supplier.add_goodslist(IN pr_id bigint, IN p_id bigint, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w bigint)
    LANGUAGE sql
    AS $$

insert into supplier.goodslist
(product_id, premise_id, quantity, sizex, sizey, sizez, weight)
values
(pr_id, p_id, quan, sx, sy, sz, w);

$$;
    DROP PROCEDURE supplier.add_goodslist(IN pr_id bigint, IN p_id bigint, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w bigint);
       supplier          postgres    false    6            *           1255    19198 …   add_premise(bigint, double precision, double precision, character varying, bigint, bigint, bigint, bigint, character varying, bigint) 	   PROCEDURE       CREATE PROCEDURE supplier.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint)
    LANGUAGE sql
    AS $$
insert into supplier.premises
(premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number)
values
(p_type, coord_long, coord_lat, email, phone, postcode, region, city, street, h_number)
$$;
 
  DROP PROCEDURE supplier.add_premise(IN p_type bigint, IN coord_long double precision, IN coord_lat double precision, IN email character varying, IN phone bigint, IN postcode bigint, IN region bigint, IN city bigint, IN street character varying, IN h_number bigint);
       supplier          postgres    false    6            (           1255    19196 6   add_product(bigint, numeric, numeric, bigint, boolean) 	   PROCEDURE       CREATE PROCEDURE supplier.add_product(IN b_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean)
    LANGUAGE sql
    AS $$
insert into supplier.products
(barcode_id, supplier_price, client_price, quantity, available)
values
(b_id, sup_p, c_p, quan, ava)
$$;
 w   DROP PROCEDURE supplier.add_product(IN b_id bigint, IN sup_p numeric, IN c_p numeric, IN quan bigint, IN ava boolean);
       supplier          postgres    false    6            !           1255    19206 C   add_supplier_routes(bigint, bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE       CREATE PROCEDURE supplier.add_supplier_routes(IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint, IN par_id bigint DEFAULT NULL::bigint, IN st bigint DEFAULT 0)
    LANGUAGE sql
    AS $$

insert into supplier.supplier_routes
(parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, status)
values
(par_id, d_id, g_id, p_id, n_p_id, now(), st);

$$;
    DROP PROCEDURE supplier.add_supplier_routes(IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint, IN par_id bigint, IN st bigint);
       supplier          postgres    false    6            ,           1255    19199 o   create_supplier_order(bigint, bigint, bigint, bigint, bigint, numeric, bigint, bigint, bigint, bigint, numeric) 	   PROCEDURE       CREATE PROCEDURE supplier.create_supplier_order(IN s_id bigint, IN p_id bigint, IN f_pr bigint, IN t_pr bigint, IN st_s_r_id bigint, IN s_pr numeric, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w numeric)
    LANGUAGE sql
    AS $$

insert into supplier.supplier_order
(supplier_id, product_id, from_premise,
to_premise, start_supplier_route_id, supplier_price, quantity, order_date, sizex, sizey, sizez, wieght)
values
(s_id, p_id, f_pr, t_pr, st_s_r_id, s_pr, quan, now(), sx, sy, sz, w);

$$;
 Ý   DROP PROCEDURE supplier.create_supplier_order(IN s_id bigint, IN p_id bigint, IN f_pr bigint, IN t_pr bigint, IN st_s_r_id bigint, IN s_pr numeric, IN quan bigint, IN sx bigint, IN sy bigint, IN sz bigint, IN w numeric);
       supplier          postgres    false    6            .           1255    26832 >   create_supplier_routes(bigint, bigint, bigint, bigint, bigint) 	   PROCEDURE     <  CREATE PROCEDURE supplier.create_supplier_routes(IN pr_id bigint, IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint)
    LANGUAGE sql
    AS $$
insert into supplier.supplier_routes
(parent_id, delivery_id, goodslist_id, point_id, next_point_id, status)
values
(pr_id, d_id, g_id, p_id, n_p_id, 0)
$$;
 ƒ   DROP PROCEDURE supplier.create_supplier_routes(IN pr_id bigint, IN d_id bigint, IN g_id bigint, IN p_id bigint, IN n_p_id bigint);
       supplier          postgres    false    6            -           1255    26831 !   send_goodslist_details_sr(bigint)    FUNCTION     «  CREATE FUNCTION supplier.send_goodslist_details_sr(s_o_id bigint) RETURNS TABLE(current_supplier_route_id bigint, product_id bigint, quantity bigint, sizex bigint, sizey bigint, sizez bigint, weight bigint, next_point_id bigint, status bigint, delivery_id bigint, goodslist_id bigint)
    LANGUAGE plpgsql COST 1 ROWS 1
    AS $$
begin
return QUERY  select  so.current_supplier_route_id, so.product_id, so.quantity, so.sizex, so.sizey, so.sizez, so.weight, sr.next_point_id, sr.status, sr.delivery_id, sr.goodslist_id from supplier.supplier_order so, 
supplier.supplier_routes so
where so.supplier_order_id = s_o_id and sr.supplier_route_id= so.current_supplier_route_id; 
end;

$$;
 A   DROP FUNCTION supplier.send_goodslist_details_sr(s_o_id bigint);
       supplier          postgres    false    6            0           1255    26836 *   send_update_supplier_routes_status(bigint) 	   PROCEDURE     ¾   CREATE PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_routes set status = 2 where supplier_route_id = s_r_id
$$;
 N   DROP PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint);
       supplier          postgres    false    6            1           1255    26838 2   send_update_supplier_routes_status(bigint, bigint) 	   PROCEDURE     9  CREATE PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint, IN s_o_id bigint)
    LANGUAGE sql
    AS $$
update supplier.supplier_order set current_supplier_route_id = s_r_id where supplier_order_id = s_o_id ;
update supplier.supplier_routes set status =2 where supplier_route_id = s_r_id;
$$;
 `   DROP PROCEDURE supplier.send_update_supplier_routes_status(IN s_r_id bigint, IN s_o_id bigint);
       supplier          postgres    false    6            Ò            1259    18116    actions    TABLE     p   CREATE TABLE public.actions (
    action_id integer NOT NULL,
    action_name character varying(45) NOT NULL
);
    DROP TABLE public.actions;
       public         heap    postgres    false            ÷            1259    18581    ans    TABLE       CREATE TABLE public.ans (
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
    DROP TABLE public.ans;
       public         heap    postgres    false            ë            1259    18397 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            ê            1259    18396    auth_group_id_seq    SEQUENCE     Ó   ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            í            1259    18405    auth_group_permissions    TABLE     Š   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            ì            1259    18404    auth_group_permissions_id_seq    SEQUENCE     ë   ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            é            1259    18391    auth_permission    TABLE     ¿   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            è            1259    18390    auth_permission_id_seq    SEQUENCE     Ý   ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            ï            1259    18411 	   auth_user    TABLE     ß  CREATE TABLE public.auth_user (
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
    DROP TABLE public.auth_user;
       public         heap    postgres    false            ñ            1259    18419    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            ð            1259    18418    auth_user_groups_id_seq    SEQUENCE     ß   ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            î            1259    18410    auth_user_id_seq    SEQUENCE     Ñ   ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            ó            1259    18425    auth_user_user_permissions    TABLE        CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            ò            1259    18424 !   auth_user_user_permissions_id_seq    SEQUENCE     ó   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    243            Õ            1259    18134    barcodes    TABLE     á   CREATE TABLE public.barcodes (
    barcode_id bigint NOT NULL,
    catalog_id integer NOT NULL,
    supplier_id integer NOT NULL,
    barcode_name character varying(45) NOT NULL,
    country character varying(45) NOT NULL
);
    DROP TABLE public.barcodes;
       public         heap    postgres    false            ù            1259    18597    barcodes_sequence    SEQUENCE     {   CREATE SEQUENCE public.barcodes_sequence
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.barcodes_sequence;
       public          postgres    false            Ó            1259    18121    catalog    TABLE     ‰   CREATE TABLE public.catalog (
    catalog_id integer NOT NULL,
    catalog_name character varying(45) NOT NULL,
    parent_id integer
);
    DROP TABLE public.catalog;
       public         heap    postgres    false            Û            1259    18211    city    TABLE     €   CREATE TABLE public.city (
    city_id integer NOT NULL,
    city_name character varying(45) DEFAULT NULL::character varying
);
    DROP TABLE public.city;
       public         heap    postgres    false            Ü            1259    18217    client_order    TABLE     ú  CREATE TABLE public.client_order (
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
     DROP TABLE public.client_order;
       public         heap    postgres    false            ö           0    0    TABLE client_order    ACL     5   GRANT SELECT ON TABLE public.client_order TO client;
          public          postgres    false    220            Þ            1259    18251 
   client_routes    TABLE     A  CREATE TABLE public.client_routes (
    client_route_id integer NOT NULL,
    delivery_id integer,
    client_order_id integer NOT NULL,
    point_id integer NOT NULL,
    next_point_id integer NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status integer NOT NULL
);
 !   DROP TABLE public.client_routes;
       public         heap    postgres    false            Ú            1259    18196    clients    TABLE     `  CREATE TABLE public.clients (
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
    DROP TABLE public.clients;
       public         heap    postgres    false            ÷           0    0 
   TABLE clients    ACL     0   GRANT SELECT ON TABLE public.clients TO client;
          public          postgres    false    218            ã            1259    18349    control_points    TABLE       CREATE TABLE public.control_points (
    control_points_id integer NOT NULL,
    employee_id integer NOT NULL,
    product_id integer NOT NULL,
    action_id integer NOT NULL,
    premise_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);
 "   DROP TABLE public.control_points;
       public         heap    postgres    false            Ý            1259    18243    delivery    TABLE     i  CREATE TABLE public.delivery (
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
    DROP TABLE public.delivery;
       public         heap    postgres    false            õ            1259    18483    django_admin_log    TABLE     ˆ  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            ô            1259    18482    django_admin_log_id_seq    SEQUENCE     ß   ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    245            ç            1259    18383    django_content_type    TABLE     Ÿ   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            æ            1259    18382    django_content_type_id_seq    SEQUENCE     å   ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            å            1259    18375    django_migrations    TABLE     Ä   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            ä            1259    18374    django_migrations_id_seq    SEQUENCE     á   ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            ö            1259    18511    django_session    TABLE     ª   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            ß            1259    18276 	   employees    TABLE     6  CREATE TABLE public.employees (
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
    DROP TABLE public.employees;
       public         heap    postgres    false            Ø            1259    18166 	   goodslist    TABLE       CREATE TABLE public.goodslist (
    goodslist_id integer NOT NULL,
    barcode_id bigint NOT NULL,
    premise_id integer NOT NULL,
    quantity integer NOT NULL,
    sizex integer NOT NULL,
    sizey integer NOT NULL,
    sizez integer NOT NULL,
    weight numeric(8,3) NOT NULL
);
    DROP TABLE public.goodslist;
       public         heap    postgres    false            Ö            1259    18149    premise_type    TABLE     {   CREATE TABLE public.premise_type (
    premise_type_id integer NOT NULL,
    type_decryp character varying(45) NOT NULL
);
     DROP TABLE public.premise_type;
       public         heap    postgres    false            ø            1259    18590    premises_sequence    SEQUENCE     {   CREATE SEQUENCE public.premises_sequence
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.premises_sequence;
       public          postgres    false            ×            1259    18154    premises    TABLE     ¢  CREATE TABLE public.premises (
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
    DROP TABLE public.premises;
       public         heap    postgres    false    248            ú            1259    18606    product_sequence    SEQUENCE     z   CREATE SEQUENCE public.product_sequence
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.product_sequence;
       public          postgres    false            Ù            1259    18181    products    TABLE     L  CREATE TABLE public.products (
    product_id integer DEFAULT nextval('public.product_sequence'::regclass) NOT NULL,
    barcode_id bigint NOT NULL,
    goodslist_id bigint NOT NULL,
    supplier_price numeric(10,2) NOT NULL,
    client_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    available boolean NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false    250            à            1259    18293    region    TABLE     †   CREATE TABLE public.region (
    region_id integer NOT NULL,
    region_name character varying(90) DEFAULT NULL::character varying
);
    DROP TABLE public.region;
       public         heap    postgres    false            ø           0    0    TABLE region    ACL     /   GRANT SELECT ON TABLE public.region TO client;
          public          postgres    false    224            û            1259    18611    supplier_order_sequence    SEQUENCE        CREATE SEQUENCE public.supplier_order_sequence
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.supplier_order_sequence;
       public          postgres    false            á            1259    18299    supplier_order    TABLE     _  CREATE TABLE public.supplier_order (
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
 "   DROP TABLE public.supplier_order;
       public         heap    postgres    false    251            â            1259    18324    supplier_routes    TABLE     O  CREATE TABLE public.supplier_routes (
    supplier_route_id integer NOT NULL,
    delivey_id integer NOT NULL,
    supplier_order_id integer NOT NULL,
    point_id integer,
    next_point_id integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    status integer NOT NULL
);
 #   DROP TABLE public.supplier_routes;
       public         heap    postgres    false                       1259    19203    supplier_routes_seq    SEQUENCE     |   CREATE SEQUENCE public.supplier_routes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.supplier_routes_seq;
       public          postgres    false            Ô            1259    18126 	   suppliers    TABLE     l  CREATE TABLE public.suppliers (
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
    DROP TABLE public.suppliers;
       public         heap    postgres    false            ü            1259    18922    actions    TABLE     r   CREATE TABLE supplier.actions (
    action_id integer NOT NULL,
    action_name character varying(45) NOT NULL
);
    DROP TABLE supplier.actions;
       supplier         heap    postgres    false    6            ÿ            1259    18940    barcodes    TABLE     ã   CREATE TABLE supplier.barcodes (
    barcode_id bigint NOT NULL,
    catalog_id integer NOT NULL,
    supplier_id integer NOT NULL,
    barcode_name character varying(45) NOT NULL,
    country character varying(45) NOT NULL
);
    DROP TABLE supplier.barcodes;
       supplier         heap    postgres    false    6            ý            1259    18927    catalog    TABLE     ‹   CREATE TABLE supplier.catalog (
    catalog_id integer NOT NULL,
    catalog_name character varying(45) NOT NULL,
    parent_id integer
);
    DROP TABLE supplier.catalog;
       supplier         heap    postgres    false    6                       1259    19012    city    TABLE     ‚   CREATE TABLE supplier.city (
    city_id integer NOT NULL,
    city_name character varying(45) DEFAULT NULL::character varying
);
    DROP TABLE supplier.city;
       supplier         heap    postgres    false    6            	           1259    19086    client_order    TABLE       CREATE TABLE supplier.client_order (
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
 "   DROP TABLE supplier.client_order;
       supplier         heap    postgres    false    6                       1259    19026 
   client_routes    TABLE     N  CREATE TABLE supplier.client_routes (
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
 #   DROP TABLE supplier.client_routes;
       supplier         heap    postgres    false    6                       1259    18997    clients    TABLE     b  CREATE TABLE supplier.clients (
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
    DROP TABLE supplier.clients;
       supplier         heap    postgres    false    6            
           1259    19170    control_points    TABLE       CREATE TABLE supplier.control_points (
    control_points_id integer NOT NULL,
    employee_id integer NOT NULL,
    product_id integer NOT NULL,
    action_id integer NOT NULL,
    premise_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);
 $   DROP TABLE supplier.control_points;
       supplier         heap    postgres    false    6                       1259    19018    delivery    TABLE     k  CREATE TABLE supplier.delivery (
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
    DROP TABLE supplier.delivery;
       supplier         heap    postgres    false    6            
           1259    19117 	   employees    TABLE     8  CREATE TABLE supplier.employees (
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
    DROP TABLE supplier.employees;
       supplier         heap    postgres    false    6                       1259    18982 	   goodslist    TABLE       CREATE TABLE supplier.goodslist (
    goodslist_id integer NOT NULL,
    product_id bigint NOT NULL,
    premise_id integer NOT NULL,
    quantity integer NOT NULL,
    sizex integer NOT NULL,
    sizey integer NOT NULL,
    sizez integer NOT NULL,
    weight numeric(8,3) NOT NULL
);
    DROP TABLE supplier.goodslist;
       supplier         heap    postgres    false    6                        1259    18955    premise_type    TABLE     }   CREATE TABLE supplier.premise_type (
    premise_type_id integer NOT NULL,
    type_decryp character varying(45) NOT NULL
);
 "   DROP TABLE supplier.premise_type;
       supplier         heap    postgres    false    6                       1259    18960    premises    TABLE     n  CREATE TABLE supplier.premises (
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
    DROP TABLE supplier.premises;
       supplier         heap    postgres    false    6                       1259    18972    products    TABLE     ÷   CREATE TABLE supplier.products (
    product_id integer NOT NULL,
    barcode_id bigint NOT NULL,
    supplier_price numeric(10,2) NOT NULL,
    client_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    available boolean NOT NULL
);
    DROP TABLE supplier.products;
       supplier         heap    postgres    false    6                       1259    19134    region    TABLE     ˆ   CREATE TABLE supplier.region (
    region_id integer NOT NULL,
    region_name character varying(90) DEFAULT NULL::character varying
);
    DROP TABLE supplier.region;
       supplier         heap    postgres    false    6                       1259    19140    supplier_order    TABLE     #  CREATE TABLE supplier.supplier_order (
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
 $   DROP TABLE supplier.supplier_order;
       supplier         heap    postgres    false    6                       1259    19056    supplier_routes    TABLE     Š  CREATE TABLE supplier.supplier_routes (
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
 %   DROP TABLE supplier.supplier_routes;
       supplier         heap    postgres    false    270    6            þ            1259    18932 	   suppliers    TABLE     n  CREATE TABLE supplier.suppliers (
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