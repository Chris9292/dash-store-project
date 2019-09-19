--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Address" (
    id integer NOT NULL,
    street character varying(30) NOT NULL,
    city character varying(30) NOT NULL,
    postcode character varying(7) NOT NULL
);


--
-- Name: Customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Customer" (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    telephone character varying(15) NOT NULL,
    email character varying(30) NOT NULL,
    address_id integer NOT NULL,
    discount numeric(2,2) NOT NULL,
    vat character varying(11) NOT NULL
);


--
-- Name: Order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Order" (
    id integer NOT NULL,
    customer_id smallint NOT NULL,
    date timestamp(4) without time zone NOT NULL,
    total_cost numeric(7,2) NOT NULL
);


--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."OrderItem" (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    order_id smallint NOT NULL,
    price numeric(7,2) NOT NULL,
    quantity smallint NOT NULL
);


--
-- Name: OrderItem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."OrderItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: OrderItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."OrderItem_id_seq" OWNED BY public."OrderItem".id;


--
-- Name: Order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;


--
-- Name: Product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Product" (
    id integer NOT NULL,
    name character varying NOT NULL,
    price numeric(7,2) NOT NULL,
    category character varying(20) NOT NULL
);


--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.address_id_seq OWNED BY public."Address".id;


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public."Customer".id;


--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_id_seq OWNED BY public."Product".id;


--
-- Name: Address id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Address" ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: Customer id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Customer" ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: Order id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);


--
-- Name: OrderItem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderItem" ALTER COLUMN id SET DEFAULT nextval('public."OrderItem_id_seq"'::regclass);


--
-- Name: Product id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Data for Name: Address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Address" (id, street, city, postcode) FROM stdin;
1	Fenwick Street	Brighton	BN89ST
2	George Street	Brighton	BN83ET
3	Liverpool Avenue	Worthing	BN120RW
4	Sea Lane	Shoreham	SW121QP
5	George Street	Brighton	BN83ET
6	Fenwick Street	Brighton	BN89ST
7	Fenwick Street	Brighton	BN89ST
8	North Lane	Brighton	BN85CV
9	Main Road	Hove	BN79MG
10	Church Street	Worthing	BN124DQ
11	Salisbury Street	Hove	BN72ZT
12	South Lane	Brighton	BN88OP
13	North Lane	Brighton	BN85CV
14	Fenwick Street	Brighton	BN89ST
15	Fortnum Road	Hove	BN71KG
16	Scarborough Avenue	Brighton	BN81AZ
17	Jubilee Street	London	N117TY
18	Bridge Road	London	SW39IJ
19	Ocean Road	Eastbourne	EN124WT
20	High Street	Worthing	BN120KL
21	Station Road	Brighton	BN84WS
22	Goss Street	Hove	BN79SA
23	Church Street	Brighton	BN80JC
24	High Street	Brighton	BN82HS
\.


