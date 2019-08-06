--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 9.5.5

-- Started on 2019-08-02 17:15:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 11795)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 189 (class 1259 OID 286551)
-- Name: castes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE castes (
    id bigint NOT NULL,
    caste_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 188 (class 1259 OID 286549)
-- Name: castes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE castes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 188
-- Name: castes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE castes_id_seq OWNED BY castes.id;


--
-- TOC entry 183 (class 1259 OID 286491)
-- Name: court_complexes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE court_complexes (
    id bigint NOT NULL,
    court_complex_name character varying(255) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    district_id bigint NOT NULL,
    zone_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    subdivision_id bigint
);


--
-- TOC entry 182 (class 1259 OID 286489)
-- Name: court_complexes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE court_complexes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 182
-- Name: court_complexes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE court_complexes_id_seq OWNED BY court_complexes.id;


--
-- TOC entry 185 (class 1259 OID 286516)
-- Name: courts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE courts (
    id bigint NOT NULL,
    court_name character varying(255) NOT NULL,
    court_complex_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 184 (class 1259 OID 286514)
-- Name: courts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE courts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 184
-- Name: courts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE courts_id_seq OWNED BY courts.id;


--
-- TOC entry 211 (class 1259 OID 321642)
-- Name: dairies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dairies (
    id bigint NOT NULL,
    jo_code character varying(255) NOT NULL,
    date_of_schedule date NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 210 (class 1259 OID 321640)
-- Name: dairies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dairies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 210
-- Name: dairies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dairies_id_seq OWNED BY dairies.id;


--
-- TOC entry 191 (class 1259 OID 286566)
-- Name: designations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE designations (
    id bigint NOT NULL,
    designation_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 190 (class 1259 OID 286564)
-- Name: designations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE designations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 190
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE designations_id_seq OWNED BY designations.id;


--
-- TOC entry 179 (class 1259 OID 286451)
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE districts (
    id bigint NOT NULL,
    district_name character varying(255) NOT NULL,
    state_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 178 (class 1259 OID 286449)
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 178
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE districts_id_seq OWNED BY districts.id;


--
-- TOC entry 209 (class 1259 OID 311058)
-- Name: jo_photos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE jo_photos (
    id bigint NOT NULL,
    judicial_officer_id bigint,
    photo bytea,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 208 (class 1259 OID 311056)
-- Name: jo_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE jo_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 208
-- Name: jo_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE jo_photos_id_seq OWNED BY jo_photos.id;


--
-- TOC entry 201 (class 1259 OID 286684)
-- Name: jo_reporting_reviewings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE jo_reporting_reviewings (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    reporting_officer_id bigint NOT NULL,
    reviewing_officer_id bigint NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 200 (class 1259 OID 286682)
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE jo_reporting_reviewings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 200
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE jo_reporting_reviewings_id_seq OWNED BY jo_reporting_reviewings.id;


--
-- TOC entry 205 (class 1259 OID 286769)
-- Name: judicial_officer_posting_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE judicial_officer_posting_preferences (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    zone_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 204 (class 1259 OID 286767)
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE judicial_officer_posting_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 204
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE judicial_officer_posting_preferences_id_seq OWNED BY judicial_officer_posting_preferences.id;


--
-- TOC entry 207 (class 1259 OID 310977)
-- Name: judicial_officer_postings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE judicial_officer_postings (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    designation_id bigint NOT NULL,
    court_id bigint,
    court_complex_id bigint NOT NULL,
    mode_id bigint NOT NULL,
    from_date date NOT NULL,
    to_date date,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 206 (class 1259 OID 310975)
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE judicial_officer_postings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 206
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE judicial_officer_postings_id_seq OWNED BY judicial_officer_postings.id;


--
-- TOC entry 199 (class 1259 OID 286659)
-- Name: judicial_officer_qualifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE judicial_officer_qualifications (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    qualification_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 198 (class 1259 OID 286657)
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE judicial_officer_qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 198
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE judicial_officer_qualifications_id_seq OWNED BY judicial_officer_qualifications.id;


--
-- TOC entry 197 (class 1259 OID 286611)
-- Name: judicial_officers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE judicial_officers (
    id bigint NOT NULL,
    officer_name character varying(255) NOT NULL,
    guardian_name character varying(255) NOT NULL,
    gurdian_relation character varying(255) NOT NULL,
    jo_code character varying(255) NOT NULL,
    date_of_birth date NOT NULL,
    date_of_joining date NOT NULL,
    date_of_confirmation date NOT NULL,
    date_of_retirement date NOT NULL,
    present_address text NOT NULL,
    permanent_address text NOT NULL,
    hometown character varying(255) NOT NULL,
    home_district_id bigint NOT NULL,
    home_state_id bigint NOT NULL,
    caste_id bigint NOT NULL,
    religion_id bigint NOT NULL,
    recruitment_batch_id bigint NOT NULL,
    aadhaar_no character(12),
    pan_no character(10),
    pf_no character varying(255),
    blood_group character varying(255),
    identification_marks_1 character varying(255),
    identification_marks_2 character varying(255),
    mobile_no_1 character varying(255) NOT NULL,
    mobile_no_2 character varying(255),
    mobile_no_3 character varying(255),
    email_id_1 character varying(255) NOT NULL,
    email_id_2 character varying(255),
    email_id_3 character varying(255),
    reporting_officer_id bigint NOT NULL,
    reviewing_officer_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    photo_id bigint
);


--
-- TOC entry 196 (class 1259 OID 286609)
-- Name: judicial_officers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE judicial_officers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 196
-- Name: judicial_officers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE judicial_officers_id_seq OWNED BY judicial_officers.id;


--
-- TOC entry 170 (class 1259 OID 266867)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 169 (class 1259 OID 266865)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 169
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- TOC entry 203 (class 1259 OID 286714)
-- Name: modes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE modes (
    id bigint NOT NULL,
    posting_mode character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 202 (class 1259 OID 286712)
-- Name: modes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE modes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 202
-- Name: modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE modes_id_seq OWNED BY modes.id;


--
-- TOC entry 173 (class 1259 OID 286412)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- TOC entry 187 (class 1259 OID 286536)
-- Name: qualifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE qualifications (
    id bigint NOT NULL,
    qualification_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 186 (class 1259 OID 286534)
-- Name: qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 186
-- Name: qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE qualifications_id_seq OWNED BY qualifications.id;


--
-- TOC entry 195 (class 1259 OID 286596)
-- Name: recruitment_batches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE recruitment_batches (
    id bigint NOT NULL,
    recruitment_batch_desc character varying(255) NOT NULL,
    batch_year integer NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 194 (class 1259 OID 286594)
-- Name: recruitment_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recruitment_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 194
-- Name: recruitment_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recruitment_batches_id_seq OWNED BY recruitment_batches.id;


--
-- TOC entry 193 (class 1259 OID 286581)
-- Name: religions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE religions (
    id bigint NOT NULL,
    religion_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 192 (class 1259 OID 286579)
-- Name: religions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE religions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 192
-- Name: religions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE religions_id_seq OWNED BY religions.id;


--
-- TOC entry 175 (class 1259 OID 286421)
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE states (
    id bigint NOT NULL,
    state_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 174 (class 1259 OID 286419)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 174
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- TOC entry 181 (class 1259 OID 286471)
-- Name: subdivisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE subdivisions (
    id bigint NOT NULL,
    subdivision_name character varying(255) NOT NULL,
    district_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 180 (class 1259 OID 286469)
-- Name: subdivisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subdivisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 180
-- Name: subdivisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subdivisions_id_seq OWNED BY subdivisions.id;


--
-- TOC entry 172 (class 1259 OID 286401)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    court_id bigint,
    district_id bigint,
    zone_id bigint,
    judicial_officer_id bigint,
    jo_code character varying(255)
);


--
-- TOC entry 171 (class 1259 OID 286399)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 171
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 177 (class 1259 OID 286436)
-- Name: zones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zones (
    id bigint NOT NULL,
    zone_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    min_service_days integer
);


--
-- TOC entry 176 (class 1259 OID 286434)
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 176
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE zones_id_seq OWNED BY zones.id;


--
-- TOC entry 2014 (class 2604 OID 286554)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY castes ALTER COLUMN id SET DEFAULT nextval('castes_id_seq'::regclass);


--
-- TOC entry 2011 (class 2604 OID 286494)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes ALTER COLUMN id SET DEFAULT nextval('court_complexes_id_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 286519)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY courts ALTER COLUMN id SET DEFAULT nextval('courts_id_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 321645)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dairies ALTER COLUMN id SET DEFAULT nextval('dairies_id_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 286569)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY designations ALTER COLUMN id SET DEFAULT nextval('designations_id_seq'::regclass);


--
-- TOC entry 2009 (class 2604 OID 286454)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts ALTER COLUMN id SET DEFAULT nextval('districts_id_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 311061)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_photos ALTER COLUMN id SET DEFAULT nextval('jo_photos_id_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 286687)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings ALTER COLUMN id SET DEFAULT nextval('jo_reporting_reviewings_id_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 286772)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_posting_preferences ALTER COLUMN id SET DEFAULT nextval('judicial_officer_posting_preferences_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 310980)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings ALTER COLUMN id SET DEFAULT nextval('judicial_officer_postings_id_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 286662)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications ALTER COLUMN id SET DEFAULT nextval('judicial_officer_qualifications_id_seq'::regclass);


--
-- TOC entry 2018 (class 2604 OID 286614)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers ALTER COLUMN id SET DEFAULT nextval('judicial_officers_id_seq'::regclass);


--
-- TOC entry 2005 (class 2604 OID 266870)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 286717)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY modes ALTER COLUMN id SET DEFAULT nextval('modes_id_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 286539)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY qualifications ALTER COLUMN id SET DEFAULT nextval('qualifications_id_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 286599)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recruitment_batches ALTER COLUMN id SET DEFAULT nextval('recruitment_batches_id_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 286584)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY religions ALTER COLUMN id SET DEFAULT nextval('religions_id_seq'::regclass);


--
-- TOC entry 2007 (class 2604 OID 286424)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- TOC entry 2010 (class 2604 OID 286474)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subdivisions ALTER COLUMN id SET DEFAULT nextval('subdivisions_id_seq'::regclass);


--
-- TOC entry 2006 (class 2604 OID 286404)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2008 (class 2604 OID 286439)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY zones ALTER COLUMN id SET DEFAULT nextval('zones_id_seq'::regclass);


--
-- TOC entry 2275 (class 0 OID 286551)
-- Dependencies: 189
-- Data for Name: castes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO castes (id, caste_name, created_by, created_at, updated_at) VALUES (1, 'General', 1, NULL, NULL);
INSERT INTO castes (id, caste_name, created_by, created_at, updated_at) VALUES (2, 'Scheduled Caste', 11, '2019-07-02 06:58:28', '2019-07-02 06:58:28');
INSERT INTO castes (id, caste_name, created_by, created_at, updated_at) VALUES (3, 'Scheduled Tribe', 11, '2019-07-02 07:41:15', '2019-07-03 08:42:41');


--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 188
-- Name: castes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('castes_id_seq', 6, true);


--
-- TOC entry 2269 (class 0 OID 286491)
-- Dependencies: 183
-- Data for Name: court_complexes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (1, 'Grant, Legros and Feest', 59.4822750000000013, -96.1092660000000052, 2, 1, 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (2, 'Yost, Kiehn and Bins', -79.1505310000000009, 133.192214000000007, 2, 1, 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (3, 'O''Reilly, Reichert and White', -76.6286429999999967, -100.417776000000003, 2, 1, 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (4, 'Goldner, Swaniawski and Lockman', -11.1408070000000006, -16.4666139999999999, 2, 1, 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (5, 'Tillman, Barton and Durgan', -58.146720000000002, 119.634581999999995, 2, 1, 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (6, 'Homenick-Schuppe', -84.0189189999999968, 76.7095510000000047, 5, 2, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (7, 'Morar and Sons', 54.6449149999999975, -152.375288000000012, 5, 2, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (8, 'Mraz Ltd', 24.8595149999999983, 91.8884549999999933, 5, 2, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (9, 'Lebsack-Harris', 27.8115750000000013, -149.116534000000001, 5, 2, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (10, 'Stehr-Stiedemann', -54.9181129999999982, 92.4165420000000069, 5, 2, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (11, 'Cartwright-Bogan', -63.101309999999998, 102.337888000000007, 8, 3, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (12, 'Torphy, Durgan and Rosenbaum', 9.79833400000000054, -16.7841440000000013, 8, 3, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (13, 'Balistreri, Zboncak and Will', 77.9417799999999943, 90.160460999999998, 8, 3, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (14, 'Schaefer-Altenwerth', 22.2785019999999996, -79.8903300000000058, 8, 3, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (15, 'Streich PLC', 18.1639869999999988, 107.879433000000006, 8, 3, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (16, 'Cronin-Okuneva', 25.0479979999999998, -170.069302999999991, 11, 4, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (17, 'Fisher-Waters', 32.848042999999997, 115.957533999999995, 11, 4, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (18, 'Ziemann, Von and Luettgen', 10.8809909999999999, 59.5612429999999975, 11, 4, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (19, 'Grady Group', 42.9741909999999976, -144.757902000000001, 11, 4, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (20, 'Quigley, Yost and Thiel', 0.727601000000000053, 60.115434999999998, 11, 4, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (21, 'Wunsch-Reynolds', 76.0070529999999991, -78.411280000000005, 14, 5, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (22, 'Zemlak, Nitzsche and Herzog', 68.6196510000000046, 150.824526999999989, 14, 5, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (23, 'Murphy-Heidenreich', -80.729173000000003, 33.5590109999999981, 14, 5, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (24, 'Dare-Roob', -46.0030730000000005, -146.407841999999988, 14, 5, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (25, 'Monahan-Corwin', -25.4323300000000003, 17.4266959999999997, 14, 5, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (26, 'Wunsch, Kulas and Bosco', -77.1542910000000006, 177.631616000000008, 17, 6, 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (27, 'Kshlerin Inc', -78.7014729999999929, -36.8657480000000035, 17, 6, 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (28, 'Reichert, Becker and Heller', 35.3807660000000013, -89.1107509999999934, 17, 6, 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (29, 'Flatley PLC', 51.4572939999999974, 49.2173969999999983, 17, 6, 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (30, 'Adams-Murazik', -24.2009679999999996, -131.898689999999988, 17, 6, 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (31, 'Nitzsche, Walter and Fisher', 12.5273760000000003, -132.131987000000009, 21, 7, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (32, 'Beier-Boyer', -28.2756949999999989, -63.2722949999999997, 21, 7, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (33, 'Prohaska LLC', 77.1226970000000023, 22.0210219999999985, 21, 7, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (34, 'Emard-Cummerata', -87.006448000000006, 111.820361000000005, 21, 7, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (35, 'Nitzsche, Dicki and Lang', -29.2436849999999993, 72.0545960000000036, 21, 7, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (36, 'Kautzer, Collier and Waters', -62.2261080000000035, 158.605680000000007, 22, 8, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (37, 'Jacobs, Sawayn and Bernhard', 26.1563289999999995, 130.479500999999999, 22, 8, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (38, 'Smith, Herman and Grant', 10.7466050000000006, 80.2505369999999942, 22, 8, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (39, 'Wilderman-Skiles', 15.2570890000000006, -104.862395000000006, 22, 8, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (40, 'Schuppe, Mayert and Kulas', -76.4728020000000015, -47.190330000000003, 22, 8, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (41, 'Kessler, Witting and O''Hara', 42.3038949999999971, 34.2558429999999987, 26, 9, 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (42, 'Breitenberg Group', 39.3450309999999988, -165.894966000000011, 26, 9, 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (43, 'Hills, Mertz and Torphy', -85.5495229999999935, -7.20302699999999962, 26, 9, 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (44, 'Quigley LLC', 61.9555119999999988, 110.821385000000006, 26, 9, 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (45, 'Paucek-Konopelski', 43.3976359999999985, -24.9034499999999994, 26, 9, 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (46, 'Walsh Ltd', -72.2693830000000048, 66.7829550000000012, 29, 10, 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (47, 'McDermott Ltd', 63.0437089999999998, -25.2358049999999992, 29, 10, 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (48, 'Yost-Goldner', -88.1598249999999979, 68.2592199999999991, 29, 10, 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (49, 'Mayer, Pfeffer and Boyer', -23.0909079999999989, 74.1445020000000028, 29, 10, 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (50, 'Olson, Padberg and Hintz', -70.6874329999999986, -93.6518640000000033, 29, 10, 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 182
-- Name: court_complexes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('court_complexes_id_seq', 50, true);


--
-- TOC entry 2271 (class 0 OID 286516)
-- Dependencies: 185
-- Data for Name: courts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (1, 'dignissimos', 5, 1, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (2, 'temporibus', 5, 1, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (4, 'vel', 8, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (5, 'nemo', 8, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (6, 'odit', 8, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (8, 'blanditiis', 14, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (9, 'qui', 14, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (10, 'minima', 18, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (11, 'nesciunt', 18, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (12, 'neque', 18, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (13, 'omnis', 22, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (14, 'explicabo', 22, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (15, 'quia', 22, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (16, 'culpa', 30, 6, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (17, 'expedita', 30, 6, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (18, 'reprehenderit', 30, 6, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (19, 'in', 33, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (20, 'quidem', 33, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (21, 'ipsum', 33, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (22, 'tempora', 40, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (23, 'reiciendis', 40, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (24, 'dicta', 40, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (26, 'non', 43, 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (27, 'dolorum', 43, 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (28, 'sit', 46, 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (30, 'dolore', 46, 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (25, 'eum', 43, 12, '2019-06-17 06:27:06', '2019-06-24 09:51:25');
INSERT INTO courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (3, 'atque', 25, 11, '2019-06-17 06:27:05', '2019-07-25 05:58:59');


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 184
-- Name: courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('courts_id_seq', 30, true);


--
-- TOC entry 2297 (class 0 OID 321642)
-- Dependencies: 211
-- Data for Name: dairies; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO dairies (id, jo_code, date_of_schedule, description, created_at, updated_at) VALUES (2, 'WB007', '2019-03-07', '<h3>All the <b><i>best</i></b></h3>', '2019-07-24 00:00:00', '2019-07-24 00:00:00');
INSERT INTO dairies (id, jo_code, date_of_schedule, description, created_at, updated_at) VALUES (5, 'WB007', '2019-02-07', '<p><b>bhvbv﻿</b><b></b></p>', '2019-07-24 00:00:00', '2019-07-24 00:00:00');
INSERT INTO dairies (id, jo_code, date_of_schedule, description, created_at, updated_at) VALUES (15, 'WB007', '2019-10-07', '<p>Hello world !! This is direct from <b></b><b>Chandrayan II</b><b></b></p>', '2019-07-31 00:00:00', '2019-07-31 00:00:00');
INSERT INTO dairies (id, jo_code, date_of_schedule, description, created_at, updated_at) VALUES (18, 'WB007', '2019-11-07', '<p>CHANDRAYAN II</p>', '2019-07-31 00:00:00', '2019-07-31 00:00:00');


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 210
-- Name: dairies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dairies_id_seq', 18, true);


--
-- TOC entry 2277 (class 0 OID 286566)
-- Dependencies: 191
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (1, 'Transportation Manager', 1, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (2, 'CFO', 1, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (3, 'Construction Laborer', 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (4, 'Ship Captain', 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (5, 'Business Teacher', 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (6, 'Administrative Law Judge', 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (7, 'Corporate Trainer', 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (8, 'Tree Trimmer', 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (9, 'Plating Operator OR Coating Machine Operator', 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (10, 'Electronic Drafter', 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (11, 'Medical Laboratory Technologist', 6, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (12, 'Real Estate Association Manager', 6, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (13, 'Biological Scientist', 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (14, 'Law Enforcement Teacher', 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (15, 'Supervisor Fire Fighting Worker', 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (16, 'Ticket Agent', 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (17, 'Correspondence Clerk', 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (18, 'Entertainer and Performer', 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (19, 'Central Office Operator', 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (20, 'Wellhead Pumper', 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (23, 'demo3', 11, '2019-06-28 10:12:57', '2019-06-28 10:12:57');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (24, 'demo6', 11, '2019-06-28 10:14:10', '2019-07-03 09:21:23');


--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 190
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('designations_id_seq', 24, true);


--
-- TOC entry 2265 (class 0 OID 286451)
-- Dependencies: 179
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (1, 'Ullrichmouth', 2, 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (2, 'East Omariside', 2, 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (3, 'South Lucinda', 2, 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (4, 'West Alexys', 7, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (5, 'Lavonnestad', 7, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (6, 'O''Haraport', 7, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (7, 'Schambergerberg', 11, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (8, 'North Elzabury', 11, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (9, 'Schneiderview', 11, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (10, 'Port Helenafort', 17, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (11, 'West Elta', 17, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (12, 'Trantowborough', 17, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (13, 'South Eldred', 24, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (14, 'Effertzville', 24, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (15, 'South Nathanaelview', 24, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (16, 'Port Judy', 30, 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (17, 'Zboncakfort', 30, 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (18, 'West Magnusview', 30, 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (19, 'Graceview', 31, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (20, 'West Monteborough', 31, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (21, 'South Westleyborough', 31, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (22, 'O''Harastad', 38, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (23, 'Veronaside', 38, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (25, 'Lake Pattiefort', 44, 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (26, 'Koreyburgh', 44, 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (27, 'Marionstad', 44, 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (28, 'Lake Mitchellfort', 48, 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (29, 'Norrisville', 48, 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (30, 'West Madelynnhaven', 48, 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (24, 'Doyleland', 38, 11, '2019-06-17 06:27:06', '2019-06-29 08:15:46');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (36, 'Kolkata', 51, 11, '2019-07-10 06:27:59', '2019-07-10 06:27:59');


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 178
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('districts_id_seq', 36, true);


--
-- TOC entry 2295 (class 0 OID 311058)
-- Dependencies: 209
-- Data for Name: jo_photos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 208
-- Name: jo_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('jo_photos_id_seq', 1, false);


--
-- TOC entry 2287 (class 0 OID 286684)
-- Dependencies: 201
-- Data for Name: jo_reporting_reviewings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO jo_reporting_reviewings (id, judicial_officer_id, reporting_officer_id, reviewing_officer_id, from_date, to_date, created_by, created_at, updated_at) VALUES (3, 2, 1, 4, '2012-12-01', '2012-12-01', 1, NULL, NULL);
INSERT INTO jo_reporting_reviewings (id, judicial_officer_id, reporting_officer_id, reviewing_officer_id, from_date, to_date, created_by, created_at, updated_at) VALUES (2, 1, 1, 3, '2012-12-01', '2012-12-01', 11, NULL, '2019-07-01 12:17:20');


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 200
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('jo_reporting_reviewings_id_seq', 2, true);


--
-- TOC entry 2291 (class 0 OID 286769)
-- Dependencies: 205
-- Data for Name: judicial_officer_posting_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (7, 1, 8, 11, '2019-06-28 11:14:24', '2019-06-28 11:14:24');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (10, 4, 8, 11, '2019-06-28 11:28:50', '2019-06-28 11:28:50');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (11, 4, 6, 11, '2019-06-28 11:33:08', '2019-06-28 11:33:08');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (13, 4, 3, 11, '2019-06-28 11:37:31', '2019-06-28 11:37:31');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (14, 3, 7, 11, '2019-06-28 11:39:59', '2019-06-28 11:39:59');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (15, 4, 6, 11, '2019-06-28 11:41:07', '2019-06-28 11:41:07');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (16, 3, 9, 11, '2019-06-28 11:44:11', '2019-06-28 11:44:11');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (19, 4, 8, 11, '2019-06-29 05:50:17', '2019-07-01 08:22:40');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (21, 2, 10, 11, '2019-07-03 08:30:03', '2019-07-03 08:30:03');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (22, 11, 8, 11, '2019-07-16 08:14:17', '2019-07-16 08:14:17');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (23, 11, 1, 11, '2019-07-16 08:14:17', '2019-07-16 08:14:17');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (24, 11, 1, 11, '2019-07-19 05:49:20', '2019-07-19 05:49:20');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (25, 11, 6, 11, '2019-07-19 05:49:20', '2019-07-19 05:49:20');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (57, 11, 8, 11, '2019-07-23 06:38:54', '2019-07-23 06:38:54');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (58, 11, 1, 11, '2019-07-23 06:38:54', '2019-07-23 06:38:54');


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 204
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officer_posting_preferences_id_seq', 58, true);


--
-- TOC entry 2293 (class 0 OID 310977)
-- Dependencies: 207
-- Data for Name: judicial_officer_postings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (3, 11, 8, 27, 43, 2, '2016-03-05', '2017-03-04', 1, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (4, 11, 7, 24, 40, 2, '2014-03-05', '2016-03-04', 1, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (2, 11, 2, 30, 46, 2, '2019-03-05', NULL, 1, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (5, 13, 7, 24, 40, 2, '2014-03-05', '2016-03-04', 1, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (6, 12, 3, 1, 5, 1, '2015-02-05', '2017-02-04', 1, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (1, 12, 1, 30, 46, 1, '2017-02-05', NULL, 1, NULL, NULL);


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 206
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officer_postings_id_seq', 1, false);


--
-- TOC entry 2285 (class 0 OID 286659)
-- Dependencies: 199
-- Data for Name: judicial_officer_qualifications; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 198
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officer_qualifications_id_seq', 1, false);


--
-- TOC entry 2283 (class 0 OID 286611)
-- Dependencies: 197
-- Data for Name: judicial_officers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO judicial_officers (id, officer_name, guardian_name, gurdian_relation, jo_code, date_of_birth, date_of_joining, date_of_confirmation, date_of_retirement, present_address, permanent_address, hometown, home_district_id, home_state_id, caste_id, religion_id, recruitment_batch_id, aadhaar_no, pan_no, pf_no, blood_group, identification_marks_1, identification_marks_2, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, reporting_officer_id, reviewing_officer_id, created_at, updated_at, photo_id) VALUES (1, 'Amitabha Das', 'Sumitava Das', 'Father', 'WB126', '1975-02-25', '2000-01-25', '2005-01-01', '2035-02-28', 'Rabindra Pally, Kestopur, Kolkata-700058', 'Rabindra Pally, Kestopur, Kolkata-700058', 'Kolkata', 5, 7, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '9876543210', '', NULL, 'abc@abc.abc', '', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO judicial_officers (id, officer_name, guardian_name, gurdian_relation, jo_code, date_of_birth, date_of_joining, date_of_confirmation, date_of_retirement, present_address, permanent_address, hometown, home_district_id, home_state_id, caste_id, religion_id, recruitment_batch_id, aadhaar_no, pan_no, pf_no, blood_group, identification_marks_1, identification_marks_2, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, reporting_officer_id, reviewing_officer_id, created_at, updated_at, photo_id) VALUES (2, 'Test1', 'G Test1', 'Father', 'WB001', '1975-02-25', '2000-01-25', '2005-01-01', '2035-02-28', 'Rabindra Pally, Kestopur, Kolkata-700058', 'Rabindra Pally, Kestopur, Kolkata-700058', 'Kolkata', 5, 7, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '9876543210', '', NULL, 'abc@abc.abc', '', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO judicial_officers (id, officer_name, guardian_name, gurdian_relation, jo_code, date_of_birth, date_of_joining, date_of_confirmation, date_of_retirement, present_address, permanent_address, hometown, home_district_id, home_state_id, caste_id, religion_id, recruitment_batch_id, aadhaar_no, pan_no, pf_no, blood_group, identification_marks_1, identification_marks_2, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, reporting_officer_id, reviewing_officer_id, created_at, updated_at, photo_id) VALUES (3, 'Test2', 'G Test2', 'Mother', 'WB002', '1975-02-25', '2000-01-25', '2005-01-01', '2035-02-28', 'Rabindra Pally, Kestopur, Kolkata-700058', 'Rabindra Pally, Kestopur, Kolkata-700058', 'Kolkata', 5, 7, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '9876543210', '', NULL, 'abc@abc.abc', '', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO judicial_officers (id, officer_name, guardian_name, gurdian_relation, jo_code, date_of_birth, date_of_joining, date_of_confirmation, date_of_retirement, present_address, permanent_address, hometown, home_district_id, home_state_id, caste_id, religion_id, recruitment_batch_id, aadhaar_no, pan_no, pf_no, blood_group, identification_marks_1, identification_marks_2, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, reporting_officer_id, reviewing_officer_id, created_at, updated_at, photo_id) VALUES (4, 'Test3', 'G Test3', 'Mother', 'WB003', '1975-02-25', '2000-01-25', '2005-01-01', '2035-02-28', 'Rabindra Pally, Kestopur, Kolkata-700058', 'Rabindra Pally, Kestopur, Kolkata-700058', 'Kolkata', 5, 7, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '9876543210', '', NULL, 'abc@abc.abc', '', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO judicial_officers (id, officer_name, guardian_name, gurdian_relation, jo_code, date_of_birth, date_of_joining, date_of_confirmation, date_of_retirement, present_address, permanent_address, hometown, home_district_id, home_state_id, caste_id, religion_id, recruitment_batch_id, aadhaar_no, pan_no, pf_no, blood_group, identification_marks_1, identification_marks_2, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, reporting_officer_id, reviewing_officer_id, created_at, updated_at, photo_id) VALUES (12, 'Anabil Bhattacharya', 'S Bose', 'Mother', 'WB009', '1990-12-31', '2013-05-19', '2013-05-19', '2065-05-04', 'Belghoria ', 'Belghoria ', 'Kolkata', 11, 17, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, '1234567891', NULL, NULL, 'banabil90@gmail.com', NULL, NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO judicial_officers (id, officer_name, guardian_name, gurdian_relation, jo_code, date_of_birth, date_of_joining, date_of_confirmation, date_of_retirement, present_address, permanent_address, hometown, home_district_id, home_state_id, caste_id, religion_id, recruitment_batch_id, aadhaar_no, pan_no, pf_no, blood_group, identification_marks_1, identification_marks_2, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, reporting_officer_id, reviewing_officer_id, created_at, updated_at, photo_id) VALUES (13, 'Arpan', 'A K Roy', 'Father', 'WB012', '1987-01-14', '2010-05-03', '2012-05-12', '2047-02-04', 'hello', '73A Amherst Row, Kolkata 9', 'Kolkata', 36, 51, 1, 1, 5, NULL, NULL, NULL, 'A+', NULL, NULL, '9830982655', NULL, NULL, 'arpanroy1987@gmail.com', NULL, NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO judicial_officers (id, officer_name, guardian_name, gurdian_relation, jo_code, date_of_birth, date_of_joining, date_of_confirmation, date_of_retirement, present_address, permanent_address, hometown, home_district_id, home_state_id, caste_id, religion_id, recruitment_batch_id, aadhaar_no, pan_no, pf_no, blood_group, identification_marks_1, identification_marks_2, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, reporting_officer_id, reviewing_officer_id, created_at, updated_at, photo_id) VALUES (11, 'Rupsa Bose', 'S Ghosh', 'Husband', 'WB007', '1989-03-05', '2016-09-30', '2016-09-30', '2020-09-05', 'Saltlake sector 3, kolkata 97', '73A Amherst Row, Kolkata 9', 'Kolkata', 36, 51, 1, 1, 5, NULL, NULL, NULL, 'A+', NULL, NULL, '9830982655', NULL, NULL, 'rupsa@rupsa.rupsa', NULL, NULL, 12, 11, NULL, NULL, NULL);


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 196
-- Name: judicial_officers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officers_id_seq', 4, true);


--
-- TOC entry 2256 (class 0 OID 266867)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO migrations (id, migration, batch) VALUES (577, '2014_10_12_000000_create_users_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (578, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (579, '2019_06_12_000005_create_states_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (580, '2019_06_12_000010_create_zones_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (581, '2019_06_12_000020_create_districts_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (582, '2019_06_12_000025_create_subdivisions_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (583, '2019_06_12_000030_create_court_complexes_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (584, '2019_06_12_000040_create_courts_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (585, '2019_06_12_000050_create_qualifications_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (586, '2019_06_12_000060_create_castes_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (587, '2019_06_12_000070_create_designations_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (588, '2019_06_12_000080_create_religions_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (589, '2019_06_12_000090_create_recruitment_batches_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (590, '2019_06_12_000100_create_judicial_officers_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (591, '2019_06_13_091801_create_judicial_officer_qualifications_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (592, '2019_06_13_092954_create_jo_reporting_reviewings_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (593, '2019_06_13_093750_create_modes_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (595, '2019_06_13_101842_create_judicial_officer_posting_preferences_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (596, '2019_06_13_093852_create_judicial_officer_postings_table', 2);
INSERT INTO migrations (id, migration, batch) VALUES (599, '2019_07_15_074229_create_jo_photos_table', 4);
INSERT INTO migrations (id, migration, batch) VALUES (601, '2019_07_15_082047_alter_judicial_officers', 5);
INSERT INTO migrations (id, migration, batch) VALUES (602, '2019_07_15_072014_alter_users', 6);
INSERT INTO migrations (id, migration, batch) VALUES (604, '2019_07_22_064308_create_dairies_table', 7);


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 169
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('migrations_id_seq', 604, true);


--
-- TOC entry 2289 (class 0 OID 286714)
-- Dependencies: 203
-- Data for Name: modes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO modes (id, posting_mode, created_by, created_at, updated_at) VALUES (1, 'Transfer', 1, NULL, NULL);
INSERT INTO modes (id, posting_mode, created_by, created_at, updated_at) VALUES (2, 'Promotion', 1, NULL, NULL);
INSERT INTO modes (id, posting_mode, created_by, created_at, updated_at) VALUES (9, 'Deputation1', 11, '2019-07-01 11:24:25', '2019-07-01 11:24:38');


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 202
-- Name: modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('modes_id_seq', 9, true);


--
-- TOC entry 2259 (class 0 OID 286412)
-- Dependencies: 173
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO password_resets (email, token, created_at) VALUES ('banabil90@gmail.com', '$2y$10$SyYTnMAUdAWOtCMHLjPKfesTpVjIb6WaogBUga8vayAjqzc73hvjS', '2019-06-19 06:04:48');


--
-- TOC entry 2273 (class 0 OID 286536)
-- Dependencies: 187
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (5, 'BCom', 11, '2019-06-25 07:18:30', '2019-06-25 07:18:30');
INSERT INTO qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (7, 'MA LLB', 11, '2019-06-25 07:18:47', '2019-06-25 07:18:47');
INSERT INTO qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (8, 'BA LLB', 11, '2019-06-28 09:50:19', '2019-07-01 10:14:25');
INSERT INTO qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (10, 'M.Sc', 11, '2019-07-01 11:25:58', '2019-07-01 11:27:09');


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 186
-- Name: qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('qualifications_id_seq', 10, true);


--
-- TOC entry 2281 (class 0 OID 286596)
-- Dependencies: 195
-- Data for Name: recruitment_batches; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (5, 'psc 2011', 2011, 11, '2019-06-26 11:49:37', '2019-06-26 11:49:37');
INSERT INTO recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (8, 'CLAT 2011', 2003, 11, '2019-06-26 11:55:19', '2019-06-26 11:57:00');
INSERT INTO recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (1, 'PSC 2000', 2000, 11, NULL, '2019-06-29 08:58:19');


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 194
-- Name: recruitment_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recruitment_batches_id_seq', 14, true);


--
-- TOC entry 2279 (class 0 OID 286581)
-- Dependencies: 193
-- Data for Name: religions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO religions (id, religion_name, created_by, created_at, updated_at) VALUES (1, 'Hindu', 1, NULL, NULL);
INSERT INTO religions (id, religion_name, created_by, created_at, updated_at) VALUES (2, 'Muslim', 11, '2019-07-02 11:23:49', '2019-07-02 11:24:02');


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 192
-- Name: religions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('religions_id_seq', 3, true);


--
-- TOC entry 2261 (class 0 OID 286421)
-- Dependencies: 175
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (1, 'Colorado', 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (2, 'Illinois', 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (3, 'Montana', 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (4, 'New York', 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (5, 'North Dakota', 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (6, 'Maryland', 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (7, 'Rhode Island', 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (8, 'Wyoming', 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (9, 'New Jersey', 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (10, 'Nevada', 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (11, 'Arkansas', 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (12, 'Oklahoma', 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (13, 'North Carolina', 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (15, 'Kansas', 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (16, 'Pennsylvania', 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (17, 'Connecticut', 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (18, 'Nebraska', 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (19, 'Utah', 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (20, 'Texas', 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (21, 'Washington', 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (22, 'Missouri', 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (23, 'Wisconsin', 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (24, 'West Virginia', 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (25, 'District of Columbia', 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (26, 'Louisiana', 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (27, 'South Dakota', 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (28, 'California', 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (29, 'Maine', 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (30, 'Hawaii', 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (32, 'Virginia', 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (34, 'Tennessee', 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (35, 'New Mexico', 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (36, 'Indiana', 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (37, 'Oregon', 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (38, 'Kentucky', 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (39, 'Ohio', 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (40, 'Vermont', 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (41, 'Georgia', 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (42, 'Idaho', 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (43, 'Michigan', 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (44, 'Florida', 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (45, 'New Hampshire', 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (46, 'Delaware', 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (47, 'Iowa', 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (48, 'Massachusetts', 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (49, 'Mississippi', 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (50, 'Minnesota', 10, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (51, 'West Bengal', 1, '2019-06-18 10:06:22', '2019-06-18 10:06:22');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (52, 'Bihar', 1, '2019-06-18 10:10:49', '2019-06-18 10:10:49');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (31, 'Alabama', 1, '2019-06-17 06:27:06', '2019-06-19 09:53:56');


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 174
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('states_id_seq', 67, true);


--
-- TOC entry 2267 (class 0 OID 286471)
-- Dependencies: 181
-- Data for Name: subdivisions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (1, 'saepe', 2, 1, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (3, 'ut', 2, 1, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (7, 'quasi', 5, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (8, 'quo', 5, 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (9, 'soluta', 7, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (11, 'sunt', 7, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (12, 'molestiae', 7, 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (13, 'provident', 10, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (14, 'suscipit', 10, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (16, 'quae', 10, 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (17, 'quisquam', 13, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (19, 'voluptatem', 13, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (20, 'recusandae', 13, 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (21, 'voluptates', 17, 6, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (25, 'voluptatum', 19, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (26, 'sint', 19, 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (31, 'similique', 24, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (32, 'nostrum', 24, 8, '2019-06-17 06:27:06', '2019-06-17 06:27:06');


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 180
-- Name: subdivisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('subdivisions_id_seq', 43, true);


--
-- TOC entry 2258 (class 0 OID 286401)
-- Dependencies: 172
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (1, 'Ari Kerluke V', 'justice61@example.org', '2019-06-17 06:27:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '30pq7Fz33H', '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (2, 'Allene Jacobs', 'schultz.idell@example.com', '2019-06-17 06:27:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ff9OiYoYez', '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (3, 'Enid Gerhold', 'cstrosin@example.com', '2019-06-17 06:27:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '33tsPrwVXK', '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (4, 'Aylin Stamm', 'pschultz@example.net', '2019-06-17 06:27:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'N8V5Y6gEJM', '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (5, 'Diego Beer', 'rpowlowski@example.org', '2019-06-17 06:27:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2CAdrId8UG', '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (6, 'Prof. Jameson Fisher DDS', 'hester.champlin@example.com', '2019-06-17 06:27:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5SrdtNiVEF', '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (7, 'Dereck Cummerata V', 'thalia65@example.net', '2019-06-17 06:27:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cIHO8grDan', '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (8, 'Bonita Macejkovic Jr.', 'qbernhard@example.org', '2019-06-17 06:27:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GyAa89LtpH', '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (9, 'Augustus Koch', 'rritchie@example.net', '2019-06-17 06:27:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'K4aWP36W4S', '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (10, 'Ms. Lela Zieme', 'addie.friesen@example.net', '2019-06-17 06:27:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TY2WNlqNGi', '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (11, 'Rupsa Bose', 'rupsa@rupsa.rupsa', NULL, '$2y$10$or1dBRoI3FxqDddrMTwDEO9MOo5MuHRX8EpLNPRd6Q94VU76L2rUy', 'j8ztlKap65uF0CMt6bWHd7aS2uYjIZyTlRyVf5EKyWXvhlP9ERJ7yCNXMuOK', '2019-06-19 06:00:07', '2019-06-19 06:00:07', NULL, NULL, NULL, NULL, 'WB007');
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (12, 'Anabil Bhattacharya', 'banabil90@gmail.com', NULL, '$2y$10$SOW.J6WHttO1dhhf8u/2M.zdaiIVTygGyL03ZNLejwcPW8cmPj3Yq', NULL, '2019-06-19 06:04:30', '2019-06-19 06:04:30', NULL, NULL, NULL, NULL, 'WB009');
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, district_id, zone_id, judicial_officer_id, jo_code) VALUES (13, 'Arpan', 'arpanroy1987@gmail.com', NULL, '$2y$10$SOW.J6WHttO1dhhf8u/2M.zdaiIVTygGyL03ZNLejwcPW8cmPj3Yq', NULL, '2019-06-19 06:04:30', '2019-06-19 06:04:30', NULL, NULL, NULL, NULL, 'WB012');


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 171
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 12, true);


--
-- TOC entry 2263 (class 0 OID 286436)
-- Dependencies: 177
-- Data for Name: zones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (1, 'g', 1, '2019-06-17 06:27:04', '2019-06-17 06:27:04', 547);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (3, 'v', 3, '2019-06-17 06:27:05', '2019-06-17 06:27:05', 730);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (5, 'x', 5, '2019-06-17 06:27:05', '2019-06-17 06:27:05', 730);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (7, 'w', 7, '2019-06-17 06:27:06', '2019-06-17 06:27:06', 730);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (9, 'h', 9, '2019-06-17 06:27:06', '2019-06-17 06:27:06', 730);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (11, 'we', 11, '2019-06-24 07:15:24', '2019-06-24 07:15:24', 730);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (22, 's1', 11, '2019-07-03 07:38:06', '2019-07-03 07:38:06', 730);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (2, 'n', 2, '2019-06-17 06:27:05', '2019-06-17 06:27:05', 913);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (4, 'y', 4, '2019-06-17 06:27:05', '2019-06-17 06:27:05', 547);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (6, 'k', 6, '2019-06-17 06:27:05', '2019-06-17 06:27:05', 913);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (12, 'zap', 11, '2019-07-01 11:37:00', '2019-07-01 11:37:16', 913);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (10, 'e', 11, '2019-06-17 06:27:06', '2019-07-03 07:19:55', 47);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (8, 'd', 11, '2019-06-17 06:27:06', '2019-07-03 07:20:01', 91);


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 176
-- Name: zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('zones_id_seq', 25, true);


--
-- TOC entry 2062 (class 2606 OID 286563)
-- Name: castes_caste_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY castes
    ADD CONSTRAINT castes_caste_name_unique UNIQUE (caste_name);


--
-- TOC entry 2064 (class 2606 OID 286556)
-- Name: castes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY castes
    ADD CONSTRAINT castes_pkey PRIMARY KEY (id);


--
-- TOC entry 2050 (class 2606 OID 286513)
-- Name: court_complexes_court_complex_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_court_complex_name_unique UNIQUE (court_complex_name);


--
-- TOC entry 2052 (class 2606 OID 286496)
-- Name: court_complexes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_pkey PRIMARY KEY (id);


--
-- TOC entry 2054 (class 2606 OID 286533)
-- Name: courts_court_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courts
    ADD CONSTRAINT courts_court_name_unique UNIQUE (court_name);


--
-- TOC entry 2056 (class 2606 OID 286521)
-- Name: courts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courts
    ADD CONSTRAINT courts_pkey PRIMARY KEY (id);


--
-- TOC entry 2102 (class 2606 OID 321650)
-- Name: dairies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dairies
    ADD CONSTRAINT dairies_pkey PRIMARY KEY (id);


--
-- TOC entry 2066 (class 2606 OID 286578)
-- Name: designations_designation_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY designations
    ADD CONSTRAINT designations_designation_name_unique UNIQUE (designation_name);


--
-- TOC entry 2068 (class 2606 OID 286571)
-- Name: designations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 286468)
-- Name: districts_district_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_district_name_unique UNIQUE (district_name);


--
-- TOC entry 2044 (class 2606 OID 286456)
-- Name: districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- TOC entry 2100 (class 2606 OID 311066)
-- Name: jo_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_photos
    ADD CONSTRAINT jo_photos_pkey PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 286689)
-- Name: jo_reporting_reviewings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_pkey PRIMARY KEY (id);


--
-- TOC entry 2094 (class 2606 OID 286774)
-- Name: judicial_officer_posting_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 2096 (class 2606 OID 310984)
-- Name: judicial_officer_postings_judicial_officer_id_designation_id_co; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_judicial_officer_id_designation_id_co UNIQUE (judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date);


--
-- TOC entry 2098 (class 2606 OID 310982)
-- Name: judicial_officer_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_pkey PRIMARY KEY (id);


--
-- TOC entry 2082 (class 2606 OID 286664)
-- Name: judicial_officer_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2078 (class 2606 OID 286656)
-- Name: judicial_officers_jo_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_jo_code_unique UNIQUE (jo_code);


--
-- TOC entry 2080 (class 2606 OID 286619)
-- Name: judicial_officers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_pkey PRIMARY KEY (id);


--
-- TOC entry 2027 (class 2606 OID 266872)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2090 (class 2606 OID 286719)
-- Name: modes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY modes
    ADD CONSTRAINT modes_pkey PRIMARY KEY (id);


--
-- TOC entry 2092 (class 2606 OID 286726)
-- Name: modes_posting_mode_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY modes
    ADD CONSTRAINT modes_posting_mode_unique UNIQUE (posting_mode);


--
-- TOC entry 2084 (class 2606 OID 286666)
-- Name: qualification_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications
    ADD CONSTRAINT qualification_id UNIQUE (judicial_officer_id);


--
-- TOC entry 2058 (class 2606 OID 286541)
-- Name: qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY qualifications
    ADD CONSTRAINT qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2060 (class 2606 OID 286548)
-- Name: qualifications_qualification_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY qualifications
    ADD CONSTRAINT qualifications_qualification_name_unique UNIQUE (qualification_name);


--
-- TOC entry 2074 (class 2606 OID 286601)
-- Name: recruitment_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recruitment_batches
    ADD CONSTRAINT recruitment_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 2076 (class 2606 OID 286608)
-- Name: recruitment_batches_recruitment_batch_desc_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recruitment_batches
    ADD CONSTRAINT recruitment_batches_recruitment_batch_desc_unique UNIQUE (recruitment_batch_desc);


--
-- TOC entry 2070 (class 2606 OID 286586)
-- Name: religions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religions_pkey PRIMARY KEY (id);


--
-- TOC entry 2072 (class 2606 OID 286593)
-- Name: religions_religion_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religions_religion_name_unique UNIQUE (religion_name);


--
-- TOC entry 2088 (class 2606 OID 286691)
-- Name: reporting_officer_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT reporting_officer_id UNIQUE (judicial_officer_id);


--
-- TOC entry 2034 (class 2606 OID 286426)
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 286433)
-- Name: states_state_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_state_name_unique UNIQUE (state_name);


--
-- TOC entry 2046 (class 2606 OID 286476)
-- Name: subdivisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subdivisions
    ADD CONSTRAINT subdivisions_pkey PRIMARY KEY (id);


--
-- TOC entry 2048 (class 2606 OID 286488)
-- Name: subdivisions_subdivision_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subdivisions
    ADD CONSTRAINT subdivisions_subdivision_name_unique UNIQUE (subdivision_name);


--
-- TOC entry 2029 (class 2606 OID 286411)
-- Name: users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2031 (class 2606 OID 286409)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 286441)
-- Name: zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 286448)
-- Name: zones_zone_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_zone_name_unique UNIQUE (zone_name);


--
-- TOC entry 2032 (class 1259 OID 286418)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX password_resets_email_index ON password_resets USING btree (email);


--
-- TOC entry 2120 (class 2606 OID 286557)
-- Name: castes_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY castes
    ADD CONSTRAINT castes_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2115 (class 2606 OID 286507)
-- Name: court_complexes_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2113 (class 2606 OID 286497)
-- Name: court_complexes_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_district_id_foreign FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- TOC entry 2116 (class 2606 OID 322915)
-- Name: court_complexes_subdivision_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_subdivision_id FOREIGN KEY (subdivision_id) REFERENCES subdivisions(id);


--
-- TOC entry 2114 (class 2606 OID 286502)
-- Name: court_complexes_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES zones(id);


--
-- TOC entry 2117 (class 2606 OID 286522)
-- Name: courts_court_complex_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courts
    ADD CONSTRAINT courts_court_complex_id_foreign FOREIGN KEY (court_complex_id) REFERENCES court_complexes(id);


--
-- TOC entry 2118 (class 2606 OID 286527)
-- Name: courts_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courts
    ADD CONSTRAINT courts_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2121 (class 2606 OID 286572)
-- Name: designations_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY designations
    ADD CONSTRAINT designations_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2110 (class 2606 OID 286462)
-- Name: districts_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2109 (class 2606 OID 286457)
-- Name: districts_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_state_id_foreign FOREIGN KEY (state_id) REFERENCES states(id);


--
-- TOC entry 2148 (class 2606 OID 311067)
-- Name: jo_photos_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_photos
    ADD CONSTRAINT jo_photos_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2138 (class 2606 OID 286707)
-- Name: jo_reporting_reviewings_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2135 (class 2606 OID 286692)
-- Name: jo_reporting_reviewings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2136 (class 2606 OID 286697)
-- Name: jo_reporting_reviewings_reporting_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_reporting_officer_id_foreign FOREIGN KEY (reporting_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2137 (class 2606 OID 286702)
-- Name: jo_reporting_reviewings_reviewing_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_reviewing_officer_id_foreign FOREIGN KEY (reviewing_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2141 (class 2606 OID 286785)
-- Name: judicial_officer_posting_preferences_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2140 (class 2606 OID 286775)
-- Name: judicial_officer_posting_preferences_judicial_officer_id_foreig; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_judicial_officer_id_foreig FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2145 (class 2606 OID 311000)
-- Name: judicial_officer_postings_court_complex_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_court_complex_id_foreign FOREIGN KEY (court_complex_id) REFERENCES court_complexes(id);


--
-- TOC entry 2144 (class 2606 OID 310995)
-- Name: judicial_officer_postings_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_court_id_foreign FOREIGN KEY (court_id) REFERENCES courts(id);


--
-- TOC entry 2147 (class 2606 OID 311010)
-- Name: judicial_officer_postings_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2143 (class 2606 OID 310990)
-- Name: judicial_officer_postings_designation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_designation_id_foreign FOREIGN KEY (designation_id) REFERENCES designations(id);


--
-- TOC entry 2142 (class 2606 OID 310985)
-- Name: judicial_officer_postings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2146 (class 2606 OID 311005)
-- Name: judicial_officer_postings_mode_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_mode_id_foreign FOREIGN KEY (mode_id) REFERENCES modes(id);


--
-- TOC entry 2134 (class 2606 OID 286677)
-- Name: judicial_officer_qualifications_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2132 (class 2606 OID 286667)
-- Name: judicial_officer_qualifications_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2133 (class 2606 OID 286672)
-- Name: judicial_officer_qualifications_qualification_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_qualification_id_foreign FOREIGN KEY (qualification_id) REFERENCES qualifications(id);


--
-- TOC entry 2126 (class 2606 OID 286630)
-- Name: judicial_officers_caste_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_caste_id_foreign FOREIGN KEY (caste_id) REFERENCES castes(id);


--
-- TOC entry 2124 (class 2606 OID 286620)
-- Name: judicial_officers_home_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_home_district_id_foreign FOREIGN KEY (home_district_id) REFERENCES districts(id);


--
-- TOC entry 2125 (class 2606 OID 286625)
-- Name: judicial_officers_home_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_home_state_id_foreign FOREIGN KEY (home_state_id) REFERENCES states(id);


--
-- TOC entry 2131 (class 2606 OID 311077)
-- Name: judicial_officers_photo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_photo_id_foreign FOREIGN KEY (photo_id) REFERENCES jo_photos(id);


--
-- TOC entry 2128 (class 2606 OID 286640)
-- Name: judicial_officers_recruitment_batch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_recruitment_batch_id_foreign FOREIGN KEY (recruitment_batch_id) REFERENCES recruitment_batches(id);


--
-- TOC entry 2127 (class 2606 OID 286635)
-- Name: judicial_officers_religion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_religion_id_foreign FOREIGN KEY (religion_id) REFERENCES religions(id);


--
-- TOC entry 2129 (class 2606 OID 286645)
-- Name: judicial_officers_reporting_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_reporting_officer_id_foreign FOREIGN KEY (reporting_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2130 (class 2606 OID 286650)
-- Name: judicial_officers_reviewing_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_reviewing_officer_id_foreign FOREIGN KEY (reviewing_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2139 (class 2606 OID 286720)
-- Name: modes_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY modes
    ADD CONSTRAINT modes_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2119 (class 2606 OID 286542)
-- Name: qualifications_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY qualifications
    ADD CONSTRAINT qualifications_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2123 (class 2606 OID 286602)
-- Name: recruitment_batches_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recruitment_batches
    ADD CONSTRAINT recruitment_batches_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2122 (class 2606 OID 286587)
-- Name: religions_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religions_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2107 (class 2606 OID 286427)
-- Name: states_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2112 (class 2606 OID 286482)
-- Name: subdivisions_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subdivisions
    ADD CONSTRAINT subdivisions_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2111 (class 2606 OID 286477)
-- Name: subdivisions_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subdivisions
    ADD CONSTRAINT subdivisions_district_id_foreign FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- TOC entry 2103 (class 2606 OID 311082)
-- Name: users_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_court_id_foreign FOREIGN KEY (court_id) REFERENCES courts(id);


--
-- TOC entry 2104 (class 2606 OID 311087)
-- Name: users_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_district_id_foreign FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- TOC entry 2106 (class 2606 OID 311097)
-- Name: users_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2105 (class 2606 OID 311092)
-- Name: users_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES zones(id);


--
-- TOC entry 2108 (class 2606 OID 286442)
-- Name: zones_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


-- Completed on 2019-08-02 17:15:11

--
-- PostgreSQL database dump complete
--

