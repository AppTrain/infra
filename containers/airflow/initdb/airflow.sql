--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4 (Debian 11.4-1.pgdg90+1)
-- Dumped by pg_dump version 11.4 (Debian 11.4-1.pgdg90+1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO airflow;

--
-- Name: chart; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.chart (
    id integer NOT NULL,
    label character varying(200),
    conn_id character varying(250) NOT NULL,
    user_id integer,
    chart_type character varying(100),
    sql_layout character varying(50),
    sql text,
    y_log_scale boolean,
    show_datatable boolean,
    show_sql boolean,
    height integer,
    default_params character varying(5000),
    x_is_date boolean,
    iteration_no integer,
    last_modified timestamp with time zone
);


ALTER TABLE public.chart OWNER TO airflow;

--
-- Name: chart_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.chart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_id_seq OWNER TO airflow;

--
-- Name: chart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.chart_id_seq OWNED BY public.chart.id;


--
-- Name: connection; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.connection (
    id integer NOT NULL,
    conn_id character varying(250),
    conn_type character varying(500),
    host character varying(500),
    schema character varying(500),
    login character varying(500),
    password character varying(500),
    port integer,
    extra character varying(5000),
    is_encrypted boolean,
    is_extra_encrypted boolean
);


ALTER TABLE public.connection OWNER TO airflow;

--
-- Name: connection_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.connection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connection_id_seq OWNER TO airflow;

--
-- Name: connection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.connection_id_seq OWNED BY public.connection.id;


--
-- Name: dag; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag (
    dag_id character varying(250) NOT NULL,
    is_paused boolean,
    is_subdag boolean,
    is_active boolean,
    last_scheduler_run timestamp with time zone,
    last_pickled timestamp with time zone,
    last_expired timestamp with time zone,
    scheduler_lock boolean,
    pickle_id integer,
    fileloc character varying(2000),
    owners character varying(2000),
    description text,
    default_view character varying(25),
    schedule_interval text
);


ALTER TABLE public.dag OWNER TO airflow;

--
-- Name: dag_pickle; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_pickle (
    id integer NOT NULL,
    pickle bytea,
    created_dttm timestamp with time zone,
    pickle_hash bigint
);


ALTER TABLE public.dag_pickle OWNER TO airflow;

--
-- Name: dag_pickle_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.dag_pickle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dag_pickle_id_seq OWNER TO airflow;

--
-- Name: dag_pickle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.dag_pickle_id_seq OWNED BY public.dag_pickle.id;


--
-- Name: dag_run; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_run (
    id integer NOT NULL,
    dag_id character varying(250),
    execution_date timestamp with time zone,
    state character varying(50),
    run_id character varying(250),
    external_trigger boolean,
    conf bytea,
    end_date timestamp with time zone,
    start_date timestamp with time zone
);


ALTER TABLE public.dag_run OWNER TO airflow;

--
-- Name: dag_run_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.dag_run_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dag_run_id_seq OWNER TO airflow;

--
-- Name: dag_run_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.dag_run_id_seq OWNED BY public.dag_run.id;


--
-- Name: import_error; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.import_error (
    id integer NOT NULL,
    "timestamp" timestamp with time zone,
    filename character varying(1024),
    stacktrace text
);


ALTER TABLE public.import_error OWNER TO airflow;

--
-- Name: import_error_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.import_error_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_error_id_seq OWNER TO airflow;

--
-- Name: import_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.import_error_id_seq OWNED BY public.import_error.id;


--
-- Name: job; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.job (
    id integer NOT NULL,
    dag_id character varying(250),
    state character varying(20),
    job_type character varying(30),
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    latest_heartbeat timestamp with time zone,
    executor_class character varying(500),
    hostname character varying(500),
    unixname character varying(1000)
);


ALTER TABLE public.job OWNER TO airflow;

--
-- Name: job_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_id_seq OWNER TO airflow;

--
-- Name: job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.job_id_seq OWNED BY public.job.id;


--
-- Name: known_event; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.known_event (
    id integer NOT NULL,
    label character varying(200),
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    user_id integer,
    known_event_type_id integer,
    description text
);


ALTER TABLE public.known_event OWNER TO airflow;

--
-- Name: known_event_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.known_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.known_event_id_seq OWNER TO airflow;

--
-- Name: known_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.known_event_id_seq OWNED BY public.known_event.id;


--
-- Name: known_event_type; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.known_event_type (
    id integer NOT NULL,
    know_event_type character varying(200)
);


ALTER TABLE public.known_event_type OWNER TO airflow;

--
-- Name: known_event_type_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.known_event_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.known_event_type_id_seq OWNER TO airflow;

--
-- Name: known_event_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.known_event_type_id_seq OWNED BY public.known_event_type.id;


--
-- Name: kube_resource_version; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.kube_resource_version (
    one_row_id boolean DEFAULT true NOT NULL,
    resource_version character varying(255),
    CONSTRAINT kube_resource_version_one_row_id CHECK (one_row_id)
);


ALTER TABLE public.kube_resource_version OWNER TO airflow;

--
-- Name: kube_worker_uuid; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.kube_worker_uuid (
    one_row_id boolean DEFAULT true NOT NULL,
    worker_uuid character varying(255),
    CONSTRAINT kube_worker_one_row_id CHECK (one_row_id)
);


ALTER TABLE public.kube_worker_uuid OWNER TO airflow;

--
-- Name: log; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.log (
    id integer NOT NULL,
    dttm timestamp with time zone,
    dag_id character varying(250),
    task_id character varying(250),
    event character varying(30),
    execution_date timestamp with time zone,
    owner character varying(500),
    extra text
);


ALTER TABLE public.log OWNER TO airflow;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_id_seq OWNER TO airflow;

--
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.log_id_seq OWNED BY public.log.id;


--
-- Name: sla_miss; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.sla_miss (
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    email_sent boolean,
    "timestamp" timestamp with time zone,
    description text,
    notification_sent boolean
);


ALTER TABLE public.sla_miss OWNER TO airflow;

--
-- Name: slot_pool; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.slot_pool (
    id integer NOT NULL,
    pool character varying(50),
    slots integer,
    description text
);


ALTER TABLE public.slot_pool OWNER TO airflow;

--
-- Name: slot_pool_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.slot_pool_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slot_pool_id_seq OWNER TO airflow;

--
-- Name: slot_pool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.slot_pool_id_seq OWNED BY public.slot_pool.id;


--
-- Name: task_fail; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_fail (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    duration integer
);


ALTER TABLE public.task_fail OWNER TO airflow;

--
-- Name: task_fail_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.task_fail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_fail_id_seq OWNER TO airflow;

--
-- Name: task_fail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.task_fail_id_seq OWNED BY public.task_fail.id;


--
-- Name: task_instance; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_instance (
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    duration double precision,
    state character varying(20),
    try_number integer,
    hostname character varying(1000),
    unixname character varying(1000),
    job_id integer,
    pool character varying(50),
    queue character varying(50),
    priority_weight integer,
    operator character varying(1000),
    queued_dttm timestamp with time zone,
    pid integer,
    max_tries integer DEFAULT '-1'::integer,
    executor_config bytea
);


ALTER TABLE public.task_instance OWNER TO airflow;

--
-- Name: task_reschedule; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_reschedule (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    try_number integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    duration integer NOT NULL,
    reschedule_date timestamp with time zone NOT NULL
);


ALTER TABLE public.task_reschedule OWNER TO airflow;

--
-- Name: task_reschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.task_reschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_reschedule_id_seq OWNER TO airflow;

--
-- Name: task_reschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.task_reschedule_id_seq OWNED BY public.task_reschedule.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(250),
    email character varying(500),
    password character varying(255),
    superuser boolean
);


