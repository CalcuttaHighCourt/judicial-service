--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2019-09-08 22:52:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 26696)
-- Name: castes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.castes (
    id bigint NOT NULL,
    caste_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 197 (class 1259 OID 26699)
-- Name: castes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.castes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 197
-- Name: castes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.castes_id_seq OWNED BY public.castes.id;


--
-- TOC entry 198 (class 1259 OID 26701)
-- Name: court_complexes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.court_complexes (
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
-- TOC entry 199 (class 1259 OID 26704)
-- Name: court_complexes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.court_complexes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 199
-- Name: court_complexes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.court_complexes_id_seq OWNED BY public.court_complexes.id;


--
-- TOC entry 200 (class 1259 OID 26706)
-- Name: courts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courts (
    id bigint NOT NULL,
    court_name character varying(255) NOT NULL,
    court_complex_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 201 (class 1259 OID 26709)
-- Name: courts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 201
-- Name: courts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courts_id_seq OWNED BY public.courts.id;


--
-- TOC entry 202 (class 1259 OID 26711)
-- Name: dairies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dairies (
    id bigint NOT NULL,
    jo_code character varying(255) NOT NULL,
    date_of_schedule date NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 203 (class 1259 OID 26717)
-- Name: dairies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dairies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 203
-- Name: dairies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dairies_id_seq OWNED BY public.dairies.id;


--
-- TOC entry 204 (class 1259 OID 26719)
-- Name: designations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.designations (
    id bigint NOT NULL,
    designation_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 205 (class 1259 OID 26722)
-- Name: designations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.designations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 205
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.designations_id_seq OWNED BY public.designations.id;


--
-- TOC entry 206 (class 1259 OID 26724)
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.districts (
    id bigint NOT NULL,
    district_name character varying(255) NOT NULL,
    state_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 207 (class 1259 OID 26727)
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 207
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;


--
-- TOC entry 208 (class 1259 OID 26729)
-- Name: hc_case_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hc_case_types (
    id bigint NOT NULL,
    type_name character varying(255) NOT NULL,
    full_form character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 209 (class 1259 OID 26735)
-- Name: hc_case_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hc_case_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 209
-- Name: hc_case_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hc_case_types_id_seq OWNED BY public.hc_case_types.id;


--
-- TOC entry 210 (class 1259 OID 26737)
-- Name: jo_photos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jo_photos (
    id bigint NOT NULL,
    judicial_officer_id bigint,
    photo bytea,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 211 (class 1259 OID 26743)
-- Name: jo_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 211
-- Name: jo_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_photos_id_seq OWNED BY public.jo_photos.id;


--
-- TOC entry 248 (class 1259 OID 27756)
-- Name: jo_reporting_reviewings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jo_reporting_reviewings (
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
-- TOC entry 247 (class 1259 OID 27754)
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_reporting_reviewings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 247
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_reporting_reviewings_id_seq OWNED BY public.jo_reporting_reviewings.id;


--
-- TOC entry 212 (class 1259 OID 26750)
-- Name: judicial_officer_posting_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officer_posting_preferences (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    zone_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 213 (class 1259 OID 26753)
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_posting_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 213
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_posting_preferences_id_seq OWNED BY public.judicial_officer_posting_preferences.id;


--
-- TOC entry 214 (class 1259 OID 26755)
-- Name: judicial_officer_postings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officer_postings (
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
-- TOC entry 215 (class 1259 OID 26758)
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_postings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 215
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_postings_id_seq OWNED BY public.judicial_officer_postings.id;


--
-- TOC entry 246 (class 1259 OID 27731)
-- Name: judicial_officer_qualifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officer_qualifications (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    qualification_id bigint NOT NULL,
    passing_year integer NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 245 (class 1259 OID 27729)
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 245
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_qualifications_id_seq OWNED BY public.judicial_officer_qualifications.id;


--
-- TOC entry 244 (class 1259 OID 27665)
-- Name: judicial_officers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officers (
    id bigint NOT NULL,
    jo_code character varying(255) NOT NULL,
    officer_name character varying(255) NOT NULL,
    gender character varying(255) NOT NULL,
    guardian_name character varying(255) NOT NULL,
    gurdian_relation character varying(255) NOT NULL,
    date_of_birth date NOT NULL,
    home_state_id bigint NOT NULL,
    home_district_id bigint NOT NULL,
    hometown character varying(255) NOT NULL,
    present_address text NOT NULL,
    permanent_address text NOT NULL,
    religion_id bigint,
    category_id bigint,
    blood_group character varying(255),
    identification_mark character varying(255),
    aadhaar_no character(12),
    pan_no character(10),
    gpf_no character varying(255),
    mobile_no_1 character varying(255) NOT NULL,
    mobile_no_2 character varying(255),
    mobile_no_3 character varying(255),
    email_id_1 character varying(255) NOT NULL,
    email_id_2 character varying(255),
    email_id_3 character varying(255),
    recruitment_batch_id bigint NOT NULL,
    date_of_joining date NOT NULL,
    date_of_confirmation date NOT NULL,
    date_of_retirement date NOT NULL,
    present_reporting_officer_id bigint,
    present_reviewing_officer_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 243 (class 1259 OID 27663)
-- Name: judicial_officers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 243
-- Name: judicial_officers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officers_id_seq OWNED BY public.judicial_officers.id;


--
-- TOC entry 216 (class 1259 OID 26773)
-- Name: lcr_hc_ends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lcr_hc_ends (
    id bigint NOT NULL,
    district bigint NOT NULL,
    complex bigint NOT NULL,
    court bigint NOT NULL,
    hc_case_record bigint NOT NULL,
    hc_case_no integer NOT NULL,
    hc_case_year integer NOT NULL,
    deadline date NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 217 (class 1259 OID 26776)
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_hc_ends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 217
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_hc_ends_id_seq OWNED BY public.lcr_hc_ends.id;


--
-- TOC entry 218 (class 1259 OID 26778)
-- Name: lcr_lc_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lcr_lc_details (
    id bigint NOT NULL,
    hc_id bigint NOT NULL,
    lower_case_record bigint NOT NULL,
    lower_case_no integer NOT NULL,
    lower_case_year integer NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 219 (class 1259 OID 26781)
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_lc_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 219
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_lc_details_id_seq OWNED BY public.lcr_lc_details.id;


--
-- TOC entry 220 (class 1259 OID 26783)
-- Name: lower_case_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lower_case_types (
    id bigint NOT NULL,
    type_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 221 (class 1259 OID 26786)
-- Name: lower_case_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lower_case_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 221
-- Name: lower_case_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lower_case_types_id_seq OWNED BY public.lower_case_types.id;


--
-- TOC entry 222 (class 1259 OID 26788)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 26791)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 223
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 224 (class 1259 OID 26793)
-- Name: modes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modes (
    id bigint NOT NULL,
    posting_mode character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 225 (class 1259 OID 26796)
-- Name: modes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 225
-- Name: modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modes_id_seq OWNED BY public.modes.id;


--
-- TOC entry 226 (class 1259 OID 26798)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- TOC entry 227 (class 1259 OID 26804)
-- Name: qualifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.qualifications (
    id bigint NOT NULL,
    qualification_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 228 (class 1259 OID 26807)
-- Name: qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 228
-- Name: qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.qualifications_id_seq OWNED BY public.qualifications.id;


--
-- TOC entry 229 (class 1259 OID 26809)
-- Name: recruitment_batches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recruitment_batches (
    id bigint NOT NULL,
    recruitment_batch_desc character varying(255) NOT NULL,
    batch_year integer NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 230 (class 1259 OID 26812)
-- Name: recruitment_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recruitment_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 230
-- Name: recruitment_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recruitment_batches_id_seq OWNED BY public.recruitment_batches.id;


--
-- TOC entry 231 (class 1259 OID 26814)
-- Name: religions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.religions (
    id bigint NOT NULL,
    religion_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 232 (class 1259 OID 26817)
-- Name: religions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.religions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 232
-- Name: religions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.religions_id_seq OWNED BY public.religions.id;


--
-- TOC entry 233 (class 1259 OID 26819)
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id bigint NOT NULL,
    state_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 234 (class 1259 OID 26822)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 234
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 235 (class 1259 OID 26824)
-- Name: subdivisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subdivisions (
    id bigint NOT NULL,
    subdivision_name character varying(255) NOT NULL,
    district_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 236 (class 1259 OID 26827)
-- Name: subdivisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subdivisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 236
-- Name: subdivisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subdivisions_id_seq OWNED BY public.subdivisions.id;


--
-- TOC entry 237 (class 1259 OID 26829)
-- Name: user_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_types (
    id bigint NOT NULL,
    type_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    created_by bigint NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 26832)
-- Name: user_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 238
-- Name: user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_types_id_seq OWNED BY public.user_types.id;


--
-- TOC entry 239 (class 1259 OID 26834)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    court_id bigint,
    judicial_officer_id bigint,
    user_id character varying(50) NOT NULL,
    user_type_id bigint
);


--
-- TOC entry 240 (class 1259 OID 26840)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 240
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 241 (class 1259 OID 26842)
-- Name: zones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zones (
    id bigint NOT NULL,
    zone_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    min_service_days integer
);


--
-- TOC entry 242 (class 1259 OID 26845)
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 242
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zones_id_seq OWNED BY public.zones.id;


--
-- TOC entry 2845 (class 2604 OID 26847)
-- Name: castes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.castes ALTER COLUMN id SET DEFAULT nextval('public.castes_id_seq'::regclass);


--
-- TOC entry 2846 (class 2604 OID 26848)
-- Name: court_complexes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.court_complexes ALTER COLUMN id SET DEFAULT nextval('public.court_complexes_id_seq'::regclass);


--
-- TOC entry 2847 (class 2604 OID 26849)
-- Name: courts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts ALTER COLUMN id SET DEFAULT nextval('public.courts_id_seq'::regclass);


--
-- TOC entry 2848 (class 2604 OID 26850)
-- Name: dairies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dairies ALTER COLUMN id SET DEFAULT nextval('public.dairies_id_seq'::regclass);


--
-- TOC entry 2849 (class 2604 OID 26851)
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- TOC entry 2850 (class 2604 OID 26852)
-- Name: districts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);


--
-- TOC entry 2851 (class 2604 OID 26853)
-- Name: hc_case_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types ALTER COLUMN id SET DEFAULT nextval('public.hc_case_types_id_seq'::regclass);


--
-- TOC entry 2852 (class 2604 OID 26854)
-- Name: jo_photos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_photos ALTER COLUMN id SET DEFAULT nextval('public.jo_photos_id_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 27759)
-- Name: jo_reporting_reviewings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings ALTER COLUMN id SET DEFAULT nextval('public.jo_reporting_reviewings_id_seq'::regclass);


--
-- TOC entry 2853 (class 2604 OID 26856)
-- Name: judicial_officer_posting_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_posting_preferences_id_seq'::regclass);


--
-- TOC entry 2854 (class 2604 OID 26857)
-- Name: judicial_officer_postings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_postings_id_seq'::regclass);


--
-- TOC entry 2869 (class 2604 OID 27734)
-- Name: judicial_officer_qualifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_qualifications_id_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 27668)
-- Name: judicial_officers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers ALTER COLUMN id SET DEFAULT nextval('public.judicial_officers_id_seq'::regclass);


--
-- TOC entry 2855 (class 2604 OID 26860)
-- Name: lcr_hc_ends id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends ALTER COLUMN id SET DEFAULT nextval('public.lcr_hc_ends_id_seq'::regclass);


--
-- TOC entry 2856 (class 2604 OID 26861)
-- Name: lcr_lc_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details ALTER COLUMN id SET DEFAULT nextval('public.lcr_lc_details_id_seq'::regclass);


--
-- TOC entry 2857 (class 2604 OID 26862)
-- Name: lower_case_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types ALTER COLUMN id SET DEFAULT nextval('public.lower_case_types_id_seq'::regclass);


--
-- TOC entry 2858 (class 2604 OID 26863)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2859 (class 2604 OID 26864)
-- Name: modes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes ALTER COLUMN id SET DEFAULT nextval('public.modes_id_seq'::regclass);


--
-- TOC entry 2860 (class 2604 OID 26865)
-- Name: qualifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications ALTER COLUMN id SET DEFAULT nextval('public.qualifications_id_seq'::regclass);


--
-- TOC entry 2861 (class 2604 OID 26866)
-- Name: recruitment_batches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches ALTER COLUMN id SET DEFAULT nextval('public.recruitment_batches_id_seq'::regclass);


--
-- TOC entry 2862 (class 2604 OID 26867)
-- Name: religions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.religions ALTER COLUMN id SET DEFAULT nextval('public.religions_id_seq'::regclass);


--
-- TOC entry 2863 (class 2604 OID 26868)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 2864 (class 2604 OID 26869)
-- Name: subdivisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions ALTER COLUMN id SET DEFAULT nextval('public.subdivisions_id_seq'::regclass);


--
-- TOC entry 2865 (class 2604 OID 26870)
-- Name: user_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_types ALTER COLUMN id SET DEFAULT nextval('public.user_types_id_seq'::regclass);


--
-- TOC entry 2866 (class 2604 OID 26871)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2867 (class 2604 OID 26872)
-- Name: zones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones ALTER COLUMN id SET DEFAULT nextval('public.zones_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 26696)
-- Dependencies: 196
-- Data for Name: castes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.castes (id, caste_name, created_by, created_at, updated_at) VALUES (1, 'General', 11, NULL, NULL);
INSERT INTO public.castes (id, caste_name, created_by, created_at, updated_at) VALUES (2, 'Scheduled Caste', 11, '2019-07-02 06:58:28', '2019-07-02 06:58:28');
INSERT INTO public.castes (id, caste_name, created_by, created_at, updated_at) VALUES (3, 'Scheduled Tribe', 11, '2019-07-02 07:41:15', '2019-07-03 08:42:41');


--
-- TOC entry 3147 (class 0 OID 26701)
-- Dependencies: 198
-- Data for Name: court_complexes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (1, 'Grant, Legros and Feest', 59.4822750000000013, -96.1092660000000052, 2, 1, 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (2, 'Yost, Kiehn and Bins', -79.1505310000000009, 133.192214000000007, 2, 1, 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (3, 'O''Reilly, Reichert and White', -76.6286429999999967, -100.417776000000003, 2, 1, 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (4, 'Goldner, Swaniawski and Lockman', -11.1408070000000006, -16.4666139999999999, 2, 1, 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (5, 'Tillman, Barton and Durgan', -58.146720000000002, 119.634581999999995, 2, 1, 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (6, 'Homenick-Schuppe', -84.0189189999999968, 76.7095510000000047, 5, 2, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (7, 'Morar and Sons', 54.6449149999999975, -152.375288000000012, 5, 2, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (8, 'Mraz Ltd', 24.8595149999999983, 91.8884549999999933, 5, 2, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (9, 'Lebsack-Harris', 27.8115750000000013, -149.116534000000001, 5, 2, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (10, 'Stehr-Stiedemann', -54.9181129999999982, 92.4165420000000069, 5, 2, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (11, 'Cartwright-Bogan', -63.101309999999998, 102.337888000000007, 8, 3, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (12, 'Torphy, Durgan and Rosenbaum', 9.79833400000000054, -16.7841440000000013, 8, 3, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (13, 'Balistreri, Zboncak and Will', 77.9417799999999943, 90.160460999999998, 8, 3, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (14, 'Schaefer-Altenwerth', 22.2785019999999996, -79.8903300000000058, 8, 3, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (15, 'Streich PLC', 18.1639869999999988, 107.879433000000006, 8, 3, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (16, 'Cronin-Okuneva', 25.0479979999999998, -170.069302999999991, 11, 4, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (17, 'Fisher-Waters', 32.848042999999997, 115.957533999999995, 11, 4, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (18, 'Ziemann, Von and Luettgen', 10.8809909999999999, 59.5612429999999975, 11, 4, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (19, 'Grady Group', 42.9741909999999976, -144.757902000000001, 11, 4, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (20, 'Quigley, Yost and Thiel', 0.727601000000000053, 60.115434999999998, 11, 4, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (21, 'Wunsch-Reynolds', 76.0070529999999991, -78.411280000000005, 14, 5, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (22, 'Zemlak, Nitzsche and Herzog', 68.6196510000000046, 150.824526999999989, 14, 5, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (23, 'Murphy-Heidenreich', -80.729173000000003, 33.5590109999999981, 14, 5, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (24, 'Dare-Roob', -46.0030730000000005, -146.407841999999988, 14, 5, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (25, 'Monahan-Corwin', -25.4323300000000003, 17.4266959999999997, 14, 5, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (26, 'Wunsch, Kulas and Bosco', -77.1542910000000006, 177.631616000000008, 17, 6, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (27, 'Kshlerin Inc', -78.7014729999999929, -36.8657480000000035, 17, 6, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (28, 'Reichert, Becker and Heller', 35.3807660000000013, -89.1107509999999934, 17, 6, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (29, 'Flatley PLC', 51.4572939999999974, 49.2173969999999983, 17, 6, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (30, 'Adams-Murazik', -24.2009679999999996, -131.898689999999988, 17, 6, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (31, 'Nitzsche, Walter and Fisher', 12.5273760000000003, -132.131987000000009, 21, 7, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (32, 'Beier-Boyer', -28.2756949999999989, -63.2722949999999997, 21, 7, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (33, 'Prohaska LLC', 77.1226970000000023, 22.0210219999999985, 21, 7, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (34, 'Emard-Cummerata', -87.006448000000006, 111.820361000000005, 21, 7, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (35, 'Nitzsche, Dicki and Lang', -29.2436849999999993, 72.0545960000000036, 21, 7, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (36, 'Kautzer, Collier and Waters', -62.2261080000000035, 158.605680000000007, 22, 8, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (37, 'Jacobs, Sawayn and Bernhard', 26.1563289999999995, 130.479500999999999, 22, 8, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (38, 'Smith, Herman and Grant', 10.7466050000000006, 80.2505369999999942, 22, 8, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (39, 'Wilderman-Skiles', 15.2570890000000006, -104.862395000000006, 22, 8, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (40, 'Schuppe, Mayert and Kulas', -76.4728020000000015, -47.190330000000003, 22, 8, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (41, 'Kessler, Witting and O''Hara', 42.3038949999999971, 34.2558429999999987, 26, 9, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (42, 'Breitenberg Group', 39.3450309999999988, -165.894966000000011, 26, 9, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (43, 'Hills, Mertz and Torphy', -85.5495229999999935, -7.20302699999999962, 26, 9, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (44, 'Quigley LLC', 61.9555119999999988, 110.821385000000006, 26, 9, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (45, 'Paucek-Konopelski', 43.3976359999999985, -24.9034499999999994, 26, 9, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (46, 'Walsh Ltd', -72.2693830000000048, 66.7829550000000012, 29, 10, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (47, 'McDermott Ltd', 63.0437089999999998, -25.2358049999999992, 29, 10, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (48, 'Yost-Goldner', -88.1598249999999979, 68.2592199999999991, 29, 10, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (49, 'Mayer, Pfeffer and Boyer', -23.0909079999999989, 74.1445020000000028, 29, 10, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO public.court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (50, 'Olson, Padberg and Hintz', -70.6874329999999986, -93.6518640000000033, 29, 10, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);


--
-- TOC entry 3149 (class 0 OID 26706)
-- Dependencies: 200
-- Data for Name: courts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (4, 'vel', 8, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (5, 'nemo', 8, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (6, 'odit', 8, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (20, 'quidem', 33, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (22, 'tempora', 40, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (23, 'reiciendis', 40, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (26, 'non', 43, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (28, 'sit', 46, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (3, 'Calcutta City Court', 25, 11, '2019-06-17 06:27:05', '2019-08-03 09:19:41');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (16, 'Malda 2nd court', 30, 11, '2019-06-17 06:27:06', '2019-08-03 09:21:24');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (24, 'North Dinajpur', 40, 11, '2019-06-17 06:27:06', '2019-08-03 09:22:33');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (30, 'Alipure duar', 46, 11, '2019-06-17 06:27:06', '2019-08-03 09:23:04');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (27, 'South Dinajpore', 43, 11, '2019-06-17 06:27:06', '2019-08-03 09:23:52');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (25, 'Bankura 1 st Court', 43, 11, '2019-06-17 06:27:06', '2019-08-03 09:25:14');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (17, 'Malda 1st Court', 30, 11, '2019-06-17 06:27:06', '2019-08-03 09:26:28');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (19, 'Birbhum 1st court', 33, 11, '2019-06-17 06:27:06', '2019-08-03 09:26:54');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (21, 'Birbhum 2nd Court', 33, 11, '2019-06-17 06:27:06', '2019-08-03 09:27:08');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (8, 'Bardhaman 1st Court', 14, 11, '2019-06-17 06:27:05', '2019-08-03 09:27:25');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (1, 'Darjeeling 1st Court', 5, 11, '2019-06-17 06:27:05', '2019-08-03 09:28:11');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (31, 'Malda 3rd Court', 30, 11, '2019-08-03 09:24:36', '2019-08-03 09:28:55');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (14, 'Howrah 1st Court', 22, 11, '2019-06-17 06:27:05', '2019-08-03 09:29:36');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (10, 'Barasat 1st Court', 18, 11, '2019-06-17 06:27:05', '2019-08-03 09:30:04');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (13, 'Howrah 2nd Court', 22, 11, '2019-06-17 06:27:05', '2019-08-03 09:30:49');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (12, 'Barasat 2nd Court', 18, 11, '2019-06-17 06:27:05', '2019-08-03 09:33:11');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (11, 'Barasat 4rth ADJ', 18, 11, '2019-06-17 06:27:05', '2019-08-03 09:35:10');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (18, 'Malda 4th Adj', 30, 11, '2019-06-17 06:27:06', '2019-08-03 09:40:50');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (15, 'Howrah 3rd Court', 22, 11, '2019-06-17 06:27:05', '2019-08-03 09:41:37');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (2, 'Darjeeling 2nd Court', 5, 11, '2019-06-17 06:27:05', '2019-08-03 09:42:18');
INSERT INTO public.courts (id, court_name, court_complex_id, created_by, created_at, updated_at) VALUES (9, 'Bardhaman 2nd Court', 14, 11, '2019-06-17 06:27:05', '2019-08-03 09:44:18');


--
-- TOC entry 3151 (class 0 OID 26711)
-- Dependencies: 202
-- Data for Name: dairies; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.dairies (id, jo_code, date_of_schedule, description, created_at, updated_at) VALUES (2, 'WB007', '2019-03-07', '<h3>All the <b><i>best</i></b></h3>', '2019-07-24 00:00:00', '2019-07-24 00:00:00');
INSERT INTO public.dairies (id, jo_code, date_of_schedule, description, created_at, updated_at) VALUES (5, 'WB007', '2019-02-07', '<p><b>bhvbv﻿</b><b></b></p>', '2019-07-24 00:00:00', '2019-07-24 00:00:00');
INSERT INTO public.dairies (id, jo_code, date_of_schedule, description, created_at, updated_at) VALUES (15, 'WB007', '2019-10-07', '<p>Hello world !! This is direct from <b></b><b>Chandrayan II</b><b></b></p>', '2019-07-31 00:00:00', '2019-07-31 00:00:00');
INSERT INTO public.dairies (id, jo_code, date_of_schedule, description, created_at, updated_at) VALUES (18, 'WB007', '2019-11-07', '<p>CHANDRAYAN II</p>', '2019-07-31 00:00:00', '2019-07-31 00:00:00');
INSERT INTO public.dairies (id, jo_code, date_of_schedule, description, created_at, updated_at) VALUES (19, 'WB007', '2019-05-08', '<p>Welcome!!!!</p>', '2019-08-07 00:00:00', '2019-08-07 00:00:00');


--
-- TOC entry 3153 (class 0 OID 26719)
-- Dependencies: 204
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (1, 'Transportation Manager', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (2, 'CFO', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (3, 'Construction Laborer', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (4, 'Ship Captain', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (5, 'Business Teacher', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (6, 'Administrative Law Judge', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (7, 'Corporate Trainer', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (8, 'Tree Trimmer', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (9, 'Plating Operator OR Coating Machine Operator', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (10, 'Electronic Drafter', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (11, 'Medical Laboratory Technologist', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (12, 'Real Estate Association Manager', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (13, 'Biological Scientist', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (14, 'Law Enforcement Teacher', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (15, 'Supervisor Fire Fighting Worker', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (16, 'Ticket Agent', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (17, 'Correspondence Clerk', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (18, 'Entertainer and Performer', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (19, 'Central Office Operator', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (20, 'Wellhead Pumper', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (23, 'demo3', 11, '2019-06-28 10:12:57', '2019-06-28 10:12:57');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (24, 'demo6', 11, '2019-06-28 10:14:10', '2019-07-03 09:21:23');


--
-- TOC entry 3155 (class 0 OID 26724)
-- Dependencies: 206
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (1, 'Ullrichmouth', 2, 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (3, 'South Lucinda', 2, 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (4, 'West Alexys', 7, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (9, 'Schneiderview', 11, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (11, 'West Elta', 17, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (12, 'Trantowborough', 17, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (13, 'South Eldred', 24, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (15, 'South Nathanaelview', 24, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (17, 'Zboncakfort', 30, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (18, 'West Magnusview', 30, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (20, 'West Monteborough', 31, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (21, 'South Westleyborough', 31, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (23, 'Veronaside', 38, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (30, 'West Madelynnhaven', 48, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (36, 'Kolkata', 51, 11, '2019-07-10 06:27:59', '2019-07-10 06:27:59');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (2, 'East Midnapure', 2, 11, '2019-06-17 06:27:04', '2019-08-05 05:46:51');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (24, 'East Burdwan', 38, 11, '2019-06-17 06:27:06', '2019-08-05 05:47:04');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (14, 'West Burdwan', 24, 11, '2019-06-17 06:27:05', '2019-08-05 05:47:25');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (19, 'West Midnapure', 31, 11, '2019-06-17 06:27:06', '2019-08-05 05:47:42');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (26, 'Howrah', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:47:53');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (28, 'Hoogly', 48, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:03');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (25, 'Bankura', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:21');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (5, 'Purulia', 7, 11, '2019-06-17 06:27:05', '2019-08-05 05:48:47');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (27, 'Birbhum', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:49:09');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (29, 'North Dinajpur', 48, 11, '2019-06-17 06:27:06', '2019-08-05 05:50:28');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (8, 'South Dinajpur', 11, 11, '2019-06-17 06:27:05', '2019-08-05 05:50:41');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (6, 'Malda', 7, 11, '2019-06-17 06:27:05', '2019-08-05 05:51:22');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (22, 'Alipure duar', 38, 11, '2019-06-17 06:27:06', '2019-08-05 05:54:08');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (10, 'Darjeeling', 17, 11, '2019-06-17 06:27:05', '2019-08-05 05:55:27');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (16, 'Coochbihar', 30, 11, '2019-06-17 06:27:05', '2019-08-05 05:56:27');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (7, 'Kalimpong', 11, 11, '2019-06-17 06:27:05', '2019-08-05 05:56:54');


--
-- TOC entry 3157 (class 0 OID 26729)
-- Dependencies: 208
-- Data for Name: hc_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (1, 'AA', 'ARBRITATION APPL.', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (2, 'ABWA', 'APPL.UND.BENGAL WAKFS ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (3, 'AC', 'AWARD CASES', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (4, 'ACA', 'APPL.UNDER CHARTERED ACCOUNTANTS ACT, 1949', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (5, 'ACO', 'PET. IN COMP. APPL.', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (6, 'ACR', 'APPL.UND.CHARITABLE & RELIGIOUS TRUST ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (7, 'ACRP', 'APPL.UND.SEC.151 OF THE CR.P.C.', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (8, 'ACWA', 'APPL.UND.SEC 21 COST&WORKS ACCOUNTACTS ACT, 1959', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (9, 'AED', 'APPL. U/S. 64 OF ESTATE DUTY ACT, 1953', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (10, 'AET', 'APPL. U/S 25 OF EXPENDITURE TAX ACT, 1957', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (11, 'AFP', 'APPL.FOR LEAVE TO SUE AS AN INDIGENT PERSON', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (12, 'AGA', 'APPL.UND.SEC.25 OF ADMINISTRATOR GENERALS'' ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (13, 'AGL', 'APPL.FOR APPOINTMENT OF GUARDIAN-AD-LITEM', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (14, 'AGT', 'APPL. U/S 26 GIFT TAX ACT, 1958', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (15, 'AGWA', 'APPL.UND.GUARDIANS & WARDS ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (16, 'AHC', 'HABEAS CORPUS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (17, 'AID', 'APPL. UNDER PATENTS & DESIGNS ACT, 1970', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (18, 'AIDR', 'APPL.UND.INDUSTRIAL DEVELOPMENT REGULATION ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (19, 'AIFC', 'APPL.UND.INDUSTRIAL FINANCE CORP. ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (20, 'AIRB', 'APPN.RECON.BANK OF I', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (21, 'ALP', 'APPL.UND.CLAUSE 13 OF LETTERS PATENT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (22, 'ALP.ITL', 'APPL. UNDER CLAUSE 17 OF THE LETTERS PATENT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (23, 'ALPII', 'APPL.UND.CLAUSE 17 L', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (24, 'ALPITL', 'APPL.CLAUSE-17 LP', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (25, 'AOR', 'CALCUTTA OFFICIAL RECEIVER''S ACT 1938', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (26, 'AORC', 'APPLICATION OMNIBUS RESIDUARY CLASS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (27, 'AOT', 'APPL.UND.OFFICIAL TRUSTEES ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (28, 'AP', 'ARBITRATION PETITION', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (29, 'APD', 'APPEAL FROM DECREE', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (30, 'APDT', 'APP. FR. DECR. TEND.', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (31, 'APO', 'APPEAL FROM ORDER', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (32, 'APOT', 'TEMP APO', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (33, 'AS', 'ADMIRALITY  SUITS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (34, 'ASCI', 'APPL.FOR LEAVE TO APPEAL TO THE SUPREME COURT OF INDIA', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (35, 'ASFC', 'APPL.UND.STAE FINANCIAL CORP. ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (36, 'ASM', 'APPL.SANCHAITA MATTERS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (37, 'ATA', 'APPL.UNDER TRUST ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (38, 'ATM', 'APPL.UND.TRADE&MERCHANDISE MARKS, ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (39, 'AUDA', 'APPL.UND.UNCLAIMED DEPOSITS ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (40, 'AWT', 'APPL. U/S 27 OF WEALTH TAX ACT, 1957', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (41, 'BBA', 'APPL.UND.BANKERS BOOKS EVIDENCE ACT, 1891', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (42, 'BIFR', 'BIFR', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (43, 'CA', 'COMPANY APPLICATION', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (44, 'CAA', 'COMMISSIONER OF PATENT APPEAL', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (45, 'CC', 'CONTEMPT OF COURT CASES', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (46, 'CEXA', 'APPL.UND.CENTRAL EXCISE ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (47, 'CHS', 'CHAMBER SUMMONS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (48, 'CP', 'COMPANY PETITIONS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (49, 'CPA', 'COMMISSIONER OF PATE', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (50, 'CRA', 'COPYRIGHT APPEAL', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (51, 'CRCC', 'CRIMINAL CONTEMPT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (52, 'CS', 'CIVIL SUITS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (53, 'CS(O)', 'CIVIL SUIT(OLD)', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (54, 'CSOS', 'CIVIL SUIT ORIGINATING SUMMONS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (55, 'CUSTA', 'APPL.UND.CUSTOMS ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (56, 'DM', 'UND.CHAPTER V OF O.S. RULES', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (57, 'EC', 'EXECUTION CASES', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (58, 'EOPLA', 'EXTRA ORDINARY PROBATE PROCEEDINGS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (59, 'EOS', 'EXTRA ORDINARY SUITS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (60, 'EP', 'ELEC.PET.(PEOPLES REPRESENTATION ACT, 1951)', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (61, 'FEA', 'FOREIGN EXCHANGE APPEAL', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (62, 'FERA', 'APPL.UND.FOREIGN EXCHANGE REGULATION ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (63, 'GCAL', 'APPL.UND.GOLD CONTROL ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (64, 'IC', 'INSOLVENCY CASES', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (65, 'ICA', 'APPL.UNDER INDIAN COMPANIES ACT, 1913', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (66, 'IP', 'IT.PET.256(2)IT''61', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (67, 'ITA', 'INCOME TAX APPEAL', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (68, 'ITAT', 'INCOME TAX APPEAL TENDERED', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (69, 'ITP', 'INCOME TAX PET.(U/S. 256 (2) OF I.T. ACT, 1961)', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (70, 'ITR', 'INCOMETAX REF.SEC.256 (1) OF I.T. ACT, 1961', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (71, 'LM', 'LUNATIC MATTERS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (72, 'LPA', 'LETTERS PATENT APPEAL', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (73, 'MM', 'MISFEAOUCE MATTERS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (74, 'MS', 'MATRIMONIAL SUITS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (75, 'NM', 'NOTICE OF MOTION', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (76, 'OCO', 'ORIGINAL SIDE CROSS OBJECTION', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (77, 'OCOT', 'ORIGINAL SIDE CROSS OBJECTION TENDER', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (78, 'OTS', 'ORDINANCE TRANSFER SUITS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (79, 'PLA', 'APPL.FOR PROBATE & LETTERS OF ADMINISTRATION', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (80, 'PLR', 'UND.CHPT.XXXI-A OF O.S. RULES', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (81, 'PMS', 'PARSI MATRIMONIAL SUITS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (82, 'REF', 'REFERENCE CASE', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (83, 'RVWO', 'MEMORANDUM OF REVIEWS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (84, 'SALT', 'APPL.UND.SALT ACT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (85, 'SANA', 'SANCHAITA APPEAL', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (86, 'SCO', 'SPECIAL CASE FOR OPINION OF COURT', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (87, 'SESS', 'SESSIONS CASES', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (88, 'SS', 'SPECIAL SUITS(SEC 20 OF THE ARBITRATION ACT, 1940', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (89, 'T', 'TEMP A(1)', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (90, 'TBCS', 'TRANSFERRED BANKING COMPANIES SUITS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (91, 'TCS', 'TRANSFERRED COMPANY SUITS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (92, 'TMA', 'TRADE MARK APPEAL', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (93, 'TS', 'TESTAMENTERY SUITS', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (94, 'TUA', 'TRADE UNION APPEAL', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (95, 'WPO', 'WRIT PETITION', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (96, 'WP.CT', 'WP(CENTRAL ADMIN TRIBUNAL)', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (97, 'WP.ST', 'WP(STATE ADMIN TRIBUNAL)', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (98, 'WP.TT', 'WP(WB TAX TRIBUNAL)', NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (99, 'WPCR', 'WRIT PETITION(CIVIL RULE)', NULL, NULL);


--
-- TOC entry 3159 (class 0 OID 26737)
-- Dependencies: 210
-- Data for Name: jo_photos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3197 (class 0 OID 27756)
-- Dependencies: 248
-- Data for Name: jo_reporting_reviewings; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3161 (class 0 OID 26750)
-- Dependencies: 212
-- Data for Name: judicial_officer_posting_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (7, 1, 8, 11, '2019-06-28 11:14:24', '2019-06-28 11:14:24');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (10, 4, 8, 11, '2019-06-28 11:28:50', '2019-06-28 11:28:50');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (11, 4, 6, 11, '2019-06-28 11:33:08', '2019-06-28 11:33:08');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (13, 4, 3, 11, '2019-06-28 11:37:31', '2019-06-28 11:37:31');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (14, 3, 7, 11, '2019-06-28 11:39:59', '2019-06-28 11:39:59');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (15, 4, 6, 11, '2019-06-28 11:41:07', '2019-06-28 11:41:07');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (16, 3, 9, 11, '2019-06-28 11:44:11', '2019-06-28 11:44:11');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (19, 4, 8, 11, '2019-06-29 05:50:17', '2019-07-01 08:22:40');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (21, 2, 10, 11, '2019-07-03 08:30:03', '2019-07-03 08:30:03');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (22, 11, 8, 11, '2019-07-16 08:14:17', '2019-07-16 08:14:17');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (23, 11, 1, 11, '2019-07-16 08:14:17', '2019-07-16 08:14:17');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (24, 11, 1, 11, '2019-07-19 05:49:20', '2019-07-19 05:49:20');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (25, 11, 6, 11, '2019-07-19 05:49:20', '2019-07-19 05:49:20');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (57, 11, 8, 11, '2019-07-23 06:38:54', '2019-07-23 06:38:54');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (58, 11, 1, 11, '2019-07-23 06:38:54', '2019-07-23 06:38:54');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (59, 11, 10, 11, '2019-08-13 07:51:06', '2019-08-13 07:51:06');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) VALUES (60, 11, 1, 11, '2019-08-13 07:51:06', '2019-08-13 07:51:06');


--
-- TOC entry 3163 (class 0 OID 26755)
-- Dependencies: 214
-- Data for Name: judicial_officer_postings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (1, 16, 6, 30, 46, 9, '2019-09-08', '2019-09-08', 14, '2019-09-08 15:17:41', '2019-09-08 15:17:41');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (2, 20, 6, 30, 46, 9, '2019-09-08', '2019-09-08', 14, '2019-09-08 16:22:08', '2019-09-08 16:22:08');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (3, 24, 6, 30, 46, 9, '2019-09-08', '2019-09-08', 14, '2019-09-08 16:26:48', '2019-09-08 16:26:48');


--
-- TOC entry 3195 (class 0 OID 27731)
-- Dependencies: 246
-- Data for Name: judicial_officer_qualifications; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3193 (class 0 OID 27665)
-- Dependencies: 244
-- Data for Name: judicial_officers; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3165 (class 0 OID 26773)
-- Dependencies: 216
-- Data for Name: lcr_hc_ends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (8, 2, 5, 1, 1, 200, 2011, '2019-08-23', 11, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (9, 22, 40, 22, 7, 1000, 2005, '2019-08-25', 11, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (10, 22, 40, 22, 1, 3000, 2019, '2019-08-31', 11, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (13, 22, 40, 22, 8, 2200, 2018, '2019-08-21', 11, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (16, 22, 40, 23, 1, 2222, 2018, '2019-08-30', 11, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (17, 2, 5, 1, 1, 123, 2018, '2019-08-21', 11, NULL, NULL);


--
-- TOC entry 3167 (class 0 OID 26778)
-- Dependencies: 218
-- Data for Name: lcr_lc_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (7, 8, 52, 111, 2018, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (8, 8, 58, 222, 2017, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (9, 8, 9, 333, 2016, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (10, 9, 52, 111, 2018, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (11, 9, 58, 222, 2017, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (12, 10, 1, 111, 2019, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (13, 10, 5, 222, 2010, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (14, 10, 59, 333, 2016, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (15, 10, 5, 444, 2006, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (16, 13, 52, 222, 2019, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (17, 13, 55, 333, 2018, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (18, 16, 1, 2, 2018, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (19, 16, 6, 3, 2017, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (20, 17, 58, 258, 2018, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (21, 17, 52, 753, 2018, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (22, 17, 1, 741, 2017, 11, NULL, NULL);


--
-- TOC entry 3169 (class 0 OID 26783)
-- Dependencies: 220
-- Data for Name: lower_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (52, 'Act 39', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (1, 'Act Viii Miscellaneous Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (51, 'Act Xiv', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (58, 'Bail', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (59, 'CEX - Excise Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (3, 'Civil Appeal', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (4, 'Civil Execution', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (5, 'Civil Misc', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (6, 'Civil Revision', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (7, 'Complaint Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (55, 'C R Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (8, 'Criminal Appeal', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (9, 'Criminal Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (11, 'Criminal Misc Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (12, 'Criminal Revision', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (10, 'Crl. Execution - Criminal Execution', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (23, 'Divorce On Mutual Consent - Matri Suit Divorce Mutual Cons', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (13, 'Electricity Act', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (14, 'Estate Acquisition Appeal', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (16, 'Gr Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (17, 'Hindu Adapt. and Maint Act - Hindu Adapt. and Maint Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (18, 'Insolvancy Petition', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (19, 'L A C - Land Acquisition Cases', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (20, 'L A Ex. - Land Acquisition Execution', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (53, 'L A Suit', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (21, 'M A C C - M.A.C.C', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (22, 'M A C C Ex. - MACC Execution', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (36, 'Maintenance Case - MR case for Maintenance', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (24, 'Matrimonial Suit', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (25, 'Mc - Misc Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (54, 'M C Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (29, 'Misc. Appeal', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (26, 'Misc Case (pre-emption)', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (30, 'Misc. Criminal Revision', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (27, 'Misc Crl Case - Misc Criminal Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (31, 'Misc. Execution Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (57, 'Misc Petition (156) - Misc Petition', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (28, 'Mjc - Misc Judicial Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (32, 'Money Appeal', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (33, 'Money Execution', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (34, 'Money Suit', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (35, 'M V Act - Motor Vehicle Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (37, 'N D P S Case - NDPS Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (38, 'NGR Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (39, 'Other Appeal', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (40, 'Other Suit', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (41, 'Probate Suit', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (15, 'S C C Ex. - Execution', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (42, 'S C C Suit - SCC SUIT', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (43, 'Sessions Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (44, 'Sessions Trial', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (45, 'Special Court Cases', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (46, 'Succession Case', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (47, 'Title Appeal', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (48, 'Title Execution', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (49, 'Title Suit', NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_at, updated_at) VALUES (50, 'Trust Suit', NULL, NULL);


--
-- TOC entry 3171 (class 0 OID 26788)
-- Dependencies: 222
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations (id, migration, batch) VALUES (577, '2014_10_12_000000_create_users_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (578, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (579, '2019_06_12_000005_create_states_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (580, '2019_06_12_000010_create_zones_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (581, '2019_06_12_000020_create_districts_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (582, '2019_06_12_000025_create_subdivisions_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (583, '2019_06_12_000030_create_court_complexes_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (584, '2019_06_12_000040_create_courts_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (585, '2019_06_12_000050_create_qualifications_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (586, '2019_06_12_000060_create_castes_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (587, '2019_06_12_000070_create_designations_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (588, '2019_06_12_000080_create_religions_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (589, '2019_06_12_000090_create_recruitment_batches_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (593, '2019_06_13_093750_create_modes_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (595, '2019_06_13_101842_create_judicial_officer_posting_preferences_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (596, '2019_06_13_093852_create_judicial_officer_postings_table', 2);
INSERT INTO public.migrations (id, migration, batch) VALUES (602, '2019_07_15_072014_alter_users', 6);
INSERT INTO public.migrations (id, migration, batch) VALUES (604, '2019_07_22_064308_create_dairies_table', 7);
INSERT INTO public.migrations (id, migration, batch) VALUES (605, '2019_08_13_091522_create_lcr_hc_ends_table', 8);
INSERT INTO public.migrations (id, migration, batch) VALUES (606, '2019_08_13_091810_create_lcr_lc_details_table', 8);
INSERT INTO public.migrations (id, migration, batch) VALUES (607, '2019_08_13_101720_create_hc_case_types_table', 8);
INSERT INTO public.migrations (id, migration, batch) VALUES (608, '2019_08_13_102950_create_lower_case_types_table', 8);
INSERT INTO public.migrations (id, migration, batch) VALUES (609, '2014_10_10_000000_create_user_types_table', 9);
INSERT INTO public.migrations (id, migration, batch) VALUES (610, '2019_06_12_000110_create_jo_photos_table', 10);
INSERT INTO public.migrations (id, migration, batch) VALUES (616, '2019_06_12_000100_create_judicial_officers_table', 11);
INSERT INTO public.migrations (id, migration, batch) VALUES (617, '2019_06_13_091801_create_judicial_officer_qualifications_table', 11);
INSERT INTO public.migrations (id, migration, batch) VALUES (618, '2019_06_13_092954_create_jo_reporting_reviewings_table', 11);


--
-- TOC entry 3173 (class 0 OID 26793)
-- Dependencies: 224
-- Data for Name: modes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.modes (id, posting_mode, created_by, created_at, updated_at) VALUES (1, 'Transfer', 11, NULL, NULL);
INSERT INTO public.modes (id, posting_mode, created_by, created_at, updated_at) VALUES (2, 'Promotion', 11, NULL, NULL);
INSERT INTO public.modes (id, posting_mode, created_by, created_at, updated_at) VALUES (9, 'Deputation1', 11, '2019-07-01 11:24:25', '2019-07-01 11:24:38');


--
-- TOC entry 3175 (class 0 OID 26798)
-- Dependencies: 226
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.password_resets (email, token, created_at) VALUES ('banabil90@gmail.com', '$2y$10$SyYTnMAUdAWOtCMHLjPKfesTpVjIb6WaogBUga8vayAjqzc73hvjS', '2019-06-19 06:04:48');


--
-- TOC entry 3176 (class 0 OID 26804)
-- Dependencies: 227
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (5, 'BCom', 11, '2019-06-25 07:18:30', '2019-06-25 07:18:30');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (7, 'MA LLB', 11, '2019-06-25 07:18:47', '2019-06-25 07:18:47');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (8, 'BA LLB', 11, '2019-06-28 09:50:19', '2019-07-01 10:14:25');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (10, 'M.Sc', 11, '2019-07-01 11:25:58', '2019-07-01 11:27:09');


--
-- TOC entry 3178 (class 0 OID 26809)
-- Dependencies: 229
-- Data for Name: recruitment_batches; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (5, 'psc 2011', 2011, 11, '2019-06-26 11:49:37', '2019-06-26 11:49:37');
INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (8, 'CLAT 2011', 2003, 11, '2019-06-26 11:55:19', '2019-06-26 11:57:00');
INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (1, 'PSC 2000', 2000, 11, NULL, '2019-06-29 08:58:19');


--
-- TOC entry 3180 (class 0 OID 26814)
-- Dependencies: 231
-- Data for Name: religions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.religions (id, religion_name, created_by, created_at, updated_at) VALUES (1, 'Hindu', 11, NULL, NULL);
INSERT INTO public.religions (id, religion_name, created_by, created_at, updated_at) VALUES (2, 'Muslim', 11, '2019-07-02 11:23:49', '2019-07-02 11:24:02');


--
-- TOC entry 3182 (class 0 OID 26819)
-- Dependencies: 233
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (2, 'Illinois', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (3, 'Montana', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (4, 'New York', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (5, 'North Dakota', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (6, 'Maryland', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (8, 'Wyoming', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (9, 'New Jersey', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (10, 'Nevada', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (12, 'Oklahoma', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (13, 'North Carolina', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (15, 'Kansas', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (16, 'Pennsylvania', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (18, 'Nebraska', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (19, 'Utah', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (20, 'Texas', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (21, 'Washington', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (22, 'Missouri', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (23, 'Wisconsin', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (24, 'West Virginia', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (26, 'Louisiana', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (27, 'South Dakota', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (29, 'Maine', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (30, 'Hawaii', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (32, 'Virginia', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (34, 'Tennessee', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (35, 'New Mexico', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (36, 'Indiana', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (37, 'Oregon', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (38, 'Kentucky', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (39, 'Ohio', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (40, 'Vermont', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (41, 'Georgia', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (43, 'Michigan', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (45, 'New Hampshire', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (47, 'Iowa', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (48, 'Massachusetts', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (49, 'Mississippi', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (50, 'Minnesota', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (51, 'West Bengal', 11, '2019-06-18 10:06:22', '2019-06-18 10:06:22');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (52, 'Bihar', 11, '2019-06-18 10:10:49', '2019-06-18 10:10:49');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (7, 'Odisha', 11, '2019-06-17 06:27:05', '2019-08-05 05:57:55');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (31, 'Andhra Pradesh', 11, '2019-06-17 06:27:06', '2019-08-05 05:59:14');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (68, 'Himachal Pradesh', 11, '2019-08-05 06:03:19', '2019-08-05 06:03:19');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (69, 'Madhya Pradesh', 11, '2019-08-05 06:03:30', '2019-08-05 06:03:30');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (11, 'Maharastra', 11, '2019-06-17 06:27:05', '2019-08-05 06:03:46');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (28, 'Kerala', 11, '2019-06-17 06:27:05', '2019-08-05 06:04:55');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (1, 'Rajasthan', 11, '2019-06-17 06:27:04', '2019-08-05 06:05:07');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (17, 'Gujrat', 11, '2019-06-17 06:27:05', '2019-08-05 06:07:42');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (46, 'Tamilnadu', 11, '2019-06-17 06:27:06', '2019-08-05 06:07:52');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (25, 'Karntaka', 11, '2019-06-17 06:27:05', '2019-08-05 06:16:44');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (44, 'Hyderabad', 11, '2019-06-17 06:27:06', '2019-08-05 06:17:30');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (42, 'Jammu and Kahmir', 11, '2019-06-17 06:27:06', '2019-08-05 06:17:59');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (70, 'Punjab', 11, '2019-08-05 06:18:05', '2019-08-05 06:18:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (71, 'Hariyana', 11, '2019-08-05 06:18:12', '2019-08-05 06:18:12');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (72, 'Jharkhand', 11, '2019-08-05 06:18:28', '2019-08-05 06:18:28');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (73, 'Chattishgarh', 11, '2019-08-05 06:18:43', '2019-08-05 06:18:43');


--
-- TOC entry 3184 (class 0 OID 26824)
-- Dependencies: 235
-- Data for Name: subdivisions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (1, 'saepe', 2, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (3, 'ut', 2, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (7, 'quasi', 5, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (8, 'quo', 5, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (9, 'soluta', 7, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (11, 'sunt', 7, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (12, 'molestiae', 7, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (13, 'provident', 10, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (14, 'suscipit', 10, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (16, 'quae', 10, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (17, 'quisquam', 13, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (19, 'voluptatem', 13, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (20, 'recusandae', 13, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (21, 'voluptates', 17, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (25, 'voluptatum', 19, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (26, 'sint', 19, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (31, 'similique', 24, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) VALUES (32, 'nostrum', 24, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');


--
-- TOC entry 3186 (class 0 OID 26829)
-- Dependencies: 237
-- Data for Name: user_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.user_types (id, type_name, created_at, updated_at, created_by) VALUES (1, 'Administrator', NULL, NULL, 11);
INSERT INTO public.user_types (id, type_name, created_at, updated_at, created_by) VALUES (2, 'Judicial Officer', NULL, NULL, 11);
INSERT INTO public.user_types (id, type_name, created_at, updated_at, created_by) VALUES (3, 'Departmental Officer', NULL, NULL, 11);
INSERT INTO public.user_types (id, type_name, created_at, updated_at, created_by) VALUES (5, 'sr2', '2019-08-28 08:33:30', '2019-08-28 08:34:39', 11);
INSERT INTO public.user_types (id, type_name, created_at, updated_at, created_by) VALUES (6, 'Court', '2019-08-30 06:31:42', '2019-08-30 06:31:42', 11);


--
-- TOC entry 3188 (class 0 OID 26834)
-- Dependencies: 239
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (11, 'Administrator 1', 'admin@admin.admin', NULL, '$2y$10$or1dBRoI3FxqDddrMTwDEO9MOo5MuHRX8EpLNPRd6Q94VU76L2rUy', 'j8ztlKap65uF0CMt6bWHd7aS2uYjIZyTlRyVf5EKyWXvhlP9ERJ7yCNXMuOK', '2019-06-19 06:00:07', '2019-06-19 06:00:07', NULL, NULL, 'admin', 1);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (14, 'Rupsa Bose', 'rupsa@rupsa.rupsa', NULL, '$2y$10$or1dBRoI3FxqDddrMTwDEO9MOo5MuHRX8EpLNPRd6Q94VU76L2rUy', NULL, NULL, NULL, NULL, 11, 'rupsa', 2);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (13, 'Arpan', 'arpanroy1987@gmail.com', NULL, '$2y$10$SOW.J6WHttO1dhhf8u/2M.zdaiIVTygGyL03ZNLejwcPW8cmPj3Yq', NULL, '2019-06-19 06:04:30', '2019-06-19 06:04:30', NULL, 13, 'arpan', 2);


--
-- TOC entry 3190 (class 0 OID 26842)
-- Dependencies: 241
-- Data for Name: zones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (1, 'g', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04', 547);
INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (3, 'v', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', 730);
INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (5, 'x', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', 730);
INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (7, 'w', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', 730);
INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (9, 'h', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', 730);
INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (2, 'n', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', 913);
INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (4, 'y', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', 547);
INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (6, 'k', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', 913);
INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (12, 'zap', 11, '2019-07-01 11:37:00', '2019-07-01 11:37:16', 913);
INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (10, 'e', 11, '2019-06-17 06:27:06', '2019-07-03 07:19:55', 47);
INSERT INTO public.zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (8, 'd', 11, '2019-06-17 06:27:06', '2019-07-03 07:20:01', 91);


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 197
-- Name: castes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.castes_id_seq', 6, true);


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 199
-- Name: court_complexes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.court_complexes_id_seq', 50, true);


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 201
-- Name: courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courts_id_seq', 31, true);


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 203
-- Name: dairies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dairies_id_seq', 19, true);


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 205
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.designations_id_seq', 24, true);


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 207
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.districts_id_seq', 36, true);


--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 209
-- Name: hc_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hc_case_types_id_seq', 1, false);


--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 211
-- Name: jo_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_photos_id_seq', 1, false);


--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 247
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_reporting_reviewings_id_seq', 1, false);


--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 213
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_posting_preferences_id_seq', 60, true);


--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 215
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_postings_id_seq', 3, true);


--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 245
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_qualifications_id_seq', 25, true);


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 243
-- Name: judicial_officers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officers_id_seq', 24, true);


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 217
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_hc_ends_id_seq', 17, true);


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 219
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_lc_details_id_seq', 22, true);


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 221
-- Name: lower_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lower_case_types_id_seq', 1, false);


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 223
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 618, true);


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 225
-- Name: modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.modes_id_seq', 9, true);


--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 228
-- Name: qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.qualifications_id_seq', 10, true);


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 230
-- Name: recruitment_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recruitment_batches_id_seq', 14, true);


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 232
-- Name: religions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.religions_id_seq', 3, true);


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 234
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 73, true);


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 236
-- Name: subdivisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subdivisions_id_seq', 43, true);


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 238
-- Name: user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_types_id_seq', 6, true);


--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 240
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 22, true);


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 242
-- Name: zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zones_id_seq', 25, true);


--
-- TOC entry 2872 (class 2606 OID 26874)
-- Name: castes castes_caste_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.castes
    ADD CONSTRAINT castes_caste_name_unique UNIQUE (caste_name);


--
-- TOC entry 2874 (class 2606 OID 26876)
-- Name: castes castes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.castes
    ADD CONSTRAINT castes_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 26878)
-- Name: court_complexes court_complexes_court_complex_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.court_complexes
    ADD CONSTRAINT court_complexes_court_complex_name_unique UNIQUE (court_complex_name);


--
-- TOC entry 2878 (class 2606 OID 26880)
-- Name: court_complexes court_complexes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.court_complexes
    ADD CONSTRAINT court_complexes_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 26882)
-- Name: courts courts_court_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_court_name_unique UNIQUE (court_name);


--
-- TOC entry 2882 (class 2606 OID 26884)
-- Name: courts courts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_pkey PRIMARY KEY (id);


--
-- TOC entry 2884 (class 2606 OID 26886)
-- Name: dairies dairies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dairies
    ADD CONSTRAINT dairies_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 26888)
-- Name: designations designations_designation_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_designation_name_unique UNIQUE (designation_name);


--
-- TOC entry 2888 (class 2606 OID 26890)
-- Name: designations designations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 26892)
-- Name: districts districts_district_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_district_name_unique UNIQUE (district_name);


--
-- TOC entry 2892 (class 2606 OID 26894)
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 26896)
-- Name: hc_case_types hc_case_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types
    ADD CONSTRAINT hc_case_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 26898)
-- Name: jo_photos jo_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_photos
    ADD CONSTRAINT jo_photos_pkey PRIMARY KEY (id);


--
-- TOC entry 2975 (class 2606 OID 27763)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_judicial_officer_id_reporting_officer_i; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_judicial_officer_id_reporting_officer_i UNIQUE (judicial_officer_id, reporting_officer_id, reviewing_officer_id);


--
-- TOC entry 2977 (class 2606 OID 27761)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_pkey PRIMARY KEY (id);


--
-- TOC entry 2898 (class 2606 OID 26902)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 26904)
-- Name: judicial_officer_postings judicial_officer_postings_judicial_officer_id_designation_id_co; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_judicial_officer_id_designation_id_co UNIQUE (judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date);


--
-- TOC entry 2902 (class 2606 OID 26906)
-- Name: judicial_officer_postings judicial_officer_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_pkey PRIMARY KEY (id);


--
-- TOC entry 2971 (class 2606 OID 27738)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_judicial_officer_id_qualificati; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_judicial_officer_id_qualificati UNIQUE (judicial_officer_id, qualification_id);


--
-- TOC entry 2973 (class 2606 OID 27736)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2949 (class 2606 OID 27712)
-- Name: judicial_officers judicial_officers_aadhaar_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_aadhaar_no_unique UNIQUE (aadhaar_no);


--
-- TOC entry 2951 (class 2606 OID 27724)
-- Name: judicial_officers judicial_officers_email_id_1_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_email_id_1_unique UNIQUE (email_id_1);


--
-- TOC entry 2953 (class 2606 OID 27726)
-- Name: judicial_officers judicial_officers_email_id_2_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_email_id_2_unique UNIQUE (email_id_2);


--
-- TOC entry 2955 (class 2606 OID 27728)
-- Name: judicial_officers judicial_officers_email_id_3_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_email_id_3_unique UNIQUE (email_id_3);


--
-- TOC entry 2957 (class 2606 OID 27710)
-- Name: judicial_officers judicial_officers_jo_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_jo_code_unique UNIQUE (jo_code);


--
-- TOC entry 2959 (class 2606 OID 27718)
-- Name: judicial_officers judicial_officers_mobile_no_1_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_mobile_no_1_unique UNIQUE (mobile_no_1);


--
-- TOC entry 2961 (class 2606 OID 27720)
-- Name: judicial_officers judicial_officers_mobile_no_2_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_mobile_no_2_unique UNIQUE (mobile_no_2);


--
-- TOC entry 2963 (class 2606 OID 27722)
-- Name: judicial_officers judicial_officers_mobile_no_3_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_mobile_no_3_unique UNIQUE (mobile_no_3);


--
-- TOC entry 2965 (class 2606 OID 27714)
-- Name: judicial_officers judicial_officers_pan_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_pan_no_unique UNIQUE (pan_no);


--
-- TOC entry 2967 (class 2606 OID 27786)
-- Name: judicial_officers judicial_officers_pf_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_pf_no_unique UNIQUE (gpf_no);


--
-- TOC entry 2969 (class 2606 OID 27673)
-- Name: judicial_officers judicial_officers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 26914)
-- Name: lcr_hc_ends lcr_hc_ends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 26916)
-- Name: lcr_lc_details lcr_lc_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details
    ADD CONSTRAINT lcr_lc_details_pkey PRIMARY KEY (id);


--
-- TOC entry 2908 (class 2606 OID 26918)
-- Name: lower_case_types lower_case_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types
    ADD CONSTRAINT lower_case_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2910 (class 2606 OID 26920)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2912 (class 2606 OID 26922)
-- Name: modes modes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_pkey PRIMARY KEY (id);


--
-- TOC entry 2914 (class 2606 OID 26924)
-- Name: modes modes_posting_mode_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_posting_mode_unique UNIQUE (posting_mode);


--
-- TOC entry 2917 (class 2606 OID 26928)
-- Name: qualifications qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 26930)
-- Name: qualifications qualifications_qualification_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_qualification_name_unique UNIQUE (qualification_name);


--
-- TOC entry 2921 (class 2606 OID 26932)
-- Name: recruitment_batches recruitment_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches
    ADD CONSTRAINT recruitment_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 26934)
-- Name: recruitment_batches recruitment_batches_recruitment_batch_desc_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches
    ADD CONSTRAINT recruitment_batches_recruitment_batch_desc_unique UNIQUE (recruitment_batch_desc);


--
-- TOC entry 2925 (class 2606 OID 26936)
-- Name: religions religions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.religions
    ADD CONSTRAINT religions_pkey PRIMARY KEY (id);


--
-- TOC entry 2927 (class 2606 OID 26938)
-- Name: religions religions_religion_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.religions
    ADD CONSTRAINT religions_religion_name_unique UNIQUE (religion_name);


--
-- TOC entry 2929 (class 2606 OID 26942)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 2931 (class 2606 OID 26944)
-- Name: states states_state_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_state_name_unique UNIQUE (state_name);


--
-- TOC entry 2933 (class 2606 OID 26946)
-- Name: subdivisions subdivisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_pkey PRIMARY KEY (id);


--
-- TOC entry 2935 (class 2606 OID 26948)
-- Name: subdivisions subdivisions_subdivision_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_subdivision_name_unique UNIQUE (subdivision_name);


--
-- TOC entry 2937 (class 2606 OID 26950)
-- Name: user_types user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_types
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 26952)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2941 (class 2606 OID 26954)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 26956)
-- Name: users users_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_id_key UNIQUE (user_id);


--
-- TOC entry 2945 (class 2606 OID 26958)
-- Name: zones zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- TOC entry 2947 (class 2606 OID 26960)
-- Name: zones zones_zone_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_zone_name_unique UNIQUE (zone_name);


--
-- TOC entry 2915 (class 1259 OID 26961)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 2978 (class 2606 OID 26962)
-- Name: castes castes_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.castes
    ADD CONSTRAINT castes_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 2979 (class 2606 OID 26967)
-- Name: court_complexes court_complexes_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.court_complexes
    ADD CONSTRAINT court_complexes_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 2980 (class 2606 OID 26972)
-- Name: court_complexes court_complexes_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.court_complexes
    ADD CONSTRAINT court_complexes_district_id_foreign FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- TOC entry 2981 (class 2606 OID 26977)
-- Name: court_complexes court_complexes_subdivision_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.court_complexes
    ADD CONSTRAINT court_complexes_subdivision_id FOREIGN KEY (subdivision_id) REFERENCES public.subdivisions(id);


--
-- TOC entry 2982 (class 2606 OID 26982)
-- Name: court_complexes court_complexes_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.court_complexes
    ADD CONSTRAINT court_complexes_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 2983 (class 2606 OID 26987)
-- Name: courts courts_court_complex_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_court_complex_id_foreign FOREIGN KEY (court_complex_id) REFERENCES public.court_complexes(id);


--
-- TOC entry 2984 (class 2606 OID 26992)
-- Name: courts courts_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 2985 (class 2606 OID 26997)
-- Name: designations designations_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 2986 (class 2606 OID 27002)
-- Name: districts districts_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 2987 (class 2606 OID 27007)
-- Name: districts districts_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_state_id_foreign FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- TOC entry 3023 (class 2606 OID 27779)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3020 (class 2606 OID 27764)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3021 (class 2606 OID 27769)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_reporting_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_reporting_officer_id_foreign FOREIGN KEY (reporting_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3022 (class 2606 OID 27774)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_reviewing_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_reviewing_officer_id_foreign FOREIGN KEY (reviewing_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2988 (class 2606 OID 27037)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 2989 (class 2606 OID 27047)
-- Name: judicial_officer_postings judicial_officer_postings_court_complex_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_court_complex_id_foreign FOREIGN KEY (court_complex_id) REFERENCES public.court_complexes(id);


--
-- TOC entry 2990 (class 2606 OID 27052)
-- Name: judicial_officer_postings judicial_officer_postings_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_court_id_foreign FOREIGN KEY (court_id) REFERENCES public.courts(id);


--
-- TOC entry 2991 (class 2606 OID 27057)
-- Name: judicial_officer_postings judicial_officer_postings_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 2992 (class 2606 OID 27062)
-- Name: judicial_officer_postings judicial_officer_postings_designation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_designation_id_foreign FOREIGN KEY (designation_id) REFERENCES public.designations(id);


--
-- TOC entry 2993 (class 2606 OID 27072)
-- Name: judicial_officer_postings judicial_officer_postings_mode_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_mode_id_foreign FOREIGN KEY (mode_id) REFERENCES public.modes(id);


--
-- TOC entry 3019 (class 2606 OID 27749)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3017 (class 2606 OID 27739)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3018 (class 2606 OID 27744)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_qualification_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_qualification_id_foreign FOREIGN KEY (qualification_id) REFERENCES public.qualifications(id);


--
-- TOC entry 3012 (class 2606 OID 27684)
-- Name: judicial_officers judicial_officers_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.castes(id);


--
-- TOC entry 3010 (class 2606 OID 27674)
-- Name: judicial_officers judicial_officers_home_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_home_district_id_foreign FOREIGN KEY (home_district_id) REFERENCES public.districts(id);


--
-- TOC entry 3011 (class 2606 OID 27679)
-- Name: judicial_officers judicial_officers_home_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_home_state_id_foreign FOREIGN KEY (home_state_id) REFERENCES public.states(id);


--
-- TOC entry 3015 (class 2606 OID 27699)
-- Name: judicial_officers judicial_officers_present_reporting_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_present_reporting_officer_id_foreign FOREIGN KEY (present_reporting_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3016 (class 2606 OID 27704)
-- Name: judicial_officers judicial_officers_present_reviewing_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_present_reviewing_officer_id_foreign FOREIGN KEY (present_reviewing_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3014 (class 2606 OID 27694)
-- Name: judicial_officers judicial_officers_recruitment_batch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_recruitment_batch_id_foreign FOREIGN KEY (recruitment_batch_id) REFERENCES public.recruitment_batches(id);


--
-- TOC entry 3013 (class 2606 OID 27689)
-- Name: judicial_officers judicial_officers_religion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_religion_id_foreign FOREIGN KEY (religion_id) REFERENCES public.religions(id);


--
-- TOC entry 2994 (class 2606 OID 27132)
-- Name: lcr_hc_ends lcr_hc_ends_complex_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_complex_foreign FOREIGN KEY (complex) REFERENCES public.court_complexes(id);


--
-- TOC entry 2995 (class 2606 OID 27137)
-- Name: lcr_hc_ends lcr_hc_ends_court_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_court_foreign FOREIGN KEY (court) REFERENCES public.courts(id);


--
-- TOC entry 2996 (class 2606 OID 27142)
-- Name: lcr_hc_ends lcr_hc_ends_district_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_district_foreign FOREIGN KEY (district) REFERENCES public.districts(id);


--
-- TOC entry 2997 (class 2606 OID 27147)
-- Name: lcr_lc_details lcr_lc_details_hc_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details
    ADD CONSTRAINT lcr_lc_details_hc_id_foreign FOREIGN KEY (hc_id) REFERENCES public.lcr_hc_ends(id);


--
-- TOC entry 2998 (class 2606 OID 27152)
-- Name: modes modes_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 2999 (class 2606 OID 27157)
-- Name: qualifications qualifications_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3000 (class 2606 OID 27162)
-- Name: recruitment_batches recruitment_batches_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches
    ADD CONSTRAINT recruitment_batches_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3001 (class 2606 OID 27167)
-- Name: religions religions_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.religions
    ADD CONSTRAINT religions_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3002 (class 2606 OID 27172)
-- Name: states states_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3003 (class 2606 OID 27177)
-- Name: subdivisions subdivisions_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3004 (class 2606 OID 27182)
-- Name: subdivisions subdivisions_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_district_id_foreign FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- TOC entry 3005 (class 2606 OID 27187)
-- Name: user_types user_types_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_types
    ADD CONSTRAINT user_types_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 3006 (class 2606 OID 27192)
-- Name: users users_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_court_id_fkey FOREIGN KEY (court_id) REFERENCES public.courts(id);


--
-- TOC entry 3007 (class 2606 OID 27197)
-- Name: users users_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_court_id_foreign FOREIGN KEY (court_id) REFERENCES public.courts(id);


--
-- TOC entry 3008 (class 2606 OID 27212)
-- Name: users users_user_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_type_id_fkey FOREIGN KEY (user_type_id) REFERENCES public.user_types(id);


--
-- TOC entry 3009 (class 2606 OID 27217)
-- Name: zones zones_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);


-- Completed on 2019-09-08 22:52:10

--
-- PostgreSQL database dump complete
--

