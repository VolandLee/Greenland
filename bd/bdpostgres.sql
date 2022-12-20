PGDMP     )                    z         	   greenland    14.5    14.5 V    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16808 	   greenland    DATABASE     f   CREATE DATABASE greenland WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE greenland;
                postgres    false            /          0    18116    actions 
   TABLE DATA           9   COPY public.actions (action_id, action_name) FROM stdin;
    public          postgres    false    210   R       S          0    18581    ans 
   TABLE DATA           �   COPY public.ans (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    246   3R       G          0    18397 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    234   �R       I          0    18405    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    236   �R       E          0    18391    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    232   �R       K          0    18411 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    238   ]X       M          0    18419    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    240   Y       O          0    18425    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    242   ;Y       2          0    18134    barcodes 
   TABLE DATA           ^   COPY public.barcodes (barcode_id, catalog_id, supplier_id, barcode_name, country) FROM stdin;
    public          postgres    false    213   XY       0          0    18121    catalog 
   TABLE DATA           F   COPY public.catalog (catalog_id, catalog_name, parent_id) FROM stdin;
    public          postgres    false    211   �Y       7          0    18211    city 
   TABLE DATA           2   COPY public.city (city_id, city_name) FROM stdin;
    public          postgres    false    218   Z       8          0    18217    client_order 
   TABLE DATA           �   COPY public.client_order (client_order_id, client_id, product_id, from_premise_id, to_premise_id, client_price, order_date, delivery_date, received_date, sizex, sizey, sizez, weight) FROM stdin;
    public          postgres    false    219   �_       :          0    18251    client_routes 
   TABLE DATA           �   COPY public.client_routes (client_route_id, delivery_id, client_order_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    public          postgres    false    221   	`       6          0    18196    clients 
   TABLE DATA           �   COPY public.clients (client_id, received_point_id, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, balance, liked) FROM stdin;
    public          postgres    false    217   &`       ?          0    18349    control_points 
   TABLE DATA           s   COPY public.control_points (control_points_id, employee_id, product_id, action_id, premise_id, "time") FROM stdin;
    public          postgres    false    226   �`       9          0    18243    delivery 
   TABLE DATA           �   COPY public.delivery (delivery_id, delivery_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    220   �`       Q          0    18483    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    244   Sa       C          0    18383    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    230   pa       A          0    18375    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    228   �b       R          0    18511    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    245   �e       ;          0    18276 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, premise_id, fname, lname, patronymic, email, password, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, hire_date, chief_id) FROM stdin;
    public          postgres    false    222   �f                 0    27817    goodslist11 
   TABLE DATA           r   COPY public.goodslist11 (goodslist_id, product_id, premise_id, quantity, sizex, sizey, sizez, weight) FROM stdin;
    public          postgres    false    290   �g       3          0    18149    premise_type 
   TABLE DATA           D   COPY public.premise_type (premise_type_id, type_decryp) FROM stdin;
    public          postgres    false    214   �g       4          0    18154    premises 
   TABLE DATA           �   COPY public.premises (premise_id, premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number) FROM stdin;
    public          postgres    false    215   Fh       5          0    18181    products 
   TABLE DATA           {   COPY public.products (product_id, barcode_id, goodslist_id, supplier_price, client_price, quantity, available) FROM stdin;
    public          postgres    false    216   i       <          0    18293    region 
   TABLE DATA           8   COPY public.region (region_id, region_name) FROM stdin;
    public          postgres    false    223   �i       =          0    18299    supplier_order 
   TABLE DATA           �   COPY public.supplier_order (supplier_order_id, supplier_id, product_id, from_premise, to_premise, client_price, supplier_price, quantity, order_date, delivery_date, sizex, sizey, sizez, wieght) FROM stdin;
    public          postgres    false    224   �m       >          0    18324    supplier_routes 
   TABLE DATA           �   COPY public.supplier_routes (supplier_route_id, delivey_id, supplier_order_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    public          postgres    false    225   �m       1          0    18126 	   suppliers 
   TABLE DATA           �   COPY public.suppliers (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    public          postgres    false    212   �m       �          0    27832    Supp_ord_goodslist 
   TABLE DATA           }   COPY supplier."Supp_ord_goodslist" (goodslist_id, quantity, sizex, sizey, sizez, weight, premise_id, product_id) FROM stdin;
    supplier          postgres    false    291   �n       X          0    18922    actions 
   TABLE DATA           ;   COPY supplier.actions (action_id, action_name) FROM stdin;
    supplier          postgres    false    251   �n       q          0    27647 
   auth_group 
   TABLE DATA           0   COPY supplier.auth_group (id, name) FROM stdin;
    supplier          postgres    false    276   �n       s          0    27655    auth_group_permissions 
   TABLE DATA           O   COPY supplier.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    supplier          postgres    false    278   �n       o          0    27641    auth_permission 
   TABLE DATA           P   COPY supplier.auth_permission (id, name, content_type_id, codename) FROM stdin;
    supplier          postgres    false    274   o       u          0    27661 	   auth_user 
   TABLE DATA           �   COPY supplier.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    supplier          postgres    false    280   ht       w          0    27669    auth_user_groups 
   TABLE DATA           C   COPY supplier.auth_user_groups (id, user_id, group_id) FROM stdin;
    supplier          postgres    false    282   ru       y          0    27675    auth_user_user_permissions 
   TABLE DATA           R   COPY supplier.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    supplier          postgres    false    284   �u       [          0    18940    barcodes 
   TABLE DATA           `   COPY supplier.barcodes (barcode_id, catalog_id, supplier_id, barcode_name, country) FROM stdin;
    supplier          postgres    false    254   �u       Y          0    18927    catalog 
   TABLE DATA           H   COPY supplier.catalog (catalog_id, catalog_name, parent_id) FROM stdin;
    supplier          postgres    false    252   �u       `          0    19012    city 
   TABLE DATA           4   COPY supplier.city (city_id, city_name) FROM stdin;
    supplier          postgres    false    259   -v       d          0    19086    client_order 
   TABLE DATA           �   COPY supplier.client_order (client_order_id, client_id, product_id, from_premise_id, to_premise_id, current_client_route_id, client_price, order_date, delivery_date, received_date, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    263   |       b          0    19026    client_routes 
   TABLE DATA           �   COPY supplier.client_routes (client_route_id, parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    supplier          postgres    false    261   1|       _          0    18997    clients 
   TABLE DATA           �   COPY supplier.clients (client_id, received_point_id, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, balance, liked) FROM stdin;
    supplier          postgres    false    258   N|       h          0    19170    control_points 
   TABLE DATA           u   COPY supplier.control_points (control_points_id, employee_id, product_id, action_id, premise_id, "time") FROM stdin;
    supplier          postgres    false    267   �|       a          0    19018    delivery 
   TABLE DATA           �   COPY supplier.delivery (delivery_id, delivery_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    supplier          postgres    false    260   �|       {          0    27733    django_admin_log 
   TABLE DATA           �   COPY supplier.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    supplier          postgres    false    286   �}       m          0    27633    django_content_type 
   TABLE DATA           E   COPY supplier.django_content_type (id, app_label, model) FROM stdin;
    supplier          postgres    false    272   �}       k          0    27625    django_migrations 
   TABLE DATA           E   COPY supplier.django_migrations (id, app, name, applied) FROM stdin;
    supplier          postgres    false    270   *       |          0    27761    django_session 
   TABLE DATA           R   COPY supplier.django_session (session_key, session_data, expire_date) FROM stdin;
    supplier          postgres    false    287   ڀ       e          0    19117 	   employees 
   TABLE DATA           �   COPY supplier.employees (employee_id, premise_id, fname, lname, patronymic, email, password, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, hire_date, chief_id) FROM stdin;
    supplier          postgres    false    264   �       ~          0    27802 	   goodslist 
   TABLE DATA           r   COPY supplier.goodslist (goodslist_id, product_id, premise_id, quantity, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    289   �       \          0    18955    premise_type 
   TABLE DATA           F   COPY supplier.premise_type (premise_type_id, type_decryp) FROM stdin;
    supplier          postgres    false    255   %�       ]          0    18960    premises 
   TABLE DATA           �   COPY supplier.premises (premise_id, premise_type_id, coord_long, coord_lat, email, phone, postcode, region_id, city_id, street, h_number) FROM stdin;
    supplier          postgres    false    256   ��       ^          0    18972    products 
   TABLE DATA           o   COPY supplier.products (product_id, barcode_id, supplier_price, client_price, quantity, available) FROM stdin;
    supplier          postgres    false    257   A�       f          0    19134    region 
   TABLE DATA           :   COPY supplier.region (region_id, region_name) FROM stdin;
    supplier          postgres    false    265   ��       g          0    19140    supplier_order 
   TABLE DATA           �   COPY supplier.supplier_order (supplier_order_id, supplier_id, product_id, from_premise, to_premise, current_supplier_route_id, supplier_price, quantity, order_date, delivery_date, sizex, sizey, sizez, weight) FROM stdin;
    supplier          postgres    false    266   ǈ       c          0    19056    supplier_routes 
   TABLE DATA           �   COPY supplier.supplier_routes (supplier_route_id, parent_id, delivery_id, goodslist_id, point_id, next_point_id, start_date, end_date, status) FROM stdin;
    supplier          postgres    false    262   �       Z          0    18932 	   suppliers 
   TABLE DATA           �   COPY supplier.suppliers (supplier_id, supplier_name, email, phone, postcode, region_id, city_id, street, h_number, website) FROM stdin;
    supplier          postgres    false    253   E�       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
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
          supplier          postgres    false    288            /      x������ � �      S   O   x�3���,J�/�O+���L.��,���\NsKScc3#scCSNc##CN#SN3��/6\�qa#��	g�W� P^v      G      x������ � �      I      x������ � �      E   �  x�u�]��(���*��Q����ƕ�Lb�f��#۹���`��� �Э�c�2U`��ߗ��r����0��廲��>�kij�\_^�	��$`�����6C��'�yL��7�Fg�i�z��c~U��&��� $w���?`ɠb�����1��/��]5ޠ�m�Q��~�E�՞!;��b����NKu���ƞ���V?� zx :y6u�G��>>�:�67j���=U�w@M{���6��d�Q�Jx���(6���F��F����Ԑ�ψA�F�"�r] �*"����vqP���+SC��o�1�o���1�R[�����>��jv�O�@NS/� d4l�*��;<�wJ6_�7fk5���+�@N�����0��[�`���e�����zw�L�-b
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