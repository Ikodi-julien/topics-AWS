--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-1.pgdg20.04+1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-1.pgdg20.04+1)

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

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    author character varying(255)
);


ALTER TABLE public.categories OWNER TO quiltuuc_strapi;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: core_store; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.core_store (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.core_store OWNER TO quiltuuc_strapi;

--
-- Name: core_store_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.core_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_store_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: core_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.core_store_id_seq OWNED BY public.core_store.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    message_content jsonb,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    users_permissions_user integer,
    topic integer,
    author integer,
    author_name character varying(255)
);


ALTER TABLE public.messages OWNER TO quiltuuc_strapi;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: strapi_administrator; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.strapi_administrator (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255) NOT NULL,
    password character varying(255),
    "resetPasswordToken" character varying(255),
    "registrationToken" character varying(255),
    "isActive" boolean,
    blocked boolean
);


ALTER TABLE public.strapi_administrator OWNER TO quiltuuc_strapi;

--
-- Name: strapi_administrator_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.strapi_administrator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_administrator_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: strapi_administrator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.strapi_administrator_id_seq OWNED BY public.strapi_administrator.id;


--
-- Name: strapi_permission; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.strapi_permission (
    id integer NOT NULL,
    action character varying(255) NOT NULL,
    subject character varying(255),
    fields jsonb,
    conditions jsonb,
    role integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.strapi_permission OWNER TO quiltuuc_strapi;

--
-- Name: strapi_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.strapi_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_permission_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: strapi_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.strapi_permission_id_seq OWNED BY public.strapi_permission.id;


--
-- Name: strapi_role; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.strapi_role (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.strapi_role OWNER TO quiltuuc_strapi;

--
-- Name: strapi_role_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.strapi_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_role_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: strapi_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.strapi_role_id_seq OWNED BY public.strapi_role.id;


--
-- Name: strapi_users_roles; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.strapi_users_roles (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.strapi_users_roles OWNER TO quiltuuc_strapi;

--
-- Name: strapi_users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.strapi_users_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_users_roles_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: strapi_users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.strapi_users_roles_id_seq OWNED BY public.strapi_users_roles.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO quiltuuc_strapi;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    token character varying(255),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "user" integer
);


ALTER TABLE public.tokens OWNER TO quiltuuc_strapi;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    title character varying(255),
    topic_description jsonb,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    category integer,
    users_permissions_user integer,
    topic_content jsonb,
    author integer,
    author_name character varying(255)
);


ALTER TABLE public.topics OWNER TO quiltuuc_strapi;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: upload_file; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.upload_file (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "alternativeText" character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255) NOT NULL,
    ext character varying(255),
    mime character varying(255) NOT NULL,
    size numeric(10,2) NOT NULL,
    url character varying(255) NOT NULL,
    "previewUrl" character varying(255),
    provider character varying(255) NOT NULL,
    provider_metadata jsonb,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.upload_file OWNER TO quiltuuc_strapi;

--
-- Name: upload_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.upload_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_file_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: upload_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.upload_file_id_seq OWNED BY public.upload_file.id;


--
-- Name: upload_file_morph; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public.upload_file_morph (
    id integer NOT NULL,
    upload_file_id integer,
    related_id integer,
    related_type text,
    field text,
    "order" integer
);


ALTER TABLE public.upload_file_morph OWNER TO quiltuuc_strapi;

--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public.upload_file_morph_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_file_morph_id_seq OWNER TO quiltuuc_strapi;

--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public.upload_file_morph_id_seq OWNED BY public.upload_file_morph.id;


--
-- Name: users-permissions_permission; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public."users-permissions_permission" (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    controller character varying(255) NOT NULL,
    action character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    policy character varying(255),
    role integer,
    created_by integer,
    updated_by integer
);


ALTER TABLE public."users-permissions_permission" OWNER TO quiltuuc_strapi;

--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public."users-permissions_permission_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-permissions_permission_id_seq" OWNER TO quiltuuc_strapi;

--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public."users-permissions_permission_id_seq" OWNED BY public."users-permissions_permission".id;


--
-- Name: users-permissions_role; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public."users-permissions_role" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255),
    created_by integer,
    updated_by integer
);


ALTER TABLE public."users-permissions_role" OWNER TO quiltuuc_strapi;

--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public."users-permissions_role_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-permissions_role_id_seq" OWNER TO quiltuuc_strapi;

--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public."users-permissions_role_id_seq" OWNED BY public."users-permissions_role".id;


--
-- Name: users-permissions_user; Type: TABLE; Schema: public; Owner: ju
--

CREATE TABLE public."users-permissions_user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    provider character varying(255),
    password character varying(255),
    "resetPasswordToken" character varying(255),
    "confirmationToken" character varying(255),
    confirmed boolean,
    blocked boolean,
    role integer,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    firstname character varying(255),
    lastname character varying(255),
    token integer
);


ALTER TABLE public."users-permissions_user" OWNER TO quiltuuc_strapi;

--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ju
--

CREATE SEQUENCE public."users-permissions_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-permissions_user_id_seq" OWNER TO quiltuuc_strapi;

--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ju
--