ALTER TABLE public.users OWNER TO airflow;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO airflow;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;


--
-- Name: variable; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.variable (
    id integer NOT NULL,
    key character varying(250),
    val text,
    is_encrypted boolean
);


ALTER TABLE public.variable OWNER TO airflow;

--
-- Name: variable_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.variable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variable_id_seq OWNER TO airflow;

--
-- Name: variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.variable_id_seq OWNED BY public.variable.id;


--
-- Name: xcom; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.xcom (
    id integer NOT NULL,
    key character varying(512),
    value bytea,
    "timestamp" timestamp with time zone NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL
);


ALTER TABLE public.xcom OWNER TO airflow;

--
-- Name: xcom_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.xcom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xcom_id_seq OWNER TO airflow;

--
-- Name: xcom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.xcom_id_seq OWNED BY public.xcom.id;


--
-- Name: chart id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.chart ALTER COLUMN id SET DEFAULT nextval('public.chart_id_seq'::regclass);


--
-- Name: connection id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.connection ALTER COLUMN id SET DEFAULT nextval('public.connection_id_seq'::regclass);


--
-- Name: dag_pickle id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_pickle ALTER COLUMN id SET DEFAULT nextval('public.dag_pickle_id_seq'::regclass);


--
-- Name: dag_run id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run ALTER COLUMN id SET DEFAULT nextval('public.dag_run_id_seq'::regclass);


--
-- Name: import_error id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.import_error ALTER COLUMN id SET DEFAULT nextval('public.import_error_id_seq'::regclass);


--
-- Name: job id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.job ALTER COLUMN id SET DEFAULT nextval('public.job_id_seq'::regclass);


