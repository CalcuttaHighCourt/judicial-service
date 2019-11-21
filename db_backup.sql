--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2019-11-21 22:01:52

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
-- TOC entry 248 (class 1259 OID 30595)
-- Name: acr_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acr_histories (
    id bigint NOT NULL,
    jo_code character varying(255) NOT NULL,
    judicial_officer_id bigint NOT NULL,
    grade_id integer NOT NULL,
    year integer NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 247 (class 1259 OID 30593)
-- Name: acr_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.acr_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 247
-- Name: acr_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.acr_histories_id_seq OWNED BY public.acr_histories.id;


--
-- TOC entry 214 (class 1259 OID 30294)
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    category_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 213 (class 1259 OID 30292)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 213
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 210 (class 1259 OID 30269)
-- Name: courts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courts (
    id integer NOT NULL,
    court_name character varying(255) NOT NULL,
    subdivision_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 209 (class 1259 OID 30267)
-- Name: courts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 209
-- Name: courts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courts_id_seq OWNED BY public.courts.id;


--
-- TOC entry 216 (class 1259 OID 30304)
-- Name: designations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.designations (
    id integer NOT NULL,
    designation_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 215 (class 1259 OID 30302)
-- Name: designations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.designations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 215
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.designations_id_seq OWNED BY public.designations.id;


--
-- TOC entry 236 (class 1259 OID 30505)
-- Name: diaries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.diaries (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    date_of_schedule date NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 235 (class 1259 OID 30503)
-- Name: diaries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.diaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 235
-- Name: diaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.diaries_id_seq OWNED BY public.diaries.id;


--
-- TOC entry 206 (class 1259 OID 30234)
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.districts (
    id integer NOT NULL,
    district_name character varying(255) NOT NULL,
    state_id integer NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 205 (class 1259 OID 30232)
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.districts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 205
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;


--
-- TOC entry 246 (class 1259 OID 30585)
-- Name: grade_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grade_details (
    id integer NOT NULL,
    grade_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 245 (class 1259 OID 30583)
-- Name: grade_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grade_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 245
-- Name: grade_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grade_details_id_seq OWNED BY public.grade_details.id;


--
-- TOC entry 242 (class 1259 OID 30560)
-- Name: hc_case_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hc_case_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    full_form character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 241 (class 1259 OID 30558)
-- Name: hc_case_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hc_case_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 241
-- Name: hc_case_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hc_case_types_id_seq OWNED BY public.hc_case_types.id;


--
-- TOC entry 224 (class 1259 OID 30388)
-- Name: jo_photos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jo_photos (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    photo bytea NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 223 (class 1259 OID 30386)
-- Name: jo_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 223
-- Name: jo_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_photos_id_seq OWNED BY public.jo_photos.id;


--
-- TOC entry 228 (class 1259 OID 30424)
-- Name: jo_reporting_reviewings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jo_reporting_reviewings (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    reporting_officer_id bigint,
    from_date date NOT NULL,
    to_date date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 227 (class 1259 OID 30422)
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_reporting_reviewings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 227
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_reporting_reviewings_id_seq OWNED BY public.jo_reporting_reviewings.id;


--
-- TOC entry 252 (class 1259 OID 30635)
-- Name: jo_zone_tenures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jo_zone_tenures (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    zone_id integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 251 (class 1259 OID 30633)
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_zone_tenures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 251
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_zone_tenures_id_seq OWNED BY public.jo_zone_tenures.id;


--
-- TOC entry 234 (class 1259 OID 30484)
-- Name: judicial_officer_posting_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officer_posting_preferences (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    zone_id integer NOT NULL,
    remarks text NOT NULL,
    final_submission character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 233 (class 1259 OID 30482)
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_posting_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 233
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_posting_preferences_id_seq OWNED BY public.judicial_officer_posting_preferences.id;


--
-- TOC entry 232 (class 1259 OID 30454)
-- Name: judicial_officer_postings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officer_postings (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    designation_id integer NOT NULL,
    court_id integer,
    other_station_name character varying(255),
    mode_id integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    created_by integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 231 (class 1259 OID 30452)
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_postings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 231
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_postings_id_seq OWNED BY public.judicial_officer_postings.id;


--
-- TOC entry 226 (class 1259 OID 30404)
-- Name: judicial_officer_qualifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officer_qualifications (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    qualification_id integer NOT NULL,
    passing_year integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 225 (class 1259 OID 30402)
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 225
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_qualifications_id_seq OWNED BY public.judicial_officer_qualifications.id;


--
-- TOC entry 222 (class 1259 OID 30334)
-- Name: judicial_officers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officers (
    id bigint NOT NULL,
    registration_no character varying(255) NOT NULL,
    jo_code character varying(255) NOT NULL,
    officer_name character varying(255) NOT NULL,
    gender character varying(255) NOT NULL,
    guardian_name character varying(255) NOT NULL,
    gurdian_relation character varying(255) NOT NULL,
    date_of_birth date NOT NULL,
    home_state_id integer NOT NULL,
    home_district_id integer NOT NULL,
    hometown character varying(255),
    present_address text NOT NULL,
    permanent_address text NOT NULL,
    religion_id integer,
    category_id integer,
    blood_group character varying(255),
    identification_mark character varying(255),
    aadhaar_no character(12),
    pan_no character(10),
    gpf_no character varying(255),
    mobile_no_1 character varying(255) NOT NULL,
    mobile_no_2 character varying(255),
    email_id_1 character varying(255) NOT NULL,
    email_id_2 character varying(255),
    recruitment_batch_id integer NOT NULL,
    date_of_joining date NOT NULL,
    date_of_confirmation date NOT NULL,
    date_of_retirement date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 221 (class 1259 OID 30332)
-- Name: judicial_officers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 221
-- Name: judicial_officers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officers_id_seq OWNED BY public.judicial_officers.id;


--
-- TOC entry 238 (class 1259 OID 30521)
-- Name: lcr_hc_ends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lcr_hc_ends (
    id bigint NOT NULL,
    district integer NOT NULL,
    subdivision integer NOT NULL,
    court integer NOT NULL,
    hc_case_record character varying(255) NOT NULL,
    hc_case_no integer NOT NULL,
    hc_case_year integer NOT NULL,
    deadline date NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 237 (class 1259 OID 30519)
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_hc_ends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 237
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_hc_ends_id_seq OWNED BY public.lcr_hc_ends.id;


--
-- TOC entry 240 (class 1259 OID 30544)
-- Name: lcr_lc_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lcr_lc_details (
    id bigint NOT NULL,
    hc_id bigint NOT NULL,
    lower_case_record character varying(255) NOT NULL,
    lower_case_no integer NOT NULL,
    lower_case_year integer NOT NULL,
    compliance_flag character varying(255),
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 239 (class 1259 OID 30542)
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_lc_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 239
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_lc_details_id_seq OWNED BY public.lcr_lc_details.id;


--
-- TOC entry 244 (class 1259 OID 30575)
-- Name: lower_case_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lower_case_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 243 (class 1259 OID 30573)
-- Name: lower_case_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lower_case_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 243
-- Name: lower_case_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lower_case_types_id_seq OWNED BY public.lower_case_types.id;


--
-- TOC entry 197 (class 1259 OID 30191)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 30189)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 230 (class 1259 OID 30444)
-- Name: modes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modes (
    id integer NOT NULL,
    posting_mode character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 229 (class 1259 OID 30442)
-- Name: modes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 229
-- Name: modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modes_id_seq OWNED BY public.modes.id;


--
-- TOC entry 200 (class 1259 OID 30205)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- TOC entry 212 (class 1259 OID 30284)
-- Name: qualifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.qualifications (
    id integer NOT NULL,
    qualification_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 211 (class 1259 OID 30282)
-- Name: qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.qualifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 211
-- Name: qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.qualifications_id_seq OWNED BY public.qualifications.id;


--
-- TOC entry 220 (class 1259 OID 30324)
-- Name: recruitment_batches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recruitment_batches (
    id integer NOT NULL,
    recruitment_batch_desc character varying(255) NOT NULL,
    batch_year integer NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 219 (class 1259 OID 30322)
-- Name: recruitment_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recruitment_batches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 219
-- Name: recruitment_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recruitment_batches_id_seq OWNED BY public.recruitment_batches.id;


--
-- TOC entry 218 (class 1259 OID 30314)
-- Name: religions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.religions (
    id integer NOT NULL,
    religion_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 217 (class 1259 OID 30312)
-- Name: religions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.religions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 217
-- Name: religions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.religions_id_seq OWNED BY public.religions.id;


--
-- TOC entry 202 (class 1259 OID 30214)
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id integer NOT NULL,
    state_name character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 201 (class 1259 OID 30212)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 201
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 208 (class 1259 OID 30249)
-- Name: subdivisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subdivisions (
    id integer NOT NULL,
    subdivision_name character varying(255) NOT NULL,
    district_id integer NOT NULL,
    zone_id integer NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 207 (class 1259 OID 30247)
-- Name: subdivisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subdivisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 207
-- Name: subdivisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subdivisions_id_seq OWNED BY public.subdivisions.id;


--
-- TOC entry 199 (class 1259 OID 30199)
-- Name: user_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 198 (class 1259 OID 30197)
-- Name: user_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 198
-- Name: user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_types_id_seq OWNED BY public.user_types.id;


--
-- TOC entry 254 (class 1259 OID 30655)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    user_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_type_id integer NOT NULL,
    court_id integer,
    judicial_officer_id bigint,
    jo_code character varying(255),
    department_id integer,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 253 (class 1259 OID 30653)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 253
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 250 (class 1259 OID 30615)
-- Name: zone_subdivisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zone_subdivisions (
    id integer NOT NULL,
    zone_id integer NOT NULL,
    subdivision_id integer NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 249 (class 1259 OID 30613)
-- Name: zone_subdivisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zone_subdivisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 249
-- Name: zone_subdivisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zone_subdivisions_id_seq OWNED BY public.zone_subdivisions.id;


--
-- TOC entry 204 (class 1259 OID 30224)
-- Name: zones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zones (
    id bigint NOT NULL,
    zone_name character varying(255) NOT NULL,
    min_service_days integer,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 203 (class 1259 OID 30222)
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 203
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zones_id_seq OWNED BY public.zones.id;


--
-- TOC entry 2890 (class 2604 OID 30598)
-- Name: acr_histories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories ALTER COLUMN id SET DEFAULT nextval('public.acr_histories_id_seq'::regclass);


--
-- TOC entry 2873 (class 2604 OID 30297)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 2871 (class 2604 OID 30272)
-- Name: courts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts ALTER COLUMN id SET DEFAULT nextval('public.courts_id_seq'::regclass);


--
-- TOC entry 2874 (class 2604 OID 30307)
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- TOC entry 2884 (class 2604 OID 30508)
-- Name: diaries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diaries ALTER COLUMN id SET DEFAULT nextval('public.diaries_id_seq'::regclass);


--
-- TOC entry 2869 (class 2604 OID 30237)
-- Name: districts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);


--
-- TOC entry 2889 (class 2604 OID 30588)
-- Name: grade_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade_details ALTER COLUMN id SET DEFAULT nextval('public.grade_details_id_seq'::regclass);


--
-- TOC entry 2887 (class 2604 OID 30563)
-- Name: hc_case_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types ALTER COLUMN id SET DEFAULT nextval('public.hc_case_types_id_seq'::regclass);


--
-- TOC entry 2878 (class 2604 OID 30391)
-- Name: jo_photos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_photos ALTER COLUMN id SET DEFAULT nextval('public.jo_photos_id_seq'::regclass);


--
-- TOC entry 2880 (class 2604 OID 30427)
-- Name: jo_reporting_reviewings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings ALTER COLUMN id SET DEFAULT nextval('public.jo_reporting_reviewings_id_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 30638)
-- Name: jo_zone_tenures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures ALTER COLUMN id SET DEFAULT nextval('public.jo_zone_tenures_id_seq'::regclass);


--
-- TOC entry 2883 (class 2604 OID 30487)
-- Name: judicial_officer_posting_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_posting_preferences_id_seq'::regclass);


--
-- TOC entry 2882 (class 2604 OID 30457)
-- Name: judicial_officer_postings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_postings_id_seq'::regclass);


--
-- TOC entry 2879 (class 2604 OID 30407)
-- Name: judicial_officer_qualifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_qualifications_id_seq'::regclass);


--
-- TOC entry 2877 (class 2604 OID 30337)
-- Name: judicial_officers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers ALTER COLUMN id SET DEFAULT nextval('public.judicial_officers_id_seq'::regclass);


--
-- TOC entry 2885 (class 2604 OID 30524)
-- Name: lcr_hc_ends id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends ALTER COLUMN id SET DEFAULT nextval('public.lcr_hc_ends_id_seq'::regclass);


--
-- TOC entry 2886 (class 2604 OID 30547)
-- Name: lcr_lc_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details ALTER COLUMN id SET DEFAULT nextval('public.lcr_lc_details_id_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 30578)
-- Name: lower_case_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types ALTER COLUMN id SET DEFAULT nextval('public.lower_case_types_id_seq'::regclass);


--
-- TOC entry 2865 (class 2604 OID 30194)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 30447)
-- Name: modes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes ALTER COLUMN id SET DEFAULT nextval('public.modes_id_seq'::regclass);


--
-- TOC entry 2872 (class 2604 OID 30287)
-- Name: qualifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications ALTER COLUMN id SET DEFAULT nextval('public.qualifications_id_seq'::regclass);


--
-- TOC entry 2876 (class 2604 OID 30327)
-- Name: recruitment_batches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches ALTER COLUMN id SET DEFAULT nextval('public.recruitment_batches_id_seq'::regclass);


--
-- TOC entry 2875 (class 2604 OID 30317)
-- Name: religions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.religions ALTER COLUMN id SET DEFAULT nextval('public.religions_id_seq'::regclass);


--
-- TOC entry 2867 (class 2604 OID 30217)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 30252)
-- Name: subdivisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions ALTER COLUMN id SET DEFAULT nextval('public.subdivisions_id_seq'::regclass);


--
-- TOC entry 2866 (class 2604 OID 30202)
-- Name: user_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_types ALTER COLUMN id SET DEFAULT nextval('public.user_types_id_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 30658)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 30618)
-- Name: zone_subdivisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zone_subdivisions ALTER COLUMN id SET DEFAULT nextval('public.zone_subdivisions_id_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 30227)
-- Name: zones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones ALTER COLUMN id SET DEFAULT nextval('public.zones_id_seq'::regclass);


--
-- TOC entry 3230 (class 0 OID 30595)
-- Dependencies: 248
-- Data for Name: acr_histories; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3196 (class 0 OID 30294)
-- Dependencies: 214
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories (id, category_name, created_by, created_at, updated_at) VALUES (1, 'General', 11, NULL, NULL);
INSERT INTO public.categories (id, category_name, created_by, created_at, updated_at) VALUES (2, 'Scheduled Caste', 11, '2019-07-02 06:58:28', '2019-07-02 06:58:28');
INSERT INTO public.categories (id, category_name, created_by, created_at, updated_at) VALUES (3, 'Scheduled Tribe', 11, '2019-07-02 07:41:15', '2019-07-03 08:42:41');


--
-- TOC entry 3192 (class 0 OID 30269)
-- Dependencies: 210
-- Data for Name: courts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (59, 'Civil Judge Sr  DIV BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:20:52', '2019-11-15 17:20:52');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (60, 'ACJM BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:21:23', '2019-11-15 17:21:23');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (8, 'Bardhaman 1st Court', 51, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:27:25');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (61, 'Civil Judge Jr  DIV COURT BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:22:00', '2019-11-15 17:22:00');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (34, 'asc', 57, NULL, NULL, 11, '2019-11-15 16:34:18', '2019-11-15 16:48:00');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (62, 'JM 2nd COURT BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:22:25', '2019-11-15 17:22:25');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (13, 'Howrah 2nd Court', 77, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:30:49');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (14, 'Howrah 1st Court', 80, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:29:36');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (24, 'North Dinajpur 1st Court', 56, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-08-03 09:22:33');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (25, 'Bankura 1 st Court', 67, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-08-03 09:25:14');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (27, 'South Dinajpore', 81, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-08-03 09:23:52');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (63, 'JM 3rd Court BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:22:53', '2019-11-15 17:22:53');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (30, 'District Judge BANKURA', 75, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-11-15 16:52:38');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (35, 'CJM  BANKURA', 75, NULL, NULL, 11, '2019-11-15 16:54:32', '2019-11-15 16:55:50');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (36, 'CJSD BANKURA', 75, NULL, NULL, 11, '2019-11-15 16:56:34', '2019-11-15 16:56:34');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (38, 'Civil Judge Jr DIV I BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:00:54', '2019-11-15 17:00:54');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (37, 'Civil Judge Sr DIV  Additional  Court  BANKURA', 75, NULL, NULL, 11, '2019-11-15 16:58:42', '2019-11-15 17:02:20');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (39, 'Civil Judge Jr DIV II BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:02:58', '2019-11-15 17:02:58');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (40, 'Civil Judge Jr DIV Additional Court BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:03:41', '2019-11-15 17:03:41');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (41, 'JM 3rd COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:04:13', '2019-11-15 17:04:13');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (42, 'JM 4th COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:04:33', '2019-11-15 17:04:33');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (43, 'JM 5th COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:04:47', '2019-11-15 17:04:47');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (44, 'JM 6th Court BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:05:13', '2019-11-15 17:05:13');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (45, 'JM 7th Court BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:05:44', '2019-11-15 17:05:44');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (48, 'ADJ 2nd Court BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:07:40', '2019-11-15 17:07:40');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (49, 'ADJ 3rd Court BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:08:14', '2019-11-15 17:08:14');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (50, 'ADJ Re Designated Court BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:08:55', '2019-11-15 17:08:55');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (51, 'ADJ Fast Track Court  BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:10:22', '2019-11-15 17:10:22');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (52, 'ADJ  KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:12:57', '2019-11-15 17:12:57');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (53, 'Civil Judge Sr  DIV KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:13:49', '2019-11-15 17:15:41');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (54, 'Civil Judge Jr  DIV 1st Court KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:16:33', '2019-11-15 17:16:33');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (46, 'ADJ 1st Court BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:06:11', '2019-11-15 17:17:38');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (55, 'Civil Judge Jr  DIV 2nd Court KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:19:00', '2019-11-15 17:19:00');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (56, 'ACJM KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:19:35', '2019-11-15 17:19:35');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (57, 'JM KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:19:54', '2019-11-15 17:19:54');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (58, 'ADJ BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:20:23', '2019-11-15 17:20:23');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (64, 'District Judge BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:23:43', '2019-11-15 17:25:11');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (65, 'ADJ 1st Court BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:25:48', '2019-11-15 17:25:48');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (66, 'ADJ 2nd Court BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:26:50', '2019-11-15 17:26:50');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (67, 'ADJ 3rd Court BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:27:21', '2019-11-15 17:27:21');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (68, 'ADJ 4th Court BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:27:42', '2019-11-15 17:27:42');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (69, 'ADJ FTC Court BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:28:20', '2019-11-15 17:28:40');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (70, 'CJM BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:29:02', '2019-11-15 17:29:02');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (71, 'ACJM BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:29:17', '2019-11-15 17:29:17');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (72, ' Civil Judge Sr DIV BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:30:10', '2019-11-15 17:30:10');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (73, 'Civil Judge Jr DIV Sadar Court BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:31:20', '2019-11-15 17:31:20');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (74, 'Civil Judge Jr DIV Additional Court BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:32:52', '2019-11-15 17:32:52');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (75, 'JM 1st Court BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:33:18', '2019-11-15 17:33:18');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (76, 'JM 2nd Court BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:34:00', '2019-11-15 17:34:00');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (77, 'JM 3rd Court BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:34:18', '2019-11-15 17:34:18');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (78, 'Secretary DLSA BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:34:37', '2019-11-15 17:34:37');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (79, 'ADJ FTC Dubrajpur BIRBHUM', 81, NULL, NULL, 11, '2019-11-15 17:35:06', '2019-11-15 17:35:35');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (80, 'Civil Judge Jr DIV Court Dubrajpur BIRBHUM', 81, NULL, NULL, 11, '2019-11-15 17:37:19', '2019-11-15 17:37:19');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (81, 'JM Dubrajpur BIRBHUM', 81, NULL, NULL, 11, '2019-11-15 17:37:57', '2019-11-15 17:37:57');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (1, 'Darjeeling 1st Court', 118, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:28:11');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (3, 'Calcutta City Court', 51, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:19:41');


--
-- TOC entry 3198 (class 0 OID 30304)
-- Dependencies: 216
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3218 (class 0 OID 30505)
-- Dependencies: 236
-- Data for Name: diaries; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3188 (class 0 OID 30234)
-- Dependencies: 206
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (4, 'West Alexys', 7, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (11, 'West Elta', 17, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (12, 'Trantowborough', 17, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (15, 'South Nathanaelview', 24, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (17, 'Zboncakfort', 30, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (18, 'West Magnusview', 30, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (20, 'West Monteborough', 31, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (21, 'South Westleyborough', 31, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (36, 'Kolkata', 51, 11, '2019-07-10 06:27:59', '2019-07-10 06:27:59');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (2, 'East Midnapure', 2, 11, '2019-06-17 06:27:04', '2019-08-05 05:46:51');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (14, 'West Burdwan', 24, 11, '2019-06-17 06:27:05', '2019-08-05 05:47:25');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (26, 'Howrah', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:47:53');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (28, 'Hoogly', 48, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:03');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (25, 'Bankura', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:21');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (5, 'Purulia', 7, 11, '2019-06-17 06:27:05', '2019-08-05 05:48:47');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (27, 'Birbhum', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:49:09');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (8, 'South Dinajpur', 11, 11, '2019-06-17 06:27:05', '2019-08-05 05:50:41');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (22, 'Alipure duar', 38, 11, '2019-06-17 06:27:06', '2019-08-05 05:54:08');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (10, 'Darjeeling', 17, 11, '2019-06-17 06:27:05', '2019-08-05 05:55:27');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (7, 'Kalimpong', 11, 11, '2019-06-17 06:27:05', '2019-08-05 05:56:54');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (6, 'Malda', 8, 11, '2019-06-17 06:27:05', '2019-08-05 05:51:22');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (38, 'North 24 Parganas', 51, 11, '2019-11-11 12:26:13', '2019-11-11 12:26:13');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (13, 'South 24 Parganas', 24, 11, '2019-06-17 06:27:05', '2019-11-11 12:28:19');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (40, 'Purba Bardhaman', 51, 11, '2019-11-11 13:19:11', '2019-11-11 13:19:11');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (41, 'Paschim Bardhaman', 51, 11, '2019-11-11 13:19:29', '2019-11-11 13:19:29');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (42, 'Jhargram', 51, 11, '2019-11-11 13:19:58', '2019-11-11 13:19:58');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (43, 'Paschim Medinipur', 51, 11, '2019-11-11 13:20:14', '2019-11-11 13:20:14');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (44, 'Murshidabad', 51, 11, '2019-11-11 13:20:46', '2019-11-11 13:20:46');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (45, 'Purba Medinipur', 51, 11, '2019-11-11 13:30:59', '2019-11-11 13:30:59');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (46, 'Nadia', 51, 11, '2019-11-11 13:31:32', '2019-11-11 13:31:32');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (47, 'Cooch Behar', 51, 11, '2019-11-11 13:32:34', '2019-11-11 13:32:34');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (48, 'Jalpaiguri', 51, 11, '2019-11-11 13:42:40', '2019-11-11 13:42:40');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (29, 'U Dinajpur', 48, 11, '2019-06-17 06:27:06', '2019-11-11 13:54:30');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (49, 'D Dinajpur', 51, 11, '2019-11-11 14:00:30', '2019-11-11 14:00:30');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (50, 'Andaman and Nicobar Island', 75, 11, '2019-11-11 14:07:53', '2019-11-11 14:07:53');


--
-- TOC entry 3228 (class 0 OID 30585)
-- Dependencies: 246
-- Data for Name: grade_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (1, 'Good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (2, 'Average', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (3, 'Very Good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (4, 'Outstanding', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (5, 'Poor', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');


--
-- TOC entry 3224 (class 0 OID 30560)
-- Dependencies: 242
-- Data for Name: hc_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (1, 'AA', 'ARBRITATION APPL.', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (2, 'ABWA', 'APPL.UND.BENGAL WAKFS ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (3, 'AC', 'AWARD CASES', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (4, 'ACA', 'APPL.UNDER CHARTERED ACCOUNTANTS ACT, 1949', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (5, 'ACO', 'PET. IN COMP. APPL.', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (6, 'ACR', 'APPL.UND.CHARITABLE & RELIGIOUS TRUST ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (7, 'ACRP', 'APPL.UND.SEC.151 OF THE CR.P.C.', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (8, 'ACWA', 'APPL.UND.SEC 21 COST&WORKS ACCOUNTACTS ACT, 1959', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (9, 'AED', 'APPL. U/S. 64 OF ESTATE DUTY ACT, 1953', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (10, 'AET', 'APPL. U/S 25 OF EXPENDITURE TAX ACT, 1957', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (11, 'AFP', 'APPL.FOR LEAVE TO SUE AS AN INDIGENT PERSON', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (12, 'AGA', 'APPL.UND.SEC.25 OF ADMINISTRATOR GENERALS'' ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (13, 'AGL', 'APPL.FOR APPOINTMENT OF GUARDIAN-AD-LITEM', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (14, 'AGT', 'APPL. U/S 26 GIFT TAX ACT, 1958', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (15, 'AGWA', 'APPL.UND.GUARDIANS & WARDS ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (16, 'AHC', 'HABEAS CORPUS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (17, 'AID', 'APPL. UNDER PATENTS & DESIGNS ACT, 1970', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (18, 'AIDR', 'APPL.UND.INDUSTRIAL DEVELOPMENT REGULATION ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (19, 'AIFC', 'APPL.UND.INDUSTRIAL FINANCE CORP. ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (20, 'AIRB', 'APPN.RECON.BANK OF I', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (21, 'ALP', 'APPL.UND.CLAUSE 13 OF LETTERS PATENT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (22, 'ALP.ITL', 'APPL. UNDER CLAUSE 17 OF THE LETTERS PATENT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (23, 'ALPII', 'APPL.UND.CLAUSE 17 L', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (24, 'ALPITL', 'APPL.CLAUSE-17 LP', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (25, 'AOR', 'CALCUTTA OFFICIAL RECEIVER''S ACT 1938', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (26, 'AORC', 'APPLICATION OMNIBUS RESIDUARY CLASS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (27, 'AOT', 'APPL.UND.OFFICIAL TRUSTEES ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (28, 'AP', 'ARBITRATION PETITION', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (29, 'APD', 'APPEAL FROM DECREE', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (30, 'APDT', 'APP. FR. DECR. TEND.', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (31, 'APO', 'APPEAL FROM ORDER', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (32, 'APOT', 'TEMP APO', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (33, 'AS', 'ADMIRALITY  SUITS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (34, 'ASCI', 'APPL.FOR LEAVE TO APPEAL TO THE SUPREME COURT OF INDIA', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (35, 'ASFC', 'APPL.UND.STAE FINANCIAL CORP. ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (36, 'ASM', 'APPL.SANCHAITA MATTERS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (37, 'ATA', 'APPL.UNDER TRUST ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (38, 'ATM', 'APPL.UND.TRADE&MERCHANDISE MARKS, ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (39, 'AUDA', 'APPL.UND.UNCLAIMED DEPOSITS ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (40, 'AWT', 'APPL. U/S 27 OF WEALTH TAX ACT, 1957', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (41, 'BBA', 'APPL.UND.BANKERS BOOKS EVIDENCE ACT, 1891', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (42, 'BIFR', 'BIFR', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (43, 'CA', 'COMPANY APPLICATION', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (44, 'CAA', 'COMMISSIONER OF PATENT APPEAL', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (45, 'CC', 'CONTEMPT OF COURT CASES', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (46, 'CEXA', 'APPL.UND.CENTRAL EXCISE ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (47, 'CHS', 'CHAMBER SUMMONS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (48, 'CP', 'COMPANY PETITIONS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (49, 'CPA', 'COMMISSIONER OF PATE', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (50, 'CRA', 'COPYRIGHT APPEAL', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (51, 'CRCC', 'CRIMINAL CONTEMPT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (52, 'CS', 'CIVIL SUITS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (53, 'CS(O)', 'CIVIL SUIT(OLD)', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (54, 'CSOS', 'CIVIL SUIT ORIGINATING SUMMONS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (55, 'CUSTA', 'APPL.UND.CUSTOMS ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (56, 'DM', 'UND.CHAPTER V OF O.S. RULES', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (57, 'EC', 'EXECUTION CASES', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (58, 'EOPLA', 'EXTRA ORDINARY PROBATE PROCEEDINGS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (59, 'EOS', 'EXTRA ORDINARY SUITS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (60, 'EP', 'ELEC.PET.(PEOPLES REPRESENTATION ACT, 1951)', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (61, 'FEA', 'FOREIGN EXCHANGE APPEAL', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (62, 'FERA', 'APPL.UND.FOREIGN EXCHANGE REGULATION ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (63, 'GCAL', 'APPL.UND.GOLD CONTROL ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (64, 'IC', 'INSOLVENCY CASES', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (65, 'ICA', 'APPL.UNDER INDIAN COMPANIES ACT, 1913', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (66, 'IP', 'IT.PET.256(2)IT''61', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (67, 'ITA', 'INCOME TAX APPEAL', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (68, 'ITAT', 'INCOME TAX APPEAL TENDERED', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (69, 'ITP', 'INCOME TAX PET.(U/S. 256 (2) OF I.T. ACT, 1961)', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (70, 'ITR', 'INCOMETAX REF.SEC.256 (1) OF I.T. ACT, 1961', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (71, 'LM', 'LUNATIC MATTERS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (72, 'LPA', 'LETTERS PATENT APPEAL', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (73, 'MM', 'MISFEAOUCE MATTERS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (74, 'MS', 'MATRIMONIAL SUITS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (75, 'NM', 'NOTICE OF MOTION', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (76, 'OCO', 'ORIGINAL SIDE CROSS OBJECTION', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (77, 'OCOT', 'ORIGINAL SIDE CROSS OBJECTION TENDER', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (78, 'OTS', 'ORDINANCE TRANSFER SUITS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (79, 'PLA', 'APPL.FOR PROBATE & LETTERS OF ADMINISTRATION', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (80, 'PLR', 'UND.CHPT.XXXI-A OF O.S. RULES', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (81, 'PMS', 'PARSI MATRIMONIAL SUITS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (82, 'REF', 'REFERENCE CASE', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (83, 'RVWO', 'MEMORANDUM OF REVIEWS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (84, 'SALT', 'APPL.UND.SALT ACT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (85, 'SANA', 'SANCHAITA APPEAL', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (86, 'SCO', 'SPECIAL CASE FOR OPINION OF COURT', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (87, 'SESS', 'SESSIONS CASES', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (88, 'SS', 'SPECIAL SUITS(SEC 20 OF THE ARBITRATION ACT, 1940', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (89, 'T', 'TEMP A(1)', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (90, 'TBCS', 'TRANSFERRED BANKING COMPANIES SUITS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (91, 'TCS', 'TRANSFERRED COMPANY SUITS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (92, 'TMA', 'TRADE MARK APPEAL', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (93, 'TS', 'TESTAMENTERY SUITS', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (94, 'TUA', 'TRADE UNION APPEAL', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (95, 'WPO', 'WRIT PETITION', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (96, 'WP.CT', 'WP(CENTRAL ADMIN TRIBUNAL)', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (97, 'WP.ST', 'WP(STATE ADMIN TRIBUNAL)', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (98, 'WP.TT', 'WP(WB TAX TRIBUNAL)', 11, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (99, 'WPCR', 'WRIT PETITION(CIVIL RULE)', 11, NULL, NULL);


--
-- TOC entry 3206 (class 0 OID 30388)
-- Dependencies: 224
-- Data for Name: jo_photos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3210 (class 0 OID 30424)
-- Dependencies: 228
-- Data for Name: jo_reporting_reviewings; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3234 (class 0 OID 30635)
-- Dependencies: 252
-- Data for Name: jo_zone_tenures; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3216 (class 0 OID 30484)
-- Dependencies: 234
-- Data for Name: judicial_officer_posting_preferences; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3214 (class 0 OID 30454)
-- Dependencies: 232
-- Data for Name: judicial_officer_postings; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3208 (class 0 OID 30404)
-- Dependencies: 226
-- Data for Name: judicial_officer_qualifications; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3204 (class 0 OID 30334)
-- Dependencies: 222
-- Data for Name: judicial_officers; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3220 (class 0 OID 30521)
-- Dependencies: 238
-- Data for Name: lcr_hc_ends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (8, 2, 51, 1, '1', 200, 2011, '2019-08-23', 11, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (9, 22, 57, 3, '7', 1000, 2005, '2019-08-25', 11, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (10, 22, 57, 3, '1', 3000, 2019, '2019-08-31', 11, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (13, 22, 57, 3, '8', 2200, 2018, '2019-08-21', 11, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (16, 22, 57, 8, '1', 2222, 2018, '2019-08-30', 11, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (19, 10, 118, 1, '1', 123, 1972, '2019-12-31', 30, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (20, 10, 118, 1, '10', 582, 2017, '2020-01-10', 30, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (21, 10, 118, 1, '10', 582, 2017, '2020-01-10', 30, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (22, 25, 75, 30, '1', 456, 1967, '2019-12-31', 30, NULL, NULL);
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (17, 2, 67, 3, '1', 123, 2018, '2019-08-21', 11, NULL, NULL);


--
-- TOC entry 3222 (class 0 OID 30544)
-- Dependencies: 240
-- Data for Name: lcr_lc_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (7, 8, '52', 111, 2018, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (8, 8, '58', 222, 2017, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (9, 8, '9', 333, 2016, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (10, 9, '52', 111, 2018, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (11, 9, '58', 222, 2017, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (12, 10, '1', 111, 2019, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (13, 10, '5', 222, 2010, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (14, 10, '59', 333, 2016, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (15, 10, '5', 444, 2006, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (16, 13, '52', 222, 2019, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (17, 13, '55', 333, 2018, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (18, 16, '1', 2, 2018, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (19, 16, '6', 3, 2017, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (20, 17, '58', 258, 2018, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (21, 17, '52', 753, 2018, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (22, 17, '1', 741, 2017, NULL, 11, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (23, 19, '52', 153, 2002, NULL, 30, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (24, 19, '8', 852, 1976, NULL, 30, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (25, 20, '19', 789, 1999, NULL, 30, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (26, 21, '19', 789, 1999, NULL, 30, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (27, 22, '29', 741, 1986, NULL, 30, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (28, 22, '12', 456, 1996, NULL, 30, NULL, NULL);
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (29, 22, '43', 963, 1985, NULL, 30, NULL, NULL);


--
-- TOC entry 3226 (class 0 OID 30575)
-- Dependencies: 244
-- Data for Name: lower_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (52, 'Act 39', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (1, 'Act Viii Miscellaneous Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (51, 'Act Xiv', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (58, 'Bail', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (59, 'CEX - Excise Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (3, 'Civil Appeal', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (4, 'Civil Execution', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (5, 'Civil Misc', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (6, 'Civil Revision', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (7, 'Complaint Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (55, 'C R Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (8, 'Criminal Appeal', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (9, 'Criminal Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (11, 'Criminal Misc Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (12, 'Criminal Revision', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (10, 'Crl. Execution - Criminal Execution', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (23, 'Divorce On Mutual Consent - Matri Suit Divorce Mutual Cons', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (13, 'Electricity Act', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (14, 'Estate Acquisition Appeal', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (16, 'Gr Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (17, 'Hindu Adapt. and Maint Act - Hindu Adapt. and Maint Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (18, 'Insolvancy Petition', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (19, 'L A C - Land Acquisition Cases', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (20, 'L A Ex. - Land Acquisition Execution', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (53, 'L A Suit', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (21, 'M A C C - M.A.C.C', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (22, 'M A C C Ex. - MACC Execution', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (36, 'Maintenance Case - MR case for Maintenance', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (24, 'Matrimonial Suit', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (25, 'Mc - Misc Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (54, 'M C Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (29, 'Misc. Appeal', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (26, 'Misc Case (pre-emption)', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (30, 'Misc. Criminal Revision', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (27, 'Misc Crl Case - Misc Criminal Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (31, 'Misc. Execution Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (57, 'Misc Petition (156) - Misc Petition', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (28, 'Mjc - Misc Judicial Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (32, 'Money Appeal', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (33, 'Money Execution', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (34, 'Money Suit', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (35, 'M V Act - Motor Vehicle Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (37, 'N D P S Case - NDPS Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (38, 'NGR Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (39, 'Other Appeal', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (40, 'Other Suit', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (41, 'Probate Suit', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (15, 'S C C Ex. - Execution', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (42, 'S C C Suit - SCC SUIT', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (43, 'Sessions Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (44, 'Sessions Trial', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (45, 'Special Court Cases', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (46, 'Succession Case', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (47, 'Title Appeal', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (48, 'Title Execution', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (49, 'Title Suit', 11, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (50, 'Trust Suit', 11, NULL, NULL);


--
-- TOC entry 3179 (class 0 OID 30191)
-- Dependencies: 197
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations (id, migration, batch) VALUES (1, '2014_10_10_000000_create_user_types_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (3, '2019_06_12_000005_create_states_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (4, '2019_06_12_000010_create_zones_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (5, '2019_06_12_000020_create_districts_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (6, '2019_06_12_000025_create_subdivisions_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (7, '2019_06_12_000040_create_courts_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (8, '2019_06_12_000050_create_qualifications_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (9, '2019_06_12_000060_create_categories_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (10, '2019_06_12_000070_create_designations_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (11, '2019_06_12_000080_create_religions_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (12, '2019_06_12_000090_create_recruitment_batches_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (13, '2019_06_12_000100_create_judicial_officers_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (14, '2019_06_12_000110_create_jo_photos_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (15, '2019_06_13_091801_create_judicial_officer_qualifications_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (16, '2019_06_13_092954_create_jo_reporting_reviewings_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (17, '2019_06_13_093750_create_modes_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (18, '2019_06_13_093852_create_judicial_officer_postings_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (19, '2019_06_13_101842_create_judicial_officer_posting_preferences_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (20, '2019_07_22_064308_create_diaries_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (21, '2019_08_13_091522_create_lcr_hc_ends_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (22, '2019_08_13_091810_create_lcr_lc_details_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (23, '2019_08_13_101720_create_hc_case_types_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (24, '2019_08_13_102950_create_lower_case_types_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (25, '2019_09_24_102032_create_grade_details_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (26, '2019_09_24_102258_create_acr_histories_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (27, '2019_11_11_170427_create_zone_subdivisions_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (28, '2019_11_14_163154_create_jo_zone_tenures_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (29, '2019_11_14_163155_create_users_table', 1);


--
-- TOC entry 3212 (class 0 OID 30444)
-- Dependencies: 230
-- Data for Name: modes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3182 (class 0 OID 30205)
-- Dependencies: 200
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3194 (class 0 OID 30284)
-- Dependencies: 212
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (5, 'BCom', 11, '2019-06-25 07:18:30', '2019-06-25 07:18:30');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (7, 'MA LLB', 11, '2019-06-25 07:18:47', '2019-06-25 07:18:47');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (8, 'BA LLB', 11, '2019-06-28 09:50:19', '2019-07-01 10:14:25');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (10, 'M.Sc', 11, '2019-07-01 11:25:58', '2019-07-01 11:27:09');


--
-- TOC entry 3202 (class 0 OID 30324)
-- Dependencies: 220
-- Data for Name: recruitment_batches; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (5, 'psc 2011', 2011, 11, '2019-06-26 11:49:37', '2019-06-26 11:49:37');
INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (8, 'CLAT 2011', 2003, 11, '2019-06-26 11:55:19', '2019-06-26 11:57:00');
INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (1, 'PSC 2000', 2000, 11, NULL, '2019-06-29 08:58:19');


--
-- TOC entry 3200 (class 0 OID 30314)
-- Dependencies: 218
-- Data for Name: religions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.religions (id, religion_name, created_by, created_at, updated_at) VALUES (1, 'Hindu', 11, NULL, NULL);
INSERT INTO public.religions (id, religion_name, created_by, created_at, updated_at) VALUES (2, 'Muslim', 11, '2019-07-02 11:23:49', '2019-07-02 11:24:02');


--
-- TOC entry 3184 (class 0 OID 30214)
-- Dependencies: 202
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
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (75, 'Andaman and Nicobar Island', 11, '2019-11-11 14:04:17', '2019-11-11 14:04:17');


--
-- TOC entry 3190 (class 0 OID 30249)
-- Dependencies: 208
-- Data for Name: subdivisions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (152, 'Campvell bay', 50, 8, 11, '2019-11-15 13:28:21', '2019-11-15 13:28:21');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (133, 'Mayabunder', 50, 8, 11, '2019-11-11 14:08:37', '2019-11-11 14:08:37');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (132, 'Car Nicobar', 50, 8, 11, '2019-11-11 14:08:27', '2019-11-11 14:08:27');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (131, 'Port Blair', 50, 8, 11, '2019-11-11 14:08:16', '2019-11-11 14:08:16');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (130, 'Mal', 48, 8, 11, '2019-11-11 14:02:42', '2019-11-11 14:02:42');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (129, 'Alipurduar', 48, 8, 11, '2019-11-11 14:02:34', '2019-11-11 14:02:34');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (128, 'Jalpaiguri Sadar', 48, 8, 11, '2019-11-11 14:02:08', '2019-11-11 14:02:08');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (127, 'Buniadpur', 49, 8, 11, '2019-11-11 14:01:48', '2019-11-11 14:01:48');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (125, 'Balurghat', 49, 8, 11, '2019-11-11 14:01:02', '2019-11-11 14:01:02');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (124, 'Gorubathan', 7, 8, 11, '2019-11-11 13:59:52', '2019-11-11 13:59:52');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (123, 'Kalimpong Sadar', 7, 8, 11, '2019-11-11 13:59:32', '2019-11-11 13:59:32');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (122, 'Mungpoo', 10, 8, 11, '2019-11-11 13:59:14', '2019-11-11 13:59:14');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (121, 'Mirik', 10, 8, 11, '2019-11-11 13:59:04', '2019-11-11 13:59:04');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (120, 'Kurseong', 10, 8, 11, '2019-11-11 13:58:55', '2019-11-11 13:58:55');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (119, 'Siliguri', 10, 8, 11, '2019-11-11 13:58:43', '2019-11-11 13:58:43');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (118, 'Darjeeling Sadar', 10, 8, 11, '2019-11-11 13:58:19', '2019-11-11 13:58:19');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (117, 'Mekhligunj', 47, 8, 11, '2019-11-11 13:57:57', '2019-11-11 13:57:57');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (116, 'Mathabhanga', 47, 8, 11, '2019-11-11 13:57:43', '2019-11-11 13:57:43');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (115, 'Tufangunj', 47, 8, 11, '2019-11-11 13:57:27', '2019-11-11 13:57:27');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (113, 'Dinhata', 47, 8, 11, '2019-11-11 13:56:39', '2019-11-11 13:56:39');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (112, 'Cooch Behar Sadar', 47, 8, 11, '2019-11-11 13:56:24', '2019-11-11 13:56:24');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (111, 'islampur', 29, 8, 11, '2019-11-11 13:56:03', '2019-11-11 13:56:03');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (110, 'Raiganj', 29, 8, 11, '2019-11-11 13:55:49', '2019-11-11 13:55:49');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (109, 'Lalbagh', 44, 7, 11, '2019-11-11 13:53:14', '2019-11-11 13:53:14');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (108, 'Kandi', 44, 7, 11, '2019-11-11 13:52:34', '2019-11-11 13:52:34');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (106, 'Berhampore', 44, 7, 11, '2019-11-11 13:52:11', '2019-11-11 13:52:11');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (107, 'Jangipur', 44, 7, 11, '2019-11-11 13:52:25', '2019-11-11 13:52:25');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (105, 'Haldia', 43, 6, 11, '2019-11-11 13:51:34', '2019-11-11 13:51:34');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (104, 'Contai', 43, 6, 11, '2019-11-11 13:48:53', '2019-11-11 13:48:53');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (103, 'Tamluk', 45, 6, 11, '2019-11-11 13:48:14', '2019-11-11 13:48:33');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (102, 'Nabadwip', 46, 6, 11, '2019-11-11 13:47:28', '2019-11-11 13:47:28');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (101, 'Tehatta', 46, 6, 11, '2019-11-11 13:47:06', '2019-11-11 13:47:06');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (100, 'Ranaghat', 46, 6, 11, '2019-11-11 13:46:53', '2019-11-11 13:46:53');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (99, 'Kalyani', 46, 4, 11, '2019-11-11 13:46:33', '2019-11-11 13:46:33');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (98, 'Krishnanagar', 46, 6, 11, '2019-11-11 13:46:17', '2019-11-11 13:46:17');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (97, 'Kharagpur', 43, 6, 11, '2019-11-11 13:28:42', '2019-11-11 13:28:42');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (96, 'Garbeta', 43, 6, 11, '2019-11-11 13:28:13', '2019-11-11 13:28:13');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (95, 'Dantan', 43, 6, 11, '2019-11-11 13:27:47', '2019-11-11 13:27:47');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (94, 'Ghatal', 43, 6, 11, '2019-11-11 13:27:28', '2019-11-11 13:27:28');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (93, 'Paschim Medinipur Sadar', 43, 6, 11, '2019-11-11 13:27:14', '2019-11-11 13:27:14');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (92, 'Durgapur', 41, 6, 11, '2019-11-11 13:24:04', '2019-11-11 13:24:04');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (91, 'Asansol', 41, 6, 11, '2019-11-11 13:23:34', '2019-11-11 13:23:34');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (90, 'Jhargram', 42, 6, 11, '2019-11-11 13:23:05', '2019-11-11 13:23:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (89, 'Katwa', 40, 6, 11, '2019-11-11 13:22:40', '2019-11-11 13:22:40');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (88, 'Kalna', 40, 6, 11, '2019-11-11 13:22:20', '2019-11-11 13:22:20');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (87, 'Purba Bardhaman Sadar', 40, 6, 11, '2019-11-11 13:22:06', '2019-11-11 13:22:06');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (86, 'Raghunathpur', 5, 7, 11, '2019-11-11 13:07:24', '2019-11-11 13:07:24');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (85, 'Purulia Sadar', 5, 7, 11, '2019-11-11 13:07:06', '2019-11-11 13:07:06');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (83, 'Chanchal', 6, 7, 11, '2019-11-11 13:04:39', '2019-11-11 13:04:39');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (82, 'Malda Sadar', 6, 7, 11, '2019-11-11 13:04:24', '2019-11-11 13:04:24');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (81, 'Dubrajpur', 27, 7, 11, '2019-11-11 13:04:02', '2019-11-11 13:04:02');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (80, 'Rampurhat', 27, 7, 11, '2019-11-11 13:03:39', '2019-11-11 13:03:39');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (79, 'Bolpur', 27, 7, 11, '2019-11-11 13:03:21', '2019-11-11 13:03:21');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (78, 'Birbhum Sadar', 27, 7, 11, '2019-11-11 13:03:09', '2019-11-11 13:03:09');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (77, 'Khatra', 25, 7, 11, '2019-11-11 13:02:41', '2019-11-11 13:02:41');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (76, 'Bishnupur', 25, 7, 11, '2019-11-11 13:02:30', '2019-11-11 13:02:30');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (75, 'Bankura Sadar', 25, 7, 11, '2019-11-11 13:02:17', '2019-11-11 13:02:17');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (74, 'Sealdah', 13, 4, 11, '2019-11-11 12:56:33', '2019-11-11 12:56:33');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (71, 'Kakdwip', 13, 4, 11, '2019-11-11 12:39:24', '2019-11-11 12:39:24');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (70, 'Diamond Harbour', 13, 4, 11, '2019-11-11 12:38:53', '2019-11-11 12:38:53');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (69, 'BARUIPORE', 13, 4, 11, '2019-11-11 12:38:32', '2019-11-11 12:38:32');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (68, 'Alipore', 13, 4, 11, '2019-11-11 12:38:18', '2019-11-15 14:35:01');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (67, 'Basirhat', 38, 6, 11, '2019-11-11 12:37:43', '2019-11-11 12:37:43');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (66, 'Bongaon', 38, 6, 11, '2019-11-11 12:37:28', '2019-11-11 12:37:28');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (65, 'Sealdah', 38, 4, 11, '2019-11-11 12:37:00', '2019-11-11 12:37:00');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (64, 'Bidhannagar', 38, 4, 11, '2019-11-11 12:36:40', '2019-11-11 12:36:40');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (63, 'Barrackpore', 38, 4, 11, '2019-11-11 12:36:18', '2019-11-11 12:36:18');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (62, 'Barasat', 38, 4, 11, '2019-11-11 12:35:41', '2019-11-11 12:35:41');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (61, 'Amta', 26, 4, 11, '2019-11-11 12:25:28', '2019-11-11 12:25:28');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (60, 'Uluberia', 26, 4, 11, '2019-11-11 12:25:19', '2019-11-11 12:25:19');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (58, 'Howrah Sadar', 26, 4, 11, '2019-11-11 12:24:01', '2019-11-11 12:24:01');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (57, 'Arambagh', 28, 6, 11, '2019-11-11 12:18:01', '2019-11-11 12:18:01');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (56, 'Chandannagar', 28, 4, 11, '2019-11-11 12:17:46', '2019-11-11 12:17:46');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (55, 'Serampore', 28, 4, 11, '2019-11-11 12:17:18', '2019-11-11 12:17:18');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (54, 'Hoogly Sadar', 28, 4, 11, '2019-11-11 12:16:48', '2019-11-11 12:24:53');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (53, 'Provincial  Small Causes Court (PSCC)', 36, 4, 11, '2019-11-11 12:14:15', '2019-11-11 12:15:22');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (52, 'City Civil Court', 36, 4, 11, '2019-11-11 12:14:01', '2019-11-11 12:14:01');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (51, 'City Sessions Court', 36, 4, 11, '2019-11-11 12:13:44', '2019-11-11 12:13:44');


--
-- TOC entry 3181 (class 0 OID 30199)
-- Dependencies: 199
-- Data for Name: user_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (1, 'Administrator', NULL, NULL);
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (2, 'Judicial Officer', NULL, NULL);
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (3, 'Departmental Officer', NULL, NULL);
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (6, 'Court', '2019-08-30 06:31:42', '2019-08-30 06:31:42');
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (5, 'Inspection', '2019-08-28 08:33:30', '2019-08-28 08:34:39');


--
-- TOC entry 3236 (class 0 OID 30655)
-- Dependencies: 254
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (11, 'admin', 'Administrator 1', 1, 1, NULL, NULL, NULL, 'admin@admin.admin', NULL, '$2y$10$or1dBRoI3FxqDddrMTwDEO9MOo5MuHRX8EpLNPRd6Q94VU76L2rUy', 'VAX5uQEmi51s3j7l6t4AKzYKZFN70dghQ2nGqKYZCyQELpibGSYMLf7HqqLm', '2019-06-19 06:00:07', '2019-06-19 06:00:07');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (30, 'Court1', 'ABC', 6, 3, NULL, NULL, NULL, 'court1@court1.court1', NULL, '$2y$10$Y58W8jF73HGnjMo4KtjLV.XRK76uu7LKNQzAhYmU8BCqO86hQ06/a', NULL, '2019-09-16 10:59:20', '2019-09-16 10:59:20');


--
-- TOC entry 3232 (class 0 OID 30615)
-- Dependencies: 250
-- Data for Name: zone_subdivisions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3186 (class 0 OID 30224)
-- Dependencies: 204
-- Data for Name: zones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (4, 'A', 1095, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (6, 'B', 1095, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (8, 'D', 730, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (7, 'C', 1095, 11, '2019-11-13 00:00:00', '2019-11-15 11:31:20');


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 247
-- Name: acr_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acr_histories_id_seq', 1, false);


--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 213
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 209
-- Name: courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courts_id_seq', 1, false);


--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 215
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.designations_id_seq', 1, false);


--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 235
-- Name: diaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.diaries_id_seq', 1, false);


--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 205
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.districts_id_seq', 1, false);


--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 245
-- Name: grade_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grade_details_id_seq', 1, false);


--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 241
-- Name: hc_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hc_case_types_id_seq', 1, false);


--
-- TOC entry 3279 (class 0 OID 0)
-- Dependencies: 223
-- Name: jo_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_photos_id_seq', 1, false);


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 227
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_reporting_reviewings_id_seq', 1, false);


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 251
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_zone_tenures_id_seq', 1, false);


--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 233
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_posting_preferences_id_seq', 1, false);


--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 231
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_postings_id_seq', 1, false);


--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 225
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_qualifications_id_seq', 1, false);


--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 221
-- Name: judicial_officers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officers_id_seq', 1, false);


--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 237
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_hc_ends_id_seq', 1, false);


--
-- TOC entry 3287 (class 0 OID 0)
-- Dependencies: 239
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_lc_details_id_seq', 1, false);


--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 243
-- Name: lower_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lower_case_types_id_seq', 1, false);


--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 29, true);


--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 229
-- Name: modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.modes_id_seq', 1, false);


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 211
-- Name: qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.qualifications_id_seq', 1, false);


--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 219
-- Name: recruitment_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recruitment_batches_id_seq', 1, false);


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 217
-- Name: religions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.religions_id_seq', 1, false);


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 201
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 1, false);


--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 207
-- Name: subdivisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subdivisions_id_seq', 1, false);


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 198
-- Name: user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_types_id_seq', 1, false);


--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 253
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 249
-- Name: zone_subdivisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zone_subdivisions_id_seq', 1, false);


--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 203
-- Name: zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zones_id_seq', 1, false);


--
-- TOC entry 3000 (class 2606 OID 30602)
-- Name: acr_histories acr_histories_judicial_officer_id_year_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_judicial_officer_id_year_unique UNIQUE (judicial_officer_id, year);


--
-- TOC entry 3002 (class 2606 OID 30600)
-- Name: acr_histories acr_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 2924 (class 2606 OID 30301)
-- Name: categories categories_category_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_name_unique UNIQUE (category_name);


--
-- TOC entry 2926 (class 2606 OID 30299)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2916 (class 2606 OID 30281)
-- Name: courts courts_court_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_court_name_unique UNIQUE (court_name);


--
-- TOC entry 2918 (class 2606 OID 30274)
-- Name: courts courts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_pkey PRIMARY KEY (id);


--
-- TOC entry 2928 (class 2606 OID 30311)
-- Name: designations designations_designation_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_designation_name_unique UNIQUE (designation_name);


--
-- TOC entry 2930 (class 2606 OID 30309)
-- Name: designations designations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- TOC entry 2980 (class 2606 OID 30513)
-- Name: diaries diaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diaries
    ADD CONSTRAINT diaries_pkey PRIMARY KEY (id);


--
-- TOC entry 2908 (class 2606 OID 30246)
-- Name: districts districts_district_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_district_name_unique UNIQUE (district_name);


--
-- TOC entry 2910 (class 2606 OID 30239)
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- TOC entry 2996 (class 2606 OID 30592)
-- Name: grade_details grade_details_grade_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade_details
    ADD CONSTRAINT grade_details_grade_name_unique UNIQUE (grade_name);


--
-- TOC entry 2998 (class 2606 OID 30590)
-- Name: grade_details grade_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade_details
    ADD CONSTRAINT grade_details_pkey PRIMARY KEY (id);


--
-- TOC entry 2986 (class 2606 OID 30572)
-- Name: hc_case_types hc_case_types_full_form_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types
    ADD CONSTRAINT hc_case_types_full_form_unique UNIQUE (full_form);


--
-- TOC entry 2988 (class 2606 OID 30568)
-- Name: hc_case_types hc_case_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types
    ADD CONSTRAINT hc_case_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2990 (class 2606 OID 30570)
-- Name: hc_case_types hc_case_types_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types
    ADD CONSTRAINT hc_case_types_type_name_unique UNIQUE (type_name);


--
-- TOC entry 2960 (class 2606 OID 30396)
-- Name: jo_photos jo_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_photos
    ADD CONSTRAINT jo_photos_pkey PRIMARY KEY (id);


--
-- TOC entry 2966 (class 2606 OID 30431)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_judicial_officer_id_reporting_officer_i; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_judicial_officer_id_reporting_officer_i UNIQUE (judicial_officer_id, reporting_officer_id);


--
-- TOC entry 2968 (class 2606 OID 30429)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_pkey PRIMARY KEY (id);


--
-- TOC entry 3008 (class 2606 OID 30642)
-- Name: jo_zone_tenures jo_zone_tenures_judicial_officer_id_zone_id_from_date_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_judicial_officer_id_zone_id_from_date_unique UNIQUE (judicial_officer_id, zone_id, from_date);


--
-- TOC entry 3010 (class 2606 OID 30640)
-- Name: jo_zone_tenures jo_zone_tenures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_pkey PRIMARY KEY (id);


--
-- TOC entry 2978 (class 2606 OID 30492)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 2974 (class 2606 OID 30461)
-- Name: judicial_officer_postings judicial_officer_postings_judicial_officer_id_designation_id_co; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_judicial_officer_id_designation_id_co UNIQUE (judicial_officer_id, designation_id, court_id, mode_id, from_date);


--
-- TOC entry 2976 (class 2606 OID 30459)
-- Name: judicial_officer_postings judicial_officer_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_pkey PRIMARY KEY (id);


--
-- TOC entry 2962 (class 2606 OID 30411)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_judicial_officer_id_qualificati; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_judicial_officer_id_qualificati UNIQUE (judicial_officer_id, qualification_id);


--
-- TOC entry 2964 (class 2606 OID 30409)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2940 (class 2606 OID 30373)
-- Name: judicial_officers judicial_officers_aadhaar_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_aadhaar_no_unique UNIQUE (aadhaar_no);


--
-- TOC entry 2942 (class 2606 OID 30383)
-- Name: judicial_officers judicial_officers_email_id_1_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_email_id_1_unique UNIQUE (email_id_1);


--
-- TOC entry 2944 (class 2606 OID 30385)
-- Name: judicial_officers judicial_officers_email_id_2_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_email_id_2_unique UNIQUE (email_id_2);


--
-- TOC entry 2946 (class 2606 OID 30377)
-- Name: judicial_officers judicial_officers_gpf_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_gpf_no_unique UNIQUE (gpf_no);


--
-- TOC entry 2948 (class 2606 OID 30371)
-- Name: judicial_officers judicial_officers_jo_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_jo_code_unique UNIQUE (jo_code);


--
-- TOC entry 2950 (class 2606 OID 30379)
-- Name: judicial_officers judicial_officers_mobile_no_1_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_mobile_no_1_unique UNIQUE (mobile_no_1);


--
-- TOC entry 2952 (class 2606 OID 30381)
-- Name: judicial_officers judicial_officers_mobile_no_2_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_mobile_no_2_unique UNIQUE (mobile_no_2);


--
-- TOC entry 2954 (class 2606 OID 30375)
-- Name: judicial_officers judicial_officers_pan_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_pan_no_unique UNIQUE (pan_no);


--
-- TOC entry 2956 (class 2606 OID 30342)
-- Name: judicial_officers judicial_officers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_pkey PRIMARY KEY (id);


--
-- TOC entry 2958 (class 2606 OID 30369)
-- Name: judicial_officers judicial_officers_registration_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_registration_no_unique UNIQUE (registration_no);


--
-- TOC entry 2982 (class 2606 OID 30526)
-- Name: lcr_hc_ends lcr_hc_ends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_pkey PRIMARY KEY (id);


--
-- TOC entry 2984 (class 2606 OID 30552)
-- Name: lcr_lc_details lcr_lc_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details
    ADD CONSTRAINT lcr_lc_details_pkey PRIMARY KEY (id);


--
-- TOC entry 2992 (class 2606 OID 30580)
-- Name: lower_case_types lower_case_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types
    ADD CONSTRAINT lower_case_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2994 (class 2606 OID 30582)
-- Name: lower_case_types lower_case_types_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types
    ADD CONSTRAINT lower_case_types_type_name_unique UNIQUE (type_name);


--
-- TOC entry 2895 (class 2606 OID 30196)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2970 (class 2606 OID 30449)
-- Name: modes modes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_pkey PRIMARY KEY (id);


--
-- TOC entry 2972 (class 2606 OID 30451)
-- Name: modes modes_posting_mode_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_posting_mode_unique UNIQUE (posting_mode);


--
-- TOC entry 2920 (class 2606 OID 30289)
-- Name: qualifications qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 30291)
-- Name: qualifications qualifications_qualification_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_qualification_name_unique UNIQUE (qualification_name);


--
-- TOC entry 2936 (class 2606 OID 30329)
-- Name: recruitment_batches recruitment_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches
    ADD CONSTRAINT recruitment_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 2938 (class 2606 OID 30331)
-- Name: recruitment_batches recruitment_batches_recruitment_batch_desc_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches
    ADD CONSTRAINT recruitment_batches_recruitment_batch_desc_unique UNIQUE (recruitment_batch_desc);


--
-- TOC entry 2932 (class 2606 OID 30319)
-- Name: religions religions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.religions
    ADD CONSTRAINT religions_pkey PRIMARY KEY (id);


--
-- TOC entry 2934 (class 2606 OID 30321)
-- Name: religions religions_religion_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.religions
    ADD CONSTRAINT religions_religion_name_unique UNIQUE (religion_name);


--
-- TOC entry 2900 (class 2606 OID 30219)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 2902 (class 2606 OID 30221)
-- Name: states states_state_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_state_name_unique UNIQUE (state_name);


--
-- TOC entry 2912 (class 2606 OID 30254)
-- Name: subdivisions subdivisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_pkey PRIMARY KEY (id);


--
-- TOC entry 2914 (class 2606 OID 30256)
-- Name: subdivisions subdivisions_subdivision_name_district_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_subdivision_name_district_id_unique UNIQUE (subdivision_name, district_id);


--
-- TOC entry 2897 (class 2606 OID 30204)
-- Name: user_types user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_types
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3012 (class 2606 OID 30680)
-- Name: users users_court_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_court_id_unique UNIQUE (court_id);


--
-- TOC entry 3014 (class 2606 OID 30686)
-- Name: users users_department_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_department_id_unique UNIQUE (department_id);


--
-- TOC entry 3016 (class 2606 OID 30688)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3018 (class 2606 OID 30684)
-- Name: users users_jo_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_jo_code_unique UNIQUE (jo_code);


--
-- TOC entry 3020 (class 2606 OID 30682)
-- Name: users users_judicial_officer_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_judicial_officer_id_unique UNIQUE (judicial_officer_id);


--
-- TOC entry 3022 (class 2606 OID 30663)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3004 (class 2606 OID 30620)
-- Name: zone_subdivisions zone_subdivisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zone_subdivisions
    ADD CONSTRAINT zone_subdivisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3006 (class 2606 OID 30622)
-- Name: zone_subdivisions zone_subdivisions_zone_id_subdivision_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zone_subdivisions
    ADD CONSTRAINT zone_subdivisions_zone_id_subdivision_id_unique UNIQUE (zone_id, subdivision_id);


--
-- TOC entry 2904 (class 2606 OID 30229)
-- Name: zones zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 30231)
-- Name: zones zones_zone_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_zone_name_unique UNIQUE (zone_name);


--
-- TOC entry 2898 (class 1259 OID 30211)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 3049 (class 2606 OID 30608)
-- Name: acr_histories acr_histories_grade_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_grade_id_foreign FOREIGN KEY (grade_id) REFERENCES public.grade_details(id);


--
-- TOC entry 3048 (class 2606 OID 30603)
-- Name: acr_histories acr_histories_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3026 (class 2606 OID 30275)
-- Name: courts courts_subdivision_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_subdivision_id_foreign FOREIGN KEY (subdivision_id) REFERENCES public.subdivisions(id);


--
-- TOC entry 3043 (class 2606 OID 30514)
-- Name: diaries diaries_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diaries
    ADD CONSTRAINT diaries_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3023 (class 2606 OID 30240)
-- Name: districts districts_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_state_id_foreign FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- TOC entry 3032 (class 2606 OID 30397)
-- Name: jo_photos jo_photos_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_photos
    ADD CONSTRAINT jo_photos_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3035 (class 2606 OID 30432)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3036 (class 2606 OID 30437)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_reporting_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_reporting_officer_id_foreign FOREIGN KEY (reporting_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3052 (class 2606 OID 30643)
-- Name: jo_zone_tenures jo_zone_tenures_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3053 (class 2606 OID 30648)
-- Name: jo_zone_tenures jo_zone_tenures_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 3041 (class 2606 OID 30493)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_judicial_officer_id_foreig; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_judicial_officer_id_foreig FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3042 (class 2606 OID 30498)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 3039 (class 2606 OID 30472)
-- Name: judicial_officer_postings judicial_officer_postings_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_court_id_foreign FOREIGN KEY (court_id) REFERENCES public.courts(id);


--
-- TOC entry 3038 (class 2606 OID 30467)
-- Name: judicial_officer_postings judicial_officer_postings_designation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_designation_id_foreign FOREIGN KEY (designation_id) REFERENCES public.designations(id);


--
-- TOC entry 3037 (class 2606 OID 30462)
-- Name: judicial_officer_postings judicial_officer_postings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3040 (class 2606 OID 30477)
-- Name: judicial_officer_postings judicial_officer_postings_mode_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_mode_id_foreign FOREIGN KEY (mode_id) REFERENCES public.modes(id);


--
-- TOC entry 3033 (class 2606 OID 30412)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3034 (class 2606 OID 30417)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_qualification_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_qualification_id_foreign FOREIGN KEY (qualification_id) REFERENCES public.qualifications(id);


--
-- TOC entry 3029 (class 2606 OID 30353)
-- Name: judicial_officers judicial_officers_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3027 (class 2606 OID 30343)
-- Name: judicial_officers judicial_officers_home_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_home_district_id_foreign FOREIGN KEY (home_district_id) REFERENCES public.districts(id);


--
-- TOC entry 3028 (class 2606 OID 30348)
-- Name: judicial_officers judicial_officers_home_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_home_state_id_foreign FOREIGN KEY (home_state_id) REFERENCES public.states(id);


--
-- TOC entry 3031 (class 2606 OID 30363)
-- Name: judicial_officers judicial_officers_recruitment_batch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_recruitment_batch_id_foreign FOREIGN KEY (recruitment_batch_id) REFERENCES public.recruitment_batches(id);


--
-- TOC entry 3030 (class 2606 OID 30358)
-- Name: judicial_officers judicial_officers_religion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_religion_id_foreign FOREIGN KEY (religion_id) REFERENCES public.religions(id);


--
-- TOC entry 3044 (class 2606 OID 30527)
-- Name: lcr_hc_ends lcr_hc_ends_court_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_court_foreign FOREIGN KEY (court) REFERENCES public.courts(id);


--
-- TOC entry 3046 (class 2606 OID 30537)
-- Name: lcr_hc_ends lcr_hc_ends_district_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_district_foreign FOREIGN KEY (district) REFERENCES public.districts(id);


--
-- TOC entry 3045 (class 2606 OID 30532)
-- Name: lcr_hc_ends lcr_hc_ends_subdivision_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_subdivision_foreign FOREIGN KEY (subdivision) REFERENCES public.subdivisions(id);


--
-- TOC entry 3047 (class 2606 OID 30553)
-- Name: lcr_lc_details lcr_lc_details_hc_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details
    ADD CONSTRAINT lcr_lc_details_hc_id_foreign FOREIGN KEY (hc_id) REFERENCES public.lcr_hc_ends(id);


--
-- TOC entry 3024 (class 2606 OID 30257)
-- Name: subdivisions subdivisions_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_district_id_foreign FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- TOC entry 3025 (class 2606 OID 30262)
-- Name: subdivisions subdivisions_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 3054 (class 2606 OID 30664)
-- Name: users users_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_court_id_foreign FOREIGN KEY (court_id) REFERENCES public.courts(id);


--
-- TOC entry 3055 (class 2606 OID 30669)
-- Name: users users_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3056 (class 2606 OID 30674)
-- Name: users users_user_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_type_id_foreign FOREIGN KEY (user_type_id) REFERENCES public.user_types(id);


--
-- TOC entry 3051 (class 2606 OID 30628)
-- Name: zone_subdivisions zone_subdivisions_subdivision_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zone_subdivisions
    ADD CONSTRAINT zone_subdivisions_subdivision_id_foreign FOREIGN KEY (subdivision_id) REFERENCES public.subdivisions(id);


--
-- TOC entry 3050 (class 2606 OID 30623)
-- Name: zone_subdivisions zone_subdivisions_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zone_subdivisions
    ADD CONSTRAINT zone_subdivisions_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


-- Completed on 2019-11-21 22:01:53

--
-- PostgreSQL database dump complete
--