--
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Customer" (id, name, telephone, email, address_id, discount, vat) FROM stdin;
22	Table & Toad	01903765765	olipen@gmail.com	23	0.10	GB562235945
23	Sugar & Scarves	01903765765	samfox@gmail.com	23	0.10	GB562235987
24	Ghost & Leather	01993805044	sstevenss@gmail.com	24	0.10	GB645420550
3	SaleSmarts	01304333492	sandwoman@gmail.com	7	0.10	GB100212755
4	Industrus	01708454567	emilysimmonds@gmail.com	8	0.00	GB101203596
5	AgencyStack	01708454567	gsimmonds@gmail.com	8	0.00	GB111112300
6	CloudQuota	01903909009	ewarbs@gmail.com	9	0.10	GB132710213
7	Overseek	01503665382	dsmith@gmail.com	10	0.10	GB132710255
8	ZapLabs	01944225042	jenjan@gmail.com	11	0.10	GB211527742
9	SnapCrowd	01990375099	handemma@gmail.com	12	0.10	GB211581400
10	MusicJolt	01990375099	smallj@gmail.com	12	0.10	GB216528764
11	RightHaus	01924123032	gblake@gmail.com	13	0.00	GB216528709
12	Kiddeo	01993910088	davrich@gmail.com	14	0.10	GB233109402
13	Talkingo	01287435932	medwards@gmail.com	15	0.10	GB235410300
14	Conceptial	01902765872	balle@gmail.com	16	0.10	GB251063539
15	Visight	01922665192	eemilye@gmail.com	17	0.00	GB251063594
16	Travelemo	01903763042	chendog@gmail.com	18	0.10	GB350983637
17	Mototive	01904964165	pharris@gmail.com	19	0.00	GB536768742
18	SideEducation	02203743232	pchang@gmail.com	20	0.10	GB372727045
19	Composey	01904785038	mwest@gmail.com	21	0.10	GB524461265
20	Triptivo	01303195037	simonwest@gmail.com	22	0.10	GB536768700
21	MyCompany	01303195037	swest@gmail.com	22	0.10	GB537696496
1	SwipeWire	01903765032	jsmith@gmail.com	5	0.00	GB100000187
2	SecureSmarter	01903733211	jburrows@gmail.com	6	0.00	GB100000230
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Order" (id, customer_id, date, total_cost) FROM stdin;
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."OrderItem" (id, product_id, order_id, price, quantity) FROM stdin;
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Product" (id, name, price, category) FROM stdin;
3453	AMD ​Ryzen 5 2600 Box	127.30	cpu
3454	AMD Ryzen 5 2400G Box	118.93	cpu
3455	AMD Ryzen 5 3600 Box	208.12	cpu
3456	AMD Ryzen 7 2700X Box	209.81	cpu
3457	AMD ​Ryzen 5 2600X Box	147.56	cpu
3458	Intel Core i5-9600K Box	240.28	cpu
3459	Intel Core i7-9700K Box	379.90	cpu
3460	Intel Core i5-9400F Box	145.85	cpu
3461	AMD Ryzen 7 2700 Box	181.50	cpu
3462	AMD Ryzen 3 2200G Box	80.80	cpu
3463	AMD Ryzen 3 1200 Box	47.60	cpu
3464	AMD Ryzen 5 3600X Box	244.86	cpu
3465	Intel Core i3-9100F Box	84.87	cpu
3466	Intel Core i9-9900K Box	493.98	cpu
3467	Intel Core i7-8700 Box	322.00	cpu
3468	AMD Ryzen 7 3700X Box	339.25	cpu
3469	Intel Core i5-8400 Box	187.94	cpu
3470	AMD Ryzen 5 1500X Box	111.10	cpu
3471	AMD Ryzen 5 1600 Box	101.20	cpu
3472	Intel Core i7-8700K Box	366.06	cpu
3473	Intel Core i3-8100 Box	135.00	cpu
3474	Intel Core i5-8500 Box	219.78	cpu
3475	AMD Ryzen 3 1300X Box	72.12	cpu
3476	AMD Ryzen 3 3200G Box	93.15	cpu
3477	AMD Ryzen 5 1400 Box	100.80	cpu
3478	AMD Ryzen 5 3400G Box	145.20	cpu
3479	Intel Pentium Dual Core Gold G5400 Box	56.40	cpu
3480	Intel Core i5-8600K Box	250.00	cpu
3481	Intel Core i7-7700 Box	312.65	cpu
3482	AMD Athlon-200GE 3.20GHz 4MB Box	47.11	cpu
3483	Intel Core i3-8350K Box	169.21	cpu
3484	Intel Core i7-6800K Box	310.43	cpu
3485	Intel Core i9-9900KF Box	480.48	cpu
3486	AMD Ryzen 9 3900X Box	595.32	cpu
3487	Intel Pentium Dual Core G4560 Box	59.90	cpu
3488	Intel Core i5-6600K Box	208.06	cpu
3489	AMD Ryzen 7 1700X Box	204.00	cpu
3490	AMD Ryzen 5 1600X Box	138.40	cpu
3491	AMD Ryzen 7-3800X Box	404.70	cpu
3492	AMD Ryzen 7 1700 Box	191.58	cpu
3493	AMD Ryzen 7 1800X Box	239.06	cpu
3494	Intel Core i3-7100 Box	122.61	cpu
3495	Intel Core i5-9400 Box	193.20	cpu
3496	Intel Core i5-7600K Box	268.99	cpu
3497	Intel Core i5-7500 Box	192.32	cpu
3498	Intel Core i5-7400 Box	183.25	cpu
3499	AMD Ryzen Threadripper 1950X Box	609.03	cpu
3500	Intel Core i5-9600KF Box	219.39	cpu
3501	AMD Ryzen Threadripper 1920X Box	257.52	cpu
3502	Intel Core i3-6100 Box	135.79	cpu
3503	Intel Core i7-9700KF Box	372.00	cpu
3504	Intel Core i5-9500 Box	205.95	cpu
3505	Intel Core i7-6700K Box	311.07	cpu
3506	Intel Core i5-6500 Box	223.88	cpu
3507	AMD Ryzen Threadripper 1900X Box	198.35	cpu
3508	Intel Core i7-6700 Box	353.20	cpu
3509	AMD Ryzen Threadripper 2990WX Box	1759.98	cpu
3510	Intel Core i3-8300 Box	153.50	cpu
3511	Intel Core i5-8400 Tray	178.09	cpu
3512	AMD Athlon 240GE 3.5GHz 4MB Box	63.90	cpu
3513	AMD A6-9500 Box	37.25	cpu
3514	AMD A8-9600 Box	51.17	cpu
3515	Intel Core i7-7700K Box	387.90	cpu
3516	Intel Core i7-9700 Box	340.83	cpu
3517	Intel Core i5-6400 Box	197.96	cpu
3518	Intel Celeron Dual Core G3900 Box	40.75	cpu
3519	AMD Ryzen Threadripper 2950X Box	850.00	cpu
3520	Intel Celeron Dual Core G3930 Box	40.75	cpu
3521	Intel Core i5-7600 Box	249.86	cpu
3522	Intel Pentium Dual Core G4600 Box	95.00	cpu
3523	Intel Core i9-7900X Box	1048.00	cpu
3524	AMD Ryzen Threadripper-2920X Box	410.00	cpu
3525	Intel Core i5-8600 Box	255.00	cpu
3526	Intel Core i7-6850K Box	356.97	cpu
3527	Intel Core i9-9900K Tray	512.81	cpu
3528	AMD Athlon 220GE 3.4GHz 4MB Box	54.86	cpu
3529	Intel Core i5-9600K Tray	229.51	cpu
3530	Intel Core i7-7800X	423.99	cpu
3531	AMD Ryzen Threadripper 2970WX Box	998.10	cpu
3532	AMD Athlon X4-950 Box	52.02	cpu
3533	Intel Core i9-7980XE Box	2237.45	cpu
3534	Intel Pentium Dual Core Gold G5500 Box	95.10	cpu
3535	Intel Pentium Dual Core G4500 Box	80.00	cpu
3536	Intel Pentium Dual Core G4620 Box	105.86	cpu
3537	Intel Pentium Dual Core Gold G5600 Box	92.85	cpu
3538	Intel Core i7-7820X Box	713.91	cpu
3539	Intel Core i9-9900 Box	518.00	cpu
3540	AMD Epyc-7351P Box	822.86	cpu
3541	Intel Core i9-7920X Box	955.02	cpu
3542	Intel Core i5-9500F Box	192.00	cpu
3543	Intel Core i7-9800X Box	640.31	cpu
3544	Intel Core i9-9900X Box	1052.90	cpu
3545	Intel Celeron Dual Core G4900 Box	48.20	cpu
3546	Intel Celeron Dual Core G4920 Box	56.96	cpu
3547	Intel Core i5-7640X Box	177.31	cpu
3548	Intel Core i3 9100 - Box	144.64	cpu
3549	AMD FX-8320 Box	180.54	cpu
3550	Intel Core i7-9700F Tray	323.93	cpu
3551	Intel Xeon E5-2620 v4 Box	393.25	cpu
3552	Intel Core i9-9940X Box	1244.00	cpu
3553	Intel Core i9-9960X Box	1525.00	cpu
3554	Intel Core i7-9700K Tray	374.15	cpu
3555	Intel Core i5-9500 Tray	216.91	cpu
3556	Intel Core i5-8500 Tray	190.06	cpu
3557	Intel Xeon Gold 5122 Box	1490.65	cpu
3558	Intel Core i5-9600 Tray	236.08	cpu
3559	AMD A6-9500E Box	57.06	cpu
3560	AMD Ryzen 5 3600 Tray	210.71	cpu
3561	Intel Core i7-5930K Box	653.00	cpu
3562	AMD Ryzen 7-3700X Tray	351.71	cpu
3563	HP Xeon Silver 4110 Tray	556.00	cpu
3564	AMD ​Ryzen 5 2600X with Wraith Max Cooler Box	198.25	cpu
3565	Intel Core i7-7740X Box	400.66	cpu
3566	Intel Core i9-9920X Box	1128.95	cpu
3567	Intel Core i3-9350KF Tray	192.57	cpu
3568	AMD A12-9800E Box	89.90	cpu
3569	AMD Ryzen 7-2700 (Wraith Max) Box	288.88	cpu
3570	HP Xeon Silver 4110 Box	702.00	cpu
3571	Intel Core i7-9700F Box	329.30	cpu
3572	Intel Xeon-Gold 6252 Box	4297.22	cpu
3573	Intel Xeon-Silver 4210 Box	632.09	cpu
3574	Intel Xeon-Silver 4214 Tray	899.50	cpu
3575	Intel Xeon-Gold 5220 Box	1959.67	cpu
3576	Intel Xeon-Gold 5222 Tray	1596.00	cpu
3577	Intel Core i5-9600 Box	267.50	cpu
3578	HP Xeon Bronze 3106 Tray	474.00	cpu
3579	Intel Core i9-9820X Box	950.00	cpu
3580	Intel Core i7-8700T Tray	327.53	cpu
3581	Intel Xeon-Gold 6240 Tray	3162.25	cpu
3582	AMD Ryzen 7-3800X Tray	455.53	cpu
3583	Intel Xeon Silver 4216 Tray	1294.21	cpu
3584	Intel Core i9-7960X Box	1720.76	cpu
3585	Intel Core i3-9350KF Box	175.10	cpu
3586	AMD Ryzen 5-2500X Tray	212.41	cpu
3587	Intel Core i7-6900K Box	819.75	cpu
3588	AMD Ryzen 7-2700X Gold Edition Box	396.40	cpu
3589	Intel Xeon-Gold 6226 Tray	2317.10	cpu
3590	Intel Xeon E5-2640 v4 Box	955.00	cpu
3591	Intel Xeon-Gold 6248 Tray	3950.02	cpu
3592	Intel Xeon-Gold 6230 Tray	2327.83	cpu
3593	Intel Xeon-Gold 6244 Tray	4005.94	cpu
3594	Intel Xeon-Silver 4208 Tray	512.13	cpu
3595	Intel Xeon-Gold 6242 Tray	3468.70	cpu
3596	Intel Xeon Gold 6234 Tray	2857.94	cpu
3597	Intel Xeon Silver 4215 Tray	1055.60	cpu
3598	AMD Ryzen 5 1600X Tray	239.56	cpu
3599	HP Xeon-Silver 4110 Tray	838.05	cpu
3600	Intel Xeon-Gold 5215 Tray	1602.41	cpu
3601	Intel Xeon E-2136 Tray	376.79	cpu
3602	Intel Xeon-W-2135 Box	1017.60	cpu
3603	AMD FX-8320E Box	158.63	cpu
3604	Intel Core i7-8700K Tray	406.08	cpu
3605	Intel Xeon-E-2126G Tray	317.63	cpu
3606	Intel Xeon-E-2124 Tray	247.53	cpu
3607	AMD Ryzen 5 2600X Tray	252.95	cpu
3608	Intel Xeon-E-2146G Box	382.20	cpu
3609	Intel Xeon-E-2176G Box	442.95	cpu
3610	Intel Xeon-E-2136 Box	348.65	cpu
3611	Intel Xeon-E-2174G Box	402.90	cpu
3612	Intel Core i9-9980XE Box	2223.40	cpu
3613	Intel Xeon-E-2134 Box	308.65	cpu
3614	AMD Ryzen 7-2700X Tray	240.00	cpu
3615	Intel Xeon E3-1245v6 Box	309.50	cpu
3616	Intel Xeon-E-2134 Tray	344.29	cpu
3617	Intel Xeon-Gold 6134 Tray	3845.95	cpu
3618	Intel Core i7-8700 Tray	333.51	cpu
3619	AMD Athlon X4-950 Tray	69.90	cpu
3620	Intel Core i9-i9-7980XE Tray	2177.63	cpu
3621	Intel Core i5-7400T Tray	229.10	cpu
3622	Intel Xeon-Gold 5115 Tray	2152.47	cpu
3623	Intel Xeon-Gold 5120 Tray	1796.51	cpu
3624	Intel Xeon-W-2123 Box	359.51	cpu
3625	AMD Ryzen 7-​Ryzen 7 2700 Tray	351.21	cpu
3626	Intel Pentium Dual Core-G5400 Tray	69.51	cpu
3627	Intel Core i3-8100T Tray	148.22	cpu
3628	Intel Core i5-8600 Tray	234.29	cpu
3629	Intel Xeon Silver 4108 Box	452.36	cpu
3630	Dell Xeon-Silver 4110 Tray	700.05	cpu
3631	AMD A10-9700 Box	75.00	cpu
3632	AMD A10-9700E Box	68.40	cpu
3633	Intel Core i3-8100 Tray	127.90	cpu
3634	Intel Pentium Dual Core-G5400T 3.1 GHz Dual Core Socket Tray	82.51	cpu
3635	Intel Pentium Dual Core G5600 Tray	104.61	cpu
3636	Intel Pentium Dual Core G5500 Tray	132.78	cpu
3637	AMD Athlon X4 840 BOX	249.00	cpu
3638	Intel Xeon E3-1220v6 Box	205.95	cpu
3639	Intel Core i9-7940X Box	1440.00	cpu
3640	Intel Pentium Dual Core-Pentium Gold G5500T Tray	93.78	cpu
3641	Intel Core i9-7920X Tray	1381.57	cpu
3642	Intel Core i5-8500T Tray	249.95	cpu
3643	Intel Core i3-8300 Tray	178.77	cpu
3644	Intel Core i9-7900X Tray	1162.98	cpu
3645	Intel Core i9-7960X Tray	1925.81	cpu
3646	Intel Xeon E5-2630 v4 Box	662.20	cpu
3647	Intel Core i5-7500 Tray	197.07	cpu
3648	Intel Xeon Silver 4110 Box	579.24	cpu
3649	Intel Xeon Silver 4114 Box	790.00	cpu
3650	Intel Xeon E3-1230v6 Box	282.00	cpu
3651	Dell Xeon E5-2620 V4 Tray	563.40	cpu
3652	Intel Xeon-E3-1240 v6 Box	312.00	cpu
3653	Intel Xeon Gold 6148 Box	3469.00	cpu
3654	Intel Xeon Silver 4112 Box	587.45	cpu
3655	Intel Xeon Silver 4116 Box	1139.00	cpu
3656	Intel Core i7-7700T Tray	349.56	cpu
3657	Intel Core i7-7700 Tray	310.06	cpu
3658	Intel Xeon Platinum 8180 Box	12087.70	cpu
3659	Intel Xeon-E3-1275 v6 Box	368.63	cpu
3660	Intel Xeon Platinum 8176 Box	10531.50	cpu
3661	Intel Xeon Platinum 8160 Box	5718.30	cpu
3662	Intel Xeon Gold 6138 Box	3180.15	cpu
3663	Intel Xeon Gold 6152 Box	4447.30	cpu
3664	Intel Xeon Platinum 8164 Box	7433.80	cpu
3665	Intel Xeon Platinum 8170 Box	8945.70	cpu
3666	Intel Xeon Bronze 3106 Box	381.20	cpu
3667	Intel Xeon Gold 5120 Box	1896.15	cpu
3668	Intel Xeon-Gold 6128 Box	2061.20	cpu
3669	Intel Xeon Gold 6130 Box	2308.15	cpu
3670	Intel Xeon-Gold 6134 Box	2696.70	cpu
3671	Intel Xeon Gold 6142 Box	3585.65	cpu
3672	Intel Core i3-8350K Tray	220.70	cpu
3673	Intel Xeon E3-1270 v6 Box	384.60	cpu
3674	Intel Core i5-7500T Tray	203.45	cpu
3675	Intel Xeon Silver 4110 Tray	492.14	cpu
3676	Intel Xeon Silver 4114 Tray	719.30	cpu
3677	Intel Xeon Gold 6140 Box	2977.45	cpu
3678	Intel Xeon E3-1225 v6 Box	233.63	cpu
3679	Intel Core i3-7100 Tray	113.56	cpu
3680	AMD A12-9800 Box	124.10	cpu
3681	Intel Core i5-6400T Tray	121.22	cpu
3682	Intel Core i7-6950X Box	2023.00	cpu
3683	Intel Xeon E5-1650 v4 Box	698.34	cpu
3684	Intel Xeon E5-2680 V3 Box	1824.31	cpu
3685	Intel Xeon E5-2603 v4 Box	202.02	cpu
3686	Intel Xeon Bronze 3104 Box	271.60	cpu
3687	Intel Core i3-6320 Box	134.39	cpu
3688	Intel Core i3-7350K Box	166.50	cpu
3689	Intel Core i3-7300 Box	159.00	cpu
3690	Intel Xeon E5-2650 v4 Box	1279.00	cpu
3691	Intel Core i3-6300T Box	164.36	cpu
3692	Intel Celeron Dual Core G3950 Box	60.50	cpu
3693	Intel Core i3-7350K Tray	202.95	cpu
3694	Intel Core i7-7700K Tray	388.00	cpu
3695	Intel Xeon E5-2690 v3 Tray	1552.77	cpu
3696	Intel Core i5-7600T Tray	243.04	cpu
3697	Intel Core i5-7600 Tray	245.00	cpu
3698	Intel Core i3-7100T Box	132.97	cpu
3699	Intel Core i3-6100 Tray	121.92	cpu
3700	Intel Xeon E5-2637 v4 Tray	1249.14	cpu
3701	Intel Xeon E5-2667 v4 Tray	2083.15	cpu
3702	Intel Xeon E5-1620 v4 Box	339.74	cpu
3703	Dell Xeon E5-2630 V3 Tray	849.90	cpu
3704	Intel Xeon E5-2670 v3 Tray	1664.01	cpu
3705	Intel Xeon E5-2640 v4 Tray	915.78	cpu
3706	Intel Xeon E5-2630 v4 Tray	703.01	cpu
3707	Intel Xeon E5-2643 v4 Tray	1903.82	cpu
3708	Dell Xeon E5-2609 v4 Tray	412.30	cpu
3709	Intel Xeon E5-2623 v4 Tray	593.51	cpu
3710	Intel Core i7-6800K Tray	354.43	cpu
3711	Intel Xeon E3-1270 v5 Tray	430.19	cpu
3712	Intel Xeon E5-2660 v4 Box	1717.46	cpu
3713	Intel Xeon E5-2680 v4 Box	2122.10	cpu
3714	Intel Xeon E5-2690 v4 Box	2543.35	cpu
3715	Intel Xeon E5-2695 v4 Box	2948.85	cpu
3716	Intel Xeon E5-2697 v4 Box	3282.48	cpu
3717	Intel Xeon E5-2683 v4 Box	2247.05	cpu
3718	Intel Xeon E5-2687W V4 Box	2436.12	cpu
3719	Intel Xeon-E3-1220 v5 Box	249.46	cpu
3720	Intel Xeon E5-2609 v4 Box	366.49	cpu
3721	Intel Xeon E5-2620 v4 Tray	450.12	cpu
3722	Intel Xeon E3-1270 v5 Box	414.90	cpu
3723	Dell Xeon E5-2609 v3 Tray	412.29	cpu
3724	Intel Xeon E3-1245 v5 Box	359.80	cpu
3725	Intel Core i5-6500T Tray	207.08	cpu
3726	Intel Core i7-6700 Tray	339.57	cpu
3727	Intel Xeon E3-1230 v5 Box	349.18	cpu
3728	Intel Core i7-6700K Tray	298.84	cpu
3729	Intel Xeon E3-1225 v5 Box	269.50	cpu
3730	Intel Xeon E3-1225 v5 Tray	266.35	cpu
3731	Intel Core i3-6320 Tray	136.08	cpu
3732	Intel Xeon E3-1220 v5 Tray	262.42	cpu
3733	Intel Pentium Dual Core G4520 Box	107.50	cpu
3734	Intel Core i5-6500 Tray	214.90	cpu
3735	Intel Core i7-6700T Tray	344.72	cpu
3736	Intel Core i5-6400 Tray	215.43	cpu
3737	Intel Xeon E5-2620 v3 Tray	357.41	cpu
3738	Intel Core i5-7400 Tray	175.72	cpu
3739	Intel Xeon E5-2620 V3 Box	479.72	cpu
3740	Intel Xeon E5-2603 V3 Box	229.00	cpu
3741	Intel Xeon E5-1620 V3 Box	319.00	cpu
3742	Intel Xeon E5-2609 V3 Box	362.35	cpu
3743	Intel Xeon E5-2630 V3 Box	762.46	cpu
3744	Intel Xeon E5-2640 V3 Box	1073.34	cpu
3745	Intel Core i3-7320 Box	181.59	cpu
3746	AMD A6-7400K Box	48.60	cpu
3747	AMD FX-6350 Tray	97.00	cpu
3748	Intel Xeon E3-1220 V3 Box	244.37	cpu
3749	MSI Radeon RX 570 8GB Armor OC	146.02	graphics card
3750	MSI GeForce GTX 1660 Ti 6GB Gaming X	312.26	graphics card
3751	Gigabyte GeForce GTX 1660 Ti 6GB Gaming OC	303.53	graphics card
3752	Gigabyte GeForce GTX 1660 6GB OC	235.48	graphics card
3753	Gigabyte GeForce GTX 1660 Ti 6GB Windforce OC	294.69	graphics card
3754	Sapphire Radeon RX 580 8GB Nitro+	204.06	graphics card
3755	Sapphire Radeon RX 590 8GB Nitro+ Special Edition	220.73	graphics card
3756	Gigabyte GeForce GTX 1660 Ti 6GB OC	285.50	graphics card
3757	MSI GeForce RTX 2060 6GB Gaming Z	372.00	graphics card
3758	MSI GeForce GTX1050 Ti 4GB Gaming X	162.00	graphics card
3759	Asus GeForce RTX 2070 8GB Rog Strix Gaming OC	539.81	graphics card
3760	MSI GeForce RTX 2060 6GB Ventus OC	336.96	graphics card
3761	Gigabyte GeForce GTX 1660 6GB Gaming OC	243.00	graphics card
3762	Asus GeForce GT 1030 2GB OC	82.00	graphics card
3763	MSI GeForce GT710 2GB LP	40.03	graphics card
3764	Gigabyte GeForce GTX1050 Ti 4GB D5	147.98	graphics card
3765	MSI Radeon RX 580 8GB Armor OC	174.26	graphics card
3766	Gigabyte GeForce GTX1050 Ti 4GB OC	144.53	graphics card
3767	Palit GeForce GTX1050 Ti 4GB Dual OC	142.40	graphics card
3768	Gigabyte GeForce GTX1050 Ti 4GB G1 Gaming	170.25	graphics card
3769	Asus GeForce RTX 2060 6GB ROG Strix Gaming	422.82	graphics card
3770	Palit GeForce RTX 2060 6GB GamingPro OC	364.99	graphics card
3771	MSI GeForce GTX 1660 6GB Gaming X	254.70	graphics card
3772	Gigabyte GeForce GT 1030 2GB Low Profile	70.00	graphics card
3773	Sapphire Radeon RX 590 8GB Nitro+	224.49	graphics card
3774	Sapphire Radeon RX 580 8GB Pulse	193.97	graphics card
3775	Gigabyte GeForce GT 1030 2GB OC	75.80	graphics card
3776	MSI GeForce GTX 1660 Ti 6GB Ventus XS 6G OC	283.50	graphics card
3777	Asus GeForce GTX 1660 Ti 6GB Dual OC	293.51	graphics card
3778	Gigabyte GeForce GTX1050 Ti 4GB OC Low Profile	142.10	graphics card
3779	Asus GeForce GTX 1660 Ti 6GB Phoenix OC	291.85	graphics card
3780	Palit GeForce GTX 1660 Ti 6GB StormX	265.98	graphics card
3781	MSI GeForce GT710 1GB LP	32.50	graphics card
3782	Gigabyte GeForce GTX1050 2GB D5	124.00	graphics card
3783	Asus Radeon RX 570 4GB Expedition OC	191.00	graphics card
3784	Asus GeForce RTX 2070 Super 8GB ROG Strix Advanced Gaming	618.27	graphics card
3785	Gainward GeForce GTX1050 Ti 4GB	124.37	graphics card
3786	Gigabyte GeForce RTX 2060 Super 8GB Gaming OC	442.49	graphics card
3787	MSI GeForce GTX1050 Ti 4GB OC	133.79	graphics card
3788	Palit GeForce GT 1030 2GB	70.60	graphics card
3789	Palit GeForce GT710 2GB	35.97	graphics card
3790	Asus GeForce GTX1050 2GB Phoenix	144.94	graphics card
3791	Palit GeForce GTX 1660 6GB Dual OC	230.50	graphics card
3792	Asus GeForce GTX 1050 Ti 4GB Cerberus OC	179.80	graphics card
3793	Asus GeForce GTX1060 3GB Dual OC	207.65	graphics card
3794	MSI GeForce RTX 2070 8GB Gaming Z	691.03	graphics card
3795	Asus GeForce GTX1050 Ti 4GB Rog Strix OC	213.99	graphics card
3796	MSI GeForce GTX 1660 Ti 6GB Armor OC	288.77	graphics card
3797	Gigabyte GeForce RTX 2060 6GB Gaming OC PRO rev 1.0	357.91	graphics card
3798	Gigabyte GeForce GTX1050 2GB OC	124.00	graphics card
3799	Asus GeForce GT 710 2GB Silent	56.80	graphics card
3800	Gigabyte GeForce GTX1060 3GB	204.75	graphics card
3801	MSI GeForce GTX 1660 6GB Armor OC	231.05	graphics card
3802	Gigabyte GeForce GTX 1650 4GB Gaming OC	174.80	graphics card
3803	Asus GeForce GTX1050 Ti 4GB Phoenix	170.80	graphics card
3804	Gainward GeForce RTX 2070 Super 8GB Phantom GS	567.45	graphics card
3805	MSI GeForce GTX 1050 Ti 4GB Aero ITX OCV1	159.09	graphics card
3806	Sapphire Radeon RX 570 4GB Pulse	146.06	graphics card
3807	Asus GeForce GTX1060 6GB Turbo	328.35	graphics card
3808	MSI GeForce RTX 2080 8GB Gaming X Trio	880.00	graphics card
3809	Gigabyte GeForce RTX 2060 6GB OC rev 1.0	338.03	graphics card
3810	Asus Radeon RX 580 8GB ROG Strix TOP	270.88	graphics card
3811	Gigabyte GeForce GTX1050 Ti 4GB Windforce OC	190.00	graphics card
3812	EVGA GeForce RTX 2070 8GB XC Ultra Gaming	576.93	graphics card
3813	Asus GeForce GTX 1050 Ti 4GB Cerberus	187.15	graphics card
3814	Sapphire Radeon RX 570 8GB Pulse	151.92	graphics card
3815	MSI GeForce RTX 2060 Super 8GB Ventus OC	405.93	graphics card
3816	MSI GeForce GTX 1650 4GB Aero ITX OC	164.83	graphics card
3817	Zotac GeForce GT 1030 2GB	74.35	graphics card
3818	Gigabyte Radeon RX 580 8GB Gaming	210.74	graphics card
3819	Gigabyte GeForce RTX 2060 Super 8GB Aorus	490.93	graphics card
3820	Gainward GeForce RTX 2060 6GB Phoenix GS	362.63	graphics card
3821	Sapphire Radeon RX 580 4GB Pulse	194.00	graphics card
3822	Gigabyte GeForce GT 1030 2GB Silent Low Profile	71.23	graphics card
3823	MSI GeForce GTX1060 6GB Gaming X	323.00	graphics card
3824	MSI Radeon RX 560 4GB Aero ITX OC	135.11	graphics card
3825	Gigabyte GeForce GTX1060 6GB Windforce OC	243.40	graphics card
3826	MSI GeForce RTX 2080 8GB Ventus	822.00	graphics card
3827	MSI Radeon RX 590 8GB Armor OC	229.25	graphics card
3828	Asus GeForce GTX 1070 Ti 8GB Rog Strix Gaming Advanced	764.44	graphics card
3829	MSI GeForce RTX 2080 8GB Sea Hawk EK X	721.89	graphics card
3830	Gigabyte GeForce GTX 1660 Ti 6GB Aorus	315.91	graphics card
3831	Gigabyte GeForce RTX 2060 6GB Windforce OC rev 1.0	351.29	graphics card
3832	Gigabyte GeForce GTX 1050 2GB OC Low Profile 2G	123.60	graphics card
3833	Sapphire Radeon RX 5700 XT 8GB	382.24	graphics card
3834	MSI GeForce RTX 2080 8GB Ventus OC	841.00	graphics card
3835	Asus Radeon RX 590 8GB Rog Strix Gaming	321.82	graphics card
3836	MSI GeForce GTX1060 3GB Gaming X	288.99	graphics card
3837	Asus GeForce RTX 2070 8GB Dual OC	600.00	graphics card
3838	Asus GeForce RTX 2080 Ti 11GB Dual OC	1343.00	graphics card
3839	Gigabyte GeForce RTX 2080 8GB	709.61	graphics card
4057	MSI Radeon VII 16GB	742.91	graphics card
3840	Asus GeForce GTX 1660 6GB Phoenix OC	229.00	graphics card
3841	MSI GeForce GTX 1650 4GB Gaming X	177.55	graphics card
3842	Sapphire Radeon RX 580 8GB Nitro+ Special Edition	275.00	graphics card
3843	Gigabyte GeForce GTX1050 2GB Windforce OC	135.30	graphics card
3844	Palit GeForce RTX 2070 Super 8GB GRP	567.45	graphics card
3845	Asus Radeon RX 560 2GB Arez Evo	125.85	graphics card
3846	Sapphire Radeon RX 570 4GB Nitro+	181.24	graphics card
3847	Asus GeForce RTX 2060 6GB Dual OC	398.95	graphics card
3848	MSI GeForce RTX 2080 Ti 11GB Gaming X Trio	1288.52	graphics card
3849	Gigabyte GeForce GTX 1650 4GB Mini ITX OC	155.13	graphics card
3850	Asus GeForce RTX 2080 8GB Turbo	786.86	graphics card
3851	Asus Radeon RX 560 4GB Rog Strix Gaming OC	164.86	graphics card
3852	Gigabyte GeForce RTX 2070 8GB Gaming OC	599.99	graphics card
3853	MSI GeForce RTX 2070 8GB Armor	541.48	graphics card
3854	Asus GeForce GTX 1060 3GB Phoenix	196.60	graphics card
3855	Palit GeForce GTX 1660 Ti 6GB StormX OC	275.50	graphics card
3856	EVGA GeForce RTX 2060 6GB XC Black Gaming	392.19	graphics card
3857	MSI GeForce GTX1050 Ti 4GB LP	148.97	graphics card
3858	MSI GeForce RTX 2060 6GB Ventus XS OC	337.91	graphics card
3859	Gainward GeForce RTX 2080 8GB Phantom GLH	745.70	graphics card
3860	Palit GeForce RTX 2080 Ti 11GB Dual	1065.06	graphics card
3861	Asrock Radeon RX 560 4GB Phantom Gaming	119.40	graphics card
3862	Asus Radeon RX Vega 56 8GB OC	269.64	graphics card
3863	Palit GeForce RTX 2080 Ti 11GB GamingPro OC	1094.33	graphics card
3864	Gigabyte Radeon RX 5700 XT 8GB	410.91	graphics card
3865	Sapphire Radeon RX 550 4GB Pulse	106.95	graphics card
3866	EVGA GeForce GTX1060 3GB Superclock Gaming	260.30	graphics card
3867	MSI GeForce GT 730 2GB	85.00	graphics card
3868	Gigabyte GeForce GT710 2GB	43.80	graphics card
3869	MSI GeForce GTX 1050 2GB Aero ITX OC	125.90	graphics card
3870	Asus GeForce GTX1060 6GB Rog Strix Gaming OC	474.99	graphics card
3871	Asus GeForce GTX 1050 2GB Cerberus OC	149.47	graphics card
3872	Asus GeForce RTX 2060 Super 8GB ROG Strix OC	494.90	graphics card
3873	MSI GeForce GT 1030 2GB Aero ITX OC	83.55	graphics card
3874	Zotac GeForce RTX 2060 6GB AMP	490.00	graphics card
3875	MSI GeForce RTX 2080 8GB Duke OC	794.54	graphics card
3876	Palit GeForce GTX 1650 4GB StormX	147.10	graphics card
3877	Gigabyte Radeon RX 5700 8GB	361.40	graphics card
3878	Sapphire Radeon RX Vega 56 8GB Pulse	308.34	graphics card
3879	Gigabyte GeForce GTX 1050 3GB OC	132.49	graphics card
3880	Gigabyte GeForce RTX 2060 6GB Aorus Xtreme	409.38	graphics card
3881	Asus GeForce GTX 1650 4GB Dual OC	174.15	graphics card
3882	Sapphire Radeon RX 580 4GB Nitro+	170.76	graphics card
3883	Gigabyte GeForce GTX 1650 4GB Windforce OC	169.00	graphics card
3884	Zotac GeForce RTX 2070 8GB	496.02	graphics card
3885	Sapphire Radeon RX Vega 64 8GB Nitro+	381.85	graphics card
3886	Asus Radeon RX 560 2GB Arez OC	130.69	graphics card
3887	Asus Radeon RX 580 4GB Dual OC	230.00	graphics card
3888	Palit GeForce GTX 1650 Dual OC 4GB	158.90	graphics card
3889	Gigabyte GeForce RTX 2070 8GB Aorus Xtreme	590.33	graphics card
3890	MSI GeForce GT 1030 2GB LP OC LP OC	78.88	graphics card
3891	MSI GeForce GTX1050 2GB Gaming X	145.55	graphics card
3892	Gigabyte GeForce RTX 2080 Ti 11GB Gaming OC	1211.08	graphics card
3893	Asus Radeon RX 5700 XT 8GB	432.95	graphics card
3894	Gigabyte GeForce RTX 2070 Windforce 8GB	649.00	graphics card
3895	Zotac GeForce RTX 2080 8GB AMP Extreme	740.40	graphics card
3896	MSI GeForce GTX1070 8GB Armor OC	470.00	graphics card
3897	MSI GeForce RTX 2070 8GB Gaming X	660.73	graphics card
3898	MSI GeForce GTX1060 6GB Armor OCV1	324.00	graphics card
3899	Asus Radeon RX 5700 8GB	338.61	graphics card
3900	Gigabyte GeForce RTX 2080 8GB Gaming OC	728.30	graphics card
3901	Palit GeForce GTX 1050 Ti 4GB KalmX	151.75	graphics card
3902	Palit GeForce GTX 1060 3GB StormX	184.00	graphics card
3903	MSI GeForce RTX 2070 8GB Aero	496.83	graphics card
3904	Asrock Radeon RX 5700 8GB	354.39	graphics card
3905	Sapphire Radeon RX 560 2GB Pulse OC	103.60	graphics card
3906	Asus GeForce GT 1030 2GB LP Silent with Brackets	78.85	graphics card
3907	Asus GeForce RTX 2060 Super 6GB Dual Evo OC	444.80	graphics card
3908	MSI GeForce RTX 2070 Super 8GB Gaming X Trio	664.33	graphics card
3909	Asrock Radeon RX 580 8GB Phantom Gaming D OC	204.69	graphics card
3910	Asus GeForce GTX 1660 6GB TUF Gaming X3 Advanced Edition	276.65	graphics card
3911	Palit GeForce RTX 2060 6GB StormX OC	337.00	graphics card
3912	Gigabyte GeForce RTX 2080 Super 8GB Gaming OC	750.64	graphics card
3913	Gigabyte GeForce GTX1060 3GB G1 Gaming Rev 1.0	279.93	graphics card
3914	Asus GeForce GT 1030 2GB Low Profile	78.88	graphics card
3915	Asus GeForce GTX 1650 4GB Rog Strix Gaming OC	190.50	graphics card
3916	Asus GeForce GTX 1660 Ti 6GB Rog Strix Advanced	340.26	graphics card
3917	Gainward GeForce GTX 1660 6GB Pegasus	216.60	graphics card
3918	Asus GeForce GTX 1660 Ti 6GB Rog Strix Gaming	330.81	graphics card
3919	Palit GeForce GTX1060 6GB Super JetStream	330.00	graphics card
3920	MSI Radeon RX 570 4GB Armor OC	135.48	graphics card
3921	Sapphire Radeon RX 580 4GB Nitro+	249.00	graphics card
3922	Gigabyte GeForce RTX 2080 Ti 11GB Aorus Xtreme Waterforce WB	1512.12	graphics card
3923	MSI GeForce GT 1030 2GB LP OC (GT 1030 2G LP OC)	86.50	graphics card
3924	Gigabyte GeForce GTX 1660 6GB Mini OC	229.50	graphics card
3925	Gigabyte Radeon RX 580 8GB Aorus	222.72	graphics card
3926	Asus GeForce RTX 2080 Ti 11GB ROG Strix OC	1439.00	graphics card
3927	Inno 3D GeForce GTX 1660 Ti 6GB Twin X2	275.50	graphics card
3928	MSI Radeon R7 240 2GB LP	43.40	graphics card
3929	PNY GeForce RTX 2080 Ti 11GB XLR8	1210.59	graphics card
3930	Palit GeForce RTX 2070 Super 8GB JS	552.55	graphics card
3931	Asus GeForce GT730 2GB with Port Brackets	74.86	graphics card
3932	Gigabyte GeForce RTX 2080 8GB Aorus Xtreme	830.61	graphics card
3933	Asrock Radeon RX 550 2GB Phantom Gaming	85.15	graphics card
3934	Gainward GeForce GTX 1660 Ti 6GB Pegasus OC	261.38	graphics card
3935	XFX Radeon RX 580 8GB GTS XXX Edition	176.92	graphics card
3936	EVGA GeForce RTX 2080 8GB XC Gaming	807.54	graphics card
3937	Gigabyte Radeon RX 570 4GB	226.00	graphics card
3938	Asus GeForce GTX 1660 6GB TUF Gaming OC	252.75	graphics card
3939	Palit GeForce RTX 2080 Super 8GB GR	766.45	graphics card
3940	Asus GeForce RTX 2080 Ti 11GB ROG Strix Gaming	1365.00	graphics card
3941	Palit GeForce GTX1050 Ti 4GB StormX	136.30	graphics card
3942	Gainward GeForce RTX 2060 8GB Super Phantom GS (471056224-	458.00	graphics card
3943	Asus GeForce GT 710 1GB Bracket	40.55	graphics card
3944	Gigabyte GeForce GTX1080 8GB Windforce OC	675.00	graphics card
3945	Gigabyte GeForce RTX 2080 8GB Windforce	728.44	graphics card
3946	Zotac GeForce GT 1030 2GB	69.47	graphics card
3947	Palit GeForce GTX1060 6GB StormX	266.08	graphics card
3948	Gigabyte GeForce RTX 2080 Ti 11GB Aorus Xtreme	1460.00	graphics card
3949	Asus GeForce RTX 2070 Super 8GB Evo	558.05	graphics card
3950	Palit GeForce RTX 2080 8GB GamingPro OC	725.00	graphics card
3951	Asus GeForce RTX 2060 6GB Phoenix	370.87	graphics card
3952	Asrock Radeon RX 580 8GB Phantom Gaming X OC	202.49	graphics card
3953	KFA2 GeForce GTX 1050 2GB OC	117.95	graphics card
3954	Asus GeForce RTX 2060 Super 8GB Rog Strix Gaming	480.00	graphics card
3955	Palit GeForce GTX1050 2GB StormX	107.79	graphics card
3956	Palit GeForce GTX 1650 4GB StormX OC	153.00	graphics card
3957	Asus GeForce RTX 2060 Super 8GB Evo Advanced	437.71	graphics card
3958	Gigabyte GeForce RTX 2080 8GB Aorus Xtreme Waterforce WB	828.06	graphics card
3959	MSI Radeon RX 550 4GB LP OC	116.25	graphics card
3960	Asus GeForce GTX 1660 Ti 6GB Phoenix	287.15	graphics card
3961	Palit GeForce RTX 2060 Super 8GB JS	448.70	graphics card
3962	MSI Radeon R7 240 1GB LP	34.34	graphics card
3963	PNY Quadro P4000 8GB	810.00	graphics card
3964	MSI GeForce GTX1060 3GB Armor OCV1	261.14	graphics card
3965	Sapphire Radeon VII 16GB	715.32	graphics card
3966	Asus GeForce GTX1050 2GB ROG Strix Gaming	174.25	graphics card
3967	Gigabyte Radeon RX 580 4GB Gaming	210.19	graphics card
3968	Gigabyte GeForce GTX 1650 4GB OC	165.55	graphics card
3969	Asus GeForce GTX1060 6GB Dual	348.00	graphics card
3970	Palit GeForce RTX 2080 8GB GameRock	811.12	graphics card
3971	Inno 3D GeForce GT710 2GB DDR3 LP	34.14	graphics card
3972	Gigabyte GeForce RTX 2070 Super 8GB Aorus	690.80	graphics card
3973	Gigabyte GeForce RTX 2080 Super 8GB Windforce OC	724.24	graphics card
3974	Asus GeForce RTX 2060 Super 8GB Evo	436.48	graphics card
3975	Gigabyte Radeon RX 550 2GB D5	110.16	graphics card
3976	Gigabyte Radeon RX 590 8GB Gaming	278.26	graphics card
3977	Palit GeForce RTX 2060 Super 8GB GP OC	421.03	graphics card
3978	Asus GeForce RTX 2060 Super 8GB Rog Strix Advanced edition	485.55	graphics card
3979	Asus GeForce RTX 2080 Super 8GB EVO OC	792.35	graphics card
3980	Gigabyte GeForce RTX 2070 8GB	609.09	graphics card
3981	Asus GeForce GT 710 1GB	43.20	graphics card
3982	Zotac GeForce RTX 2070 8GB Blower	504.06	graphics card
3983	Palit GeForce GTX 1060 6GB Dual	295.00	graphics card
3984	Asus Radeon RX 580 8GB Dual Fan OC	265.61	graphics card
3985	Asus GeForce RTX 2070 Super 8GB Rog Strix Gaming	601.03	graphics card
3986	Asrock Radeon RX 570 4GB Phantom Gaming X OC	144.66	graphics card
3987	Asus GeForce GTX 1060 6GB Phoenix	306.90	graphics card
3988	Gigabyte GeForce RTX 2080 8GB Xtreme Waterforce	818.79	graphics card
3989	Asus GeForce RTX 2070 Super 8GB Turbo Evo	545.04	graphics card
3990	Asus GeForce GTX 1660 Ti 6GB TUF Gaming OC	309.86	graphics card
3991	Asus Radeon RX Vega 64 8GB Rog Strix OC	477.00	graphics card
3992	Palit GeForce GTX 1050 3GB StormX	195.00	graphics card
3993	Gigabyte GeForce GTX1060 6GB Mini ITX OC	305.91	graphics card
3994	Gigabyte GeForce RTX 2070 Mini ITX 8GB	460.59	graphics card
3995	Gainward GeForce GT 1030 2GB	80.79	graphics card
3996	Asus GeForce GTX 1050 3GB Phoenix	148.41	graphics card
3997	Asus GeForce GTX1050 2GB Rog Strix OC	179.16	graphics card
3998	Zotac GeForce GTX1050 Ti 4GB OC	140.91	graphics card
3999	Palit GeForce RTX 2080 Super 8GB GRP	757.90	graphics card
4000	Gigabyte GeForce GTX 1050 3GB D5	148.30	graphics card
4001	Palit GeForce RTX 2080 8GB Super JetStream	869.00	graphics card
4002	MSI GeForce GTX 1660 6GB Ventus XS OC	244.82	graphics card
4003	Asus GeForce RTX 2080 Ti 11GB Dual	1319.94	graphics card
4004	Zotac GeForce RTX 2080 8GB Blower	731.41	graphics card
4005	NVidia Titan RTX 24GB	2670.37	graphics card
4006	Gigabyte GeForce 210 1GB Rev 6.0/6.1	35.50	graphics card
4007	AMD 4GB Radeon Pro WX 3100	185.89	graphics card
4008	MSI Radeon RX 550 2GB Aero ITX OC	126.06	graphics card
4009	Asus Radeon RX 570 4GB Rog Strix Gaming	186.90	graphics card
4010	Asus GeForce RTX 2070 Super 8GB Evo Advanced	573.25	graphics card
4011	Zotac GeForce GTX 1660 Ti 6GB Gaming	281.60	graphics card
4012	Zotac GeForce RTX 2060 8GB Gaming Super Mini	412.44	graphics card
4013	Gainward GeForce RTX 2080 Super 8GB Phantom GLH	767.98	graphics card
4014	Asus GeForce RTX 2060 Super 8GB Evo	432.80	graphics card
4015	Asus GeForce RTX 2080 Ti 11GB ROG Strix Advanced Gaming	1377.00	graphics card
4016	Sapphire Radeon RX 570 8GB Nitro+	238.00	graphics card
4017	Asus Radeon RX 560 4GB Rog Strix Gaming	158.92	graphics card
4018	Palit GeForce RTX 2070 8GB Super X	509.55	graphics card
4019	Asus GeForce RTX 2080 Super 8GB ROG Strix Advanced	823.20	graphics card
4020	Gainward GeForce RTX 2060 Super 8GB Phoenix	408.93	graphics card
4021	MSI GeForce RTX 2060 Super 8GB Gaming X	453.06	graphics card
4022	Zotac GeForce GTX 1660 Ti 6GB AMP	298.41	graphics card
4023	Inno 3D GeForce RTX 2070 8GB Twin X2	505.00	graphics card
4024	Asus Radeon RX 550 2GB Arez Phoenix	101.11	graphics card
4025	Palit GeForce GTX1060 6GB JetStream (NE51060015J9J)	277.93	graphics card
4026	Zotac GeForce GT710 2GB	36.91	graphics card
4027	Gigabyte GeForce RTX 2060 Super 8GB Windforce OC	414.40	graphics card
4028	Asus GeForce GT730 2GB Silent with Brackets	74.74	graphics card
4029	Asus GeForce GTX1070 8GB Dual	580.56	graphics card
4030	Gigabyte GeForce RTX 2080 8GB Gaming OC White	734.34	graphics card
4031	Zotac GeForce RTX 2070 Super 8GB Twin Fan	514.26	graphics card
4032	Asus GeForce GTX 1070 Ti 8GB Cerberus	556.00	graphics card
4033	Asus GeForce RTX 2070 Super 8GB Evo OC	579.33	graphics card
4034	Asus GeForce GTX 1660 Ti 6GB Dual	295.31	graphics card
4035	Asus GeForce GTX1050 Ti 4GB Rog Strix	189.00	graphics card
4036	Zotac GeForce RTX 2060 Super 8GB AMP	425.47	graphics card
4037	Asus GeForce GT 710 2GB with Brackets	57.00	graphics card
4038	Asus GeForce RTX 2060 6GB TUF Gaming OC	385.95	graphics card
4039	Zotac GeForce RTX 2080 Ti 11GB Blower	1116.49	graphics card
4040	Gigabyte GeForce RTX 2080 Ti 11GB Turbo 11G	1029.60	graphics card
4041	Afox GeForce GT 730 4GB	69.90	graphics card
4042	Sapphire Radeon RX 5700 8GB	341.60	graphics card
4043	Gainward GeForce RTX 2080 Ti 11GB Phoenix GS	1179.70	graphics card
4044	Palit GeForce RTX 2080 8GB Dual	646.50	graphics card
4045	Asus GeForce GTX1080 8GB Turbo	695.00	graphics card
4046	Asus GeForce RTX 2060 6GB Turbo	390.75	graphics card
4047	Asus GeForce RTX 2080 8GB Rog Strix Gaming OC	899.00	graphics card
4048	EVGA GeForce GTX1070 8GB SC Gaming ACX 3.0	387.17	graphics card
4049	Asus GeForce RTX 2060 6GB Rog Strix Advanced Gaming	454.53	graphics card
4050	Gigabyte GeForce RTX 2060 6GB Gaming OC	453.00	graphics card
4051	Gainward GeForce RTX 2070 8GB	485.41	graphics card
4052	Asus GeForce GTX 1650 4GB ROG Strix Advanced Edition	184.80	graphics card
4053	Zotac GeForce RTX 2080 Super 8GB Twin Fan	707.61	graphics card
4054	Zotac GeForce RTX 2080 Super 8GB AMP	737.04	graphics card
4055	Gainward GeForce GTX1060 3GB	237.00	graphics card
4056	Palit GeForce GT 730 2GB Passive LP	51.75	graphics card
4058	Asrock Radeon RX 560 2GB Phantom Gaming	96.87	graphics card
4059	Asus GeForce RTX 2080 Ti 11GB Turbo	1228.00	graphics card
4060	PNY GeForce GTX1050 2GB	160.95	graphics card
4061	Gigabyte GeForce GTX 1660 Ti 6GB Mini	273.16	graphics card
4062	Palit GeForce GTX1070 8GB JetStream (NE51070015P2J)	426.00	graphics card
4063	Asrock Radeon RX 570 8GB Phantom Gaming X OC	178.34	graphics card
4064	Zotac GeForce RTX 2060 Super 8GB AMP Extreme	450.69	graphics card
4065	Gigabyte GeForce GT 730 2GB D5	57.76	graphics card
4066	MSI Radeon RX 5700 8GB	370.00	graphics card
4067	MSI Radeon RX 5700 XT 8GB Evoke OC	471.53	graphics card
4068	EVGA GeForce RTX 2080 Ti 11GB XC Gaming	1362.66	graphics card
4069	EVGA GeForce GTX1070 8GB FTW Gaming ACX 3.0	527.31	graphics card
4070	MSI Radeon RX Vega 56 8GB	703.00	graphics card
4071	MSI GeForce GTX 1060 6GB (GTX 1060 GAMING X+ 6G)	494.00	graphics card
4072	Gigabyte GeForce GTX970 4GB WindForce 3X OC	487.00	graphics card
4073	MSI GeForce RTX 2070 Super 8GB Ventus OC	831.00	graphics card
4074	Gigabyte GeForce RTX 2070 8GB Gaming OC White	752.00	graphics card
4075	MSI Geforce RTX 2070 8GB Gaming	555.00	graphics card
4076	MSI GeForce RTX 2080 8GB Aero	860.00	graphics card
4077	Lenovo Quadro P1000 4GB	462.00	graphics card
4078	Gainward GeForce GTX1070 8GB	554.00	graphics card
4079	Asus GeForce GTX 1050 Ti 4GB Dual OC v2	270.00	graphics card
4080	MSI GeForce RTX 2080 Super 8GB Ventus XS OC	828.10	graphics card
4081	Sapphire Radeon RX 570 4GB Pulse	214.65	graphics card
4082	EVGA GeForce RTX 2080 Ti 11GB	2018.37	graphics card
4083	MSI GeForce GTX 1660 Ti 6GB Armor	354.00	graphics card
4084	EVGA GeForce GTX 1650 4GB XC Ultra Black Gaming	214.71	graphics card
4085	MSI Radeon RX 550 2GB LP OC	171.00	graphics card
4086	Dell Radeon Pro WX 7100 8GB	948.00	graphics card
4087	Lenovo Quadro P1000 4GB	463.00	graphics card
4088	HP Quadro P1000 4GB	450.00	graphics card
4089	KFA2 GeForce GTX 1660 6GB EX	327.00	graphics card
4090	Asrock Radeon RX 5700 XT 8GB	601.00	graphics card
4091	MSI GeForce RTX 2070 8GB Ventus	689.00	graphics card
4092	Gigabyte Radeon VII 16GB	903.00	graphics card
4093	Gigabyte GeForce GTX 1070 8GB G1 Gaming Rev 2.0	714.00	graphics card
4094	Zotac GeForce GTX 1080 Ti 11GB Mini	1084.00	graphics card
4095	MSI GeForce GTX1050 Ti 4GB Gaming	258.00	graphics card
4096	Matrox 4GB	842.00	graphics card
4097	Gigabyte GeForce GTX 1070 Ti 8GB Windforce	559.00	graphics card
4098	Inno 3D GeForce RTX 2070 Super 8GB Jet	562.25	graphics card
4099	Zotac GeForce RTX 2060 6GB Gaming Twin Fan	430.00	graphics card
4100	Dell AMD Radeon R5 240 1GB	48.00	graphics card
4101	Gigabyte GeForce GTX970 4GB G1 Gaming	421.00	graphics card
4102	Zotac GeForce RTX 2080 8GB AMP Extreme Core	955.00	graphics card
4103	Sapphire Radeon RX 570 4GB Pulse	170.00	graphics card
4104	Zotac GeForce GTX1070 8GB AMP Extreme	691.00	graphics card
4105	EVGA GeForce GTX1060 6GB Gaming (06G-P4-6161)	241.00	graphics card
4106	Dell Quadro M4000 8GB	990.00	graphics card
4107	Asus GeForce GTX1070 8GB Dual OC	585.00	graphics card
4108	Zotac GeForce GTX 1650 4GB Gaming	208.00	graphics card
4109	EVGA GeForce GTX1060 6GB SC Gaming	274.00	graphics card
4110	Asus Radeon RX Vega 64 8GB Arez Strix OC	611.00	graphics card
4111	Zotac GeForce GTX1060 6GB AMP! Edition	234.00	graphics card
4112	EVGA GeForce GTX 1660 6GB XC Ultra Gaming	503.00	graphics card
4113	EVGA GeForce GTX 1070 8GB SC2 Gaming	532.00	graphics card
4114	PowerColor Radeon RX Vega 56 8GB Red Devil	1252.00	graphics card
4115	AMD FirePro 2460 0.5GB	494.00	graphics card
4116	Fujitsu GeForce GTX745 2GB	166.00	graphics card
4117	Gigabyte Radeon RX 560 4GB Gaming OC	233.00	graphics card
4118	MSI GeForce GTX1060 6GB OCV1	355.00	graphics card
4119	MSI GeForce GTX1070 8GB Gaming X 8G	701.00	graphics card
4120	EVGA GeForce GTX 1660 Ti 6GB SC Ultra Gaming	374.00	graphics card
4121	Gigabyte GeForce GTX 1060 6GB Xtreme Edition Rev. 1.0)	396.00	graphics card
4122	Dell Quadro NVS 315 1GB	90.00	graphics card
4123	Point of View GeForce 210 512MB DDR3	63.00	graphics card
4124	Gigabyte Radeon RX 580 8GB	564.00	graphics card
4125	PNY Quadro M2000 4GB	1382.00	graphics card
4126	HP Quadro 500M GFX 1GB (MXM 3.0)	136.00	graphics card
4127	Gigabyte GeForce GTX 1060 6GB Aorus Rev. 2.0	506.00	graphics card
4128	Sapphire FirePro W8000 4GB	1325.00	graphics card
4129	MSI Radeon RX Vega 64 8GB Boost OC	402.00	graphics card
4130	MSI GeForce GTX 1070 8GB Aero ITX OC	472.00	graphics card
4131	Sparkle GeForce GTX660 Ti 2GB	300.00	graphics card
4132	KFA2 GeForce GTX1070 8GB Hall of Fame	739.00	graphics card
4133	Dell Quadro P4000 8GB	1216.00	graphics card
4134	PNY Quadro NVS 510 x16 for DVI	470.00	graphics card
4135	Inno 3D GeForce GTX 1660 6GB Twin x2	240.69	graphics card
4136	Gainward GeForce GTX1060 6GB	416.00	graphics card
4137	AMD Firepro W8100 8GB	748.00	graphics card
4138	MSI GeForce GTX1060 6GB Gaming	440.00	graphics card
4139	Gigabyte GeForce GTX1060 6GB Mini ITX	370.00	graphics card
4140	Zotac GeForce RTX 2070 8GB OC Mini	698.00	graphics card
4141	Dell Quadro P1000 4GB	459.00	graphics card
4142	Asus GeForce RTX 2060 6GB ROG Strix Gaming OC	619.00	graphics card
4143	Zotac GeForce GTX1060 6GB Mini	265.00	graphics card
4144	EVGA GeForce GT 1030 2GB SC LP	137.00	graphics card
4145	HP Quadro 4000 2.0GB GDDR5	836.00	graphics card
4146	PNY GeForce GTX 1050 Ti 4GB	257.00	graphics card
4147	MSI Radeon R5 230 2GB LP (R5 230 2GD3H LP)	87.00	graphics card
4148	PowerColor Radeon RX 570 4GB Red Dragon	156.00	graphics card
4149	KFA2 GeForce RTX 2070 8GB Mini	656.00	graphics card
4150	HP Radeon HD8350 1GB	56.00	graphics card
4151	MSI Radeon RX 580 4GB Armor OC (RX 580 Armor 4G OC)	389.00	graphics card
4152	MSI GeForce GTX 1070 Ti 8GB Armor	688.00	graphics card
4153	EVGA GeForce GT730 2GB	76.00	graphics card
4154	Dell Quadro P400 2GB	164.00	graphics card
4155	MSI Radeon RX 570 4GB Gaming X	318.00	graphics card
4156	Lenovo Quadro P400 2GB	150.00	graphics card
4157	Zotac GeForce GTX1070 8GB AMP! Edition	479.00	graphics card
4158	Sapphire Radeon RX 580 4GB Nitro+ G5	248.00	graphics card
4159	Zotac GeForce RTX 2070 8GB AMP	680.00	graphics card
4160	Inno 3D GeForce GTX1070 8GB iChill	578.00	graphics card
4161	PowerColor Radeon RX 570 4GB Red Devil	287.00	graphics card
4162	Asus GeForce GTX 1070 8GB Expedition OC	580.00	graphics card
4163	HP Radeon Pro WX 4100 4GB	575.00	graphics card
4164	Dell Radeon Pro WX 4100 4GB	310.00	graphics card
4165	MSI GeForce GTX 1070 Ti 8GB Aero (GTX 1070 Ti Aero 8G)	672.00	graphics card
4166	MSI Radeon R7 250 1GB OC (R7 250 1GD5 OC)	118.00	graphics card
4167	EVGA GeForce GT 1030 2GB	143.00	graphics card
4168	Asus Radeon RX 580 4GB Dual	394.00	graphics card
4169	HP Quadro K2000 2GB	376.00	graphics card
4170	PNY GeForce RTX 2080 8GB Blower	1141.00	graphics card
4171	Inno 3D GeForce RTX 2070 Twin x2 8GB	832.00	graphics card
4172	Sapphire Radeon RX 550 2GB Pulse	150.00	graphics card
4173	Dell Quadro P400 2GB	173.00	graphics card
4174	EVGA GeForce GTX 1050 2GB FTW	246.00	graphics card
4175	Fujitsu NVS 315 1GB	177.00	graphics card
4176	Gigabyte GeForce GTX 1070 Ti 8GB	780.00	graphics card
4177	Point of View GeForce GTX 560 1GB Ultra Charged	187.00	graphics card
4178	PowerColor Radeon RX 570 4GB Red Dragon OC	216.00	graphics card
4179	HP Quadro K4000 3GB	924.00	graphics card
4180	Fujitsu Radeon Pro WX 5100 8GB	752.00	graphics card
4181	Sapphire FirePro W2100 2GB	272.00	graphics card
4182	Zotac GeForce GTX 1060 3GB AMP! Core Edition	355.00	graphics card
4183	EVGA GeForce GTX 1050 Ti 4GB FTW Gaming	290.00	graphics card
4184	HP Quadro NVS 315 1GB x16 for DVI/VGA	183.00	graphics card
4185	Gainward GeForce RTX 2070 8GB Phoenix (426018336-	764.00	graphics card
4186	Palit GeForce GTX 1060 6GB GamingPro OC	426.00	graphics card
4187	EVGA GeForce GTX950 2GB SSC ACX 2.0	244.00	graphics card
4188	EVGA GeForce GTX 1070 Ti 8GB SC Gaming	701.00	graphics card
4189	PNY Quadro 4000 2GB	961.00	graphics card
4190	Gainward GeForce RTX 2070 8GB Phoenix (4153)	762.00	graphics card
4191	PowerColor Radeon RX Vega 64 8GB	545.00	graphics card
4192	PNY GeForce GTX950 2GB	210.00	graphics card
4193	Gainward GeForce RTX 2070 8GB Phoenix GS	684.00	graphics card
4194	MSI GeForce GTX980 Ti 6GB (GTX 980TI GAMING 6G GOLDEN EDITION)	1023.00	graphics card
4195	KFA2 GeForce GT630 2GB	76.00	graphics card
4196	Asus GeForce GTX 1070 8GB Expedition	521.00	graphics card
4197	PNY GeForce RTX 2080 Super 8GB Blower	976.00	graphics card
4198	Asus Radeon RX 560 4GB Evo	179.00	graphics card
4199	Palit GeForce RTX 2080 8GB JetStream	952.00	graphics card
4200	KFA2 GeForce GT 1030 2GB	131.00	graphics card
4201	Gainward GeForce GTX 1070 Ti 8GB Phoenix GS	706.00	graphics card
4202	HP Radeon Pro WX 7100 8GB	1108.00	graphics card
4203	EVGA GeForce RTX 2060 6GB SC	444.00	graphics card
4204	Sapphire Radeon RX 570 4GB (11266-46)	301.00	graphics card
4205	Palit GeForce GTX 1070 Ti 8GB JetStream (NE5107T015P2J)	686.00	graphics card
4206	MSI GeForce RTX 2080 8GB Ventus V2	964.00	graphics card
4207	Gigabyte GeForce GTX 1060 3GB G1 Gaming Rev 2.0 (GV-N1060G1 GAMING-3GD)	332.00	graphics card
4208	PNY GeForce GTX 1070 Ti 8GB	760.00	graphics card
4724	PNY Quadro K4200 4GB	1097.00	graphics card
4209	Zotac GeForce GTX 1070 8GB AMP Extreme Core	629.00	graphics card
4210	PowerColor Radeon RX 560 4GB Red Dragon (AXRX560 4GBD5-DHA)	211.00	graphics card
4211	EVGA GeForce RTX 2070 8GB Gaming	682.00	graphics card
4212	HP Quadro K600 1GB	220.00	graphics card
4213	Gigabyte GeForce GT 710 1GB	64.00	graphics card
4214	Dell Quadro P1000 4GB	459.00	graphics card
4215	PowerColor Radeon RX 580 4GB Red Dragon OC	296.00	graphics card
4216	Fujitsu Radeon Pro WX 3100 4GB	526.00	graphics card
4217	PowerColor Radeon RX Vega 56 8GB (AXRX 8GBHBM2-3DH)	697.00	graphics card
4218	Fujitsu AMD FirePro V5900 2GB	683.00	graphics card
4219	Gigabyte Radeon RX 570 4GB MI	252.00	graphics card
4220	KFA2 GeForce GTX1060 6GB EX OC	576.00	graphics card
4221	Asus Radeon R9 270X 2GB DirectCU II	234.00	graphics card
4222	MSI GeForce GTX1080 8GB Armor OC (GTX 1080 ARMOR 8G OC)	922.00	graphics card
4223	HP Quadro P600 2GB	444.00	graphics card
4224	AMD FirePro W7100 8GB	1325.00	graphics card
4225	Zotac GeForce GT730 4GB Zone Edition	155.00	graphics card
4226	MSI Radeon R5 230 LP 1GB LP	69.00	graphics card
4227	KFA2 GeForce RTX 2080 8GB EX OC	923.00	graphics card
4228	Gigabyte GeForce GTX 1080 8GB Mini ITX 8G	821.00	graphics card
4229	Sapphire Radeon RX Vega 64 8GB	886.00	graphics card
4230	Fujitsu FirePro V3900 1GB	470.00	graphics card
4231	Inno 3D GeForce GTX 1070 Ti 8GB Jet	760.00	graphics card
4232	MSI GeForce RTX 2070 8GB Aero ITX	673.00	graphics card
4233	PowerColor Radeon RX Vega 64 8GB Red Devil	638.00	graphics card
4234	EVGA GeForce GTX 1650 4GB SC Ultra Gaming	212.00	graphics card
4235	Sapphire Radeon RX 570 4GB Pulse ITX	245.00	graphics card
4236	Gigabyte GeForce GTX1070 8GB	406.20	graphics card
4237	Gigabyte GeForce RTX 2080 Ti 11GB Aorus	1199.75	graphics card
4238	Inno 3D GeForce RTX 2070 8GB Ichill X3 Jekyll	546.33	graphics card
4239	Gainward GeForce GT710 2GB SilentFX	42.50	graphics card
4240	Gainward GeForce RTX 2060 6GB Pegasus OC	346.00	graphics card
4241	Zotac GeForce RTX 2080 8GB AMP	770.91	graphics card
4242	Gainward GeForce RTX 2070 8GB Phantom GLH	539.30	graphics card
4243	KFA2 GeForce RTX 2070 8GB EX	494.59	graphics card
4244	Asus Radeon RX Vega 56 8GB Rog Strix OC	335.00	graphics card
4245	Asus GeForce GTX 1650 4GB Dual	170.95	graphics card
4246	Asus GeForce GTX 1650 4GB Phoenix OC	169.50	graphics card
4247	Sapphire Radeon RX 5700 XT 8GB Pulse	423.50	graphics card
4248	Asus GeForce GTX 1660 6GB Phoenix	233.12	graphics card
4249	Asus GeForce GTX 1660 Ti 6GB OC	344.95	graphics card
4250	MSI GeForce RTX 2080 Ti 11GB Ventus	1107.91	graphics card
4251	MSI Radeon RX 550 4GB Aero ITX OC	125.00	graphics card
4252	Asus GeForce RTX 2080 Super 8GB Dual Evo	782.95	graphics card
4253	Zotac GeForce RTX 2070 8GB AMP Extreme	620.00	graphics card
4254	Gainward GeForce RTX 2060 Super 8GB Ghost	375.00	graphics card
4255	Sapphire Radeon RX 5700 8GB Pulse	372.50	graphics card
4256	Palit GeForce RTX 2070 8GB Gamerock	554.50	graphics card
4257	Asus GeForce RTX 2060 6GB Advanced EVO	390.85	graphics card
4258	Asus GeForce RTX 2060 6GB Dual EVO	384.95	graphics card
4259	Gigabyte Radeon RX Vega 56 8GB Gaming OC	299.77	graphics card
4260	Gigabyte GeForce RTX 2080 8GB Turbo OC	743.16	graphics card
4261	Gigabyte Radeon RX 560 4GB OC rev. 2.0	137.47	graphics card
4262	PNY Quadro RTX 4000 8GB	936.02	graphics card
4263	Asus GeForce RTX 2060 6GB Rog Strix	415.50	graphics card
4264	XFX Radeon RX 570 8GB RS XXX Edition	156.26	graphics card
4265	PowerColor Radeon RX 570 8GB Red Dragon	159.90	graphics card
4266	Gigabyte GeForce GTX 1070 8GB Windforce OC rev 2.0	665.00	graphics card
4267	Palit GeForce RTX 2080 8GB GameRock Premium	728.75	graphics card
4268	XFX Radeon RX 590 8GB FatBoy	205.02	graphics card
4269	Zotac GeForce GTX1060 3GB AMP! Edition	217.50	graphics card
4270	Asus GeForce GTX 1660 Ti EVO OC 6GB	323.78	graphics card
4271	Sapphire Radeon RX 550 2GB Pulse	99.41	graphics card
4272	Palit GeForce RTX 2060 Super 8GB Dual	402.65	graphics card
4273	Sapphire Radeon RX 550 4GB	105.95	graphics card
4274	Zotac GeForce RTX 2070 Super 8GB AMP	534.24	graphics card
4275	Gainward GeForce GTX 1650 4GB Pegasus	151.85	graphics card
4276	Sapphire Radeon RX 560 4GB Pulse	114.79	graphics card
4277	Asus Radeon RX 580 8GB ROG Strix Gaming	296.00	graphics card
4278	Gainward GeForce RTX 2060 Super 8GB Phoenix GS	394.88	graphics card
4279	Gigabyte GeForce RTX 2080 Ti 11GB Turbo OC	1237.27	graphics card
4280	Gainward GeForce RTX 2080 Super 8GB Phantom	760.50	graphics card
4281	Palit GeForce RTX 2070 Super 8GB GR	549.90	graphics card
4282	Zotac GeForce GTX1050 2GB Mini	139.00	graphics card
4283	Gainward GeForce RTX 2060 6GB Phoenix	329.34	graphics card
4284	Gainward GeForce GTX 1660 6GB Pegasus OC	222.11	graphics card
4285	Asus GeForce GTX 1660 6GB Dual EVO	257.80	graphics card
4286	EVGA GeForce GTX1050 2GB SSC Gaming ACX 3.0	195.31	graphics card
4287	AMD Radeon Pro WX 9100 16GB	1964.82	graphics card
4288	Asus GeForce RTX 2060 6GB Dual Advanced	376.05	graphics card
4289	Asus GeForce GTX 1660 6GB TUF Gaming X3 OC	286.00	graphics card
4290	MSI GeForce RTX 2060 Super 8GB Super Armor OC	441.50	graphics card
4291	Inno 3D GeForce RTX 2080 8GB Gaming OC X3	661.66	graphics card
4292	Asus Radeon R5 230 1GB Sillent	36.50	graphics card
4293	MSI Radeon RX 5700 XT 8GB	412.90	graphics card
4294	EVGA GeForce GTX 1070 Ti 8GB FTW Ultra Silent Gaming	484.48	graphics card
4295	Asrock Radeon RX 590 8GB Phantom Gaming X OC	247.39	graphics card
4296	EVGA GeForce RTX 2060 6GB XC Gaming	359.00	graphics card
4297	Gainward GeForce RTX 2080 8GB Phoenix GS	665.22	graphics card
4298	Gigabyte GeForce RTX 2060 6GB Windforce OC rev 2.0	366.98	graphics card
4299	Asus GeForce GTX 1650 4GB Phoenix	163.50	graphics card
4300	MSI GeForce GTX 1050 2GB Aero ITX OCV1	138.92	graphics card
4301	MSI GeForce GTX 1050 Ti 4GB Aero ITX OC	199.00	graphics card
4302	Asus Radeon RX 570 4GB ROG Strix Gaming OC	193.29	graphics card
4303	AMD Radeon Pro WX5100 8GB	413.45	graphics card
4304	Gigabyte GeForce RTX 2080 Ti 11GB Windforce	1159.00	graphics card
4305	Asus GeForce GTX 1660 6GB TUF Gaming OC	246.07	graphics card
4306	MSI GeForce RTX 2080 Super 8GB Ventus OC	745.45	graphics card
4307	Asrock Radeon RX 590 8GB Phantom Gaming U	252.67	graphics card
4308	Zotac GeForce GTX 1050 Ti 4GB Mini	145.85	graphics card
4309	Gigabyte GeForce RTX 2060 6GB Mini ITX OC rev. 1.0	328.72	graphics card
4310	Inno 3D GeForce GTX1050 Ti 4GB Twin X2	131.85	graphics card
4311	PNY Quadro P400 2GB DVI	129.51	graphics card
4312	Palit GeForce RTX 2080 Ti 11GB GamingPro	1114.45	graphics card
4313	Gigabyte Radeon RX 570 4GB Aorus	160.89	graphics card
4314	Gigabyte Radeon RX Vega 64 8GB Gaming OC	389.00	graphics card
4315	Gainward GeForce RTX 2070 8GB Phoenix GS	450.00	graphics card
4316	Gigabyte GeForce RTX 2070 8GB Aorus Xtreme	739.00	graphics card
4317	Gainward GeForce GTX 1660 Ti 6GB Pegasus	270.75	graphics card
4318	KFA2 GeForce GTX 1050 Ti 4GB EXOC White	158.29	graphics card
4319	Palit GeForce RTX 2060 6GB GamingPro	351.00	graphics card
4320	Asus GeForce GTX 1660 6GB Evo OC	297.00	graphics card
4321	Inno 3D GeForce RTX 2080 8GB X2 OC	680.09	graphics card
4322	MSI GeForce GTX 1060 3GB Aero ITX OC	260.90	graphics card
4323	XFX Radeon RX 560 4GB 14CU Single Fan	154.36	graphics card
4324	Asus GeForce GTX1050 Ti 4GB Expedition OC	196.28	graphics card
4325	Gigabyte GeForce RTX 2070 Super 8GB Windforce OC 3X	532.13	graphics card
4326	Asus Radeon RX 5700 8GB OC	426.92	graphics card
4327	Asus Radeon RX 560 4GB Arez EVO OC	151.85	graphics card
4328	Palit GeForce GTX 1660 6GB StormX	245.00	graphics card
4329	PNY Quadro P2000 5GB	437.95	graphics card
4330	Gainward GeForce GTX 1650 Ghost 4GB	156.50	graphics card
4331	Inno 3D GeForce GT 1030 2GB Passive	70.08	graphics card
4332	EVGA GeForce GTX1050 Ti 4GB SC Gaming	168.50	graphics card
4333	EVGA GeForce RTX 2080 8GB XC2 Ultra	999.37	graphics card
4334	PNY Quadro M6000 24GB	6304.77	graphics card
4335	Inno 3D GeForce RTX 2070 Super 8GB iChill X3 Ultra	547.74	graphics card
4336	Gainward GeForce GTX 1650 4GB Pegasus OC	153.00	graphics card
4337	Palit GeForce GTX 1660 6GB Dual	228.40	graphics card
4338	PNY Quadro P400 2GB	98.52	graphics card
4339	Gigabyte GeForce RTX 2070 Super 8GB Gaming OC 3X	600.00	graphics card
4340	Asus Radeon RX 5700 XT 8GB ROG Strix OC	478.31	graphics card
4341	Sapphire Radeon RX 590 8GB Nitro+ AMD 50 Gold Edition	222.03	graphics card
4342	Gigabyte GeForce RTX 2080 Super 8GB Turbo	829.30	graphics card
4343	Gainward GeForce RTX 2070 Super 8GB Phantom	555.70	graphics card
4344	EVGA GeForce GTX 1660 6GB XC Black Gaming	248.00	graphics card
4345	Inno 3D GeForce GTX 1060 6GB Compact	299.00	graphics card
4346	Asus Radeon RX 580 8GB Arez Strix OC	313.24	graphics card
4347	EVGA GeForce GTX 1660 6GB XC Gaming	268.19	graphics card
4348	Gigabyte GeForce GTX1080 8GB G1 Gaming	759.00	graphics card
4349	Palit GeForce GTX 1660 6GB StormX	217.82	graphics card
4350	Zotac GeForce GT 1030 2GB	74.90	graphics card
4351	Inno 3D GeForce RTX 2080 Super 8GB Gaming OC X3	727.36	graphics card
4352	Gainward GeForce RTX 2080 8GB Phantom (426018336-	699.84	graphics card
4353	Zotac GeForce RTX 2070 Super 8GB AMP Extreme	558.04	graphics card
4354	MSI GeForce GTX 1050 2GB OCV1	129.99	graphics card
4355	PNY GeForce RTX 2080 8GB XLR8 Gaming OC	739.24	graphics card
4356	Zotac GeForce GTX 1050 Ti 4GB Low Profile	177.00	graphics card
4357	Asus GeForce RTX 2060 6GB EVO OC	438.00	graphics card
4358	MSI GeForce GTX 1060 6GB Aero ITX OC	342.80	graphics card
4359	Gigabyte GeForce RTX 2070 8GB Gaming	536.44	graphics card
4360	Asus Radeon R5 230 2GB Sillent	49.53	graphics card
4361	PNY Quadro P600 2GB	208.35	graphics card
4362	MSI GeForce GT 1030 2GB AERO ITX 2GD4 OC	74.17	graphics card
4363	Gainward GeForce RTX 2080 8GB Phantom GS	709.75	graphics card
4364	Asus GeForce RTX 2080 Ti 11GB Dual	1218.50	graphics card
4365	Gainward GeForce RTX 2060 6GB Pegasus	363.82	graphics card
4366	Inno 3D GeForce RTX 2080 8GB TWIN X2	719.00	graphics card
4367	Inno 3D GeForce RTX 2080 Ti 11GB Twin X2	1087.90	graphics card
4368	Gainward GeForce GTX 1650 Ghost OC 4GB	177.99	graphics card
4369	Asus GeForce GTX 1050 Ti 4GB Low Profile	175.43	graphics card
4370	Asus Radeon RX 580 8GB Arez Dual OC	313.98	graphics card
4371	Asus GeForce RTX 2080 8GB Dual OC	850.53	graphics card
4372	Gigabyte GeForce RTX 2070 Super 8GB Gaming OC	629.00	graphics card
4373	Gigabyte GeForce RTX 2060 6GB Gaming OC rev 2.0	359.23	graphics card
4374	PNY Quadro P1000 4GB	369.30	graphics card
4375	EVGA GeForce RTX 2080 8GB FTW3 Ultra Gaming	887.89	graphics card
4376	PNY Quadro P1000 4GB DVI	371.95	graphics card
4377	Gigabyte GeForce RTX 2060 6GB Gaming OC Pro White	387.70	graphics card
4378	MSI GeForce GT 1030 2GB LP OC	80.99	graphics card
4379	Sapphire Radeon R5 230 1GB Silent	34.14	graphics card
4380	EVGA GeForce GTX 1660 6GB XC Ultra Gaming	274.34	graphics card
4381	Gigabyte GeForce RTX 2060 6GB OC rev. 2.0 (GV-N2060OC-6GD rev. 2.0)	349.86	graphics card
4382	PNY GeForce GTX1060 3GB	288.49	graphics card
4383	Sapphire Radeon RX 570 4GB Pulse	242.89	graphics card
4384	Asus GeForce RTX 2070 8GB Rog Strix Advanced Gaming	569.00	graphics card
4385	Asus Radeon RX 550 4GB Phoenix	119.87	graphics card
4386	PNY GeForce RTX 2070 8GB XLR8 Gaming OC	529.96	graphics card
4387	MSI GeForce RTX 2070 8GB Armor OC	529.93	graphics card
4388	Asus GeForce RTX 2080 Super 8GB OC	913.96	graphics card
4389	Gigabyte GeForce GTX 1660 6GB Gaming	251.52	graphics card
4390	Gainward GeForce RTX 2060 6GB Ghost	352.00	graphics card
4391	Inno 3D GeForce RTX 2080 Ti 11GB iChill Black	1412.21	graphics card
4392	Gainward GeForce GTX 1660 6GB Ghost	232.50	graphics card
4393	EVGA GeForce GTX1050 2GB SC Gaming	123.70	graphics card
4394	Palit GeForce RTX 2060 6GB Dual	346.00	graphics card
4395	EVGA GeForce RTX 2070 Super 8GB XC Ultra Gaming	632.30	graphics card
4396	Zotac GeForce GTX 1660 6GB	249.86	graphics card
4397	Gainward GeForce GTX 1660 Ti 6GB Ghost	280.20	graphics card
4398	MSI GeForce GTX 1060 3GB OC	262.79	graphics card
4399	Afox GeForce GTX 1060 6GB	252.90	graphics card
4400	EVGA GeForce RTX 2060 Super 8GB XC Ultra Gaming	530.37	graphics card
4401	Asus GeForce GTX1080 8GB ROG Strix	604.05	graphics card
4402	EVGA GeForce GTX 1660 Ti 6GB XC Black	281.56	graphics card
4403	Asus GeForce RTX 2060 6GB Dual	374.08	graphics card
4404	Gainward GeForce RTX 2080 Ti 11GB Phoenix	1157.50	graphics card
4405	EVGA GeForce GTX 1660 Ti 6GB XC	300.68	graphics card
4406	Asrock Radeon RX 570 8GB Phantom Gaming D OC	152.00	graphics card
4407	Inno 3D GeForce RTX 2080 Super 8GB Ichill Frostbite	773.63	graphics card
4408	Asus Radeon RX 580 8GB Arez Strix Top Edition	318.41	graphics card
4409	Gainward GeForce GTX1060 6GB Phoenix	245.45	graphics card
4410	EVGA GeForce RTX 2080 8GB FTW3 Ultra Hybrid Gaming	931.56	graphics card
4411	Asus Radeon RX 580 8GB Rog Strix Gaming OC	286.18	graphics card
4412	Asus GeForce GTX 1060 6GB ROG Strix Advanced	386.77	graphics card
4413	Afox GeForce GTX 1060 3GB	195.90	graphics card
4414	PNY Quadro RTX 6000 24GB	4350.00	graphics card
4415	Gigabyte GeForce GT 710 2GB	48.00	graphics card
4416	MSI GeForce GTX1080 8GB Aero OC	761.93	graphics card
4417	Inno 3D GeForce RTX 2080 Ti 11GB Gaming OC X3	1249.40	graphics card
4418	Zotac GeForce RTX 2080 Super 8GB AMP Extreme	871.43	graphics card
4419	PNY Quadro RTX 5000 16GB	2139.20	graphics card
4420	EVGA GeForce RTX 2070 8GB FTW3 Ultra Gaming	614.25	graphics card
4421	Gigabyte GeForce RTX 2080 8GB Turbo	712.31	graphics card
4422	MSI GeForce GTX 1650 4GB Ventus XS OC	178.93	graphics card
4423	Palit GeForce GTX 1650 Dual 4GB	172.65	graphics card
4424	Zotac GeForce GT710 1GB	54.10	graphics card
4425	Asus GeForce RTX 2080 8GB Dual EVO Advanced	785.00	graphics card
4426	Asus GeForce GTX 1060 6GB Expedition OC	285.00	graphics card
4427	KFA2 GeForce GTX1050 Ti 4GB OC	142.13	graphics card
4428	Asus GeForce RTX 2080 8GB Dual EVO	770.00	graphics card
4429	PowerColor Radeon RX 5700 8GB	326.13	graphics card
4430	Gigabyte GeForce RTX 2080 Super 8GB Aorus	932.75	graphics card
4431	Asus GeForce GTX 1660 Ti 6GB Dual Evo	355.29	graphics card
4432	Gigabyte GeForce GTX 1050 3GB Low Profile	153.66	graphics card
4433	Palit GeForce GTX 1070 8GB Dual	357.92	graphics card
4434	Afox GeForce GTX 1050 2GB	129.85	graphics card
4435	Gigabyte GeForce GT 710 2GB	45.99	graphics card
4436	Inno 3D GeForce RTX 2060 Super 8GB Twin X2 OC	394.40	graphics card
4437	Inno 3D GeForce RTX 2080 Super 8GB Super Twin X2 OC	707.50	graphics card
4438	Gainward GeForce RTX 2070 8GB Phantom GS	524.78	graphics card
4439	EVGA GeForce RTX 2070 Super 8GB XC Gaming	675.12	graphics card
4440	Gainward GeForce GTX 1660 Ti 6GB Ghost OC	284.93	graphics card
4441	Palit GeForce RTX 2070 8GB GameRock Premium	525.96	graphics card
4442	EVGA GeForce RTX 2070 Super 8GB Black Gaming	605.73	graphics card
4443	EVGA GeForce RTX 2060 Super 8GB XC Gaming	504.76	graphics card
4444	Palit GeForce RTX 2060 Super 8GB GP	468.51	graphics card
4445	EVGA GeForce RTX 2070 8GB XC Black Edition	557.13	graphics card
4446	Gigabyte GeForce RTX 2070 Super 8GB Windforce OC	613.64	graphics card
4447	Gigabyte GeForce RTX 2060 6GB Mini ITX OC rev. 2.0	387.95	graphics card
4448	EVGA GeForce GTX1050 Ti 4GB SSC Gaming ACX 3.0	194.01	graphics card
4449	PNY GeForce RTX 2080 8GB	796.08	graphics card
4450	EVGA GeForce RTX 2070 8GB XC Gaming	571.06	graphics card
4451	Gigabyte GeForce RTX 2080 Ti 11GB Turbo	1248.39	graphics card
4452	Zotac GeForce RTX 2080 8GB	697.01	graphics card
4453	Asrock Radeon RX 5700 XT 8GB Challenger D OC	489.52	graphics card
4454	Asus GeForce GTX 1660 Ti 6GB TUF Gaming X3 OC	372.85	graphics card
4455	EVGA GeForce RTX 2070 Super 8GB XC Hybrid	712.01	graphics card
4456	Sapphire Radeon RX 590 Pulse 8GB	241.20	graphics card
4457	MSI Radeon RX 5700 XT 8GB Mech OC	474.10	graphics card
4458	EVGA GeForce RTX 2080 8GB XC Ultra Gaming	855.56	graphics card
4459	Inno 3D GeForce RTX 2060 6GB Twin X2	354.00	graphics card
4460	EVGA GeForce RTX 2060 6GB XC Ultra Black	429.00	graphics card
4461	Inno 3D GeForce GTX 1660 Ti 6GB Compact	271.95	graphics card
4462	PNY GeForce GTX 1660 Ti 6GB XLR8 Gaming OC	313.00	graphics card
4463	EVGA GeForce RTX 2080 Ti 11GB FTW3 Ultra Hydro Copper Gaming	1753.61	graphics card
4464	Gigabyte GeForce RTX 2060 6GB Windforce (rev. 1.0)	419.05	graphics card
4465	Gigabyte GeForce GT 730 2GB rev 2.0	68.60	graphics card
4466	PowerColor Radeon RX 5700 XT 8GB	459.64	graphics card
4467	Gigabyte GeForce RTX 2060 Super 8GB Windforce	417.97	graphics card
4468	Asrock Radeon VII 16GB Phantom Gaming X	772.01	graphics card
4469	Inno 3D GeForce GTX 1650 4GB Twin X2 OC	147.15	graphics card
4470	MSI GeForce RTX 2080 Super 8GB	899.12	graphics card
4471	Asus Radeon RX 560 4GB OC	178.50	graphics card
4472	EVGA GeForce GTX 1650 4GB XC Black Gaming	180.58	graphics card
4473	Asus GeForce RTX 2080 Super 8GB ROG Strix Gaming	902.37	graphics card
4474	EVGA GeForce GTX 1650 4GB XC Gaming	193.34	graphics card
4475	Asus Radeon RX 5700 8GB	426.61	graphics card
4476	EVGA GeForce RTX 2080 Ti 11GB XC Hybrid Gaming	1518.82	graphics card
4477	EVGA GeForce RTX 2080 8GB FTW3 Ultra Hydro Copper Gaming	1147.78	graphics card
4478	Zotac GeForce GTX1050 2GB OC	150.00	graphics card
4479	Inno 3D GeForce RTX 2070 Super 8GB Twin X2 OC	571.95	graphics card
4480	Asus GeForce GTX 1660 Ti 6GB Dual Advanced	374.44	graphics card
4481	Zotac GeForce RTX 2080 8GB AMP Maxx	721.15	graphics card
4482	PNY GeForce GTX1060 6GB	382.00	graphics card
4483	EVGA GeForce RTX 2080 Super 8GB XC Ultra OC	850.17	graphics card
4484	EVGA GeForce RTX 2080 Ti 11GB XC2 Ultra Gaming	1476.31	graphics card
4485	EVGA GeForce RTX 2080 Super 8GB Black Gaming	849.45	graphics card
4486	KFA2 GeForce RTX 2080 Super 8GB EX	812.76	graphics card
4487	Palit GeForce RTX 2070 8GB Super JetStream	671.00	graphics card
4488	Sapphire GPRO 4300 4GB	207.90	graphics card
4489	PNY GeForce GTX1050 Ti 4GB	312.36	graphics card
4490	EVGA GeForce RTX 2070 Super 8GB Blower	616.35	graphics card
4491	Asus GeForce RTX 2080 8GB Turbo Evo	921.50	graphics card
4492	Inno 3D GeForce RTX 2080 Ti 11GB Jet	1168.08	graphics card
4493	Palit GeForce RTX 2060 6GB Dual OC	358.00	graphics card
4494	Zotac GeForce GTX 1660 6GB AMP	265.00	graphics card
4495	Palit GeForce GTX 1660 Ti 6GB Dual OC	287.28	graphics card
4496	MSI GeForce GTX 1050 2GB LP	133.88	graphics card
4497	MSI Radeon RX 5700 8GB Mech OC	404.60	graphics card
4498	Palit GeForce GTX 1660 Ti 6GB Dual	316.25	graphics card
4499	Palit GeForce RTX 2070 8GB JetStream	519.68	graphics card
4500	EVGA GeForce RTX 2080 Ti 11GB XC Ultra Gaming	1353.88	graphics card
4501	KFA2 GeForce RTX 2060 6GB EX 1 Click OC	361.26	graphics card
4502	Asus GeForce RTX 2080 8GB Dual Advanced	834.09	graphics card
4503	EVGA GeForce RTX 2080 8GB FTW3 GAMING	955.51	graphics card
4504	Palit GeForce RTX 2070 8GB Dual	521.75	graphics card
4505	Inno 3D GeForce GTX 1660 6GB Twin X2	245.20	graphics card
4506	XFX Radeon RX 5700 8GB	391.52	graphics card
4507	EVGA GeForce RTX 2080 8GB Gaming	827.96	graphics card
4508	Gigabyte Radeon RX 550 2GB D5 rev. 2.0	114.00	graphics card
4509	Sapphire Radeon RX 570 8GB Pulse	278.00	graphics card
4510	PNY GeForce GT 1030 2GB	104.90	graphics card
4511	PNY Quadro P600 2GB	198.95	graphics card
4512	EVGA GeForce RTX 2080 Ti 11GB FTW3 Gaming	1465.68	graphics card
4513	EVGA GeForce RTX 2070 8GB XC Black Edition	604.76	graphics card
4514	Inno 3D GeForce GT730 2GB DDR3 LP	57.60	graphics card
4515	Gigabyte Radeon RX 580 4GB Aorus	302.81	graphics card
4516	Fujitsu Quadro P620 2GB	179.96	graphics card
4517	Asus Radeon RX 5700 8GB TUF Gaming OC	459.50	graphics card
4518	Gigabyte GeForce GTX 1660 Ti 6GB Windforce	328.41	graphics card
4519	EVGA GeForce RTX 2080 8GB XC2 Gaming	987.39	graphics card
4520	EVGA GeForce RTX 2080 Ti 11GB XC Black Edition	1321.00	graphics card
4521	Asus Radeon RX 5700 XT 8GB TUF Gaming X3 OC	525.77	graphics card
4522	HP Quadro RTX 4000 8GB	1129.00	graphics card
4523	Asus GeForce RTX 2070 8GB Rog Strix Gaming	597.85	graphics card
4524	Palit GeForce RTX 2070 8GB GamingPro OC	546.57	graphics card
4525	EVGA GeForce RTX 2080 8GB XC Black Edition	871.43	graphics card
4526	EVGA GeForce GTX 1660 6GB XC Ultra Black Gaming	275.28	graphics card
4527	Palit GeForce RTX 2060 6GB StormX	360.82	graphics card
4528	Asus GeForce GTX1060 6GB Dual	315.00	graphics card
4529	MSI GeForce RTX 2060 6GB Gaming	425.00	graphics card
4530	Asus GeForce RTX 2080 8GB Dual OC	853.79	graphics card
4531	Inno 3D GeForce RTX 2070 8GB XC OC	536.68	graphics card
4532	Palit GeForce GTX 1050 Ti 4GB Dual	165.91	graphics card
4533	Afox GeForce GTX 1050 Ti 4GB	164.00	graphics card
4534	EVGA GeForce RTX 2080 Super 8GB FTW3 Ultra OC	1018.46	graphics card
4535	EVGA GeForce RTX 2080 8GB Black Edition Gaming	808.72	graphics card
4536	Inno 3D GeForce RTX 2080 8GB Ichill X3 Jekyll	760.00	graphics card
4537	Asrock Radeon RX 560 4GB Phantom G R	130.50	graphics card
4538	Asus Radeon RX 560 4GB AreZ OC	182.80	graphics card
4539	AMD Radeon Pro WX 2100 2GB Radeon Pro WX2100	141.89	graphics card
4540	EVGA GeForce RTX 2060 6GB XC Ultra Gaming	432.04	graphics card
4541	PNY GeForce RTX 2080 Ti 11GB	1279.37	graphics card
4542	EVGA GeForce RTX 2080 Ti 11GB FTW3 Ultra Gaming	1595.00	graphics card
4543	EVGA GeForce RTX 2080 Ti 11GB FTW3 Ultra Hybrid Gaming	1562.29	graphics card
4544	Gigabyte GeForce RTX 2080 Super 8GB Aorus Waterforce	1020.00	graphics card
4545	PNY GeForce GT710 2GB	52.82	graphics card
4546	EVGA GeForce RTX 2080 Ti 11GB Gaming	1168.08	graphics card
4547	beroNet GeForce GTX 1650 4GB EX	171.28	graphics card
4548	AMD Radeon Pro WX 8200 8GB	1230.00	graphics card
4549	Asus GeForce RTX 2060 6GB TUF Gaming	419.00	graphics card
4550	KFA2 GeForce RTX 2060 Super 8GB EX	480.00	graphics card
4551	EVGA GeForce RTX 2080 Super 8GB FTW3 Hybrid Gaming	1091.50	graphics card
4552	Inno 3D GeForce GTX 1650 4GB Compact	163.20	graphics card
4553	Inno 3D GeForce RTX 2070 Super 8GB	604.29	graphics card
4554	PowerColor Radeon RX 590 8GB Red Dragon	222.57	graphics card
4555	Gigabyte GeForce RTX 2060 Super 8GB Gaming OC 3X	443.06	graphics card
4556	Gigabyte GeForce RTX 2080 Super 8GB Aorus Waterforce WB	1029.00	graphics card
4557	Asus GeForce RTX 2080 Super 8GB Advanced	958.20	graphics card
4558	PNY Quadro P2200 5GB	468.44	graphics card
4559	EVGA GeForce GTX 1650 4GB XC Ultra Gaming OC	224.17	graphics card
4560	KFA2 GeForce GTX 1660 Ti 6GB EX (1 Click OC)	314.58	graphics card
4561	EVGA GeForce RTX 2080 Super 8GB XC Gaming	874.89	graphics card
4562	PNY GeForce RTX 2070 Super 8GB Triple Fan XLR8 Gaming Overclocked	615.39	graphics card
4563	KFA2 GeForce GTX 1660 6GB 1-Click OC	224.32	graphics card
4564	PNY GeForce RTX 2070 Super 8GB Blower	594.14	graphics card
4565	Manli GeForce RTX 2070 Super 8GB	547.96	graphics card
4566	Gainward GeForce RTX 2070 8GB Phantom	560.98	graphics card
4567	EVGA GeForce GTX 1050 3GB SC Gaming	139.90	graphics card
4568	EVGA GeForce RTX 2080 8GB XC Hybrid Gaming	983.04	graphics card
4569	Manli GeForce RTX 2060 Super 8GB	427.28	graphics card
4570	EVGA GeForce RTX 2070 Super 8GB FTW3 Ultra Gaming	742.64	graphics card
4571	Manli GeForce RTX 2060 Super 8GB Gallardo	441.28	graphics card
4572	PNY GeForce RTX 2060 Super 8GB Dual Fan	445.34	graphics card
4573	PNY GeForce RTX 2060 Super 8GB Dual Fan XLR8 Gaming OC	465.65	graphics card
4574	Gigabyte GeForce GT 730 2GB D3 rev. 3.0	66.79	graphics card
4575	PowerColor Radeon RX 580 4GB Red Dragon	253.50	graphics card
4576	EVGA GeForce GTX 1660 6GB	289.67	graphics card
4577	Palit GeForce GTX 1080 8GB Super JetStream	766.50	graphics card
4578	XFX Radeon RX 5700 XT 8GB	444.42	graphics card
4579	EVGA GeForce RTX 2060 Super 8GB SC Ultra Gaming	543.18	graphics card
4580	KFA2 GeForce GTX 1660 Ti 6GB 1 Click OC	287.06	graphics card
4581	Inno 3D GeForce GTX 1060 Gaming OC 6GB	223.36	graphics card
4582	Asus GeForce RTX 2070 8GB Dual Advanced	523.27	graphics card
4583	MSI GeForce RTX 2080 8GB Sea Hawk X	868.31	graphics card
4584	HP Quadro P1000 4GB	372.37	graphics card
4585	Asus GeForce RTX 2070 8GB Dual Evo	619.18	graphics card
4586	Asus Radeon RX 580 8GB Dual	240.19	graphics card
4587	PNY GeForce GTX 1660 Ti 6GB	293.20	graphics card
4588	Gigabyte GeForce GTX 1070 8GB Windforce OC rev 1.0	520.00	graphics card
4589	Gigabyte GeForce GT710 1GB	48.00	graphics card
4590	MSI GeForce GT710 2GB 2GD3H H2D	61.09	graphics card
4591	Asrock Radeon RX 570 4GB Phantom Gaming M1	143.11	graphics card
4592	Zotac GeForce RTX 2060 6GB	355.75	graphics card
4593	HP Quadro RTX 6000 24GB	4719.00	graphics card
4594	Manli GeForce GTX 1060 3GB	173.24	graphics card
4595	HP Quadro RTX 5000 16GB	2349.00	graphics card
4596	KFA2 GeForce RTX 2060 6GB 1-Click OC	357.52	graphics card
4597	Lenovo Quadro P620 2GB	220.97	graphics card
4598	Inno 3D GeForce RTX 2080 8GB Ichill Black	855.40	graphics card
4599	Palit GeForce GT 1030 2GB	81.00	graphics card
4600	Fujitsu Radeon Pro WX 2100 2GB	247.32	graphics card
4601	Inno 3D GeForce RTX 2060 6GB Compact	478.18	graphics card
4602	MSI GeForce RTX 2080 Ti 11GB Sea Hawk X	1506.71	graphics card
4603	Gigabyte GeForce GT 730 2GB rev 1.0	56.68	graphics card
4604	Gigabyte GeForce RTX 2080 Ti 11GB TURBO	1213.83	graphics card
4605	Manli GeForce GTX 1050 Ti 4GB	139.23	graphics card
4606	Manli GeForce RTX 2080 Ti 11GB	1119.41	graphics card
4607	Manli GeForce GTX 1660 6GB	233.25	graphics card
4608	Asus GeForce GTX 1660 6GB TUF Gaming	300.06	graphics card
4609	Manli GeForce GTX 1660 6GB	229.91	graphics card
4610	Manli GeForce RTX 2080 Ti 11GB	1127.29	graphics card
4611	OWC Radeon RX 580 8GB	426.00	graphics card
4612	EVGA GeForce RTX 2070 8GB Black	530.29	graphics card
4613	PNY GeForce GTX 1650 4GB XLR8 Gaming OC	175.00	graphics card
4614	Asus Radeon R7 240 2GB LP	69.99	graphics card
4615	MSI GeForce GT730 2GB	71.93	graphics card
4616	PowerColor Radeon RX 590 8GB Red Devil	278.88	graphics card
4617	XFX Radeon VII 16GB	764.73	graphics card
4618	Zotac GeForce RTX 2080 Ti 11GB AMP Extreme Core	1372.21	graphics card
4619	Zotac GeForce RTX 2080 Ti 11GB ArcticStorm	1563.68	graphics card
4620	PNY GeForce GTX 1660 6GB XLR8 Gaming Overclocked	311.00	graphics card
4621	Lenovo Quadro P4000 8GB	1189.05	graphics card
4622	Gainward GeForce RTX 2060 6GB Ghost OC	405.91	graphics card
4623	PowerColor Radeon RX 560 2GB Red Dragon	129.96	graphics card
4624	Gainward GeForce RTX 2080 8GB Triple	702.28	graphics card
4625	Inno 3D GeForce GTX 1070 8GB X2 V4	349.90	graphics card
4626	XFX Radeon R7 240 2GB	79.99	graphics card
4627	Inno 3D GeForce RTX 2080 8GB JET	763.55	graphics card
4628	Inno 3D GeForce RTX 2080 Ti 11GB OC X3	1119.69	graphics card
4629	Inno 3D GeForce RTX 2080 Ti 11GB X2 OC	1214.09	graphics card
4630	Asus GeForce RTX 2080 8GB Dual	885.14	graphics card
4631	Asus Radeon RX 570 4GB Arez Strix OC	269.12	graphics card
4632	Sapphire Radeon R5 230 1GB D3	55.00	graphics card
4633	PNY GeForce RTX 2060 6GB XLR8 Overclocked edition	388.45	graphics card
4634	Inno 3D GeForce RTX 2080 8GB Ichill Frostbite	809.63	graphics card
4635	Gainward GeForce GTX 1070 Ti 8GB	410.32	graphics card
4636	EVGA GeForce RTX 2080 Ti 11GB Black Edition	1161.66	graphics card
4637	PNY Quadro P5000 16GB	1784.48	graphics card
4638	HP Quadro P600 2GB	184.90	graphics card
4639	PNY GeForce RTX 2070 8GB Blower	532.57	graphics card
4640	PowerColor Radeon RX 580 8GB Red Dragon	173.07	graphics card
4641	Asus GeForce RTX 2070 8GB Dual	609.25	graphics card
4642	Gainward GeForce RTX 2080 8GB	789.95	graphics card
4643	Inno 3D GeForce GTX 1050 Ti 4GB 1 Slot Edition	148.99	graphics card
4644	Zotac GeForce RTX 2080 Ti 11GB AMP	1212.22	graphics card
4645	HP Quadro P2000 5GB	461.50	graphics card
4646	PNY GeForce GT 1030 2GB	104.80	graphics card
4647	Asus GeForce RTX 2080 8GB ROG Strix Gaming	890.26	graphics card
4648	Asus GeForce RTX 2080 8GB Rog Strix Gaming	953.99	graphics card
4649	Gigabyte Radeon RX 570 8GB Gaming	250.00	graphics card
4650	Inno 3D GeForce GTX 1060 3GB Compact	203.64	graphics card
4651	Palit GeForce RTX 2070 8GB Dual	610.00	graphics card
4652	Gainward GeForce RTX 2080 8GB Phoenix	805.71	graphics card
4653	Gainward GeForce GTX1060 6GB Phoenix GS	260.25	graphics card
4654	PNY Quadro M5000 8GB	2292.93	graphics card
4655	Inno 3D GeForce GTX 1070 Ti 8GB X2 V2	369.90	graphics card
4656	Gainward GeForce GTX1050 2GB	114.76	graphics card
4657	Asus Radeon RX 570 4GB Expedition	186.89	graphics card
4658	Sapphire Radeon RX 550 4GB Pulse	160.65	graphics card
4659	Gainward GeForce GTX 1060 6GB	259.89	graphics card
4660	Inno 3D GeForce GT710 1GB DDR3 LP	29.43	graphics card
4661	Asus GeForce GTX 1060 6GB Expedition	347.82	graphics card
4662	Sapphire Radeon RX 560 2GB Pulse	103.61	graphics card
4663	Asus GeForce GT710 2GB Silent	51.75	graphics card
4664	PNY Quadro GP100 16GB	6308.74	graphics card
4665	PNY GeForce GT710 1GB	42.45	graphics card
4666	Palit GeForce GTX 1060 6GB Dual	300.90	graphics card
4667	HP Quadro P400 2GB	119.00	graphics card
4668	EVGA GeForce GTX1050 2GB Gaming	154.00	graphics card
4669	MSI GeForce GT710 2GB	59.00	graphics card
4670	Gainward GeForce GT730 2GB SilentFX	61.73	graphics card
4671	Gigabyte GeForce GTX 1080 8GB	819.00	graphics card
4672	AMD Radeon Pro WX 4100 4GB	303.70	graphics card
4673	XFX Radeon RX 560 2GB 14CU Single Fan	105.10	graphics card
4674	EVGA GeForce GT 1030 2GB SC	91.08	graphics card
4675	XFX Radeon RX 580 4GB GTX XXX Edition	408.25	graphics card
4676	HP Quadro P4000 8GB	1019.00	graphics card
4677	Fujitsu Quadro P1000 4GB	367.90	graphics card
4678	AMD Radeon Pro WX7100 8GB	619.42	graphics card
4679	Asus Radeon R7 240 4GB OC	106.70	graphics card
4680	PowerColor Radeon RX 560 4GB Red Dragon Radeon	139.00	graphics card
4681	HP GeForce GT 730 2GB	99.90	graphics card
4682	XFX Radeon RX 550 2GB Core Edition	92.38	graphics card
4683	Inno 3D GeForce GTX1050 2GB Compact	145.00	graphics card
4684	EVGA GeForce GTX 1070 8GB FTW2 Gaming	489.02	graphics card
4685	Gigabyte Radeon RX 560 4GB rev. 1.0	137.45	graphics card
4686	EVGA GeForce GT710 2GB	47.70	graphics card
4687	Gigabyte GeForce GTX1060 3GB Mini ITX OC	213.11	graphics card
4688	Fujitsu Quadro P2000 5GB	500.00	graphics card
4689	PNY GeForce GT 730 2GB	72.02	graphics card
4690	XFX Radeon RX 550 4GB Core Edition	127.00	graphics card
4691	PNY Quadro P6000 24GB	4953.92	graphics card
4692	Inno 3D GeForce GTX1050 Ti 4GB Compact	137.95	graphics card
4693	Zotac GeForce GTX 1070 8GB AMP Core Edition	585.32	graphics card
4694	EVGA GeForce GTX1050 Ti 4GB Gaming	158.47	graphics card
4695	KFA2 GeForce GT 1030 2GB	85.04	graphics card
4696	XFX Radeon RX 570 4GB XXX Edition	166.00	graphics card
4697	Asus GeForce GT710 1GB	42.00	graphics card
4698	Zotac GeForce GT710 1GB	38.96	graphics card
4699	PNY GeForce GTX 1070 8GB	817.04	graphics card
4700	Zotac GeForce GTX 1650 4GB OC	141.82	graphics card
4701	PNY GeForce GTX 1060 6GB	515.36	graphics card
4702	Gainward GeForce GTX1070 8GB Phoenix GS	528.44	graphics card
4703	Asus Radeon RX 550 2GB	140.43	graphics card
4704	Inno 3D GeForce GT730 1GB LP	57.90	graphics card
4705	PNY GeForce GTX 1060 6GB XLR8 OC Gaming	266.85	graphics card
4706	Gigabyte GeForce GT710 1GB	46.00	graphics card
4707	Asus Radeon R7 240 4GB OC	99.00	graphics card
4708	Inno 3D GeForce GTX1060 3GB X2	223.10	graphics card
4709	PowerColor Radeon RX 460 4GB Red Dragon	129.00	graphics card
4710	Gigabyte GeForce 210 1GB rev 5.0	44.38	graphics card
4711	AMD FirePro W9100 16GB	4072.32	graphics card
4712	PNY Quadro NVS 810 4GB	834.76	graphics card
4713	PNY Quadro NVS 810 4GB	858.31	graphics card
4714	Asus GeForce GTX1070 8GB Turbo	583.00	graphics card
4715	Gigabyte GeForce 210 1GB	45.00	graphics card
4716	Gigabyte GeForce 210 1GB rev 1.0	46.83	graphics card
4717	PNY Quadro K2200 4GB	481.10	graphics card
4718	Asus GeForce GT 1030 2GB Phoenix OC	88.79	graphics card
4719	Gainward GeForce GT630 1GB	84.99	graphics card
4720	Asus GeForce GT730 2GB Silent with Brackets	93.89	graphics card
4721	Sapphire Radeon R5 230 2GB D3	55.10	graphics card
4722	Zotac GeForce GT730 2GB	71.06	graphics card
4723	EVGA GeForce GT720 1GB	59.36	graphics card
4725	EVGA GeForce GT740 4GB Superclocked	128.32	graphics card
4726	PNY Quadro K620 2GB	194.25	graphics card
4727	Sapphire Radeon R5 230 2GB Sillent	53.30	graphics card
4728	Gainward GeForce GT730 1GB D5	75.00	graphics card
4729	Sapphire Radeon R7 240 1GB D5	74.99	graphics card
4730	PNY Quadro NVS 510 x16 for DP	439.00	graphics card
4731	Sapphire Radeon HD 6450 1GB	41.89	graphics card
4732	Sapphire Radeon HD 6450 2GB Silent LP	46.80	graphics card
\.


--
-- Name: OrderItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."OrderItem_id_seq"', 49, true);


--
-- Name: Order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Order_id_seq"', 29, true);


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.address_id_seq', 26, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_id_seq', 27, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_id_seq', 4733, true);


--
-- Name: OrderItem OrderItem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: Address address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: Customer customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: Product product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: OrderItem OrderItem_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_order_id_fkey" FOREIGN KEY (order_id) REFERENCES public."Order"(id);


--
-- Name: OrderItem OrderItem_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_product_id_fkey" FOREIGN KEY (product_id) REFERENCES public."Product"(id);


--
-- Name: Order Order_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES public."Customer"(id);


--
-- Name: Customer customers_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT customers_address_id_fkey FOREIGN KEY (address_id) REFERENCES public."Address"(id);


--
-- PostgreSQL database dump complete
--