ALTER SEQUENCE public."users-permissions_user_id_seq" OWNED BY public."users-permissions_user".id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: core_store id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.core_store ALTER COLUMN id SET DEFAULT nextval('public.core_store_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: strapi_administrator id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_administrator ALTER COLUMN id SET DEFAULT nextval('public.strapi_administrator_id_seq'::regclass);


--
-- Name: strapi_permission id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_permission ALTER COLUMN id SET DEFAULT nextval('public.strapi_permission_id_seq'::regclass);


--
-- Name: strapi_role id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_role ALTER COLUMN id SET DEFAULT nextval('public.strapi_role_id_seq'::regclass);


--
-- Name: strapi_users_roles id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_users_roles ALTER COLUMN id SET DEFAULT nextval('public.strapi_users_roles_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: upload_file id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.upload_file ALTER COLUMN id SET DEFAULT nextval('public.upload_file_id_seq'::regclass);


--
-- Name: upload_file_morph id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.upload_file_morph ALTER COLUMN id SET DEFAULT nextval('public.upload_file_morph_id_seq'::regclass);


--
-- Name: users-permissions_permission id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public."users-permissions_permission" ALTER COLUMN id SET DEFAULT nextval('public."users-permissions_permission_id_seq"'::regclass);


--
-- Name: users-permissions_role id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public."users-permissions_role" ALTER COLUMN id SET DEFAULT nextval('public."users-permissions_role_id_seq"'::regclass);


--
-- Name: users-permissions_user id; Type: DEFAULT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public."users-permissions_user" ALTER COLUMN id SET DEFAULT nextval('public."users-permissions_user_id_seq"'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.categories (id, name, published_at, created_by, updated_by, created_at, updated_at, author) FROM stdin;
1	animals	2021-03-18 16:52:32.493+01	\N	\N	2021-03-18 16:39:56.765671+01	2021-03-18 16:52:32.504+01	\N
2	arts	2021-03-18 16:52:39.146+01	\N	\N	2021-03-18 16:39:56.765671+01	2021-03-18 16:52:39.155+01	\N
3	bdsm	2021-03-18 16:52:44.762+01	\N	\N	2021-03-18 16:39:56.765671+01	2021-03-18 16:52:44.771+01	\N
4	cinema	2021-03-18 16:52:54.522+01	\N	\N	2021-03-18 16:39:56.765671+01	2021-03-18 16:52:54.53+01	\N
5	sports	2021-03-18 16:52:59.644+01	\N	\N	2021-03-18 16:39:56.765671+01	2021-03-18 16:52:59.656+01	\N
6	technology	2021-03-18 16:53:04.353+01	\N	\N	2021-03-18 16:39:56.765671+01	2021-03-18 16:53:04.36+01	\N
7	videogames	2021-03-18 16:53:09.623+01	\N	\N	2021-03-18 16:39:56.765671+01	2021-03-18 16:53:09.633+01	\N
\.


--
-- Data for Name: core_store; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.core_store (id, key, value, type, environment, tag) FROM stdin;
10	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true}	object	development	
1	model_def_strapi::core-store	{"uid":"strapi::core-store","collectionName":"core_store","info":{"name":"core_store","description":""},"options":{"timestamps":false},"attributes":{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}}	object	\N	\N
2	model_def_strapi::webhooks	{"uid":"strapi::webhooks","collectionName":"strapi_webhooks","info":{"name":"Strapi webhooks","description":""},"options":{"timestamps":false},"attributes":{"name":{"type":"string"},"url":{"type":"text"},"headers":{"type":"json"},"events":{"type":"json"},"enabled":{"type":"boolean"}}}	object	\N	\N
8	model_def_plugins::users-permissions.role	{"uid":"plugins::users-permissions.role","collectionName":"users-permissions_role","kind":"collectionType","info":{"name":"role","description":""},"options":{"timestamps":false},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true}}}	object	\N	\N
9	model_def_plugins::users-permissions.user	{"uid":"plugins::users-permissions.user","collectionName":"users-permissions_user","kind":"collectionType","info":{"name":"user","description":""},"options":{"draftAndPublish":false,"timestamps":["created_at","updated_at"]},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false},"firstname":{"type":"string"},"lastname":{"type":"string"},"topics":{"via":"author","collection":"topic","isVirtual":true},"messages":{"via":"author","collection":"message","isVirtual":true},"token":{"model":"token","via":"user"},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true}}}	object	\N	\N
4	model_def_strapi::role	{"uid":"strapi::role","collectionName":"strapi_role","kind":"collectionType","info":{"name":"Role","description":""},"options":{"timestamps":["created_at","updated_at"]},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"collection":"user","via":"roles","plugin":"admin","attribute":"user","column":"id","isVirtual":true},"permissions":{"configurable":false,"plugin":"admin","collection":"permission","via":"role","isVirtual":true}}}	object	\N	\N
6	model_def_plugins::upload.file	{"uid":"plugins::upload.file","collectionName":"upload_file","kind":"collectionType","info":{"name":"file","description":""},"options":{"timestamps":["created_at","updated_at"]},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true}}}	object	\N	\N
11	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"/auth/auth0/callback","scope":["openid","email","profile"]}}	object		
12	plugin_content_manager_configuration_content_types::strapi::role	{"uid":"strapi::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"Users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"editRelations":["users","permissions"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6}]]}}	object		
13	plugin_content_manager_configuration_content_types::strapi::user	{"uid":"strapi::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"Firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"Lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"RegistrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"RegistrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"IsActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"IsActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"Roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"editRelations":["roles"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4}]]}}	object		
14	plugin_content_manager_configuration_content_types::plugins::users-permissions.permission	{"uid":"plugins::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type","defaultSortBy":"type","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"controller":{"edit":{"label":"Controller","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Controller","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"enabled":{"edit":{"label":"Enabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Enabled","searchable":true,"sortable":true}},"policy":{"edit":{"label":"Policy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Policy","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","controller","action"],"editRelations":["role"],"edit":[[{"name":"type","size":6},{"name":"controller","size":6}],[{"name":"action","size":6},{"name":"enabled","size":4}],[{"name":"policy","size":6}]]}}	object		
15	plugin_content_manager_configuration_content_types::plugins::upload.file	{"uid":"plugins::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"AlternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AlternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"Caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"Width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Width","searchable":true,"sortable":true}},"height":{"edit":{"label":"Height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"Formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"Hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"Ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"Mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"Size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Size","searchable":true,"sortable":true}},"url":{"edit":{"label":"Url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"PreviewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreviewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"Provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider_metadata","searchable":false,"sortable":false}},"related":{"edit":{"label":"Related","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Related","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":["related"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}	object		
19	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object		
20	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object		
16	plugin_content_manager_configuration_content_types::strapi::permission	{"uid":"strapi::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"Subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Subject","searchable":true,"sortable":true}},"fields":{"edit":{"label":"Fields","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Fields","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"Conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"editRelations":["role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"fields","size":12}],[{"name":"conditions","size":12}]]}}	object		
18	plugin_content_manager_configuration_content_types::plugins::users-permissions.role	{"uid":"plugins::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Users","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}	object		
21	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null}}	object		
17	plugin_content_manager_configuration_content_types::plugins::users-permissions.user	{"uid":"plugins::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"lastname":{"edit":{"label":"Lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Lastname","searchable":true,"sortable":true}},"topics":{"edit":{"label":"Topics","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"Topics","searchable":false,"sortable":false}},"confirmationToken":{"edit":{"label":"ConfirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ConfirmationToken","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"messages":{"edit":{"label":"Messages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"Messages","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}},"token":{"edit":{"label":"Token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"token"},"list":{"label":"Token","searchable":true,"sortable":true}},"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"Firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Firstname","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"Confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Confirmed","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"firstname","size":6}],[{"name":"lastname","size":6}]],"editRelations":["role","messages","topics","token"],"list":["id","username","email","confirmed","token"]}}	object		
3	model_def_strapi::permission	{"uid":"strapi::permission","collectionName":"strapi_permission","kind":"collectionType","info":{"name":"Permission","description":""},"options":{"timestamps":["created_at","updated_at"]},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"fields":{"type":"json","configurable":false,"required":false,"default":[]},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"model":"role","plugin":"admin"}}}	object	\N	\N
26	model_def_application::topic.topic	{"uid":"application::topic.topic","collectionName":"topics","kind":"collectionType","info":{"name":"topic","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"attributes":{"title":{"type":"string"},"topic_description":{"type":"json"},"messages":{"via":"topic","collection":"message","isVirtual":true},"category":{"model":"category","via":"topics"},"author":{"plugin":"users-permissions","model":"user","via":"topics"},"topic_content":{"type":"json"},"author_name":{"type":"string"},"published_at":{"type":"datetime","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true}}}	object	\N	\N
22	model_def_application::category.category	{"uid":"application::category.category","collectionName":"categories","kind":"collectionType","info":{"name":"category","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"attributes":{"name":{"type":"string"},"topics":{"via":"category","collection":"topic","isVirtual":true},"published_at":{"type":"datetime","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true}}}	object	\N	\N
27	plugin_content_manager_configuration_content_types::application::topic.topic	{"uid":"application::topic.topic","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"published_at":{"edit":{"label":"Published_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Published_at","searchable":true,"sortable":true}},"topic_content":{"edit":{"label":"Topic_content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Topic_content","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"author":{"edit":{"label":"Author","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Author","searchable":true,"sortable":true}},"topic_description":{"edit":{"label":"Topic_description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Topic_description","searchable":false,"sortable":false}},"messages":{"edit":{"label":"Messages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"Messages","searchable":false,"sortable":false}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"category":{"edit":{"label":"Category","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Category","searchable":true,"sortable":true}},"author_name":{"edit":{"label":"Author_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Author_name","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6}],[{"name":"topic_description","size":12}],[{"name":"topic_content","size":12}],[{"name":"author_name","size":6}]],"editRelations":["messages","category","author"],"list":["id","title","created_at","messages","author_name"]}}	object		
24	model_def_application::message.message	{"uid":"application::message.message","collectionName":"messages","kind":"collectionType","info":{"name":"message","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"attributes":{"message_content":{"type":"json"},"author":{"plugin":"users-permissions","model":"user","via":"messages"},"topic":{"model":"topic","via":"messages"},"author_name":{"type":"string"},"published_at":{"type":"datetime","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true}}}	object	\N	\N
23	plugin_content_manager_configuration_content_types::application::category.category	{"uid":"application::category.category","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"topics":{"edit":{"label":"Topics","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"Topics","searchable":false,"sortable":false}},"published_at":{"edit":{"label":"Published_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Published_at","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","published_at","created_at"],"edit":[[{"name":"name","size":6}]],"editRelations":["topics"]}}	object		
7	model_def_plugins::users-permissions.permission	{"uid":"plugins::users-permissions.permission","collectionName":"users-permissions_permission","kind":"collectionType","info":{"name":"permission","description":""},"options":{"timestamps":false},"attributes":{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true}}}	object	\N	\N
29	plugin_content_manager_configuration_content_types::application::token.token	{"uid":"application::token.token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"token","defaultSortBy":"token","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"token":{"edit":{"label":"Token","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Token","searchable":true,"sortable":true}},"user":{"edit":{"label":"User","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"User","searchable":true,"sortable":true}},"published_at":{"edit":{"label":"Published_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Published_at","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","token","published_at","created_at"],"edit":[[{"name":"token","size":6}]],"editRelations":["user"]}}	object		
28	model_def_application::token.token	{"uid":"application::token.token","collectionName":"tokens","kind":"collectionType","info":{"name":"token"},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"attributes":{"token":{"type":"string"},"user":{"via":"token","plugin":"users-permissions","model":"user"},"published_at":{"type":"datetime","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"private":true}}}	object	\N	\N
30	plugin_documentation_config	{"restrictedAccess":false}	object		
5	model_def_strapi::user	{"uid":"strapi::user","collectionName":"strapi_administrator","kind":"collectionType","info":{"name":"User","description":""},"options":{"timestamps":false},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"collection":"role","collectionName":"strapi_users_roles","via":"users","dominant":true,"plugin":"admin","configurable":false,"private":true,"attribute":"role","column":"id","isVirtual":true},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true}}}	object	\N	\N
25	plugin_content_manager_configuration_content_types::application::message.message	{"uid":"application::message.message","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"message_content":{"edit":{"label":"Message_content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Message_content","searchable":false,"sortable":false}},"author":{"edit":{"label":"Author","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Author","searchable":true,"sortable":true}},"topic":{"edit":{"label":"Topic","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"Topic","searchable":true,"sortable":true}},"author_name":{"edit":{"label":"Author_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Author_name","searchable":true,"sortable":true}},"published_at":{"edit":{"label":"Published_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Published_at","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"message_content","size":12}],[{"name":"author_name","size":6}]],"editRelations":["topic","author"],"list":["id","created_at","updated_at","topic","author_name"]}}	object		
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.messages (id, message_content, published_at, created_by, updated_by, created_at, updated_at, users_permissions_user, topic, author, author_name) FROM stdin;
58	{"ops": [{"insert": "Claw your carpet in places everyone can see - why hide my amazing artistic clawing skills? cats go for world domination, scratch the box love me! yet nya nya nyan yet kitty run to human with blood on mouth from frenzied attack on poor innocent mouse, don''t i look cute?'", "attributes": {"color": "#0066cc"}}, {"insert": "\\n\\n"}]}	2021-03-30 18:59:35.27+02	\N	\N	2021-03-30 18:59:35.272+02	2021-03-30 18:59:35.277+02	\N	60	43	leon-leon
59	{"ops": [{"insert": "Ouais mais nous on change de coin, et quand ils arrivent là, ils sont pinés, il y a personne. Vous en avez encore beaucoup du sensationnel comme ça?\\n\\n"}]}	2021-03-30 19:01:54.717+02	\N	\N	2021-03-30 19:01:54.72+02	2021-03-30 19:01:54.723+02	\N	63	43	leon-leon
60	{"ops": [{"insert": "Sweet beast. Paw at beetle and eat it before it gets away.\\n\\n"}]}	2021-03-30 19:04:15.6+02	\N	\N	2021-03-30 19:04:15.602+02	2021-03-30 19:04:15.605+02	\N	60	44	alex
61	{"ops": [{"insert": "Pepper jack cheese triangles cheesy feet chalk and cheese swiss cheese and wine everyone loves camembert de normandie.\\n\\n"}]}	2021-03-30 19:04:50.172+02	\N	\N	2021-03-30 19:04:50.173+02	2021-03-30 19:04:50.176+02	\N	65	44	alex
62	{"ops": [{"insert": "Oh mais j'm’en fais pas. J'vais m’entrainer jusqu'à c'que ça marche! S’il vous plait! Faites pas votre mijoré! Moi je me fais traiter de gonzesse j'en fais pas tout un cake!\\n\\n"}]}	2021-03-30 19:07:41.437+02	\N	\N	2021-03-30 19:07:41.44+02	2021-03-30 19:07:55.398+02	\N	63	44	alex
\.


--
-- Data for Name: strapi_administrator; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.strapi_administrator (id, firstname, lastname, username, email, password, "resetPasswordToken", "registrationToken", "isActive", blocked) FROM stdin;
1	julien	Pellin	\N	jupellin39@gmail.com	$2a$10$sZ.CQfK3txzqI8g3/D81F.Rls1Kx9RFv2o6N8MHUdVpcVN/Efm9he	\N	\N	t	\N
\.


--
-- Data for Name: strapi_permission; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.strapi_permission (id, action, subject, fields, conditions, role, created_at, updated_at) FROM stdin;
1	plugins::upload.read	\N	\N	[]	2	2021-03-18 16:24:26.282+01	2021-03-18 16:24:26.292+01
3	plugins::upload.assets.update	\N	\N	[]	2	2021-03-18 16:24:26.283+01	2021-03-18 16:24:26.292+01
9	plugins::upload.assets.copy-link	\N	\N	[]	3	2021-03-18 16:24:26.308+01	2021-03-18 16:24:26.314+01
10	plugins::upload.assets.download	\N	\N	[]	3	2021-03-18 16:24:26.308+01	2021-03-18 16:24:26.315+01
113	plugins::documentation.read	\N	\N	[]	1	2021-03-20 18:35:51.236+01	2021-03-20 18:35:51.242+01
14	plugins::content-manager.explorer.delete	plugins::users-permissions.user	\N	[]	1	2021-03-18 16:24:26.345+01	2021-03-18 16:24:26.36+01
23	plugins::content-manager.single-types.configure-view	\N	\N	[]	1	2021-03-18 16:24:26.385+01	2021-03-18 16:24:26.397+01
24	plugins::content-manager.collection-types.configure-view	\N	\N	[]	1	2021-03-18 16:24:26.385+01	2021-03-18 16:24:26.402+01
34	plugins::users-permissions.advanced-settings.read	\N	\N	[]	1	2021-03-18 16:24:26.426+01	2021-03-18 16:24:26.441+01
37	admin::marketplace.plugins.install	\N	\N	[]	1	2021-03-18 16:24:26.43+01	2021-03-18 16:24:26.445+01
46	admin::users.delete	\N	\N	[]	1	2021-03-18 16:24:26.467+01	2021-03-18 16:24:26.481+01
49	admin::roles.update	\N	\N	[]	1	2021-03-18 16:24:26.471+01	2021-03-18 16:24:26.487+01
116	plugins::content-manager.explorer.create	application::topic.topic	["title", "topic_description", "messages", "category", "author", "topic_content", "author_name"]	[]	1	2021-03-28 14:40:04.457+02	2021-03-28 14:40:04.467+02
112	plugins::content-manager.explorer.update	plugins::users-permissions.user	["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "firstname", "lastname", "topics", "messages", "token"]	[]	1	2021-03-20 18:13:13.452+01	2021-03-20 18:13:13.466+01
4	plugins::upload.assets.download	\N	\N	[]	2	2021-03-18 16:24:26.285+01	2021-03-18 16:24:26.294+01
7	plugins::upload.assets.create	\N	\N	[]	3	2021-03-18 16:24:26.306+01	2021-03-18 16:24:26.315+01
114	plugins::documentation.settings.update	\N	\N	[]	1	2021-03-20 18:35:51.236+01	2021-03-20 18:35:51.242+01
22	plugins::upload.settings.read	\N	\N	[]	1	2021-03-18 16:24:26.385+01	2021-03-18 16:24:26.397+01
33	plugins::users-permissions.email-templates.update	\N	\N	[]	1	2021-03-18 16:24:26.426+01	2021-03-18 16:24:26.441+01
47	admin::roles.create	\N	\N	[]	1	2021-03-18 16:24:26.468+01	2021-03-18 16:24:26.482+01
117	plugins::content-manager.explorer.read	application::topic.topic	["title", "topic_description", "messages", "category", "author", "topic_content", "author_name"]	[]	1	2021-03-28 14:40:04.458+02	2021-03-28 14:40:04.467+02
5	plugins::upload.assets.copy-link	\N	\N	[]	2	2021-03-18 16:24:26.285+01	2021-03-18 16:24:26.295+01
8	plugins::upload.read	\N	\N	["admin::is-creator"]	3	2021-03-18 16:24:26.306+01	2021-03-18 16:24:26.317+01
115	plugins::documentation.settings.regenerate	\N	\N	[]	1	2021-03-20 18:35:51.237+01	2021-03-20 18:35:51.243+01
21	plugins::upload.assets.copy-link	\N	\N	[]	1	2021-03-18 16:24:26.383+01	2021-03-18 16:24:26.398+01
31	plugins::users-permissions.providers.update	\N	\N	[]	1	2021-03-18 16:24:26.425+01	2021-03-18 16:24:26.438+01
41	admin::webhooks.update	\N	\N	[]	1	2021-03-18 16:24:26.464+01	2021-03-18 16:24:26.478+01
118	plugins::content-manager.explorer.update	application::topic.topic	["title", "topic_description", "messages", "category", "author", "topic_content", "author_name"]	[]	1	2021-03-28 14:40:04.46+02	2021-03-28 14:40:04.469+02
16	plugins::email.settings.read	\N	\N	[]	1	2021-03-18 16:24:26.345+01	2021-03-18 16:24:26.36+01
28	plugins::users-permissions.roles.update	\N	\N	[]	1	2021-03-18 16:24:26.39+01	2021-03-18 16:24:26.406+01
38	admin::marketplace.plugins.uninstall	\N	\N	[]	1	2021-03-18 16:24:26.43+01	2021-03-18 16:24:26.445+01
45	admin::users.update	\N	\N	[]	1	2021-03-18 16:24:26.467+01	2021-03-18 16:24:26.481+01
67	plugins::content-manager.explorer.delete	application::topic.topic	\N	[]	1	2021-03-18 16:29:30.9+01	2021-03-18 16:29:30.911+01
119	plugins::content-manager.explorer.create	application::message.message	["message_content", "author", "topic", "author_name"]	[]	1	2021-03-28 14:40:38.992+02	2021-03-28 14:40:38.999+02
93	plugins::content-manager.explorer.create	application::category.category	["name", "topics"]	[]	1	2021-03-20 08:31:12.113+01	2021-03-20 08:32:19.314+01
17	plugins::upload.read	\N	\N	[]	1	2021-03-18 16:24:26.346+01	2021-03-18 16:24:26.36+01
26	plugins::users-permissions.roles.create	\N	\N	[]	1	2021-03-18 16:24:26.387+01	2021-03-18 16:24:26.402+01
32	plugins::users-permissions.email-templates.read	\N	\N	[]	1	2021-03-18 16:24:26.426+01	2021-03-18 16:24:26.438+01
42	admin::webhooks.delete	\N	\N	[]	1	2021-03-18 16:24:26.464+01	2021-03-18 16:24:26.478+01
68	plugins::content-manager.explorer.publish	application::topic.topic	\N	[]	1	2021-03-18 16:29:30.901+01	2021-03-18 16:29:30.911+01
120	plugins::content-manager.explorer.read	application::message.message	["message_content", "author", "topic", "author_name"]	[]	1	2021-03-28 14:40:38.993+02	2021-03-28 14:40:38.999+02
94	plugins::content-manager.explorer.read	application::category.category	["name", "topics"]	[]	1	2021-03-20 08:31:12.114+01	2021-03-20 08:32:19.316+01
18	plugins::upload.assets.create	\N	\N	[]	1	2021-03-18 16:24:26.346+01	2021-03-18 16:24:26.364+01
29	plugins::users-permissions.roles.delete	\N	\N	[]	1	2021-03-18 16:24:26.39+01	2021-03-18 16:24:26.406+01
36	admin::marketplace.read	\N	\N	[]	1	2021-03-18 16:24:26.43+01	2021-03-18 16:24:26.445+01
44	admin::users.read	\N	\N	[]	1	2021-03-18 16:24:26.467+01	2021-03-18 16:24:26.481+01
121	plugins::content-manager.explorer.update	application::message.message	["message_content", "author", "topic", "author_name"]	[]	1	2021-03-28 14:40:38.994+02	2021-03-28 14:40:39+02
95	plugins::content-manager.explorer.update	application::category.category	["name", "topics"]	[]	1	2021-03-20 08:31:12.114+01	2021-03-20 08:32:19.316+01
19	plugins::upload.assets.update	\N	\N	[]	1	2021-03-18 16:24:26.346+01	2021-03-18 16:24:26.364+01
30	plugins::users-permissions.providers.read	\N	\N	[]	1	2021-03-18 16:24:26.39+01	2021-03-18 16:24:26.406+01
39	admin::webhooks.create	\N	\N	[]	1	2021-03-18 16:24:26.431+01	2021-03-18 16:24:26.445+01
48	admin::roles.read	\N	\N	[]	1	2021-03-18 16:24:26.468+01	2021-03-18 16:24:26.482+01
20	plugins::upload.assets.download	\N	\N	[]	1	2021-03-18 16:24:26.349+01	2021-03-18 16:24:26.364+01
27	plugins::users-permissions.roles.read	\N	\N	[]	1	2021-03-18 16:24:26.39+01	2021-03-18 16:24:26.406+01
35	plugins::users-permissions.advanced-settings.update	\N	\N	[]	1	2021-03-18 16:24:26.43+01	2021-03-18 16:24:26.445+01
43	admin::users.create	\N	\N	[]	1	2021-03-18 16:24:26.467+01	2021-03-18 16:24:26.481+01
53	plugins::content-manager.explorer.delete	application::category.category	\N	[]	1	2021-03-18 16:27:02.83+01	2021-03-18 16:27:02.839+01
55	plugins::content-manager.explorer.publish	application::category.category	\N	[]	1	2021-03-18 16:27:02.832+01	2021-03-18 16:27:02.843+01
105	plugins::content-manager.explorer.delete	application::token.token	\N	[]	1	2021-03-20 18:05:24.11+01	2021-03-20 18:05:24.121+01
106	plugins::content-manager.explorer.publish	application::token.token	\N	[]	1	2021-03-20 18:05:24.112+01	2021-03-20 18:05:24.119+01
107	plugins::content-manager.explorer.read	application::token.token	["token", "user"]	[]	1	2021-03-20 18:13:13.45+01	2021-03-20 18:13:13.463+01
108	plugins::content-manager.explorer.create	plugins::users-permissions.user	["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "firstname", "lastname", "topics", "messages", "token"]	[]	1	2021-03-20 18:13:13.451+01	2021-03-20 18:13:13.463+01
62	plugins::content-manager.explorer.delete	application::message.message	\N	[]	1	2021-03-18 16:28:28.677+01	2021-03-18 16:28:28.689+01
109	plugins::content-manager.explorer.create	application::token.token	["token", "user"]	[]	1	2021-03-20 18:13:13.451+01	2021-03-20 18:13:13.463+01
63	plugins::content-manager.explorer.publish	application::message.message	\N	[]	1	2021-03-18 16:28:28.677+01	2021-03-18 16:28:28.692+01
110	plugins::content-manager.explorer.read	plugins::users-permissions.user	["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "firstname", "lastname", "topics", "messages", "token"]	[]	1	2021-03-20 18:13:13.451+01	2021-03-20 18:13:13.463+01
2	plugins::upload.assets.create	\N	\N	[]	2	2021-03-18 16:24:26.283+01	2021-03-18 16:24:26.292+01
6	plugins::upload.assets.update	\N	\N	["admin::is-creator"]	3	2021-03-18 16:24:26.306+01	2021-03-18 16:24:26.313+01
15	plugins::content-type-builder.read	\N	\N	[]	1	2021-03-18 16:24:26.345+01	2021-03-18 16:24:26.36+01
25	plugins::content-manager.components.configure-layout	\N	\N	[]	1	2021-03-18 16:24:26.385+01	2021-03-18 16:24:26.402+01
40	admin::webhooks.read	\N	\N	[]	1	2021-03-18 16:24:26.431+01	2021-03-18 16:24:26.449+01
50	admin::roles.delete	\N	\N	[]	1	2021-03-18 16:24:26.475+01	2021-03-18 16:24:26.493+01
111	plugins::content-manager.explorer.update	application::token.token	["token", "user"]	[]	1	2021-03-20 18:13:13.451+01	2021-03-20 18:13:13.463+01
\.


--
-- Data for Name: strapi_role; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.strapi_role (id, name, code, description, created_at, updated_at) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2021-03-18 16:24:26.244+01	2021-03-18 16:24:26.244+01
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2021-03-18 16:24:26.26+01	2021-03-18 16:24:26.26+01
3	Author	strapi-author	Authors can manage the content they have created.	2021-03-18 16:24:26.271+01	2021-03-18 16:24:26.271+01
\.


--
-- Data for Name: strapi_users_roles; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.strapi_users_roles (id, user_id, role_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.tokens (id, token, published_at, created_by, updated_by, created_at, updated_at, "user") FROM stdin;
4	bob@bob.frtopicsQ	2021-03-23 14:41:13.052+01	\N	\N	2021-03-23 14:41:13.059+01	2021-03-23 14:41:13.066+01	39
5	jupellin39@gmail.comtopicsQ	2021-03-23 15:09:30.903+01	\N	\N	2021-03-23 15:09:30.906+01	2021-03-23 16:04:53.477+01	\N
6	jupellin39@gmail.comtopicsQ	2021-03-23 16:07:12.436+01	\N	\N	2021-03-23 16:07:12.439+01	2021-03-23 16:07:12.446+01	41
8	gg@gg.frtopicsQ	2021-03-28 14:14:00.764+02	\N	\N	2021-03-28 14:14:00.769+02	2021-03-28 14:14:00.775+02	44
7	jupellin39@gmail.comtopicsQ	2021-03-23 17:21:21.059+01	\N	\N	2021-03-23 17:21:21.061+01	2021-03-28 15:28:18.146+02	\N
9	jupellin39@gmail.comtopicsQ	2021-03-28 15:42:10.768+02	\N	\N	2021-03-28 15:42:10.771+02	2021-03-28 15:42:10.778+02	45
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.topics (id, title, topic_description, published_at, created_by, updated_by, created_at, updated_at, category, users_permissions_user, topic_content, author, author_name) FROM stdin;
65	I love cheese, especially fromage goat.	\N	2021-03-30 19:01:01.261+02	\N	\N	2021-03-30 19:01:01.263+02	2021-03-30 19:01:01.27+02	2	\N	{"ops": [{"insert": "Cheddar lancashire manchego croque monsieur feta bavarian bergkase cauliflower cheese goat. Cow parmesan airedale stilton squirty cheese paneer taleggio queso. 🧀 \\nWho moved my cheese cheese slices who moved my cheese roquefort st. agur blue cheese everyone loves queso cauliflower cheese.\\n\\n"}]}	43	leon-leon
66	Y a des gens qui ont pris la peine de faire un dessert.	\N	2021-03-30 19:06:41.783+02	\N	\N	2021-03-30 19:06:41.786+02	2021-03-30 19:06:41.791+02	4	\N	{"ops": [{"insert": "La moindre des choses c’est de rester pour le manger. \\nJ’ai envie d’faire des tartes, voilà! Vous n’allez pas m’obliger à m’justifier!\\nMais oui mon p’tit père il faudra bien vous y coller! À moins que vous préfériez vous taper les tartes! \\nOh ben ça va on plaisante! C’est une tarte aux myrtilles 🍰 . Pourquoi elle vous revient pas?\\n\\n"}]}	44	alex
60	One of these days i''m going to get that red dot, just you wait and see	\N	2021-03-30 18:53:17.294+02	\N	\N	2021-03-30 18:53:17.305+02	2021-03-30 18:53:17.316+02	1	\N	{"ops": [{"insert": "Cat ipsum dolor sit amet, ", "attributes": {"color": "#88846f"}}, {"insert": "\\n"}, {"insert": "throw down all the stuff in the kitchen and cat sit like bread hell is other people. Swat at dog hiding behind the couch until lured out by a feathery toy who''s the baby, for walk on car leaving trail of paw prints on hood and windshield bite nose of your human, 🐱 yet sleep all day whilst slave is at work, play all night whilst slave is sleeping.😎 ", "attributes": {"color": "#88846f"}}, {"insert": "\\n\\n"}]}	45	arno
61	Esse chillwave fashion axe messenger bag echo park.	\N	2021-03-30 18:54:31.873+02	\N	\N	2021-03-30 18:54:31.877+02	2021-03-30 18:54:31.882+02	2	\N	{"ops": [{"insert": "Culpa disrupt plaid pariatur nostrud. Kitsch mlkshk laborum, helvetica food truck pinterest activated charcoal direct trade fixie artisan polaroid veniam craft beer lomo gentrify. \\n\\nQui keytar hashtag pickled flexitarian listicle small batch.\\n\\n"}]}	45	arno
62	Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro.	\N	2021-03-30 18:55:26.963+02	\N	\N	2021-03-30 18:55:26.967+02	2021-03-30 18:55:26.973+02	3	\N	{"ops": [{"insert": "De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia?", "attributes": {"color": "#e60000", "background": "#000000"}}, {"insert": "\\n\\n"}]}	45	arno
63	Sinon on fait un tunnel jusqu'à notre campement.	\N	2021-03-30 18:56:42.022+02	\N	\N	2021-03-30 18:56:42.027+02	2021-03-30 18:56:42.032+02	4	\N	{"ops": [{"insert": "Léodagan et moi on creuse, pendant vous balancez de la caillasse dans l''autre sens pour les éloigner du chantier. A genoux, pas à genoux c’est une chose... Enfin en attendant je vous donne pas tout notre or.\\n\\nFaut faire comme avec les scorpions qui se suicident quand ils sont entourés par le feu. \\n\\nAh ben un peu oui, surtout que s''ils ont vu d''où venait la pierre ils sont en train de radiner droit sur nous!\\n\\n"}]}	45	arno
64	Cow beef ribs ham tri-tip.	\N	2021-03-30 18:58:55.513+02	\N	\N	2021-03-30 18:58:55.516+02	2021-03-30 18:58:55.52+02	1	\N	{"ops": [{"insert": "Bacon ball tip short loin corned beef. Cupim ham pork loin chuck fatback rump kevin pig picanha short loin meatloaf flank t-bone ribeye pork chop. \\nPork spare ribs salami cow tenderloin meatball. Bacon beef pork chop rump, tail t-bone ground round spare ribs.\\n🐷 \\n"}]}	43	leon-leon
\.


--
-- Data for Name: upload_file; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.upload_file (id, name, "alternativeText", caption, width, height, formats, hash, ext, mime, size, url, "previewUrl", provider, provider_metadata, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: upload_file_morph; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public.upload_file_morph (id, upload_file_id, related_id, related_type, field, "order") FROM stdin;
\.


--
-- Data for Name: users-permissions_permission; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public."users-permissions_permission" (id, type, controller, action, enabled, policy, role, created_by, updated_by) FROM stdin;
1	content-manager	collection-types	bulkdelete	f		1	\N	\N
2	content-manager	collection-types	bulkdelete	f		2	\N	\N
3	content-manager	collection-types	create	f		2	\N	\N
4	content-manager	collection-types	create	f		1	\N	\N
5	content-manager	collection-types	delete	f		1	\N	\N
6	content-manager	collection-types	delete	f		2	\N	\N
7	content-manager	collection-types	find	f		1	\N	\N
8	content-manager	collection-types	find	f		2	\N	\N
9	content-manager	collection-types	findone	f		1	\N	\N
10	content-manager	collection-types	findone	f		2	\N	\N
11	content-manager	collection-types	previewmanyrelations	f		1	\N	\N
12	content-manager	collection-types	previewmanyrelations	f		2	\N	\N
13	content-manager	collection-types	publish	f		1	\N	\N
14	content-manager	collection-types	publish	f		2	\N	\N
15	content-manager	collection-types	unpublish	f		1	\N	\N
16	content-manager	collection-types	unpublish	f		2	\N	\N
17	content-manager	collection-types	update	f		1	\N	\N
18	content-manager	collection-types	update	f		2	\N	\N
19	content-manager	components	findcomponentconfiguration	f		1	\N	\N
20	content-manager	components	findcomponentconfiguration	f		2	\N	\N
21	content-manager	components	findcomponents	f		1	\N	\N
22	content-manager	components	findcomponents	f		2	\N	\N
23	content-manager	components	updatecomponentconfiguration	f		1	\N	\N
24	content-manager	components	updatecomponentconfiguration	f		2	\N	\N
25	content-manager	content-types	findcontenttypeconfiguration	f		1	\N	\N
26	content-manager	content-types	findcontenttypeconfiguration	f		2	\N	\N
28	content-manager	content-types	findcontenttypes	f		2	\N	\N
27	content-manager	content-types	findcontenttypes	f		1	\N	\N
29	content-manager	content-types	updatecontenttypeconfiguration	f		1	\N	\N
30	content-manager	content-types	updatecontenttypeconfiguration	f		2	\N	\N
31	content-manager	relations	find	f		1	\N	\N
32	content-manager	relations	find	f		2	\N	\N
33	content-manager	single-types	createorupdate	f		1	\N	\N
34	content-manager	single-types	createorupdate	f		2	\N	\N
36	content-manager	single-types	delete	f		2	\N	\N
35	content-manager	single-types	delete	f		1	\N	\N
37	content-manager	single-types	find	f		1	\N	\N
38	content-manager	single-types	find	f		2	\N	\N
39	content-manager	single-types	publish	f		1	\N	\N
40	content-manager	single-types	publish	f		2	\N	\N
41	content-manager	single-types	unpublish	f		1	\N	\N
42	content-manager	single-types	unpublish	f		2	\N	\N
44	content-manager	uid	checkuidavailability	f		2	\N	\N
45	content-manager	uid	generateuid	f		1	\N	\N
46	content-manager	uid	generateuid	f		2	\N	\N
43	content-manager	uid	checkuidavailability	f		1	\N	\N
47	content-type-builder	builder	getreservednames	f		1	\N	\N
48	content-type-builder	builder	getreservednames	f		2	\N	\N
49	content-type-builder	componentcategories	deletecategory	f		1	\N	\N
50	content-type-builder	componentcategories	deletecategory	f		2	\N	\N
52	content-type-builder	componentcategories	editcategory	f		2	\N	\N
53	content-type-builder	components	createcomponent	f		1	\N	\N
54	content-type-builder	components	createcomponent	f		2	\N	\N
51	content-type-builder	componentcategories	editcategory	f		1	\N	\N
56	content-type-builder	components	deletecomponent	f		2	\N	\N
57	content-type-builder	components	getcomponent	f		1	\N	\N
55	content-type-builder	components	deletecomponent	f		1	\N	\N
58	content-type-builder	components	getcomponent	f		2	\N	\N
59	content-type-builder	components	getcomponents	f		1	\N	\N
60	content-type-builder	components	getcomponents	f		2	\N	\N
61	content-type-builder	components	updatecomponent	f		1	\N	\N
63	content-type-builder	connections	getconnections	f		1	\N	\N
64	content-type-builder	connections	getconnections	f		2	\N	\N
65	content-type-builder	contenttypes	createcontenttype	f		1	\N	\N
66	content-type-builder	contenttypes	createcontenttype	f		2	\N	\N
67	content-type-builder	contenttypes	deletecontenttype	f		1	\N	\N
62	content-type-builder	components	updatecomponent	f		2	\N	\N
68	content-type-builder	contenttypes	deletecontenttype	f		2	\N	\N
69	content-type-builder	contenttypes	getcontenttype	f		1	\N	\N
70	content-type-builder	contenttypes	getcontenttype	f		2	\N	\N
71	content-type-builder	contenttypes	getcontenttypes	f		1	\N	\N
72	content-type-builder	contenttypes	getcontenttypes	f		2	\N	\N
73	content-type-builder	contenttypes	updatecontenttype	f		1	\N	\N
80	email	email	test	f		2	\N	\N
81	upload	upload	count	f		1	\N	\N
82	upload	upload	count	f		2	\N	\N
85	upload	upload	find	f		1	\N	\N
90	upload	upload	getsettings	f		2	\N	\N
91	upload	upload	search	f		1	\N	\N
92	upload	upload	search	f		2	\N	\N
97	users-permissions	auth	callback	f		1	\N	\N
101	users-permissions	auth	emailconfirmation	f		1	\N	\N
111	users-permissions	user	count	f		1	\N	\N
486	application	token	count	f		1	\N	\N
74	content-type-builder	contenttypes	updatecontenttype	f		2	\N	\N
84	upload	upload	destroy	f		2	\N	\N
93	upload	upload	updatesettings	f		1	\N	\N
102	users-permissions	auth	emailconfirmation	t		2	\N	\N
116	users-permissions	user	destroy	f		2	\N	\N
124	users-permissions	user	me	t		2	\N	\N
132	users-permissions	userspermissions	getadvancedsettings	f		2	\N	\N
143	users-permissions	userspermissions	getroles	f		1	\N	\N
152	users-permissions	userspermissions	updateadvancedsettings	f		2	\N	\N
160	application	category	create	f		2	\N	\N
487	application	token	count	f		3	\N	\N
293	application	category	findone	t		4	\N	\N
303	application	message	delete	f		4	\N	\N
314	content-manager	collection-types	delete	f		4	\N	\N
324	content-manager	content-types	updatecontenttypeconfiguration	f		4	\N	\N
337	content-type-builder	components	getcomponents	f		4	\N	\N
349	email	email	getsettings	f		4	\N	\N
353	upload	upload	destroy	f		4	\N	\N
362	users-permissions	auth	register	f		4	\N	\N
372	users-permissions	user	me	f		4	\N	\N
384	users-permissions	userspermissions	updateemailtemplate	f		4	\N	\N
194	application	topic	update	f		2	\N	\N
185	application	topic	count	t		1	\N	\N
497	application	token	delete	f		2	\N	\N
515	application	token	update	f		5	\N	\N
76	email	email	getsettings	f		2	\N	\N
77	email	email	send	f		1	\N	\N
83	upload	upload	destroy	f		1	\N	\N
89	upload	upload	getsettings	f		1	\N	\N
94	upload	upload	updatesettings	f		2	\N	\N
99	users-permissions	auth	connect	t		1	\N	\N
105	users-permissions	auth	register	f		1	\N	\N
107	users-permissions	auth	resetpassword	f		1	\N	\N
112	users-permissions	user	count	f		2	\N	\N
117	users-permissions	user	destroyall	f		1	\N	\N
126	users-permissions	user	update	f		2	\N	\N
137	users-permissions	userspermissions	getpolicies	f		1	\N	\N
133	users-permissions	userspermissions	getemailtemplate	f		1	\N	\N
145	users-permissions	userspermissions	getroutes	f		1	\N	\N
146	users-permissions	userspermissions	getroutes	f		2	\N	\N
155	users-permissions	userspermissions	updateproviders	f		1	\N	\N
156	users-permissions	userspermissions	updateproviders	f		2	\N	\N
161	application	category	delete	f		1	\N	\N
170	application	category	update	f		2	\N	\N
295	application	category	create	f		4	\N	\N
294	application	category	count	t		4	\N	\N
304	application	topic	find	t		4	\N	\N
310	content-manager	collection-types	find	f		4	\N	\N
313	content-manager	collection-types	update	f		4	\N	\N
317	content-manager	collection-types	bulkdelete	f		4	\N	\N
323	content-manager	content-types	findcontenttypeconfiguration	f		4	\N	\N
330	content-manager	single-types	unpublish	f		4	\N	\N
332	content-manager	uid	checkuidavailability	f		4	\N	\N
339	content-type-builder	components	updatecomponent	f		4	\N	\N
343	content-type-builder	contenttypes	getcontenttype	f		4	\N	\N
347	email	email	send	f		4	\N	\N
354	upload	upload	updatesettings	f		4	\N	\N
358	users-permissions	auth	callback	f		4	\N	\N
364	users-permissions	auth	sendemailconfirmation	f		4	\N	\N
368	users-permissions	user	count	f		4	\N	\N
377	users-permissions	userspermissions	getrole	f		4	\N	\N
378	users-permissions	userspermissions	getroles	f		4	\N	\N
388	users-permissions	userspermissions	updateproviders	f		4	\N	\N
186	application	topic	create	f		2	\N	\N
488	application	token	count	f		4	\N	\N
502	application	token	find	f		2	\N	\N
513	application	token	update	f		3	\N	\N
193	application	topic	update	t		1	\N	\N
125	users-permissions	user	update	f		1	\N	\N
78	email	email	send	f		2	\N	\N
88	upload	upload	findone	f		2	\N	\N
98	users-permissions	auth	callback	t		2	\N	\N
108	users-permissions	auth	resetpassword	t		2	\N	\N
118	users-permissions	user	destroyall	f		2	\N	\N
128	users-permissions	userspermissions	createrole	f		2	\N	\N
135	users-permissions	userspermissions	getpermissions	f		1	\N	\N
142	users-permissions	userspermissions	getrole	f		2	\N	\N
153	users-permissions	userspermissions	updateemailtemplate	f		1	\N	\N
162	application	category	delete	f		2	\N	\N
296	application	category	delete	f		4	\N	\N
305	application	topic	findone	t		4	\N	\N
320	content-manager	components	findcomponentconfiguration	f		4	\N	\N
329	content-manager	single-types	publish	f		4	\N	\N
340	content-type-builder	components	deletecomponent	f		4	\N	\N
350	upload	upload	find	f		4	\N	\N
360	users-permissions	auth	connect	f		4	\N	\N
365	users-permissions	user	create	f		4	\N	\N
373	users-permissions	userspermissions	createrole	f		4	\N	\N
383	users-permissions	userspermissions	getemailtemplate	f		4	\N	\N
489	application	token	count	f		5	\N	\N
503	application	token	find	f		3	\N	\N
187	application	topic	delete	t		1	\N	\N
507	application	token	findone	t		2	\N	\N
79	email	email	test	f		1	\N	\N
87	upload	upload	findone	f		1	\N	\N
96	upload	upload	upload	f		2	\N	\N
106	users-permissions	auth	register	t		2	\N	\N
115	users-permissions	user	destroy	f		1	\N	\N
127	users-permissions	userspermissions	createrole	f		1	\N	\N
138	users-permissions	userspermissions	getpolicies	f		2	\N	\N
148	users-permissions	userspermissions	index	f		2	\N	\N
158	users-permissions	userspermissions	updaterole	f		2	\N	\N
490	application	token	create	f		1	\N	\N
297	application	category	update	f		4	\N	\N
309	application	topic	delete	f		4	\N	\N
315	content-manager	collection-types	publish	f		4	\N	\N
326	content-manager	single-types	find	f		4	\N	\N
335	content-type-builder	componentcategories	deletecategory	f		4	\N	\N
345	content-type-builder	contenttypes	updatecontenttype	f		4	\N	\N
355	upload	upload	getsettings	f		4	\N	\N
363	users-permissions	auth	emailconfirmation	f		4	\N	\N
374	users-permissions	userspermissions	deleterole	f		4	\N	\N
382	users-permissions	userspermissions	updaterole	f		4	\N	\N
188	application	topic	delete	f		2	\N	\N
163	application	category	find	t		1	\N	\N
500	application	token	delete	f		5	\N	\N
510	application	token	findone	f		5	\N	\N
100	users-permissions	auth	connect	t		2	\N	\N
110	users-permissions	auth	sendemailconfirmation	f		2	\N	\N
120	users-permissions	user	find	f		2	\N	\N
130	users-permissions	userspermissions	deleterole	f		2	\N	\N
140	users-permissions	userspermissions	getproviders	f		2	\N	\N
150	users-permissions	userspermissions	searchusers	f		2	\N	\N
164	application	category	create	f		1	\N	\N
292	application	category	find	t		4	\N	\N
189	application	topic	find	t		2	\N	\N
302	application	message	update	f		4	\N	\N
312	content-manager	collection-types	create	f		4	\N	\N
322	content-manager	content-types	findcontenttypes	f		4	\N	\N
333	content-type-builder	builder	getreservednames	f		4	\N	\N
344	content-type-builder	contenttypes	createcontenttype	f		4	\N	\N
352	upload	upload	count	f		4	\N	\N
366	users-permissions	user	update	f		4	\N	\N
375	users-permissions	userspermissions	getpermissions	f		4	\N	\N
385	users-permissions	userspermissions	getadvancedsettings	f		4	\N	\N
504	application	token	find	f		4	\N	\N
514	application	token	update	f		4	\N	\N
491	application	token	create	t		2	\N	\N
103	users-permissions	auth	forgotpassword	f		1	\N	\N
114	users-permissions	user	create	f		2	\N	\N
136	users-permissions	userspermissions	getpermissions	f		2	\N	\N
144	users-permissions	userspermissions	getroles	f		2	\N	\N
154	users-permissions	userspermissions	updateemailtemplate	f		2	\N	\N
298	application	message	findone	t		4	\N	\N
122	users-permissions	user	findone	t		2	\N	\N
165	application	category	count	t		2	\N	\N
306	application	topic	count	t		4	\N	\N
319	content-manager	components	findcomponents	f		4	\N	\N
328	content-manager	single-types	delete	f		4	\N	\N
338	content-type-builder	components	createcomponent	f		4	\N	\N
346	content-type-builder	contenttypes	deletecontenttype	f		4	\N	\N
356	upload	upload	upload	f		4	\N	\N
367	users-permissions	user	find	f		4	\N	\N
379	users-permissions	userspermissions	getroutes	f		4	\N	\N
387	users-permissions	userspermissions	getproviders	f		4	\N	\N
190	application	topic	find	t		1	\N	\N
492	application	token	create	f		3	\N	\N
498	application	token	delete	f		3	\N	\N
508	application	token	findone	f		3	\N	\N
109	users-permissions	auth	sendemailconfirmation	f		1	\N	\N
119	users-permissions	user	find	f		1	\N	\N
129	users-permissions	userspermissions	deleterole	f		1	\N	\N
139	users-permissions	userspermissions	getproviders	f		1	\N	\N
149	users-permissions	userspermissions	searchusers	f		1	\N	\N
166	application	category	find	t		2	\N	\N
299	application	message	find	t		4	\N	\N
308	application	topic	update	f		4	\N	\N
316	content-manager	collection-types	unpublish	f		4	\N	\N
327	content-manager	single-types	createorupdate	f		4	\N	\N
336	content-type-builder	components	getcomponent	f		4	\N	\N
348	email	email	test	f		4	\N	\N
359	users-permissions	auth	resetpassword	f		4	\N	\N
370	users-permissions	user	destroy	f		4	\N	\N
380	users-permissions	userspermissions	index	f		4	\N	\N
191	application	topic	findone	t		1	\N	\N
493	application	token	create	f		4	\N	\N
499	application	token	delete	f		4	\N	\N
511	application	token	update	f		1	\N	\N
121	users-permissions	user	findone	f		1	\N	\N
134	users-permissions	userspermissions	getemailtemplate	f		2	\N	\N
147	users-permissions	userspermissions	index	f		1	\N	\N
157	users-permissions	userspermissions	updaterole	f		1	\N	\N
192	application	topic	findone	t		2	\N	\N
300	application	message	count	t		4	\N	\N
311	content-manager	collection-types	findone	f		4	\N	\N
321	content-manager	components	updatecomponentconfiguration	f		4	\N	\N
331	content-manager	uid	generateuid	f		4	\N	\N
341	content-type-builder	connections	getconnections	f		4	\N	\N
351	upload	upload	findone	f		4	\N	\N
361	users-permissions	auth	forgotpassword	f		4	\N	\N
371	users-permissions	user	destroyall	f		4	\N	\N
381	users-permissions	userspermissions	searchusers	f		4	\N	\N
167	application	category	findone	t		1	\N	\N
494	application	token	create	f		5	\N	\N
501	application	token	find	f		1	\N	\N
512	application	token	update	f		2	\N	\N
168	application	category	findone	t		2	\N	\N
195	application	category	find	t		3	\N	\N
205	application	message	update	t		3	\N	\N
215	content-manager	collection-types	create	f		3	\N	\N
225	content-manager	content-types	findcontenttypes	f		3	\N	\N
235	content-manager	uid	checkuidavailability	f		3	\N	\N
245	content-type-builder	contenttypes	getcontenttypes	f		3	\N	\N
255	upload	upload	count	f		3	\N	\N
265	users-permissions	auth	register	f		3	\N	\N
275	users-permissions	user	me	f		3	\N	\N
285	users-permissions	userspermissions	updaterole	f		3	\N	\N
301	application	message	create	f		4	\N	\N
307	application	topic	create	f		4	\N	\N
318	content-manager	collection-types	previewmanyrelations	f		4	\N	\N
325	content-manager	relations	find	f		4	\N	\N
334	content-type-builder	componentcategories	editcategory	f		4	\N	\N
342	content-type-builder	contenttypes	getcontenttypes	f		4	\N	\N
357	upload	upload	search	f		4	\N	\N
369	users-permissions	user	findone	f		4	\N	\N
376	users-permissions	userspermissions	getpolicies	f		4	\N	\N
386	users-permissions	userspermissions	updateadvancedsettings	f		4	\N	\N
495	application	token	count	f		2	\N	\N
505	application	token	find	f		5	\N	\N
509	application	token	findone	f		4	\N	\N
169	application	category	update	f		1	\N	\N
196	application	category	findone	t		3	\N	\N
209	application	topic	count	t		3	\N	\N
218	content-manager	collection-types	publish	f		3	\N	\N
228	content-manager	relations	find	f		3	\N	\N
237	content-type-builder	componentcategories	editcategory	f		3	\N	\N
250	email	email	send	f		3	\N	\N
261	users-permissions	auth	callback	f		3	\N	\N
272	users-permissions	user	count	f		3	\N	\N
279	users-permissions	userspermissions	getpolicies	f		3	\N	\N
288	users-permissions	userspermissions	getadvancedsettings	f		3	\N	\N
159	application	category	count	t		1	\N	\N
496	application	token	delete	f		1	\N	\N
506	application	token	findone	f		1	\N	\N
171	application	message	count	t		2	\N	\N
197	application	category	count	t		3	\N	\N
206	application	message	delete	t		3	\N	\N
220	content-manager	collection-types	bulkdelete	f		3	\N	\N
231	content-manager	single-types	delete	f		3	\N	\N
243	content-type-builder	components	deletecomponent	f		3	\N	\N
252	email	email	getsettings	f		3	\N	\N
262	users-permissions	auth	resetpassword	f		3	\N	\N
271	users-permissions	user	findone	f		3	\N	\N
282	users-permissions	userspermissions	getroutes	f		3	\N	\N
389	application	category	find	t		5	\N	\N
399	application	message	update	t		5	\N	\N
409	content-manager	collection-types	create	f		5	\N	\N
420	content-manager	content-types	findcontenttypeconfiguration	f		5	\N	\N
430	content-type-builder	builder	getreservednames	f		5	\N	\N
439	content-type-builder	contenttypes	getcontenttypes	f		5	\N	\N
448	upload	upload	findone	f		5	\N	\N
460	users-permissions	auth	emailconfirmation	f		5	\N	\N
469	users-permissions	user	me	f		5	\N	\N
479	users-permissions	userspermissions	updaterole	f		5	\N	\N
516	documentation	documentation	deletedoc	f		3	\N	\N
526	documentation	documentation	index	f		1	\N	\N
536	documentation	documentation	loginview	f		1	\N	\N
548	documentation	documentation	updatesettings	f		3	\N	\N
181	application	message	update	t		1	\N	\N
551	users-permissions	user	updateme	f		2	\N	\N
182	application	message	update	f		2	\N	\N
517	documentation	documentation	deletedoc	f		2	\N	\N
198	application	category	create	f		3	\N	\N
207	application	topic	find	t		3	\N	\N
216	content-manager	collection-types	update	f		3	\N	\N
226	content-manager	content-types	findcontenttypeconfiguration	f		3	\N	\N
236	content-type-builder	builder	getreservednames	f		3	\N	\N
249	content-type-builder	contenttypes	deletecontenttype	f		3	\N	\N
259	upload	upload	upload	f		3	\N	\N
266	users-permissions	auth	emailconfirmation	f		3	\N	\N
276	users-permissions	userspermissions	createrole	f		3	\N	\N
172	application	message	count	t		1	\N	\N
390	application	category	findone	t		5	\N	\N
400	application	message	delete	t		5	\N	\N
410	content-manager	collection-types	update	f		5	\N	\N
419	content-manager	content-types	findcontenttypes	f		5	\N	\N
431	content-type-builder	componentcategories	editcategory	f		5	\N	\N
441	content-type-builder	contenttypes	createcontenttype	f		5	\N	\N
451	upload	upload	updatesettings	f		5	\N	\N
461	users-permissions	auth	sendemailconfirmation	f		5	\N	\N
471	users-permissions	userspermissions	deleterole	f		5	\N	\N
481	users-permissions	userspermissions	updateemailtemplate	f		5	\N	\N
528	documentation	documentation	index	f		3	\N	\N
539	documentation	documentation	loginview	f		4	\N	\N
547	documentation	documentation	updatesettings	f		2	\N	\N
552	users-permissions	user	updateme	t		1	\N	\N
199	application	category	delete	f		3	\N	\N
211	application	topic	update	t		3	\N	\N
219	content-manager	collection-types	unpublish	f		3	\N	\N
227	content-manager	content-types	updatecontenttypeconfiguration	f		3	\N	\N
239	content-type-builder	components	getcomponents	f		3	\N	\N
251	email	email	test	f		3	\N	\N
260	upload	upload	search	f		3	\N	\N
269	users-permissions	user	update	f		3	\N	\N
280	users-permissions	userspermissions	getrole	f		3	\N	\N
287	users-permissions	userspermissions	updateemailtemplate	f		3	\N	\N
391	application	category	count	t		5	\N	\N
401	application	topic	find	t		5	\N	\N
411	content-manager	collection-types	delete	f		5	\N	\N
421	content-manager	content-types	updatecontenttypeconfiguration	f		5	\N	\N
429	content-manager	uid	checkuidavailability	f		5	\N	\N
440	content-type-builder	contenttypes	getcontenttype	f		5	\N	\N
450	upload	upload	destroy	f		5	\N	\N
459	users-permissions	auth	register	f		5	\N	\N
470	users-permissions	userspermissions	createrole	f		5	\N	\N
480	users-permissions	userspermissions	getemailtemplate	f		5	\N	\N
518	documentation	documentation	deletedoc	f		1	\N	\N
529	documentation	documentation	index	f		4	\N	\N
540	documentation	documentation	loginview	f		5	\N	\N
549	documentation	documentation	updatesettings	f		4	\N	\N
173	application	message	create	t		1	\N	\N
555	users-permissions	user	updateme	f		5	\N	\N
174	application	message	create	f		2	\N	\N
200	application	category	update	f		3	\N	\N
210	application	topic	create	t		3	\N	\N
222	content-manager	components	findcomponents	f		3	\N	\N
233	content-manager	single-types	unpublish	f		3	\N	\N
242	content-type-builder	components	updatecomponent	f		3	\N	\N
247	content-type-builder	contenttypes	createcontenttype	f		3	\N	\N
258	upload	upload	getsettings	f		3	\N	\N
270	users-permissions	user	find	f		3	\N	\N
281	users-permissions	userspermissions	getroles	f		3	\N	\N
392	application	category	update	t		5	\N	\N
403	application	topic	count	t		5	\N	\N
416	content-manager	components	findcomponents	f		5	\N	\N
426	content-manager	single-types	publish	f		5	\N	\N
433	content-type-builder	components	getcomponents	f		5	\N	\N
444	email	email	send	f		5	\N	\N
454	upload	upload	search	f		5	\N	\N
465	users-permissions	user	findone	f		5	\N	\N
476	users-permissions	userspermissions	getroutes	f		5	\N	\N
484	users-permissions	userspermissions	getproviders	f		5	\N	\N
519	documentation	documentation	deletedoc	f		4	\N	\N
527	documentation	documentation	index	f		2	\N	\N
537	documentation	documentation	loginview	f		2	\N	\N
550	documentation	documentation	updatesettings	f		5	\N	\N
553	users-permissions	user	updateme	f		3	\N	\N
201	application	message	find	t		3	\N	\N
208	application	topic	findone	t		3	\N	\N
217	content-manager	collection-types	delete	f		3	\N	\N
229	content-manager	single-types	find	f		3	\N	\N
241	content-type-builder	components	createcomponent	f		3	\N	\N
248	content-type-builder	contenttypes	updatecontenttype	f		3	\N	\N
257	upload	upload	updatesettings	f		3	\N	\N
268	users-permissions	user	create	f		3	\N	\N
278	users-permissions	userspermissions	getpermissions	f		3	\N	\N
289	users-permissions	userspermissions	updateadvancedsettings	f		3	\N	\N
393	application	category	delete	t		5	\N	\N
404	application	topic	create	t		5	\N	\N
415	content-manager	collection-types	previewmanyrelations	f		5	\N	\N
424	content-manager	single-types	createorupdate	f		5	\N	\N
434	content-type-builder	components	getcomponent	f		5	\N	\N
443	content-type-builder	contenttypes	deletecontenttype	f		5	\N	\N
452	upload	upload	upload	f		5	\N	\N
466	users-permissions	user	count	f		5	\N	\N
475	users-permissions	userspermissions	getroles	f		5	\N	\N
482	users-permissions	userspermissions	getadvancedsettings	f		5	\N	\N
520	documentation	documentation	deletedoc	f		5	\N	\N
530	documentation	documentation	index	f		5	\N	\N
538	documentation	documentation	loginview	f		3	\N	\N
546	documentation	documentation	updatesettings	f		1	\N	\N
175	application	message	delete	t		1	\N	\N
554	users-permissions	user	updateme	f		4	\N	\N
202	application	message	findone	t		3	\N	\N
212	application	topic	delete	t		3	\N	\N
221	content-manager	collection-types	previewmanyrelations	f		3	\N	\N
230	content-manager	single-types	createorupdate	f		3	\N	\N
238	content-type-builder	componentcategories	deletecategory	f		3	\N	\N
253	upload	upload	find	f		3	\N	\N
264	users-permissions	auth	forgotpassword	f		3	\N	\N
273	users-permissions	user	destroy	f		3	\N	\N
284	users-permissions	userspermissions	searchusers	f		3	\N	\N
291	users-permissions	userspermissions	updateproviders	f		3	\N	\N
176	application	message	find	t		1	\N	\N
394	application	category	create	t		5	\N	\N
402	application	topic	findone	t		5	\N	\N
412	content-manager	collection-types	publish	f		5	\N	\N
422	content-manager	relations	find	f		5	\N	\N
432	content-type-builder	componentcategories	deletecategory	f		5	\N	\N
442	content-type-builder	contenttypes	updatecontenttype	f		5	\N	\N
453	upload	upload	getsettings	f		5	\N	\N
462	users-permissions	user	create	f		5	\N	\N
472	users-permissions	userspermissions	getpermissions	f		5	\N	\N
521	documentation	documentation	getinfos	f		2	\N	\N
533	documentation	documentation	login	f		3	\N	\N
542	documentation	documentation	regeneratedoc	f		2	\N	\N
177	application	message	delete	f		2	\N	\N
203	application	message	count	t		3	\N	\N
213	content-manager	collection-types	find	f		3	\N	\N
224	content-manager	components	updatecomponentconfiguration	f		3	\N	\N
234	content-manager	uid	generateuid	f		3	\N	\N
244	content-type-builder	connections	getconnections	f		3	\N	\N
254	upload	upload	findone	f		3	\N	\N
263	users-permissions	auth	connect	f		3	\N	\N
274	users-permissions	user	destroyall	f		3	\N	\N
283	users-permissions	userspermissions	index	f		3	\N	\N
290	users-permissions	userspermissions	getproviders	f		3	\N	\N
395	application	message	findone	t		5	\N	\N
405	application	topic	delete	t		5	\N	\N
418	content-manager	components	updatecomponentconfiguration	f		5	\N	\N
427	content-manager	single-types	unpublish	f		5	\N	\N
437	content-type-builder	components	deletecomponent	f		5	\N	\N
447	upload	upload	find	f		5	\N	\N
458	users-permissions	auth	forgotpassword	f		5	\N	\N
467	users-permissions	user	destroy	f		5	\N	\N
477	users-permissions	userspermissions	index	f		5	\N	\N
522	documentation	documentation	getinfos	f		1	\N	\N
531	documentation	documentation	login	f		1	\N	\N
541	documentation	documentation	regeneratedoc	f		1	\N	\N
178	application	message	findone	t		2	\N	\N
204	application	message	create	t		3	\N	\N
214	content-manager	collection-types	findone	f		3	\N	\N
223	content-manager	components	findcomponentconfiguration	f		3	\N	\N
232	content-manager	single-types	publish	f		3	\N	\N
240	content-type-builder	components	getcomponent	f		3	\N	\N
246	content-type-builder	contenttypes	getcontenttype	f		3	\N	\N
256	upload	upload	destroy	f		3	\N	\N
267	users-permissions	auth	sendemailconfirmation	f		3	\N	\N
277	users-permissions	userspermissions	deleterole	f		3	\N	\N
286	users-permissions	userspermissions	getemailtemplate	f		3	\N	\N
396	application	message	count	t		5	\N	\N
407	content-manager	collection-types	find	f		5	\N	\N
414	content-manager	collection-types	bulkdelete	f		5	\N	\N
425	content-manager	single-types	delete	f		5	\N	\N
436	content-type-builder	components	updatecomponent	f		5	\N	\N
445	email	email	test	f		5	\N	\N
455	users-permissions	auth	callback	f		5	\N	\N
464	users-permissions	user	find	f		5	\N	\N
473	users-permissions	userspermissions	getpolicies	f		5	\N	\N
485	users-permissions	userspermissions	updateproviders	f		5	\N	\N
523	documentation	documentation	getinfos	f		3	\N	\N
532	documentation	documentation	login	f		2	\N	\N
543	documentation	documentation	regeneratedoc	f		3	\N	\N
179	application	message	find	t		2	\N	\N
397	application	message	find	t		5	\N	\N
406	application	topic	update	t		5	\N	\N
417	content-manager	components	findcomponentconfiguration	f		5	\N	\N
428	content-manager	uid	generateuid	f		5	\N	\N
438	content-type-builder	connections	getconnections	f		5	\N	\N
449	upload	upload	count	f		5	\N	\N
457	users-permissions	auth	connect	f		5	\N	\N
468	users-permissions	user	destroyall	f		5	\N	\N
478	users-permissions	userspermissions	searchusers	f		5	\N	\N
524	documentation	documentation	getinfos	f		5	\N	\N
534	documentation	documentation	login	f		4	\N	\N
544	documentation	documentation	regeneratedoc	f		4	\N	\N
180	application	message	findone	t		1	\N	\N
398	application	message	create	t		5	\N	\N
408	content-manager	collection-types	findone	f		5	\N	\N
413	content-manager	collection-types	unpublish	f		5	\N	\N
423	content-manager	single-types	find	f		5	\N	\N
435	content-type-builder	components	createcomponent	f		5	\N	\N
446	email	email	getsettings	f		5	\N	\N
456	users-permissions	auth	resetpassword	f		5	\N	\N
463	users-permissions	user	update	f		5	\N	\N
474	users-permissions	userspermissions	getrole	f		5	\N	\N
483	users-permissions	userspermissions	updateadvancedsettings	f		5	\N	\N
525	documentation	documentation	getinfos	f		4	\N	\N
535	documentation	documentation	login	f		5	\N	\N
545	documentation	documentation	regeneratedoc	f		5	\N	\N
183	application	topic	create	t		1	\N	\N
75	email	email	getsettings	f		1	\N	\N
86	upload	upload	find	f		2	\N	\N
95	upload	upload	upload	f		1	\N	\N
104	users-permissions	auth	forgotpassword	t		2	\N	\N
113	users-permissions	user	create	f		1	\N	\N
123	users-permissions	user	me	t		1	\N	\N
131	users-permissions	userspermissions	getadvancedsettings	f		1	\N	\N
141	users-permissions	userspermissions	getrole	f		1	\N	\N
151	users-permissions	userspermissions	updateadvancedsettings	f		1	\N	\N
184	application	topic	count	t		2	\N	\N
\.


--
-- Data for Name: users-permissions_role; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public."users-permissions_role" (id, name, description, type, created_by, updated_by) FROM stdin;
3	Author	This is an author of messages or topics	author	\N	\N
5	Admin	Default role for admin user	admin	\N	\N
4	Reader	This is a reader, probably not used... as visitors have 'public' role by default.	reader	\N	\N
2	Public	Default role given to unauthenticated user.	public	\N	\N
1	Authenticated	Default role given to authenticated user.	authenticated	\N	\N
\.


--
-- Data for Name: users-permissions_user; Type: TABLE DATA; Schema: public; Owner: ju
--

COPY public."users-permissions_user" (id, username, email, provider, password, "resetPasswordToken", "confirmationToken", confirmed, blocked, role, created_by, updated_by, created_at, updated_at, firstname, lastname, token) FROM stdin;
44	alex	gg@gg.fr	local	$2a$10$AbDbTKOwCHQyO70cLc0aHuJvHFbghrQhHYHRRlkd94NBp1aHmMKlO	\N	\N	t	\N	1	\N	\N	2021-03-28 14:14:00.732+02	2021-03-28 14:18:54.545+02	gg	gg	8
45	arno	jupellin39@gmail.com	local	$2a$10$bZsiCSWObEgpdhP957/R5uspAXgFvQfdsW47ma0VPxmYVe1PQ93Da	\N	\N	t	\N	1	\N	\N	2021-03-28 15:42:10.742+02	2021-03-28 23:42:07.506+02	Julien	PELLIN	9
39	bob-bob	bob@bob.fr	local	$2a$10$2ZT2T9KBVNu5mFkTa5ER9uyAPwiNuGGrJf25tSw7i3STJSX4Av.pq	\N	\N	t	\N	1	\N	\N	2021-03-23 14:41:13.02+01	2021-03-23 14:41:13.064+01	bob	bob	4
43	leon-leon	leon@leon.fr	local	$2a$10$Ha1nLzrRGgokAm9lkFz0S.ZbWzrc3u3Cvya.W.2sFvLs4/7BJGto2	\N	\N	t	\N	1	\N	\N	2021-03-28 12:18:33.596+02	2021-03-29 01:21:59.802+02	leon	leon	\N
41	bernard	de@de.fr	local	$2a$10$N6ih8i.V3RdoW./l.Ue6WOwX9abNwudBksS11AvO/L./D7pVo8RFm	\N	\N	t	\N	1	\N	\N	2021-03-23 16:07:12.404+01	2021-03-23 17:21:03.026+01	Julien	PELLIN	6
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.categories_id_seq', 7, true);


--
-- Name: core_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.core_store_id_seq', 30, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.messages_id_seq', 62, true);


--
-- Name: strapi_administrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.strapi_administrator_id_seq', 1, true);


--
-- Name: strapi_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.strapi_permission_id_seq', 121, true);


--
-- Name: strapi_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.strapi_role_id_seq', 3, true);


--
-- Name: strapi_users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.strapi_users_roles_id_seq', 1, true);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.tokens_id_seq', 9, true);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.topics_id_seq', 66, true);


--
-- Name: upload_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.upload_file_id_seq', 1, false);


--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public.upload_file_morph_id_seq', 1, false);


--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public."users-permissions_permission_id_seq"', 555, true);


--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public."users-permissions_role_id_seq"', 5, true);


--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ju
--

SELECT pg_catalog.setval('public."users-permissions_user_id_seq"', 45, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: core_store core_store_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.core_store
    ADD CONSTRAINT core_store_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: strapi_administrator strapi_administrator_email_unique; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_administrator
    ADD CONSTRAINT strapi_administrator_email_unique UNIQUE (email);


--
-- Name: strapi_administrator strapi_administrator_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_administrator
    ADD CONSTRAINT strapi_administrator_pkey PRIMARY KEY (id);


--
-- Name: strapi_permission strapi_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_permission
    ADD CONSTRAINT strapi_permission_pkey PRIMARY KEY (id);


--
-- Name: strapi_role strapi_role_code_unique; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_role
    ADD CONSTRAINT strapi_role_code_unique UNIQUE (code);


--
-- Name: strapi_role strapi_role_name_unique; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_role
    ADD CONSTRAINT strapi_role_name_unique UNIQUE (name);


--
-- Name: strapi_role strapi_role_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_role
    ADD CONSTRAINT strapi_role_pkey PRIMARY KEY (id);


--
-- Name: strapi_users_roles strapi_users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_users_roles
    ADD CONSTRAINT strapi_users_roles_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: upload_file_morph upload_file_morph_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.upload_file_morph
    ADD CONSTRAINT upload_file_morph_pkey PRIMARY KEY (id);


--
-- Name: upload_file upload_file_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public.upload_file
    ADD CONSTRAINT upload_file_pkey PRIMARY KEY (id);


--
-- Name: users-permissions_permission users-permissions_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public."users-permissions_permission"
    ADD CONSTRAINT "users-permissions_permission_pkey" PRIMARY KEY (id);


--
-- Name: users-permissions_role users-permissions_role_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public."users-permissions_role"
    ADD CONSTRAINT "users-permissions_role_pkey" PRIMARY KEY (id);


--
-- Name: users-permissions_role users-permissions_role_type_unique; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public."users-permissions_role"
    ADD CONSTRAINT "users-permissions_role_type_unique" UNIQUE (type);


--
-- Name: users-permissions_user users-permissions_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public."users-permissions_user"
    ADD CONSTRAINT "users-permissions_user_pkey" PRIMARY KEY (id);


--
-- Name: users-permissions_user users-permissions_user_username_unique; Type: CONSTRAINT; Schema: public; Owner: ju
--

ALTER TABLE ONLY public."users-permissions_user"
    ADD CONSTRAINT "users-permissions_user_username_unique" UNIQUE (username);


--
-- PostgreSQL database dump complete
--

