PGDMP         !                 y            BARLogistics    12.5    12.5 <    b           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            c           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            d           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            e           1262    16393    BARLogistics    DATABASE     �   CREATE DATABASE "BARLogistics" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "BARLogistics";
                postgres    false            �            1259    16394    capitals    TABLE     �   CREATE TABLE public.capitals (
    name character varying NOT NULL,
    distance_from_bar integer,
    import_tax double precision
);
    DROP TABLE public.capitals;
       public         heap    postgres    false            �            1259    16400    orders    TABLE     �   CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer,
    status character varying,
    price double precision,
    ship_date character varying,
    order_date character varying
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16406    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    203            f           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    204            �            1259    16408    orders_parts    TABLE     �   CREATE TABLE public.orders_parts (
    order_id integer NOT NULL,
    part_id bigint NOT NULL,
    quantity integer NOT NULL
);
     DROP TABLE public.orders_parts;
       public         heap    postgres    false            �            1259    16411    parts    TABLE     �   CREATE TABLE public.parts (
    part_num integer NOT NULL,
    part_name character varying,
    location character varying,
    price double precision,
    volume integer
);
    DROP TABLE public.parts;
       public         heap    postgres    false            �            1259    16417    parts_locations    TABLE     m   CREATE TABLE public.parts_locations (
    name character varying NOT NULL,
    distances_from_bar integer
);
 #   DROP TABLE public.parts_locations;
       public         heap    postgres    false            �            1259    16423    parts_parts_num_seq    SEQUENCE     �   CREATE SEQUENCE public.parts_parts_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.parts_parts_num_seq;
       public          postgres    false    206            g           0    0    parts_parts_num_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.parts_parts_num_seq OWNED BY public.parts.part_num;
          public          postgres    false    208            �            1259    16425    roles    TABLE     W   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(20)
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    16428    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    209            h           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    210            �            1259    16430 
   user_roles    TABLE     ^   CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false            �            1259    16433    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    password character varying,
    first_name character varying,
    last_name character varying,
    address character varying,
    email character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16439    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    212            i           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    213            �            1259    16441    vehicle_info    TABLE        CREATE TABLE public.vehicle_info (
    type character varying NOT NULL,
    fuel_consumption integer,
    avg_speed integer
);
     DROP TABLE public.vehicle_info;
       public         heap    postgres    false            �            1259    16447    vehicle_inventory    TABLE     y   CREATE TABLE public.vehicle_inventory (
    id integer NOT NULL,
    type character varying,
    availability boolean
);
 %   DROP TABLE public.vehicle_inventory;
       public         heap    postgres    false            �
           2604    16453    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    204    203            �
           2604    16454    parts part_num    DEFAULT     q   ALTER TABLE ONLY public.parts ALTER COLUMN part_num SET DEFAULT nextval('public.parts_parts_num_seq'::regclass);
 =   ALTER TABLE public.parts ALTER COLUMN part_num DROP DEFAULT;
       public          postgres    false    208    206            �
           2604    16455    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            �
           2604    16456    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212            R          0    16394    capitals 
   TABLE DATA           G   COPY public.capitals (name, distance_from_bar, import_tax) FROM stdin;
    public          postgres    false    202   <D       S          0    16400    orders 
   TABLE DATA           Y   COPY public.orders (order_id, user_id, status, price, ship_date, order_date) FROM stdin;
    public          postgres    false    203   `Q       U          0    16408    orders_parts 
   TABLE DATA           C   COPY public.orders_parts (order_id, part_id, quantity) FROM stdin;
    public          postgres    false    205   }Q       V          0    16411    parts 
   TABLE DATA           M   COPY public.parts (part_num, part_name, location, price, volume) FROM stdin;
    public          postgres    false    206   �Q       W          0    16417    parts_locations 
   TABLE DATA           C   COPY public.parts_locations (name, distances_from_bar) FROM stdin;
    public          postgres    false    207   �X       Y          0    16425    roles 
   TABLE DATA           )   COPY public.roles (id, name) FROM stdin;
    public          postgres    false    209   �Y       [          0    16430 
   user_roles 
   TABLE DATA           6   COPY public.user_roles (user_id, role_id) FROM stdin;
    public          postgres    false    211   Z       \          0    16433    users 
   TABLE DATA           ^   COPY public.users (id, username, password, first_name, last_name, address, email) FROM stdin;
    public          postgres    false    212    Z       ^          0    16441    vehicle_info 
   TABLE DATA           I   COPY public.vehicle_info (type, fuel_consumption, avg_speed) FROM stdin;
    public          postgres    false    214   =Z       _          0    16447    vehicle_inventory 
   TABLE DATA           C   COPY public.vehicle_inventory (id, type, availability) FROM stdin;
    public          postgres    false    215   }Z       j           0    0    orders_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_order_id_seq', 1, true);
          public          postgres    false    204            k           0    0    parts_parts_num_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.parts_parts_num_seq', 1283, true);
          public          postgres    false    208            l           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    210            m           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    213            �
           2606    16458    capitals capitals_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.capitals
    ADD CONSTRAINT capitals_pkey PRIMARY KEY (name);
 @   ALTER TABLE ONLY public.capitals DROP CONSTRAINT capitals_pkey;
       public            postgres    false    202            �
           2606    16460     orders_parts order_products_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.orders_parts
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (order_id, part_id);
 J   ALTER TABLE ONLY public.orders_parts DROP CONSTRAINT order_products_pkey;
       public            postgres    false    205    205            �
           2606    16462    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    203            �
           2606    16464 $   parts_locations parts_locations_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.parts_locations
    ADD CONSTRAINT parts_locations_pkey PRIMARY KEY (name);
 N   ALTER TABLE ONLY public.parts_locations DROP CONSTRAINT parts_locations_pkey;
       public            postgres    false    207            �
           2606    16466    parts parts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (part_num);
 :   ALTER TABLE ONLY public.parts DROP CONSTRAINT parts_pkey;
       public            postgres    false    206            �
           2606    16468    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    209            �
           2606    16470 !   users uk6dotkott2kjsp8vw4d0m25fb7 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7;
       public            postgres    false    212            �
           2606    16472 !   users ukr43af9ap4edm43mmtq01oddj6 
   CONSTRAINT     `   ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT ukr43af9ap4edm43mmtq01oddj6;
       public            postgres    false    212            �
           2606    16474    user_roles user_roles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    211    211            �
           2606    16476    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    212            �
           2606    16478    vehicle_info vehicle_info_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.vehicle_info
    ADD CONSTRAINT vehicle_info_pkey PRIMARY KEY (type);
 H   ALTER TABLE ONLY public.vehicle_info DROP CONSTRAINT vehicle_info_pkey;
       public            postgres    false    214            �
           2606    16480 (   vehicle_inventory vehicle_inventory_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.vehicle_inventory
    ADD CONSTRAINT vehicle_inventory_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.vehicle_inventory DROP CONSTRAINT vehicle_inventory_pkey;
       public            postgres    false    215            �
           2606    16481 #   orders_parts fk_orders_parts_orders    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_parts
    ADD CONSTRAINT fk_orders_parts_orders FOREIGN KEY (order_id) REFERENCES public.orders(order_id) NOT VALID;
 M   ALTER TABLE ONLY public.orders_parts DROP CONSTRAINT fk_orders_parts_orders;
       public          postgres    false    205    2743    203            �
           2606    16486 "   orders_parts fk_orders_parts_parts    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_parts
    ADD CONSTRAINT fk_orders_parts_parts FOREIGN KEY (part_id) REFERENCES public.parts(part_num) NOT VALID;
 L   ALTER TABLE ONLY public.orders_parts DROP CONSTRAINT fk_orders_parts_parts;
       public          postgres    false    205    2747    206            �
           2606    16491    orders fk_orders_users    FK CONSTRAINT        ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_users FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 @   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_users;
       public          postgres    false    203    212    2759            �
           2606    16496    parts fk_parts_parts_locations    FK CONSTRAINT     �   ALTER TABLE ONLY public.parts
    ADD CONSTRAINT fk_parts_parts_locations FOREIGN KEY (location) REFERENCES public.parts_locations(name) NOT VALID;
 H   ALTER TABLE ONLY public.parts DROP CONSTRAINT fk_parts_parts_locations;
       public          postgres    false    206    2749    207            �
           2606    16501    users fk_users_capitals    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_capitals FOREIGN KEY (address) REFERENCES public.capitals(name) NOT VALID;
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_users_capitals;
       public          postgres    false    202    2741    212            �
           2606    16506 3   vehicle_inventory fk_vehicle_inventory_vehicle_info    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle_inventory
    ADD CONSTRAINT fk_vehicle_inventory_vehicle_info FOREIGN KEY (type) REFERENCES public.vehicle_info(type) NOT VALID;
 ]   ALTER TABLE ONLY public.vehicle_inventory DROP CONSTRAINT fk_vehicle_inventory_vehicle_info;
       public          postgres    false    214    2761    215            �
           2606    16511 &   user_roles fkh8ciramu9cc9q3qcqiv4ue8a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6;
       public          postgres    false    209    2751    211            �
           2606    16516 &   user_roles fkhfh9dx7w3ubf1co1vdev94g3f    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f;
       public          postgres    false    211    2759    212            R     x�uX�v�8\�_�]6�ߏ�l'v�G�-�9�3HDHX$�	�察*�N�f6�������;�\����4�1Ȣ4�,	�ʈQ���`A�WAy���o�4-�4�$EY�Y����ƈU/VO�����%HҪ�"o�giu/�8��*�c>�j�W�t7~���Z+VX�:fg\"�� N�����QO��2�kM+�|�~qc��,Iß��1�<H��dQTge^�q'q1��4���iZ��Y>)9��F��ȟ[���`ax�f'�3B�T)݇k�b�������.� Nx�;�r�d�e�VEB���g�^4r�"K2� O�s��V��u��B �]�"f&��N���c� ���E���I��3��A�9�1v�����>�7	�xby���6��t�_4�#nZY��p۩��ѽβT
�)͑7�7��^�0Xq�K
6g�v�R�y-͛l���5|���J�ѣ�g�^��e\FA�#΍���o��2a�	A=����+���yf�(V�.�g�F�rO۾�h���+Z�ն��Ys��V_Ĥ�"Os�eᕚ��3۱QAY'%ʨ��$��o�Y��w�����z�c��N7l����,B�Sh�&�M��|����g�A�(P�eZ�,��ζV��rGբw�ڋq�(�v׫}�%������p���Y��h�4��ߝ�n��E�� <1��C=��u��G#qɞ9׭�����sM��V�eyx���Zz��)(Ҽ`�&�j��p)�7bV�߷]�_���x`��.g���7������ܗ�̘H[=" �[��(,��4�Aۃ��z���������=�,�K�F�`7WAQŬ�$�//�NuVG!\�W{=�䟎��`��X��u��sq**�K^�#�A ��q��E�5/��N�a|��uV�*��ĖK=��V����'S{3�������e���U3�|�[����:�`r!��=g�`���ct7��rX��_�l�%A	h�Q���mŬ�[��ʪQ� ˳��O��_��F��4�"8[��jD<>O�&F�r�,�j'@=��-�6ʢb��!�Q�.��s��gQE�7��/�eD8%��<�&��hݎq�� �+p����GG�@YbK��#��RhԪ" ���L��%�(f�ү�j�AWR���׵o�si�2-f��vP����a��E��>Hk����])q�h�8��1��_� �":��qx���)Z]����ߙ����P��`��%.�]ف�Ε�4o���M�Lƺ�g{���'޻�"��!�|�ӃQ���յP(�:���y���ݫV�Gx}����q�ܳ#��?�	�smG@�	�-�z���3`�u/]:�2v���{��&�;���ظ�	S]��@�f� �A�<�� h��Ր�I؍�m׈��&��A���e�����$�Ue�MD/������OPWE��z@+�z@L�΢?A*T�S ̖��q����Xha�'M�;����x�zx�o�40ą�r���5�6��i�o��9�烴Ht�!���!r��!�W2Ѝ2jDD���]�A:��z�T@���n�+R����y�'�-Q=�A"[7'Ӟ޼��'װ-E��+@"eg�
��V�N^�U�0��X�ƭP�/�,c�)�Ą��2��h�*�"�N�҃���ӯy��b'3�F�b�ሳ��W�}�π��8KH#�l��'Տ�N\1w�	�8͘�����G�������$�"ɠu�9#�R�-܊i/LP&yͻe����*i�ūB#�
��~k��5�|bMWd�o4��lԋ?��EP����H�x�~,˙-���"bd�ӳ5�b���׉u��MB�6��^[q�wz����]H��&GBKV��q�D/(��f#��.�俐��ثE4�:(:��fiaT�c-\�8O��}�_ ����K�Q�y�չ���P �,��b<�H��7�i5Ֆ��dk4�,�,�&���?{월��hF�hgw�Y�o/
ʋ(%NǓj�+�@ρ9�]���~���4;�^��zX"�S �W���~�
�S�J��B7b� �p/���2���^(``�@��,,����y�C��[�Cҿ��t�����L�j'u2Bd׽��<ш)�0Pp�}�ώ���7��	1G�$����B�PEE�`B砏���|'�����WQ�L�v�Wq
����ɢ��?�F���#+w@��a�q!���qC�֙{������sKy�/p�J�_�(9���9�a\��P$�ד��k\O<��8�U�$�y��w^q�~�vW�#����QU���3YOڧ:Qf�n�1����H)r�^�;����$v�G��}�B#���\'��_����8��ڥ�tx�½!�ë�WgAVS��T�cF�(>�^�ܨy��\x���6�O.���_z��7Q��B�~���s;^�UyUy0_	����&�#ߔ�@55j�?��On�W[����1Nܨ#���,|�>��h:���Z��ع���2�_R�LA�`�����
1��4�����.�����П��ؽ��@.�P|��,��Pε�*q�.���!2n_��kV���M�<m��{��r��D�{�R:,���lB��'C=�����
kc6��r��޷�Q�L>F�����[�ڠ�ɯ�l6RSf{�PZb��7�����RaN~wKczxs䋗���b��	*s��Q	A�c1@0݊� �_���fm����AO88��!�X7�2���"M}�6��:���W�� /U�`(f��U�o�.̃����[�=U����B�n�>i+Pqh0�G�A���.-hy�IڞՂj�_��r.u�	*[1��v�s'�*7˴��vb��,���.�y�0����!d�"OɶUx���Vc*�W���`?�^��Y v�C�@�X��K	�(�q���;��*��hkG���骈5�^7\�m�9Hhh7������lL_�� Dђ�/v�ܤ�Ř�]7�'�b [b����ʼV�9��|�<�5K��p���e'(���j��k���A��ХiF-������{�� WQ:9��CL�;�.�63�a�փ��Qc�Ag�N����F����pHY�^�m5��X|���r(g�d�ɱɓ12e�XDЀ�{��I��a���m�^ ;Oh�7�(��,_���A�����Ed�^Y�8�Dv��H��.���ɽ�ˏ�E���S�d��/5`��ȟh�s���u�g      S      x������ � �      U      x������ � �      V     x�eWɎ�8=3_��̡����ـ$�h7�9̅�i��$���?����ɀ�X�W�<�s��D/4������<�겓�*R��
#�$dj��I�Qh�둓��H�Y��i\�8���RT����ڊ��@f}���Mά�!�z���-���������Q����"��sz�Sp�XemY/i����Uw�[�O��Xr�A-�q2d�-��)��J
�9��$4=�jK��yR�d����U�$����������*�ِޝ��3���8P�2��	>�1�|�޷�plE6���R�̾�ɃG�*I�y���%��,�+J��Nb���K��vYq���3ʼ�D�\}����`�|]�U�+W� �x���}BF�5|�Y9�d�r�+݉pqm��gU�4�a�C_�A��rpZ�ev�|�%#�~���RzoY��R��\�$z��L4mv�Z�.4�.�|v!�6��W�ु�,���U���<�,cL���d}����"'>�y���"B�u W��0�����r������P��"�p����{�Q3��Լ�Zs��l��Ԡ���~���<*ǖ����!�n�|���V��^�_����UN�"��b�a�>]w�����XO.W�h����W$�`k�8�	�ƽ/��_G>��7�.��UR��QN���,�5y�d(w�i�{q���dKgsE>�( xb��d�:���ېT����;����ٜŘ(,������a��^s`˵Y�=ǶME> ��&���K>���}��g���]��6'ϼ�٨z9iA��|��i�ªT�����Q Z�#�Z��<��H�ЖN�Ô�;�1f��ۆ||ڄ�[�%�D���dtE>��9&�{��||�:D�c"�:�Ū���;������/��=_W�R;��^����W54���B����|�Z�'q�1tP�C�
K������`��b�,'�GD/��0[)�=���ˇ�~�#�4Y��& !wl�9��";�U�s�� �9�vO),��bK���ak�1�RP&ʡyO�4[^z��SL�%߄��>~�1(_�l��P����p�@2�ū%����,/ȗ�0�7e���|�Z�4eE  �u�u����ۨ�&����h[��'3+�_䁻ߌe z�]�椪������͔��?c.�ǸO|gn�*'��p�{P岣���XM����x��$�}�PYc�!��pq>�#��O�z��{��S9GE�~�	�}n�`�S00�NZb�q�~�2\$ϖ,���k��Ң��[~b8P���E
�q=M��-h�#R�!����@�+��=;����U&Db�;<�4yV��8G쾦HzY�u9��B�ܬO�+�?�b���P^�3׸}��u�+'=a4���]� ��9�?��"��p��fE� ��6����^`Z�FV5��#�H��_��a�F>�����:y�8M����y��3�lG,7��/��,�o�Y����2.C�Vb�R�7�#��Y«��A�Q{�����ҩ�e?%a؄����!֋�x�A�-�x�;/�"C��WP�����g�o���?�\oQ������|ֱ�^T�e��֣ �]�l���������	|��s������W����+�����e�;7՗��k>w�$�jL����T�;v枕�S�o�X�4 ��~��-0�]��M��ȝ��}z�W�2�қ��}z���}�#�����W�����_�\�#��l���q�&4�5���e�[E������k+��4r�����7o�db      W   
  x��MN�0��oN� ��$[�RA�	�敘Ī;�D�Ƃ#q�lG�f������<���=I!p�ā�Z��81#�Y�Na�R��)٠s��H6]�91I)��ǸB�>���Tv���ޑ�쾗4۩w�,j<�l'M��0�\6����6۲p���qr'Ҧ�!�.���/�k��8,ɒZ�]�c��5Z�Z�h��M��A>�@;s��[�/��
Eo٥q.]��#��j�*��r�Vmk����GR*���<�����!�d�      Y   !   x�3���q�v�2��]|=��b���� t��      [      x������ � �      \      x������ � �      ^   0   x�K��4�443���L.�w*-�4�441�
��44�4������ ǫ�      _   5   x�3�K��,�2���Pڄ�73�(ߩ��1E�!s�9C<��������� ���     