--
-- Name: known_event id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.known_event ALTER COLUMN id SET DEFAULT nextval('public.known_event_id_seq'::regclass);


--
-- Name: known_event_type id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.known_event_type ALTER COLUMN id SET DEFAULT nextval('public.known_event_type_id_seq'::regclass);


--
-- Name: log id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.log ALTER COLUMN id SET DEFAULT nextval('public.log_id_seq'::regclass);


--
-- Name: slot_pool id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.slot_pool ALTER COLUMN id SET DEFAULT nextval('public.slot_pool_id_seq'::regclass);


--
-- Name: task_fail id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_fail ALTER COLUMN id SET DEFAULT nextval('public.task_fail_id_seq'::regclass);


--
-- Name: task_reschedule id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule ALTER COLUMN id SET DEFAULT nextval('public.task_reschedule_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: variable id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.variable ALTER COLUMN id SET DEFAULT nextval('public.variable_id_seq'::regclass);


--
-- Name: xcom id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.xcom ALTER COLUMN id SET DEFAULT nextval('public.xcom_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.alembic_version (version_num) FROM stdin;
a56c9515abdc
939bb1e647c8
\.


--
-- Data for Name: chart; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.chart (id, label, conn_id, user_id, chart_type, sql_layout, sql, y_log_scale, show_datatable, show_sql, height, default_params, x_is_date, iteration_no, last_modified) FROM stdin;
1	Airflow task instance by type	airflow_db	\N	bar	series	SELECT state, COUNT(1) as number FROM task_instance WHERE dag_id LIKE 'example%' GROUP BY state	\N	\N	t	600	{}	f	0	2019-06-24 04:01:24.220852+00
\.


--
-- Data for Name: connection; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.connection (id, conn_id, conn_type, host, schema, login, password, port, extra, is_encrypted, is_extra_encrypted) FROM stdin;
1	airflow_db	mysql	mysql	airflow	root	\N	\N	\N	f	f
2	beeline_default	beeline	localhost	default	\N	\N	10000	gAAAAABdEEsTd8k4tMmhmbRl2tBHseq0fQwT7uVn4L5ywSSmRZYlS79I2nWbgJ7ZF584QscIYrm5CVectdr48Wth_idllyvekUEWda7A7OT-BVhabhUepjNcSPmQvH2iqxOZZfVspREk	f	t
3	bigquery_default	google_cloud_platform	\N	default	\N	\N	\N	\N	f	f
4	local_mysql	mysql	localhost	airflow	airflow	gAAAAABdEEsTimdDBP4sI-sroQzmEsWdKJcosifTcXTDWYz_tKvFwbubzIGeyUlumEd3cl7sG0ogxo5EgWbvwpwMnUDgfHHNsQ==	\N	\N	t	f
5	presto_default	presto	localhost	hive	\N	\N	3400	\N	f	f
6	google_cloud_default	google_cloud_platform	\N	default	\N	\N	\N	\N	f	f
7	hive_cli_default	hive_cli	\N	default	\N	\N	\N	\N	f	f
8	hiveserver2_default	hiveserver2	localhost	default	\N	\N	10000	\N	f	f
9	metastore_default	hive_metastore	localhost	\N	\N	\N	9083	gAAAAABdEEsTT8bT1UVuFB9nnGbIGD-FpywOXAHbV2EbfG53KsuNK92QGy3aF6wePOpQhRLWWvrBFQqRsMHGBiYCzDXEdl4E2yUqBZFBYtK-rKYuFHRXIG8=	f	t
10	mongo_default	mongo	mongo	\N	\N	\N	27017	\N	f	f
11	mysql_default	mysql	mysql	airflow	root	\N	\N	\N	f	f
12	postgres_default	postgres	postgres	airflow	postgres	gAAAAABdEEsTzYEUyHAy21WHTkGgbf1KDhTJNgiZBo4swgVuNuMhT6oYMDiQLPG2S9cmZS2fUBbpoP6tc3DfZlcqY_n_2ann6g==	\N	\N	t	f
13	sqlite_default	sqlite	/tmp/sqlite_default.db	\N	\N	\N	\N	\N	f	f
14	http_default	http	https://www.google.com/	\N	\N	\N	\N	\N	f	f
15	mssql_default	mssql	localhost	\N	\N	\N	1433	\N	f	f
16	vertica_default	vertica	localhost	\N	\N	\N	5433	\N	f	f
17	wasb_default	wasb	\N	\N	\N	\N	\N	gAAAAABdEEsT0Zta0hb6uvP8mLGKLu4m98NzjkwAntIOtz_ITa_9xji5Z0AQq3BybHH76nggeZU-YKqW7KJ9wT32Fta-CTu7KAKz4bdVMr9xNIbtFn4-Bkc=	f	t
18	webhdfs_default	hdfs	localhost	\N	\N	\N	50070	\N	f	f
19	ssh_default	ssh	localhost	\N	\N	\N	\N	\N	f	f
20	sftp_default	sftp	localhost	\N	airflow	\N	22	gAAAAABdEEsTmh07NmeT4JHbHJSfTm9Xy65q4yEo1k0LD2uZES61-jcl_j_3ufhmv-cY-yQDb0-H9fCLYHkT0OXYI3YBD6SS9pLlUNJlENXuu0j42tEi7bexQbQY0yBrP3de4UUQ7PFw5Qvzbs0HlOqwZJIqwjyzZs8Og1XGboDwmTwW41Wt_zPsqvWAR1H-YYfNsGXbU_Qv	f	t
21	fs_default	fs	\N	\N	\N	\N	\N	gAAAAABdEEsTrt-rY1M3r724Pqis-rrRMFuMk73bhdTDl4zKOZmanpnjcEBgLsDTI1yqu1J5EwI3nRxcYnFDkiV-5ZiDdc5ZyA==	f	t
22	aws_default	aws	\N	\N	\N	\N	\N	gAAAAABdEEsT3n3XWa6GcNx9distAbqLVnavr7TVtp2UE6a151m7mC06DhrAEumwbflpO_tHblPVju2XsltCNNs_NAURQU6lvwHrn3D2XBFzfelUUJcJdxU=	f	t
23	spark_default	spark	yarn	\N	\N	\N	\N	gAAAAABdEEsTZhjsocbU6xxx0KcxNEelFFGxLAXqaGyN5Qse1GxckHZnhbwVeMJxZ_lZavoQSPgZ0JIVLKlacwxP40eNoe8crn2nw5e8vtqy1MTS1HwJXb0=	f	t
24	druid_broker_default	druid	druid-broker	\N	\N	\N	8082	gAAAAABdEEsTf7NHRMw9HbjOCMSz2NmCUWeyIth0zqFj1wmAD4sr3OkmPG_2oBQAmalcckeO_M20pjjv7pxX2R5ZJQe7fKZ6lvt5T0oDLSsJhpU4pm_VzlU=	f	t
25	druid_ingest_default	druid	druid-overlord	\N	\N	\N	8081	gAAAAABdEEsTEKsTBFpx1JBSNN6Jj8oR48VXTvjJrJKuePyZZ2PDIvc2VAOZTifZ3yc6zFE5QQ826B08u8m6Ty2m3pfXkgbXjoPft2wT-Jf-FmDZrTU_LalVuk2XsuF5Aze8mSHSpggs	f	t
26	redis_default	redis	redis	\N	\N	\N	6379	gAAAAABdEEsTalHOdzQLF2-6TqgdRagAXDmo4vZUaxKyy8DgD-MeVuFcgI-RM3zErrU0wyb_vCzT0frqhxGK-UPKbiOhQ7volg==	f	t
27	sqoop_default	sqoop	rmdbs	\N	\N	\N	\N		f	f
28	emr_default	emr	\N	\N	\N	\N	\N	gAAAAABdEEsTICDpGPE7BZSbPNcpTgt19IS1zXHcacIm7Rfe8GLHYa6XUp6eaUd_CVwG9ycLxPIOQv9h2dlah_OxazcsJnpL5xFj9Z1pk0OLePhKDIngD55NPk8xyOA06S5gXwn9PZXiQARdDX4gTWacYO7r7hj3j_37tnlrGASg8-Ppag1MLS-cvAV0lQcgkJF1VTmSncHh3A0cn4UTvQNd6URJ7xuu8UuKSD6wbnXTGxnuCmRG_SbJc5rnetGyr8c0V41jHNnxXhXmYx6TPGuWbJDfXfrqXyOz5sZWhvE4PdrtKfXP2u3KH4RDbSKclSoIBLTH0_KS3wXaSAJ-1iNwHC9PpMOaAsflNgY2uwJiRVD8GIG3bLHXx1uXyg9YSnExgPpbXoGniwc-9tkYFUMAp6JzrAdZ0ba90TUmCOiK2h63GjQ_0NlupIZ8irgubW_l-CkJbRGxKB36Va-EdxQJu0qgqY7yglk4opvRFMPIKNOwKG8kECPHnkigwB1KQF3iU7JfexX1CUEX_6wHf4OZZ4TiqAG7XoccBpKTh8AZ1xyAuou1Lhs8uyFdOF82GxJF37gxCjgUbxzekg60Et2X3ufOL3kaHBF2FptVA-EnTIMb5lyuDp9kHeE65bXA5nsv6q1IBOy0t9Qgs8WvFYGJ8Qj5_XO2BzxtcysB7qvSesU_QFnMHYqHQM6nAdq2bQVGghijV5xGO-V-aYyB6jdZrqd8wZEp5aYziXYvT3QaNCl_7WAkCabA6EeLhJyRrULdfmnD5NcRPfIMG-h55oLf5AXMr58Z7jiSJIEgYlknrtIkRHd1XE0HR4QIis7V0BYYEUg5wOUlhkWvyDoGroY9JLxDAN9m6Q5EmgQDKerCYwUIp76GdlMdDrhIWzDKHZOn6Z4X3fKFyjE3YaaChTAgRGCt9P9Pp4TYQbgrfZ0rJSmfV37fFlHK-h71abPy0igTckXgROeBzdpMbWnDsxm9EmvmonhL6-6kEZqx5Si0Hs9J_asCxbZ8A-dkpXAzg9MQpfVzuf5psgCKMIUs916-4mjIPjUvGG-UkUqGOGNPSWr5PJLhWWIFPwcvnkcRpq5Gf-R0LW8DbH9qzremOe1HD3wNDtGIrHGcGJsJtBkbtysIbdpZ6gdLF0Ci_1WBlxZxQXgCF8hF-FsdI0eZrXUy8b-shouEzMPicm5HujN15jY11gLrI_n3cGGmob7N_uaMogip4Lhr3XfcrB4N0jbo47tEXwwe6I0y0Pr3NUJCsDjyZQqtCz0OhrM_IMjjVuIilKhU6TAHM6IaEBx93BMFHOdAsRq89TJnYTfAxPmUWJAeEPVzRiGZG8oF9nra_7ynpzfDoPtzY-Z5fCH0VErY-NR72q50tb4AXdeTLFHuDnS1Bq-Z6wHPc__inW-NADxS4OjvxaDAlcQIhfd7JeiCpV4o-iyJASO0RrQ993tmwyg24007rKVXzqc0BMpLAtV-sSM7yrSR41ZkmB_I-SvDBNRnSeLPLpas6h9QrH9GzWRatyaM00sS9qC5ctuYh6Dva0zVvNgPibe0CN25LHwOt1LY5vpR4EU69wyQlYDCMus-H54mUvquEWF-0MtxTw_Bp-wJo4kax39mA_7aXgE-aj1F9Uwy9FBO99Nv-cgCG0eymGF8s_XGuzeIOyIe1ALqDUIQNdhHfUhIm6M9lYGTocoFLZdzU9Vc17saPgYL6gFEXVjI4B8lskzZbQcuUQnf79DZM76Z4hx7MplJQhHOa_AI0D6XnLQ7HuVU2BS992PM1OSaewkkOmgxfatyaZEpWYsZ_ezeqLyqiM3YsoKX9buFhoHU3Sw-l1PM0ze8zTsay0ino-Fu5JLScf8WsXeqwKjaD5RQQNuIsRNylQBx4ERhElo_6BcQ6YGO-WIDvZwfW_AJT0aXS_1PYdlaF0sWKRVnx-WJ514UzZI-4ltWEfntgIXYdrmD2gifiYAO-BWSLO5ybmasDoAbGdFhzvoJKCtPZ9xzGGZSLM0fDwaICCxkZnkpHUn1XUuN2qjQGQoHskdkpNQ8bDY-sxVUCeex6KFStaU2zKWNB84mcJ9Wi2HucWN5rAmgWVCXppQvRHiHEjLMmCsJvagF2t8UXQu5pCs2usVTXS4m8ds9_77wSyib5EaZo1DHveUw7RBa_1hY0TDvFFhMxHmoSZtTHGuZYiYMGQ_U6FB1UzW3IaUN9ISwOFv0hZ1t7M0UohA1yqvn37PHy2vw0sXUj-l6BkCVTLabDDd6W7KubnQUrb2u8beF9lOE6z9Aj0eC6pa-RjiOue5XznI2jVTNBEAHPhyQaSxjrHuyBK2tec7_AocxTEEAQSZ-qTxsXkmB9g07fgaeyNt-MQnIzGtmLDyxzhMO63tXxzlUI9Z_Fbt0rwIIFq5yWhEfcMvPw0zhSIGGorrMjRj94MaKXHgMKNHmPGJ3TOzRux2AlpNoIhgPZv5lYrpPQp-_7is4jzFGfBeRmbX3bchD2hWHd4YP0KcBqjkDt0GipzNQQaHDD_m4vs14h5VdZjAn6wsDASYeRTMrM7QKTvdg_3I=	f	t
29	databricks_default	databricks	localhost	\N	\N	\N	\N	\N	f	f
30	qubole_default	qubole	localhost	\N	\N	\N	\N	\N	f	f
31	segment_default	segment	\N	\N	\N	\N	\N	gAAAAABdEEsToSBhDoDOXVAwyAw0MG9knNl3NGr2WCtuKg7gzsN2s0SpcIMomKMaSH3-8w-CFO0Mm1gXIHCPzsBz7WukLMp2mSXcLsYXzlZrxQ_2o05SSdaaihwD0Biu6dM1ISwfCfXz	f	t
32	azure_data_lake_default	azure_data_lake	\N	\N	\N	\N	\N	gAAAAABdEEsTE6tSZlHcX_HWPaq9qZjj-oQfVhe85bfSMVPeunngjDiyT-Rc03kauol2s8k3CNIOvXa3e2LW3MhfGPSCP_7cfV1pXzYapQ2RfHBNBOKLfrjmsP7goRmQLgukrl4gFegopnMftZDF3Z-nX4hjg-SDnA==	f	t
33	azure_cosmos_default	azure_cosmos	\N	\N	\N	\N	\N	gAAAAABdEEsUj4UG9Me1PU3dmQ2K-eXFh-P6N6khDYNHiJqsa9fgJaOlvCATDSZ1Dnbxofem3P6hi2CcQyiML5W4tsQpYEUNPzrrmeEs7LRC8zJ2Bc6j0YBjhODd7gM66VXTWIrgMrpbsPfrrAY52oggSgzf7JhMuMIlpYeOVzrq5eEeWDYDrsQ=	f	t
34	azure_container_instances_default	azure_container_instances	\N	\N	\N	\N	\N	gAAAAABdEEsU3sFGNx42DifvtB1bb07IzuYaZkaQWJ7cHWCTxhM5NGALn4WL6q0aM7bd7kmDSXhH9sALHxxtW6PiwDgh3kz_197L-cuMffYM-X8hAzd_UuXmWi3EaTEpwHRTVQ5LFdxkZWkEGu3Xi0PnR47hkyL-XghRMm95ygjt7tj3XE-s1QY=	f	t
35	cassandra_default	cassandra	cassandra	\N	\N	\N	9042	\N	f	f
36	dingding_default	http		\N	\N	\N	\N	\N	f	f
37	opsgenie_default	http		\N	\N	\N	\N	\N	f	f
\.


--
-- Data for Name: dag; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag (dag_id, is_paused, is_subdag, is_active, last_scheduler_run, last_pickled, last_expired, scheduler_lock, pickle_id, fileloc, owners, description, default_view, schedule_interval) FROM stdin;
latest_only_with_trigger	t	f	t	2019-06-24 05:44:46.458368+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_latest_only_with_trigger.py	Airflow		\N	{"type": "timedelta", "attrs": {"days": 0, "seconds": 14400, "microseconds": 0}}
example_trigger_target_dag	t	f	t	2019-06-24 05:44:46.468483+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_trigger_target_dag.py	airflow		\N	null
example_subdag_operator	t	f	t	2019-06-24 05:44:46.519597+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_subdag_operator.py	airflow		\N	"@once"
example_subdag_operator.section-1	t	t	t	2019-06-24 05:44:46.519597+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/subdags/subdag.py	airflow		\N	"@daily"
example_subdag_operator.section-2	t	t	t	2019-06-24 05:44:46.519597+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/subdags/subdag.py	airflow		\N	"@daily"
example_http_operator	t	f	t	2019-06-24 05:44:46.530185+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_http_operator.py	airflow		\N	{"type": "timedelta", "attrs": {"days": 1, "seconds": 0, "microseconds": 0}}
example_skip_dag	t	f	t	2019-06-24 05:44:46.532944+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_skip_dag.py	airflow		\N	{"type": "timedelta", "attrs": {"days": 1, "seconds": 0, "microseconds": 0}}
example_trigger_controller_dag	t	f	t	2019-06-24 05:44:46.536389+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_trigger_controller_dag.py	airflow		\N	"@once"
example_bash_operator	t	f	t	2019-06-24 05:44:46.541132+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_bash_operator.py	airflow		\N	"0 0 * * *"
example_python_operator	t	f	t	2019-06-24 05:44:46.557126+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_python_operator.py	airflow		\N	null
tutorial	t	f	t	2019-06-24 05:44:46.568967+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/tutorial.py	airflow	A simple tutorial DAG	\N	{"type": "timedelta", "attrs": {"days": 1, "seconds": 0, "microseconds": 0}}
example_xcom	t	f	t	2019-06-24 05:44:46.472023+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_xcom.py	airflow		\N	"@once"
example_branch_operator	t	f	t	2019-06-24 05:44:46.475278+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_branch_operator.py	airflow		\N	"@daily"
example_short_circuit_operator	t	f	t	2019-06-24 05:44:46.479046+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_short_circuit_operator.py	airflow		\N	{"type": "timedelta", "attrs": {"days": 1, "seconds": 0, "microseconds": 0}}
latest_only	t	f	t	2019-06-24 05:44:46.482044+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_latest_only.py	Airflow		\N	{"type": "timedelta", "attrs": {"days": 0, "seconds": 14400, "microseconds": 0}}
example_branch_dop_operator_v3	t	f	t	2019-06-24 05:44:46.486602+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_branch_python_dop_operator_3.py	airflow		\N	"*/1 * * * *"
test_utils	t	f	t	2019-06-24 05:44:46.499111+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/test_utils.py	airflow		\N	null
example_passing_params_via_test_command	t	f	t	2019-06-24 05:44:46.50564+00	\N	\N	\N	\N	/root/.cache/pypoetry/virtualenvs/annalect-airflow-py3.7/lib/python3.7/site-packages/airflow/example_dags/example_passing_params_via_test_command.py	airflow		\N	"*/1 * * * *"
\.


--
-- Data for Name: dag_pickle; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_pickle (id, pickle, created_dttm, pickle_hash) FROM stdin;
\.


--
-- Data for Name: dag_run; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_run (id, dag_id, execution_date, state, run_id, external_trigger, conf, end_date, start_date) FROM stdin;
\.


--
-- Data for Name: import_error; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.import_error (id, "timestamp", filename, stacktrace) FROM stdin;
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.job (id, dag_id, state, job_type, start_date, end_date, latest_heartbeat, executor_class, hostname, unixname) FROM stdin;
\.


--
-- Data for Name: known_event; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.known_event (id, label, start_date, end_date, user_id, known_event_type_id, description) FROM stdin;
\.


--
-- Data for Name: known_event_type; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.known_event_type (id, know_event_type) FROM stdin;
1	Holiday
2	Outage
3	Natural Disaster
4	Marketing Campaign
\.


--
-- Data for Name: kube_resource_version; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.kube_resource_version (one_row_id, resource_version) FROM stdin;
t	
\.


--
-- Data for Name: kube_worker_uuid; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.kube_worker_uuid (one_row_id, worker_uuid) FROM stdin;
t	
\.


--
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.log (id, dttm, dag_id, task_id, event, execution_date, owner, extra) FROM stdin;
\.


--
-- Data for Name: sla_miss; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.sla_miss (task_id, dag_id, execution_date, email_sent, "timestamp", description, notification_sent) FROM stdin;
\.


--
-- Data for Name: slot_pool; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.slot_pool (id, pool, slots, description) FROM stdin;
\.


--
-- Data for Name: task_fail; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_fail (id, task_id, dag_id, execution_date, start_date, end_date, duration) FROM stdin;
\.


--
-- Data for Name: task_instance; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_instance (task_id, dag_id, execution_date, start_date, end_date, duration, state, try_number, hostname, unixname, job_id, pool, queue, priority_weight, operator, queued_dttm, pid, max_tries, executor_config) FROM stdin;
\.


--
-- Data for Name: task_reschedule; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_reschedule (id, task_id, dag_id, execution_date, try_number, start_date, end_date, duration, reschedule_date) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.users (id, username, email, password, superuser) FROM stdin;
\.


--
-- Data for Name: variable; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.variable (id, key, val, is_encrypted) FROM stdin;
\.


--
-- Data for Name: xcom; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.xcom (id, key, value, "timestamp", execution_date, task_id, dag_id) FROM stdin;
\.


--
-- Name: chart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.chart_id_seq', 1, true);


--
-- Name: connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.connection_id_seq', 37, true);


--
-- Name: dag_pickle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.dag_pickle_id_seq', 1, false);


--
-- Name: dag_run_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.dag_run_id_seq', 1, false);


--
-- Name: import_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.import_error_id_seq', 1, false);


--
-- Name: job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.job_id_seq', 1, false);


--
-- Name: known_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.known_event_id_seq', 1, false);


--
-- Name: known_event_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.known_event_type_id_seq', 4, true);


--
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.log_id_seq', 1, false);


--
-- Name: slot_pool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.slot_pool_id_seq', 1, false);


--
-- Name: task_fail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.task_fail_id_seq', 1, false);


--
-- Name: task_reschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.task_reschedule_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: variable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.variable_id_seq', 1, false);


--
-- Name: xcom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.xcom_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: chart chart_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT chart_pkey PRIMARY KEY (id);


--
-- Name: connection connection_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT connection_pkey PRIMARY KEY (id);


--
-- Name: dag_pickle dag_pickle_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_pickle
    ADD CONSTRAINT dag_pickle_pkey PRIMARY KEY (id);


--
-- Name: dag dag_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag
    ADD CONSTRAINT dag_pkey PRIMARY KEY (dag_id);


--
-- Name: dag_run dag_run_dag_id_execution_date_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_dag_id_execution_date_key UNIQUE (dag_id, execution_date);


--
-- Name: dag_run dag_run_dag_id_run_id_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_dag_id_run_id_key UNIQUE (dag_id, run_id);


--
-- Name: dag_run dag_run_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_pkey PRIMARY KEY (id);


--
-- Name: import_error import_error_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.import_error
    ADD CONSTRAINT import_error_pkey PRIMARY KEY (id);


--
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- Name: known_event known_event_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.known_event
    ADD CONSTRAINT known_event_pkey PRIMARY KEY (id);


--
-- Name: known_event_type known_event_type_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.known_event_type
    ADD CONSTRAINT known_event_type_pkey PRIMARY KEY (id);


--
-- Name: kube_resource_version kube_resource_version_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.kube_resource_version
    ADD CONSTRAINT kube_resource_version_pkey PRIMARY KEY (one_row_id);


--
-- Name: kube_worker_uuid kube_worker_uuid_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.kube_worker_uuid
    ADD CONSTRAINT kube_worker_uuid_pkey PRIMARY KEY (one_row_id);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- Name: sla_miss sla_miss_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.sla_miss
    ADD CONSTRAINT sla_miss_pkey PRIMARY KEY (task_id, dag_id, execution_date);


--
-- Name: slot_pool slot_pool_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.slot_pool
    ADD CONSTRAINT slot_pool_pkey PRIMARY KEY (id);


--
-- Name: slot_pool slot_pool_pool_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.slot_pool
    ADD CONSTRAINT slot_pool_pool_key UNIQUE (pool);


--
-- Name: task_fail task_fail_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_fail
    ADD CONSTRAINT task_fail_pkey PRIMARY KEY (id);


--
-- Name: task_instance task_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance
    ADD CONSTRAINT task_instance_pkey PRIMARY KEY (task_id, dag_id, execution_date);


--
-- Name: task_reschedule task_reschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_pkey PRIMARY KEY (id);


--
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: users user_username_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: variable variable_key_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.variable
    ADD CONSTRAINT variable_key_key UNIQUE (key);


--
-- Name: variable variable_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.variable
    ADD CONSTRAINT variable_pkey PRIMARY KEY (id);


--
-- Name: xcom xcom_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.xcom
    ADD CONSTRAINT xcom_pkey PRIMARY KEY (id);


--
-- Name: dag_id_state; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX dag_id_state ON public.dag_run USING btree (dag_id, state);


--
-- Name: idx_job_state_heartbeat; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_job_state_heartbeat ON public.job USING btree (state, latest_heartbeat);


--
-- Name: idx_log_dag; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_log_dag ON public.log USING btree (dag_id);


--
-- Name: idx_task_fail_dag_task_date; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_task_fail_dag_task_date ON public.task_fail USING btree (dag_id, task_id, execution_date);


--
-- Name: idx_task_reschedule_dag_task_date; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_task_reschedule_dag_task_date ON public.task_reschedule USING btree (dag_id, task_id, execution_date);


--
-- Name: idx_xcom_dag_task_date; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_xcom_dag_task_date ON public.xcom USING btree (dag_id, task_id, execution_date);


--
-- Name: job_type_heart; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX job_type_heart ON public.job USING btree (job_type, latest_heartbeat);


--
-- Name: sm_dag; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX sm_dag ON public.sla_miss USING btree (dag_id);


--
-- Name: ti_dag_date; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_dag_date ON public.task_instance USING btree (dag_id, execution_date);


--
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_dag_state ON public.task_instance USING btree (dag_id, state);


--
-- Name: ti_job_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_job_id ON public.task_instance USING btree (job_id);


--
-- Name: ti_pool; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_pool ON public.task_instance USING btree (pool, state, priority_weight);


--
-- Name: ti_state; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_state ON public.task_instance USING btree (state);


--
-- Name: ti_state_lkp; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_state_lkp ON public.task_instance USING btree (dag_id, task_id, execution_date, state);


--
-- Name: chart chart_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT chart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: known_event known_event_known_event_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.known_event
    ADD CONSTRAINT known_event_known_event_type_id_fkey FOREIGN KEY (known_event_type_id) REFERENCES public.known_event_type(id);


--
-- Name: known_event known_event_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.known_event
    ADD CONSTRAINT known_event_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: task_reschedule task_reschedule_dag_task_date_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_dag_task_date_fkey FOREIGN KEY (task_id, dag_id, execution_date) REFERENCES public.task_instance(task_id, dag_id, execution_date) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

