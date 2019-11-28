--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2019-11-29 00:45:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 265 (class 1255 OID 30743)
-- Name: movedeleted(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.movedeleted() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                BEGIN
                    insert into history_deleted_data(table_name,deleted_data,deleted_time)
                    values(TG_TABLE_NAME,row_to_json(OLD),now());
                    return OLD;
                END;
            $$;


--
-- TOC entry 266 (class 1255 OID 30744)
-- Name: moveupdated(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.moveupdated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                BEGIN
                    insert into history_updated_data(table_name,updated_data,updated_time)
                    values(TG_TABLE_NAME,row_to_json(OLD),now());
                    return OLD;
                END;
            $$;


SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 30745)
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
-- TOC entry 197 (class 1259 OID 30748)
-- Name: acr_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.acr_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 197
-- Name: acr_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.acr_histories_id_seq OWNED BY public.acr_histories.id;


--
-- TOC entry 198 (class 1259 OID 30750)
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
-- TOC entry 199 (class 1259 OID 30753)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 199
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 200 (class 1259 OID 30755)
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
-- TOC entry 201 (class 1259 OID 30758)
-- Name: courts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 201
-- Name: courts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courts_id_seq OWNED BY public.courts.id;


--
-- TOC entry 202 (class 1259 OID 30760)
-- Name: departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.departments (
    id bigint NOT NULL,
    dept_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 203 (class 1259 OID 30763)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 203
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 204 (class 1259 OID 30765)
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
-- TOC entry 205 (class 1259 OID 30768)
-- Name: designations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.designations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 205
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.designations_id_seq OWNED BY public.designations.id;


--
-- TOC entry 206 (class 1259 OID 30770)
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
-- TOC entry 207 (class 1259 OID 30776)
-- Name: diaries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.diaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 207
-- Name: diaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.diaries_id_seq OWNED BY public.diaries.id;


--
-- TOC entry 208 (class 1259 OID 30778)
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
-- TOC entry 209 (class 1259 OID 30781)
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 209
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;


--
-- TOC entry 210 (class 1259 OID 30783)
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
-- TOC entry 211 (class 1259 OID 30786)
-- Name: grade_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grade_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 211
-- Name: grade_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grade_details_id_seq OWNED BY public.grade_details.id;


--
-- TOC entry 212 (class 1259 OID 30788)
-- Name: hc_case_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hc_case_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    full_form character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 213 (class 1259 OID 30794)
-- Name: hc_case_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hc_case_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 213
-- Name: hc_case_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hc_case_types_id_seq OWNED BY public.hc_case_types.id;


--
-- TOC entry 214 (class 1259 OID 30796)
-- Name: history_deleted_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.history_deleted_data (
    id bigint NOT NULL,
    table_name character varying(255) NOT NULL,
    deleted_data json NOT NULL,
    deleted_time timestamp(0) without time zone NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 30802)
-- Name: history_deleted_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.history_deleted_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 215
-- Name: history_deleted_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.history_deleted_data_id_seq OWNED BY public.history_deleted_data.id;


--
-- TOC entry 216 (class 1259 OID 30804)
-- Name: history_updated_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.history_updated_data (
    id bigint NOT NULL,
    table_name character varying(255) NOT NULL,
    updated_data json NOT NULL,
    updated_time timestamp(0) without time zone NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30810)
-- Name: history_updated_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.history_updated_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 217
-- Name: history_updated_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.history_updated_data_id_seq OWNED BY public.history_updated_data.id;


--
-- TOC entry 218 (class 1259 OID 30812)
-- Name: jo_legal_experiences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jo_legal_experiences (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    subdivision_id integer NOT NULL,
    from_year integer NOT NULL,
    to_year integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 219 (class 1259 OID 30815)
-- Name: jo_legal_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_legal_experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 219
-- Name: jo_legal_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_legal_experiences_id_seq OWNED BY public.jo_legal_experiences.id;


--
-- TOC entry 220 (class 1259 OID 30825)
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
-- TOC entry 221 (class 1259 OID 30828)
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_reporting_reviewings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 221
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_reporting_reviewings_id_seq OWNED BY public.jo_reporting_reviewings.id;


--
-- TOC entry 222 (class 1259 OID 30830)
-- Name: jo_reportings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jo_reportings (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    posting_id bigint NOT NULL,
    reporting_officer_id bigint,
    other_reporting_officer_name character(255),
    other_reporting_officer_designation character(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 223 (class 1259 OID 30836)
-- Name: jo_reportings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_reportings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 223
-- Name: jo_reportings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_reportings_id_seq OWNED BY public.jo_reportings.id;


--
-- TOC entry 224 (class 1259 OID 30838)
-- Name: jo_zone_tenures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jo_zone_tenures (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    zone_id integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 225 (class 1259 OID 30841)
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_zone_tenures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 225
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_zone_tenures_id_seq OWNED BY public.jo_zone_tenures.id;


--
-- TOC entry 226 (class 1259 OID 30843)
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
-- TOC entry 227 (class 1259 OID 30849)
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_posting_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 227
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_posting_preferences_id_seq OWNED BY public.judicial_officer_posting_preferences.id;


--
-- TOC entry 228 (class 1259 OID 30851)
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
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 229 (class 1259 OID 30854)
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_postings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 229
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_postings_id_seq OWNED BY public.judicial_officer_postings.id;


--
-- TOC entry 230 (class 1259 OID 30856)
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
-- TOC entry 231 (class 1259 OID 30859)
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 231
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_qualifications_id_seq OWNED BY public.judicial_officer_qualifications.id;


--
-- TOC entry 232 (class 1259 OID 30861)
-- Name: judicial_officers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officers (
    id bigint NOT NULL,
    registration_no character varying(255) NOT NULL,
    jo_code character varying(255),
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
    profile_image character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp with time zone
);


--
-- TOC entry 233 (class 1259 OID 30867)
-- Name: judicial_officers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 233
-- Name: judicial_officers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officers_id_seq OWNED BY public.judicial_officers.id;


--
-- TOC entry 234 (class 1259 OID 30869)
-- Name: lcr_hc_ends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lcr_hc_ends (
    id bigint NOT NULL,
    district integer NOT NULL,
    subdivision integer NOT NULL,
    court integer NOT NULL,
    hc_case_record integer NOT NULL,
    hc_case_no integer NOT NULL,
    hc_case_year integer NOT NULL,
    deadline date NOT NULL,
    memo_no character varying(255) NOT NULL,
    status_flag character varying(255),
    memo_date date NOT NULL,
    forwarding_court integer,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 235 (class 1259 OID 30875)
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_hc_ends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 235
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_hc_ends_id_seq OWNED BY public.lcr_hc_ends.id;


--
-- TOC entry 236 (class 1259 OID 30877)
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
-- TOC entry 237 (class 1259 OID 30883)
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_lc_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 237
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_lc_details_id_seq OWNED BY public.lcr_lc_details.id;


--
-- TOC entry 238 (class 1259 OID 30885)
-- Name: lcr_status_checks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lcr_status_checks (
    id bigint NOT NULL,
    hc_id bigint NOT NULL,
    remarks character varying(255) NOT NULL,
    memo_no character varying(255) NOT NULL,
    memo_date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 239 (class 1259 OID 30891)
-- Name: lcr_status_checks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_status_checks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 239
-- Name: lcr_status_checks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_status_checks_id_seq OWNED BY public.lcr_status_checks.id;


--
-- TOC entry 240 (class 1259 OID 30893)
-- Name: lower_case_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lower_case_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 241 (class 1259 OID 30896)
-- Name: lower_case_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lower_case_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 241
-- Name: lower_case_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lower_case_types_id_seq OWNED BY public.lower_case_types.id;


--
-- TOC entry 242 (class 1259 OID 30898)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 30901)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 243
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 244 (class 1259 OID 30903)
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
-- TOC entry 245 (class 1259 OID 30906)
-- Name: modes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 245
-- Name: modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modes_id_seq OWNED BY public.modes.id;


--
-- TOC entry 246 (class 1259 OID 30908)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- TOC entry 247 (class 1259 OID 30914)
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
-- TOC entry 248 (class 1259 OID 30917)
-- Name: qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 248
-- Name: qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.qualifications_id_seq OWNED BY public.qualifications.id;


--
-- TOC entry 249 (class 1259 OID 30919)
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
-- TOC entry 250 (class 1259 OID 30922)
-- Name: recruitment_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recruitment_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 250
-- Name: recruitment_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recruitment_batches_id_seq OWNED BY public.recruitment_batches.id;


--
-- TOC entry 251 (class 1259 OID 30924)
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
-- TOC entry 252 (class 1259 OID 30927)
-- Name: religions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.religions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 252
-- Name: religions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.religions_id_seq OWNED BY public.religions.id;


--
-- TOC entry 253 (class 1259 OID 30929)
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
-- TOC entry 254 (class 1259 OID 30932)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 254
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 255 (class 1259 OID 30934)
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
-- TOC entry 256 (class 1259 OID 30937)
-- Name: subdivisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subdivisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 256
-- Name: subdivisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subdivisions_id_seq OWNED BY public.subdivisions.id;


--
-- TOC entry 257 (class 1259 OID 30939)
-- Name: user_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 258 (class 1259 OID 30942)
-- Name: user_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 258
-- Name: user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_types_id_seq OWNED BY public.user_types.id;


--
-- TOC entry 259 (class 1259 OID 30944)
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
-- TOC entry 260 (class 1259 OID 30950)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 260
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 261 (class 1259 OID 30952)
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
-- TOC entry 262 (class 1259 OID 30955)
-- Name: zone_subdivisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zone_subdivisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 262
-- Name: zone_subdivisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zone_subdivisions_id_seq OWNED BY public.zone_subdivisions.id;


--
-- TOC entry 263 (class 1259 OID 30957)
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
-- TOC entry 264 (class 1259 OID 30960)
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 264
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zones_id_seq OWNED BY public.zones.id;


--
-- TOC entry 2901 (class 2604 OID 30962)
-- Name: acr_histories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories ALTER COLUMN id SET DEFAULT nextval('public.acr_histories_id_seq'::regclass);


--
-- TOC entry 2902 (class 2604 OID 30963)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 2903 (class 2604 OID 30964)
-- Name: courts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts ALTER COLUMN id SET DEFAULT nextval('public.courts_id_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 30965)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 2905 (class 2604 OID 30966)
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- TOC entry 2906 (class 2604 OID 30967)
-- Name: diaries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diaries ALTER COLUMN id SET DEFAULT nextval('public.diaries_id_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 30968)
-- Name: districts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);


--
-- TOC entry 2908 (class 2604 OID 30969)
-- Name: grade_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade_details ALTER COLUMN id SET DEFAULT nextval('public.grade_details_id_seq'::regclass);


--
-- TOC entry 2909 (class 2604 OID 30970)
-- Name: hc_case_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types ALTER COLUMN id SET DEFAULT nextval('public.hc_case_types_id_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 30971)
-- Name: history_deleted_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.history_deleted_data ALTER COLUMN id SET DEFAULT nextval('public.history_deleted_data_id_seq'::regclass);


--
-- TOC entry 2911 (class 2604 OID 30972)
-- Name: history_updated_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.history_updated_data ALTER COLUMN id SET DEFAULT nextval('public.history_updated_data_id_seq'::regclass);


--
-- TOC entry 2912 (class 2604 OID 30973)
-- Name: jo_legal_experiences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_legal_experiences ALTER COLUMN id SET DEFAULT nextval('public.jo_legal_experiences_id_seq'::regclass);


--
-- TOC entry 2913 (class 2604 OID 30975)
-- Name: jo_reporting_reviewings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings ALTER COLUMN id SET DEFAULT nextval('public.jo_reporting_reviewings_id_seq'::regclass);


--
-- TOC entry 2914 (class 2604 OID 30976)
-- Name: jo_reportings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings ALTER COLUMN id SET DEFAULT nextval('public.jo_reportings_id_seq'::regclass);


--
-- TOC entry 2915 (class 2604 OID 30977)
-- Name: jo_zone_tenures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures ALTER COLUMN id SET DEFAULT nextval('public.jo_zone_tenures_id_seq'::regclass);


--
-- TOC entry 2916 (class 2604 OID 30978)
-- Name: judicial_officer_posting_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_posting_preferences_id_seq'::regclass);


--
-- TOC entry 2917 (class 2604 OID 30979)
-- Name: judicial_officer_postings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_postings_id_seq'::regclass);


--
-- TOC entry 2918 (class 2604 OID 30980)
-- Name: judicial_officer_qualifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_qualifications_id_seq'::regclass);


--
-- TOC entry 2919 (class 2604 OID 30981)
-- Name: judicial_officers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers ALTER COLUMN id SET DEFAULT nextval('public.judicial_officers_id_seq'::regclass);


--
-- TOC entry 2920 (class 2604 OID 30982)
-- Name: lcr_hc_ends id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends ALTER COLUMN id SET DEFAULT nextval('public.lcr_hc_ends_id_seq'::regclass);


--
-- TOC entry 2921 (class 2604 OID 30983)
-- Name: lcr_lc_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details ALTER COLUMN id SET DEFAULT nextval('public.lcr_lc_details_id_seq'::regclass);


--
-- TOC entry 2922 (class 2604 OID 30984)
-- Name: lcr_status_checks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_status_checks ALTER COLUMN id SET DEFAULT nextval('public.lcr_status_checks_id_seq'::regclass);


--
-- TOC entry 2923 (class 2604 OID 30985)
-- Name: lower_case_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types ALTER COLUMN id SET DEFAULT nextval('public.lower_case_types_id_seq'::regclass);


--
-- TOC entry 2924 (class 2604 OID 30986)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2925 (class 2604 OID 30987)
-- Name: modes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes ALTER COLUMN id SET DEFAULT nextval('public.modes_id_seq'::regclass);


--
-- TOC entry 2926 (class 2604 OID 30988)
-- Name: qualifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications ALTER COLUMN id SET DEFAULT nextval('public.qualifications_id_seq'::regclass);


--
-- TOC entry 2927 (class 2604 OID 30989)
-- Name: recruitment_batches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches ALTER COLUMN id SET DEFAULT nextval('public.recruitment_batches_id_seq'::regclass);


--
-- TOC entry 2928 (class 2604 OID 30990)
-- Name: religions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.religions ALTER COLUMN id SET DEFAULT nextval('public.religions_id_seq'::regclass);


--
-- TOC entry 2929 (class 2604 OID 30991)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 2930 (class 2604 OID 30992)
-- Name: subdivisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions ALTER COLUMN id SET DEFAULT nextval('public.subdivisions_id_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 30993)
-- Name: user_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_types ALTER COLUMN id SET DEFAULT nextval('public.user_types_id_seq'::regclass);


--
-- TOC entry 2932 (class 2604 OID 30994)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 30995)
-- Name: zone_subdivisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zone_subdivisions ALTER COLUMN id SET DEFAULT nextval('public.zone_subdivisions_id_seq'::regclass);


--
-- TOC entry 2934 (class 2604 OID 30996)
-- Name: zones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones ALTER COLUMN id SET DEFAULT nextval('public.zones_id_seq'::regclass);


--
-- TOC entry 3243 (class 0 OID 30745)
-- Dependencies: 196
-- Data for Name: acr_histories; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3245 (class 0 OID 30750)
-- Dependencies: 198
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories (id, category_name, created_by, created_at, updated_at) VALUES (1, 'general', 11, NULL, NULL);
INSERT INTO public.categories (id, category_name, created_by, created_at, updated_at) VALUES (2, 'scheduled caste', 11, '2019-07-02 06:58:28', '2019-07-02 06:58:28');
INSERT INTO public.categories (id, category_name, created_by, created_at, updated_at) VALUES (3, 'scheduled tribe', 11, '2019-07-02 07:41:15', '2019-07-03 08:42:41');


--
-- TOC entry 3247 (class 0 OID 30755)
-- Dependencies: 200
-- Data for Name: courts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (59, 'civil judge sr  div bishnupur', 76, NULL, NULL, 11, '2019-11-15 17:20:52', '2019-11-15 17:20:52');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (60, 'acjm bishnupur', 76, NULL, NULL, 11, '2019-11-15 17:21:23', '2019-11-15 17:21:23');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (8, 'bardhaman 1st court', 51, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:27:25');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (61, 'civil judge jr  div court bishnupur', 76, NULL, NULL, 11, '2019-11-15 17:22:00', '2019-11-15 17:22:00');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (62, 'jm 2nd court bishnupur', 76, NULL, NULL, 11, '2019-11-15 17:22:25', '2019-11-15 17:22:25');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (13, 'howrah 2nd court', 77, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:30:49');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (14, 'howrah 1st court', 80, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:29:36');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (24, 'north dinajpur 1st court', 56, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-08-03 09:22:33');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (25, 'bankura 1 st court', 67, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-08-03 09:25:14');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (27, 'south dinajpore', 81, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-08-03 09:23:52');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (63, 'jm 3rd court bishnupur', 76, NULL, NULL, 11, '2019-11-15 17:22:53', '2019-11-15 17:22:53');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (30, 'district judge bankura', 75, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-11-15 16:52:38');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (35, 'cjm  bankura', 75, NULL, NULL, 11, '2019-11-15 16:54:32', '2019-11-15 16:55:50');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (36, 'cjsd bankura', 75, NULL, NULL, 11, '2019-11-15 16:56:34', '2019-11-15 16:56:34');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (38, 'civil judge jr div i bankura', 75, NULL, NULL, 11, '2019-11-15 17:00:54', '2019-11-15 17:00:54');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (37, 'civil judge sr div  additional  court  bankura', 75, NULL, NULL, 11, '2019-11-15 16:58:42', '2019-11-15 17:02:20');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (39, 'civil judge jr div ii bankura', 75, NULL, NULL, 11, '2019-11-15 17:02:58', '2019-11-15 17:02:58');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (40, 'civil judge jr div additional court bankura', 75, NULL, NULL, 11, '2019-11-15 17:03:41', '2019-11-15 17:03:41');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (41, 'jm 3rd court bankura', 75, NULL, NULL, 11, '2019-11-15 17:04:13', '2019-11-15 17:04:13');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (42, 'jm 4th court bankura', 75, NULL, NULL, 11, '2019-11-15 17:04:33', '2019-11-15 17:04:33');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (43, 'jm 5th court bankura', 75, NULL, NULL, 11, '2019-11-15 17:04:47', '2019-11-15 17:04:47');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (44, 'jm 6th court bankura', 75, NULL, NULL, 11, '2019-11-15 17:05:13', '2019-11-15 17:05:13');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (45, 'jm 7th court bankura', 75, NULL, NULL, 11, '2019-11-15 17:05:44', '2019-11-15 17:05:44');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (48, 'adj 2nd court bankura', 75, NULL, NULL, 11, '2019-11-15 17:07:40', '2019-11-15 17:07:40');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (49, 'adj 3rd court bankura', 75, NULL, NULL, 11, '2019-11-15 17:08:14', '2019-11-15 17:08:14');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (50, 'adj re designated court bankura', 75, NULL, NULL, 11, '2019-11-15 17:08:55', '2019-11-15 17:08:55');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (51, 'adj fast track court  bankura', 75, NULL, NULL, 11, '2019-11-15 17:10:22', '2019-11-15 17:10:22');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (52, 'adj  khatra', 77, NULL, NULL, 11, '2019-11-15 17:12:57', '2019-11-15 17:12:57');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (53, 'civil judge sr  div khatra', 77, NULL, NULL, 11, '2019-11-15 17:13:49', '2019-11-15 17:15:41');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (54, 'civil judge jr  div 1st court khatra', 77, NULL, NULL, 11, '2019-11-15 17:16:33', '2019-11-15 17:16:33');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (46, 'adj 1st court bankura', 75, NULL, NULL, 11, '2019-11-15 17:06:11', '2019-11-15 17:17:38');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (55, 'civil judge jr  div 2nd court khatra', 77, NULL, NULL, 11, '2019-11-15 17:19:00', '2019-11-15 17:19:00');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (56, 'acjm khatra', 77, NULL, NULL, 11, '2019-11-15 17:19:35', '2019-11-15 17:19:35');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (57, 'jm khatra', 77, NULL, NULL, 11, '2019-11-15 17:19:54', '2019-11-15 17:19:54');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (58, 'adj bishnupur', 76, NULL, NULL, 11, '2019-11-15 17:20:23', '2019-11-15 17:20:23');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (64, 'district judge birbhum', 78, NULL, NULL, 11, '2019-11-15 17:23:43', '2019-11-15 17:25:11');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (65, 'adj 1st court birbhum', 78, NULL, NULL, 11, '2019-11-15 17:25:48', '2019-11-15 17:25:48');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (66, 'adj 2nd court birbhum', 78, NULL, NULL, 11, '2019-11-15 17:26:50', '2019-11-15 17:26:50');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (67, 'adj 3rd court birbhum', 78, NULL, NULL, 11, '2019-11-15 17:27:21', '2019-11-15 17:27:21');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (68, 'adj 4th court birbhum', 78, NULL, NULL, 11, '2019-11-15 17:27:42', '2019-11-15 17:27:42');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (69, 'adj ftc court birbhum', 78, NULL, NULL, 11, '2019-11-15 17:28:20', '2019-11-15 17:28:40');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (70, 'cjm birbhum', 78, NULL, NULL, 11, '2019-11-15 17:29:02', '2019-11-15 17:29:02');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (71, 'acjm birbhum', 78, NULL, NULL, 11, '2019-11-15 17:29:17', '2019-11-15 17:29:17');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (72, ' civil judge sr div birbhum', 78, NULL, NULL, 11, '2019-11-15 17:30:10', '2019-11-15 17:30:10');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (73, 'civil judge jr div sadar court birbhum', 78, NULL, NULL, 11, '2019-11-15 17:31:20', '2019-11-15 17:31:20');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (74, 'civil judge jr div additional court birbhum', 78, NULL, NULL, 11, '2019-11-15 17:32:52', '2019-11-15 17:32:52');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (75, 'jm 1st court birbhum', 78, NULL, NULL, 11, '2019-11-15 17:33:18', '2019-11-15 17:33:18');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (76, 'jm 2nd court birbhum', 78, NULL, NULL, 11, '2019-11-15 17:34:00', '2019-11-15 17:34:00');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (77, 'jm 3rd court birbhum', 78, NULL, NULL, 11, '2019-11-15 17:34:18', '2019-11-15 17:34:18');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (78, 'secretary dlsa birbhum', 78, NULL, NULL, 11, '2019-11-15 17:34:37', '2019-11-15 17:34:37');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (79, 'adj ftc dubrajpur birbhum', 81, NULL, NULL, 11, '2019-11-15 17:35:06', '2019-11-15 17:35:35');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (80, 'civil judge jr div court dubrajpur birbhum', 81, NULL, NULL, 11, '2019-11-15 17:37:19', '2019-11-15 17:37:19');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (81, 'jm dubrajpur birbhum', 81, NULL, NULL, 11, '2019-11-15 17:37:57', '2019-11-15 17:37:57');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (1, 'darjeeling 1st court', 118, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:28:11');
INSERT INTO public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) VALUES (3, 'calcutta city court', 51, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:19:41');


--
-- TOC entry 3249 (class 0 OID 30760)
-- Dependencies: 202
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.departments (id, dept_name, created_at, updated_at) VALUES (1, 'Rule ', NULL, NULL);
INSERT INTO public.departments (id, dept_name, created_at, updated_at) VALUES (2, 'Criminal', NULL, NULL);
INSERT INTO public.departments (id, dept_name, created_at, updated_at) VALUES (3, 'FMA', NULL, NULL);


--
-- TOC entry 3251 (class 0 OID 30765)
-- Dependencies: 204
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (1, 'ACJM', 2, '2019-11-22 18:04:31', '2019-11-22 18:04:31');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (2, 'JM', 11, '2019-11-26 15:42:01', '2019-11-26 15:43:14');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (3, 'ADJ', 11, '2019-11-26 15:43:22', '2019-11-26 15:43:22');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (4, 'ADJ FTC', 11, '2019-11-26 15:43:35', '2019-11-26 15:43:35');
INSERT INTO public.designations (id, designation_name, created_by, created_at, updated_at) VALUES (5, 'CJSD', 11, '2019-11-26 15:43:48', '2019-11-26 15:43:48');


--
-- TOC entry 3253 (class 0 OID 30770)
-- Dependencies: 206
-- Data for Name: diaries; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3255 (class 0 OID 30778)
-- Dependencies: 208
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (4, 'west alexys', 7, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (11, 'west elta', 17, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (12, 'trantowborough', 17, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (15, 'south nathanaelview', 24, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (17, 'zboncakfort', 30, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (18, 'west magnusview', 30, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (20, 'west monteborough', 31, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (21, 'south westleyborough', 31, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (36, 'kolkata', 51, 11, '2019-07-10 06:27:59', '2019-07-10 06:27:59');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (2, 'east midnapure', 2, 11, '2019-06-17 06:27:04', '2019-08-05 05:46:51');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (14, 'west burdwan', 24, 11, '2019-06-17 06:27:05', '2019-08-05 05:47:25');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (26, 'howrah', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:47:53');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (28, 'hoogly', 48, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:03');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (25, 'bankura', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:21');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (5, 'purulia', 7, 11, '2019-06-17 06:27:05', '2019-08-05 05:48:47');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (27, 'birbhum', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:49:09');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (8, 'south dinajpur', 11, 11, '2019-06-17 06:27:05', '2019-08-05 05:50:41');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (22, 'alipure duar', 38, 11, '2019-06-17 06:27:06', '2019-08-05 05:54:08');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (10, 'darjeeling', 17, 11, '2019-06-17 06:27:05', '2019-08-05 05:55:27');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (7, 'kalimpong', 11, 11, '2019-06-17 06:27:05', '2019-08-05 05:56:54');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (6, 'malda', 8, 11, '2019-06-17 06:27:05', '2019-08-05 05:51:22');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (38, 'north 24 parganas', 51, 11, '2019-11-11 12:26:13', '2019-11-11 12:26:13');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (13, 'south 24 parganas', 24, 11, '2019-06-17 06:27:05', '2019-11-11 12:28:19');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (40, 'purba bardhaman', 51, 11, '2019-11-11 13:19:11', '2019-11-11 13:19:11');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (41, 'paschim bardhaman', 51, 11, '2019-11-11 13:19:29', '2019-11-11 13:19:29');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (42, 'jhargram', 51, 11, '2019-11-11 13:19:58', '2019-11-11 13:19:58');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (43, 'paschim medinipur', 51, 11, '2019-11-11 13:20:14', '2019-11-11 13:20:14');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (44, 'murshidabad', 51, 11, '2019-11-11 13:20:46', '2019-11-11 13:20:46');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (45, 'purba medinipur', 51, 11, '2019-11-11 13:30:59', '2019-11-11 13:30:59');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (46, 'nadia', 51, 11, '2019-11-11 13:31:32', '2019-11-11 13:31:32');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (47, 'cooch behar', 51, 11, '2019-11-11 13:32:34', '2019-11-11 13:32:34');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (48, 'jalpaiguri', 51, 11, '2019-11-11 13:42:40', '2019-11-11 13:42:40');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (29, 'u dinajpur', 48, 11, '2019-06-17 06:27:06', '2019-11-11 13:54:30');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (49, 'd dinajpur', 51, 11, '2019-11-11 14:00:30', '2019-11-11 14:00:30');
INSERT INTO public.districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (50, 'andaman and nicobar island', 75, 11, '2019-11-11 14:07:53', '2019-11-11 14:07:53');


--
-- TOC entry 3257 (class 0 OID 30783)
-- Dependencies: 210
-- Data for Name: grade_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (1, 'good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (2, 'average', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (3, 'very good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (4, 'outstanding', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (5, 'poor', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');


--
-- TOC entry 3259 (class 0 OID 30788)
-- Dependencies: 212
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
-- TOC entry 3261 (class 0 OID 30796)
-- Dependencies: 214
-- Data for Name: history_deleted_data; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3263 (class 0 OID 30804)
-- Dependencies: 216
-- Data for Name: history_updated_data; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (2, 'judicial_officers', '{"id":28,"registration_no":"123","jo_code":"WB123","officer_name":"Rupsa Bose","gender":"M","guardian_name":"Pradip Basu","gurdian_relation":"Father","date_of_birth":"1989-02-02","home_state_id":51,"home_district_id":36,"hometown":"Maniktala","present_address":"APC Road","permanent_address":"APC Road","religion_id":1,"category_id":1,"blood_group":"A+","identification_mark":"Mole In Right Face","aadhaar_no":"123456789012","pan_no":"5647239810","gpf_no":"145637","mobile_no_1":"8981475652","mobile_no_2":null,"email_id_1":"rupsa@gmail.com","email_id_2":null,"recruitment_batch_id":8,"date_of_joining":"2018-09-19","date_of_confirmation":"2018-09-19","date_of_retirement":"2040-05-01","created_at":null,"updated_at":null}', '2019-11-27 05:56:42');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (3, 'judicial_officer_postings', '{"id":30,"judicial_officer_id":31,"designation_id":3,"court_id":1,"other_station_name":null,"mode_id":1,"from_date":"2019-11-24","to_date":"2019-11-28","created_at":"2019-11-28 13:23:13","updated_at":"2019-11-28 13:23:13"}', '2019-11-27 07:59:09');


--
-- TOC entry 3265 (class 0 OID 30812)
-- Dependencies: 218
-- Data for Name: jo_legal_experiences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (1, 32, 68, 2018, 2019, '2019-11-28 18:00:56', '2019-11-28 18:00:56');
INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (2, 32, 57, 2016, 2018, '2019-11-28 18:00:56', '2019-11-28 18:00:56');


--
-- TOC entry 3267 (class 0 OID 30825)
-- Dependencies: 220
-- Data for Name: jo_reporting_reviewings; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3269 (class 0 OID 30830)
-- Dependencies: 222
-- Data for Name: jo_reportings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_reportings (id, judicial_officer_id, posting_id, reporting_officer_id, other_reporting_officer_name, other_reporting_officer_designation, created_at, updated_at) VALUES (1, 31, 29, 28, NULL, NULL, '2019-11-28 13:23:13', '2019-11-28 13:23:13');
INSERT INTO public.jo_reportings (id, judicial_officer_id, posting_id, reporting_officer_id, other_reporting_officer_name, other_reporting_officer_designation, created_at, updated_at) VALUES (2, 32, 31, 31, NULL, NULL, '2019-11-28 18:00:56', '2019-11-28 18:00:56');


--
-- TOC entry 3271 (class 0 OID 30838)
-- Dependencies: 224
-- Data for Name: jo_zone_tenures; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (15, 28, 8, '2019-01-08', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (14, 28, 7, '2018-09-19', '2018-11-27', NULL, '2019-11-27 11:34:59');
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (17, 31, 8, '2019-11-24', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (16, 31, 7, '2019-11-12', '2019-11-22', NULL, '2019-11-28 13:23:13');
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (18, 32, 7, '2019-11-01', NULL, NULL, NULL);


--
-- TOC entry 3273 (class 0 OID 30843)
-- Dependencies: 226
-- Data for Name: judicial_officer_posting_preferences; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3275 (class 0 OID 30851)
-- Dependencies: 228
-- Data for Name: judicial_officer_postings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, other_station_name, mode_id, from_date, to_date, created_at, updated_at) VALUES (25, 28, 1, 71, NULL, 1, '2018-09-19', '2019-01-02', '2019-11-27 11:34:59', '2019-11-27 11:34:59');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, other_station_name, mode_id, from_date, to_date, created_at, updated_at) VALUES (26, 28, 3, 1, NULL, 1, '2019-01-08', '2019-11-27', '2019-11-27 11:34:59', '2019-11-27 11:34:59');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, other_station_name, mode_id, from_date, to_date, created_at, updated_at) VALUES (29, 31, 1, 71, NULL, 1, '2019-11-12', '2019-11-22', '2019-11-28 13:23:13', '2019-11-28 13:23:13');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, other_station_name, mode_id, from_date, to_date, created_at, updated_at) VALUES (30, 31, 3, 1, NULL, 1, '2019-11-24', '2019-11-28', '2019-11-28 13:23:13', '2019-11-28 13:23:13');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, other_station_name, mode_id, from_date, to_date, created_at, updated_at) VALUES (31, 32, 1, 71, NULL, 1, '2019-11-01', NULL, '2019-11-28 18:00:56', '2019-11-28 18:00:56');


--
-- TOC entry 3277 (class 0 OID 30856)
-- Dependencies: 230
-- Data for Name: judicial_officer_qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (36, 28, 8, 2019, '2019-11-27 11:34:59', '2019-11-27 11:34:59');
INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (41, 31, 5, 2017, '2019-11-28 13:23:13', '2019-11-28 13:23:13');
INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (42, 31, 7, 2019, '2019-11-28 13:23:13', '2019-11-28 13:23:13');
INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (43, 32, 8, 2019, '2019-11-28 18:00:56', '2019-11-28 18:00:56');


--
-- TOC entry 3279 (class 0 OID 30861)
-- Dependencies: 232
-- Data for Name: judicial_officers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, guardian_name, gurdian_relation, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, religion_id, category_id, blood_group, identification_mark, aadhaar_no, pan_no, gpf_no, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at) VALUES (28, '123', 'WB123', 'Rupsa Bose', 'M', 'Pradip Basu', 'Father', '1989-02-02', 51, 36, 'Maniktala', 'APC Road', 'APC Road', 1, 1, 'A+', 'Mole In Right Face', '123456789012', '5647239810', '145637', '8981475652', NULL, 'rupsa@gmail.com', NULL, 8, '2018-09-19', '2018-09-19', '2040-05-01', NULL, NULL, NULL);
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, guardian_name, gurdian_relation, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, religion_id, category_id, blood_group, identification_mark, aadhaar_no, pan_no, gpf_no, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at) VALUES (31, '164', 'WB164', 'Arpan Kr Roy', 'M', 'Demo Guardian', 'Father', '2019-11-01', 51, 36, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', 1, 1, 'A+', '', NULL, NULL, NULL, '5897452321', NULL, 'arpan@gmail.com', NULL, 1, '2019-11-02', '2019-11-03', '2019-11-04', NULL, NULL, NULL);
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, guardian_name, gurdian_relation, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, religion_id, category_id, blood_group, identification_mark, aadhaar_no, pan_no, gpf_no, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at) VALUES (32, '2912', 'WB2912', 'Anabil Bhattacharya', 'M', 'Bimalendu Bhattacharya', 'Father', '1990-12-29', 51, 36, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', 1, 1, 'B-', 'Nothing', '123456789123', 'ABC1234569', NULL, '8981660217', '9038202731', 'banabil90@gmail.com', 'abcde@gmail.com', 1, '2019-09-19', '2019-09-19', '2040-12-29', NULL, NULL, NULL);


--
-- TOC entry 3281 (class 0 OID 30869)
-- Dependencies: 234
-- Data for Name: lcr_hc_ends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, memo_no, status_flag, memo_date, forwarding_court, created_by, created_at, updated_at) VALUES (9, 10, 118, 3, 72, 258, 1999, '2019-12-19', '546G', 'forward', '2019-11-26', 71, 30, '2019-11-26 00:00:00', '2019-11-28 00:00:00');
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, memo_no, status_flag, memo_date, forwarding_court, created_by, created_at, updated_at) VALUES (7, 25, 75, 3, 1, 111, 2000, '2019-11-29', '7676FMA', 'comply', '2019-11-26', 60, 30, '2019-11-26 00:00:00', '2019-11-28 00:00:00');
INSERT INTO public.lcr_hc_ends (id, district, subdivision, court, hc_case_record, hc_case_no, hc_case_year, deadline, memo_no, status_flag, memo_date, forwarding_court, created_by, created_at, updated_at) VALUES (8, 25, 77, 3, 95, 321, 2001, '2020-01-31', '3232FA', 'comply', '2019-11-26', NULL, 30, '2019-11-26 00:00:00', '2019-11-28 00:00:00');


--
-- TOC entry 3283 (class 0 OID 30877)
-- Dependencies: 236
-- Data for Name: lcr_lc_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (29, 7, '52', 888, 2001, NULL, 30, '2019-11-26 00:00:00', '2019-11-26 00:00:00');
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (30, 8, '52', 432, 2002, NULL, 30, '2019-11-26 00:00:00', '2019-11-26 00:00:00');
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (31, 8, '10', 1234, 2003, NULL, 30, '2019-11-26 00:00:00', '2019-11-26 00:00:00');
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (32, 9, '17', 879, 2001, NULL, 30, '2019-11-26 00:00:00', '2019-11-26 00:00:00');
INSERT INTO public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) VALUES (33, 9, '44', 6554, 2005, NULL, 30, '2019-11-26 00:00:00', '2019-11-26 00:00:00');


--
-- TOC entry 3285 (class 0 OID 30885)
-- Dependencies: 238
-- Data for Name: lcr_status_checks; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3287 (class 0 OID 30893)
-- Dependencies: 240
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
-- TOC entry 3289 (class 0 OID 30898)
-- Dependencies: 242
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
INSERT INTO public.migrations (id, migration, batch) VALUES (15, '2019_06_13_091801_create_judicial_officer_qualifications_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (17, '2019_06_13_093750_create_modes_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (18, '2019_06_13_093852_create_judicial_officer_postings_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (19, '2019_06_13_101842_create_judicial_officer_posting_preferences_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (20, '2019_07_22_064308_create_diaries_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (22, '2019_08_13_091810_create_lcr_lc_details_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (23, '2019_08_13_101720_create_hc_case_types_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (24, '2019_08_13_102950_create_lower_case_types_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (25, '2019_09_24_102032_create_grade_details_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (26, '2019_09_24_102258_create_acr_histories_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (27, '2019_11_11_170427_create_zone_subdivisions_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (28, '2019_11_14_163154_create_jo_zone_tenures_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (29, '2019_11_14_163155_create_users_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (30, '2019_11_21_113129_create_lcr_status_checks_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (34, '2019_08_13_091522_create_lcr_hc_ends_table', 2);
INSERT INTO public.migrations (id, migration, batch) VALUES (40, '2019_11_27_153252_create_history_updated_deleted_table', 3);
INSERT INTO public.migrations (id, migration, batch) VALUES (41, '2019_11_27_153905_create_update_delete_procedure', 3);
INSERT INTO public.migrations (id, migration, batch) VALUES (42, '2019_11_27_154543_create_update_delete_trigger', 3);
INSERT INTO public.migrations (id, migration, batch) VALUES (44, '2019_06_13_092954_create_jo_reportings_table', 4);
INSERT INTO public.migrations (id, migration, batch) VALUES (45, '2019_06_13_092954_create_jo_reporting_reviewings_table', 5);
INSERT INTO public.migrations (id, migration, batch) VALUES (46, '2019_11_28_121009_create_departments_table', 5);
INSERT INTO public.migrations (id, migration, batch) VALUES (47, '2019_11_28_162816_create_jo_legal_experiences_table', 6);


--
-- TOC entry 3291 (class 0 OID 30903)
-- Dependencies: 244
-- Data for Name: modes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.modes (id, posting_mode, created_by, created_at, updated_at) VALUES (1, 'Permanent', 11, '2019-11-26 11:33:19', '2019-11-26 11:33:19');
INSERT INTO public.modes (id, posting_mode, created_by, created_at, updated_at) VALUES (2, 'Deputation', 11, '2019-11-26 11:33:26', '2019-11-26 11:33:26');


--
-- TOC entry 3293 (class 0 OID 30908)
-- Dependencies: 246
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3294 (class 0 OID 30914)
-- Dependencies: 247
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (5, 'bcom', 11, '2019-06-25 07:18:30', '2019-06-25 07:18:30');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (7, 'ma llb', 11, '2019-06-25 07:18:47', '2019-06-25 07:18:47');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (8, 'ba llb', 11, '2019-06-28 09:50:19', '2019-07-01 10:14:25');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (10, 'm.sc', 11, '2019-07-01 11:25:58', '2019-07-01 11:27:09');


--
-- TOC entry 3296 (class 0 OID 30919)
-- Dependencies: 249
-- Data for Name: recruitment_batches; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (5, 'psc 2011', 2011, 11, '2019-06-26 11:49:37', '2019-06-26 11:49:37');
INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (8, 'clat 2011', 2003, 11, '2019-06-26 11:55:19', '2019-06-26 11:57:00');
INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (1, 'psc 2000', 2000, 11, NULL, '2019-06-29 08:58:19');


--
-- TOC entry 3298 (class 0 OID 30924)
-- Dependencies: 251
-- Data for Name: religions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.religions (id, religion_name, created_by, created_at, updated_at) VALUES (1, 'hindu', 11, NULL, NULL);
INSERT INTO public.religions (id, religion_name, created_by, created_at, updated_at) VALUES (2, 'muslim', 11, '2019-07-02 11:23:49', '2019-07-02 11:24:02');


--
-- TOC entry 3300 (class 0 OID 30929)
-- Dependencies: 253
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (2, 'illinois', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (3, 'montana', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (4, 'new york', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (5, 'north dakota', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (6, 'maryland', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (8, 'wyoming', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (9, 'new jersey', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (10, 'nevada', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (12, 'oklahoma', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (13, 'north carolina', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (15, 'kansas', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (16, 'pennsylvania', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (18, 'nebraska', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (19, 'utah', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (20, 'texas', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (21, 'washington', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (22, 'missouri', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (23, 'wisconsin', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (24, 'west virginia', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (26, 'louisiana', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (27, 'south dakota', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (29, 'maine', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (30, 'hawaii', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (32, 'virginia', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (34, 'tennessee', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (35, 'new mexico', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (36, 'indiana', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (37, 'oregon', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (38, 'kentucky', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (39, 'ohio', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (40, 'vermont', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (43, 'michigan', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (45, 'new hampshire', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (47, 'iowa', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (48, 'massachusetts', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (49, 'mississippi', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (50, 'minnesota', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (51, 'west bengal', 11, '2019-06-18 10:06:22', '2019-06-18 10:06:22');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (52, 'bihar', 11, '2019-06-18 10:10:49', '2019-06-18 10:10:49');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (7, 'odisha', 11, '2019-06-17 06:27:05', '2019-08-05 05:57:55');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (31, 'andhra pradesh', 11, '2019-06-17 06:27:06', '2019-08-05 05:59:14');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (68, 'himachal pradesh', 11, '2019-08-05 06:03:19', '2019-08-05 06:03:19');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (69, 'madhya pradesh', 11, '2019-08-05 06:03:30', '2019-08-05 06:03:30');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (11, 'maharastra', 11, '2019-06-17 06:27:05', '2019-08-05 06:03:46');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (28, 'kerala', 11, '2019-06-17 06:27:05', '2019-08-05 06:04:55');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (1, 'rajasthan', 11, '2019-06-17 06:27:04', '2019-08-05 06:05:07');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (46, 'tamilnadu', 11, '2019-06-17 06:27:06', '2019-08-05 06:07:52');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (25, 'karntaka', 11, '2019-06-17 06:27:05', '2019-08-05 06:16:44');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (44, 'hyderabad', 11, '2019-06-17 06:27:06', '2019-08-05 06:17:30');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (42, 'jammu and kahmir', 11, '2019-06-17 06:27:06', '2019-08-05 06:17:59');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (70, 'punjab', 11, '2019-08-05 06:18:05', '2019-08-05 06:18:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (71, 'hariyana', 11, '2019-08-05 06:18:12', '2019-08-05 06:18:12');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (72, 'jharkhand', 11, '2019-08-05 06:18:28', '2019-08-05 06:18:28');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (73, 'chattishgarh', 11, '2019-08-05 06:18:43', '2019-08-05 06:18:43');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (75, 'andaman and nicobar island', 11, '2019-11-11 14:04:17', '2019-11-11 14:04:17');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (17, 'Gujrat', 11, '2019-06-17 06:27:05', '2019-11-22 15:57:57');


--
-- TOC entry 3302 (class 0 OID 30934)
-- Dependencies: 255
-- Data for Name: subdivisions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (152, 'campvell bay', 50, 8, 11, '2019-11-15 13:28:21', '2019-11-15 13:28:21');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (133, 'mayabunder', 50, 8, 11, '2019-11-11 14:08:37', '2019-11-11 14:08:37');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (132, 'car nicobar', 50, 8, 11, '2019-11-11 14:08:27', '2019-11-11 14:08:27');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (131, 'port blair', 50, 8, 11, '2019-11-11 14:08:16', '2019-11-11 14:08:16');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (130, 'mal', 48, 8, 11, '2019-11-11 14:02:42', '2019-11-11 14:02:42');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (129, 'alipurduar', 48, 8, 11, '2019-11-11 14:02:34', '2019-11-11 14:02:34');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (128, 'jalpaiguri sadar', 48, 8, 11, '2019-11-11 14:02:08', '2019-11-11 14:02:08');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (127, 'buniadpur', 49, 8, 11, '2019-11-11 14:01:48', '2019-11-11 14:01:48');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (125, 'balurghat', 49, 8, 11, '2019-11-11 14:01:02', '2019-11-11 14:01:02');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (124, 'gorubathan', 7, 8, 11, '2019-11-11 13:59:52', '2019-11-11 13:59:52');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (123, 'kalimpong sadar', 7, 8, 11, '2019-11-11 13:59:32', '2019-11-11 13:59:32');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (122, 'mungpoo', 10, 8, 11, '2019-11-11 13:59:14', '2019-11-11 13:59:14');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (121, 'mirik', 10, 8, 11, '2019-11-11 13:59:04', '2019-11-11 13:59:04');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (120, 'kurseong', 10, 8, 11, '2019-11-11 13:58:55', '2019-11-11 13:58:55');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (119, 'siliguri', 10, 8, 11, '2019-11-11 13:58:43', '2019-11-11 13:58:43');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (118, 'darjeeling sadar', 10, 8, 11, '2019-11-11 13:58:19', '2019-11-11 13:58:19');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (117, 'mekhligunj', 47, 8, 11, '2019-11-11 13:57:57', '2019-11-11 13:57:57');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (116, 'mathabhanga', 47, 8, 11, '2019-11-11 13:57:43', '2019-11-11 13:57:43');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (115, 'tufangunj', 47, 8, 11, '2019-11-11 13:57:27', '2019-11-11 13:57:27');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (113, 'dinhata', 47, 8, 11, '2019-11-11 13:56:39', '2019-11-11 13:56:39');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (112, 'cooch behar sadar', 47, 8, 11, '2019-11-11 13:56:24', '2019-11-11 13:56:24');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (111, 'islampur', 29, 8, 11, '2019-11-11 13:56:03', '2019-11-11 13:56:03');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (110, 'raiganj', 29, 8, 11, '2019-11-11 13:55:49', '2019-11-11 13:55:49');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (109, 'lalbagh', 44, 7, 11, '2019-11-11 13:53:14', '2019-11-11 13:53:14');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (108, 'kandi', 44, 7, 11, '2019-11-11 13:52:34', '2019-11-11 13:52:34');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (106, 'berhampore', 44, 7, 11, '2019-11-11 13:52:11', '2019-11-11 13:52:11');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (107, 'jangipur', 44, 7, 11, '2019-11-11 13:52:25', '2019-11-11 13:52:25');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (105, 'haldia', 43, 6, 11, '2019-11-11 13:51:34', '2019-11-11 13:51:34');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (104, 'contai', 43, 6, 11, '2019-11-11 13:48:53', '2019-11-11 13:48:53');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (103, 'tamluk', 45, 6, 11, '2019-11-11 13:48:14', '2019-11-11 13:48:33');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (102, 'nabadwip', 46, 6, 11, '2019-11-11 13:47:28', '2019-11-11 13:47:28');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (101, 'tehatta', 46, 6, 11, '2019-11-11 13:47:06', '2019-11-11 13:47:06');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (100, 'ranaghat', 46, 6, 11, '2019-11-11 13:46:53', '2019-11-11 13:46:53');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (99, 'kalyani', 46, 4, 11, '2019-11-11 13:46:33', '2019-11-11 13:46:33');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (98, 'krishnanagar', 46, 6, 11, '2019-11-11 13:46:17', '2019-11-11 13:46:17');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (97, 'kharagpur', 43, 6, 11, '2019-11-11 13:28:42', '2019-11-11 13:28:42');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (96, 'garbeta', 43, 6, 11, '2019-11-11 13:28:13', '2019-11-11 13:28:13');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (95, 'dantan', 43, 6, 11, '2019-11-11 13:27:47', '2019-11-11 13:27:47');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (94, 'ghatal', 43, 6, 11, '2019-11-11 13:27:28', '2019-11-11 13:27:28');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (93, 'paschim medinipur sadar', 43, 6, 11, '2019-11-11 13:27:14', '2019-11-11 13:27:14');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (92, 'durgapur', 41, 6, 11, '2019-11-11 13:24:04', '2019-11-11 13:24:04');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (91, 'asansol', 41, 6, 11, '2019-11-11 13:23:34', '2019-11-11 13:23:34');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (90, 'jhargram', 42, 6, 11, '2019-11-11 13:23:05', '2019-11-11 13:23:05');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (89, 'katwa', 40, 6, 11, '2019-11-11 13:22:40', '2019-11-11 13:22:40');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (88, 'kalna', 40, 6, 11, '2019-11-11 13:22:20', '2019-11-11 13:22:20');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (87, 'purba bardhaman sadar', 40, 6, 11, '2019-11-11 13:22:06', '2019-11-11 13:22:06');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (86, 'raghunathpur', 5, 7, 11, '2019-11-11 13:07:24', '2019-11-11 13:07:24');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (85, 'purulia sadar', 5, 7, 11, '2019-11-11 13:07:06', '2019-11-11 13:07:06');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (83, 'chanchal', 6, 7, 11, '2019-11-11 13:04:39', '2019-11-11 13:04:39');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (82, 'malda sadar', 6, 7, 11, '2019-11-11 13:04:24', '2019-11-11 13:04:24');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (81, 'dubrajpur', 27, 7, 11, '2019-11-11 13:04:02', '2019-11-11 13:04:02');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (80, 'rampurhat', 27, 7, 11, '2019-11-11 13:03:39', '2019-11-11 13:03:39');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (79, 'bolpur', 27, 7, 11, '2019-11-11 13:03:21', '2019-11-11 13:03:21');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (78, 'birbhum sadar', 27, 7, 11, '2019-11-11 13:03:09', '2019-11-11 13:03:09');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (77, 'khatra', 25, 7, 11, '2019-11-11 13:02:41', '2019-11-11 13:02:41');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (76, 'bishnupur', 25, 7, 11, '2019-11-11 13:02:30', '2019-11-11 13:02:30');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (75, 'bankura sadar', 25, 7, 11, '2019-11-11 13:02:17', '2019-11-11 13:02:17');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (74, 'sealdah', 13, 4, 11, '2019-11-11 12:56:33', '2019-11-11 12:56:33');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (71, 'kakdwip', 13, 4, 11, '2019-11-11 12:39:24', '2019-11-11 12:39:24');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (70, 'diamond harbour', 13, 4, 11, '2019-11-11 12:38:53', '2019-11-11 12:38:53');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (69, 'baruipore', 13, 4, 11, '2019-11-11 12:38:32', '2019-11-11 12:38:32');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (68, 'alipore', 13, 4, 11, '2019-11-11 12:38:18', '2019-11-15 14:35:01');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (67, 'basirhat', 38, 6, 11, '2019-11-11 12:37:43', '2019-11-11 12:37:43');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (66, 'bongaon', 38, 6, 11, '2019-11-11 12:37:28', '2019-11-11 12:37:28');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (65, 'sealdah', 38, 4, 11, '2019-11-11 12:37:00', '2019-11-11 12:37:00');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (64, 'bidhannagar', 38, 4, 11, '2019-11-11 12:36:40', '2019-11-11 12:36:40');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (63, 'barrackpore', 38, 4, 11, '2019-11-11 12:36:18', '2019-11-11 12:36:18');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (62, 'barasat', 38, 4, 11, '2019-11-11 12:35:41', '2019-11-11 12:35:41');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (61, 'amta', 26, 4, 11, '2019-11-11 12:25:28', '2019-11-11 12:25:28');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (60, 'uluberia', 26, 4, 11, '2019-11-11 12:25:19', '2019-11-11 12:25:19');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (58, 'howrah sadar', 26, 4, 11, '2019-11-11 12:24:01', '2019-11-11 12:24:01');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (57, 'arambagh', 28, 6, 11, '2019-11-11 12:18:01', '2019-11-11 12:18:01');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (56, 'chandannagar', 28, 4, 11, '2019-11-11 12:17:46', '2019-11-11 12:17:46');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (55, 'serampore', 28, 4, 11, '2019-11-11 12:17:18', '2019-11-11 12:17:18');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (54, 'hoogly sadar', 28, 4, 11, '2019-11-11 12:16:48', '2019-11-11 12:24:53');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (53, 'provincial  small causes court (pscc)', 36, 4, 11, '2019-11-11 12:14:15', '2019-11-11 12:15:22');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (52, 'city civil court', 36, 4, 11, '2019-11-11 12:14:01', '2019-11-11 12:14:01');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (51, 'city sessions court', 36, 4, 11, '2019-11-11 12:13:44', '2019-11-11 12:13:44');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (2, 'abc', 50, 8, 11, '2019-11-22 16:03:51', '2019-11-22 16:03:51');


--
-- TOC entry 3304 (class 0 OID 30939)
-- Dependencies: 257
-- Data for Name: user_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (6, 'Court', '2019-08-30 06:31:42', '2019-08-30 06:31:42');
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (1, 'Administrator', NULL, NULL);
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (5, 'Inspection', '2019-08-28 08:33:30', '2019-11-22 14:23:26');
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (2, 'Judicial Officer', NULL, '2019-11-22 14:24:03');
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (7, 'Central Dispatch Section', '2019-11-22 17:41:12', '2019-11-22 17:41:12');
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (8, 'Department', '2019-11-28 16:17:12', '2019-11-28 16:17:12');


--
-- TOC entry 3306 (class 0 OID 30944)
-- Dependencies: 259
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (43, 'jo00032', 'Anabil Bhattacharya', 2, NULL, 32, NULL, NULL, 'banabil90@gmail.com', NULL, '$2y$10$WznmxyUdjymJIi2qsCJ5LuS2am4cq0poG1bfJYtWOas6DZbt0013K', NULL, '2019-11-28 18:00:56', '2019-11-28 18:00:56');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (30, 'court1', 'Court', 6, 3, NULL, NULL, NULL, 'court1@court1.court1', NULL, '$2y$10$aBAFK1T59AzcJVKBGLkV4uMOHGSxxYUkuFR0IE84imZjK55wryJ2u', NULL, '2019-09-16 10:59:20', '2019-09-16 10:59:20');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (33, 'jo00028', 'Rupsa Basu', 2, NULL, 28, NULL, NULL, 'rupsa@gmail.com', NULL, '$2y$10$Q4g8CvhRZwcr/k.dkaABruCTVjqowDVgykm..DFNss3ouSeykll8C', NULL, '2019-11-27 11:34:59', '2019-11-27 11:34:59');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (36, 'jo00031', 'Arpan Kr Roy', 2, NULL, 31, NULL, NULL, 'arpan@gmail.com', NULL, '$2y$10$KgMxnUWYcnSd1wNvX0Uj6.58nkJ6rOk4EivGZ/8683fF0CocBvyLa', NULL, '2019-11-28 13:23:13', '2019-11-28 13:23:13');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (40, 'abs123', 'Abhisikta Basak', 8, NULL, NULL, NULL, 3, 'kpc@kpc.kpc', NULL, '$2y$10$8LdZ9BSda9VIJZY5SyWvs.wCwTwORzw48qdRvRWKhivltjjtbhnci', NULL, '2019-11-28 17:43:08', '2019-11-28 17:43:08');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (37, 'ab123', 'Srijoni Ghosh', 8, NULL, NULL, NULL, 90, 'sr@sr.com', NULL, '$2y$10$M59u/bbTQHGvI6KMB.43N.5Q4JQOxwg1MC8eBVN.Or06jZqW2DvO6', NULL, '2019-11-28 17:38:34', '2019-11-28 17:38:34');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (42, 'qwerty', 'werty', 8, NULL, NULL, NULL, 1, 'we@we.com', NULL, '$2y$10$u7EFi05Y0Sozv2BWSNJqn.ijZvJW3Si9LH4.NojS5qJJfaHQuqgom', NULL, '2019-11-28 18:00:52', '2019-11-28 18:00:52');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (11, 'admin', 'administrator 1', 1, 1, NULL, NULL, NULL, 'admin@admin.admin', NULL, '$2y$10$aBAFK1T59AzcJVKBGLkV4uMOHGSxxYUkuFR0IE84imZjK55wryJ2u', '4xyOJnIl4Uz9PNHW9MBqXaupVU7KKre7FJJuFsznlI9XMQP7T9vRffdu1EAE', '2019-06-19 06:00:07', '2019-06-19 06:00:07');


--
-- TOC entry 3308 (class 0 OID 30952)
-- Dependencies: 261
-- Data for Name: zone_subdivisions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3310 (class 0 OID 30957)
-- Dependencies: 263
-- Data for Name: zones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (4, 'a', 1095, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (6, 'b', 1095, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (8, 'd', 730, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (7, 'c', 1095, 11, '2019-11-13 00:00:00', '2019-11-15 11:31:20');


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 197
-- Name: acr_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acr_histories_id_seq', 1, true);


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 199
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 201
-- Name: courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courts_id_seq', 82, true);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 203
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.departments_id_seq', 1, false);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 205
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.designations_id_seq', 5, true);


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 207
-- Name: diaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.diaries_id_seq', 1, true);


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 209
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.districts_id_seq', 1, true);


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 211
-- Name: grade_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grade_details_id_seq', 1, false);


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 213
-- Name: hc_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hc_case_types_id_seq', 1, false);


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 215
-- Name: history_deleted_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.history_deleted_data_id_seq', 1, false);


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 217
-- Name: history_updated_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.history_updated_data_id_seq', 3, true);


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 219
-- Name: jo_legal_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_legal_experiences_id_seq', 2, true);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 221
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_reporting_reviewings_id_seq', 1, false);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 223
-- Name: jo_reportings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_reportings_id_seq', 2, true);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 225
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_zone_tenures_id_seq', 18, true);


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 227
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_posting_preferences_id_seq', 8, true);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 229
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_postings_id_seq', 31, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 231
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_qualifications_id_seq', 43, true);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 233
-- Name: judicial_officers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officers_id_seq', 32, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 235
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_hc_ends_id_seq', 9, true);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 237
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_lc_details_id_seq', 33, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 239
-- Name: lcr_status_checks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_status_checks_id_seq', 1, false);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 241
-- Name: lower_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lower_case_types_id_seq', 1, false);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 243
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 47, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 245
-- Name: modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.modes_id_seq', 2, true);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 248
-- Name: qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.qualifications_id_seq', 1, false);


--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 250
-- Name: recruitment_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recruitment_batches_id_seq', 1, false);


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 252
-- Name: religions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.religions_id_seq', 1, false);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 254
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 58, true);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 256
-- Name: subdivisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subdivisions_id_seq', 151, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 258
-- Name: user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_types_id_seq', 7, true);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 260
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 43, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 262
-- Name: zone_subdivisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zone_subdivisions_id_seq', 1, false);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 264
-- Name: zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zones_id_seq', 13, true);


--
-- TOC entry 2936 (class 2606 OID 30998)
-- Name: acr_histories acr_histories_judicial_officer_id_year_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_judicial_officer_id_year_unique UNIQUE (judicial_officer_id, year);


--
-- TOC entry 2938 (class 2606 OID 31000)
-- Name: acr_histories acr_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 2940 (class 2606 OID 31002)
-- Name: categories categories_category_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_name_unique UNIQUE (category_name);


--
-- TOC entry 2942 (class 2606 OID 31004)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2944 (class 2606 OID 31006)
-- Name: courts courts_court_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_court_name_unique UNIQUE (court_name);


--
-- TOC entry 2946 (class 2606 OID 31008)
-- Name: courts courts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_pkey PRIMARY KEY (id);


--
-- TOC entry 2948 (class 2606 OID 31010)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2950 (class 2606 OID 31012)
-- Name: designations designations_designation_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_designation_name_unique UNIQUE (designation_name);


--
-- TOC entry 2952 (class 2606 OID 31014)
-- Name: designations designations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- TOC entry 2954 (class 2606 OID 31016)
-- Name: diaries diaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diaries
    ADD CONSTRAINT diaries_pkey PRIMARY KEY (id);


--
-- TOC entry 2956 (class 2606 OID 31018)
-- Name: districts districts_district_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_district_name_unique UNIQUE (district_name);


--
-- TOC entry 2958 (class 2606 OID 31020)
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- TOC entry 2960 (class 2606 OID 31022)
-- Name: grade_details grade_details_grade_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade_details
    ADD CONSTRAINT grade_details_grade_name_unique UNIQUE (grade_name);


--
-- TOC entry 2962 (class 2606 OID 31024)
-- Name: grade_details grade_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade_details
    ADD CONSTRAINT grade_details_pkey PRIMARY KEY (id);


--
-- TOC entry 2964 (class 2606 OID 31026)
-- Name: hc_case_types hc_case_types_full_form_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types
    ADD CONSTRAINT hc_case_types_full_form_unique UNIQUE (full_form);


--
-- TOC entry 2966 (class 2606 OID 31028)
-- Name: hc_case_types hc_case_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types
    ADD CONSTRAINT hc_case_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2968 (class 2606 OID 31030)
-- Name: hc_case_types hc_case_types_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types
    ADD CONSTRAINT hc_case_types_type_name_unique UNIQUE (type_name);


--
-- TOC entry 2970 (class 2606 OID 31032)
-- Name: history_deleted_data history_deleted_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.history_deleted_data
    ADD CONSTRAINT history_deleted_data_pkey PRIMARY KEY (id);


--
-- TOC entry 2972 (class 2606 OID 31034)
-- Name: history_updated_data history_updated_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.history_updated_data
    ADD CONSTRAINT history_updated_data_pkey PRIMARY KEY (id);


--
-- TOC entry 2974 (class 2606 OID 31036)
-- Name: jo_legal_experiences jo_legal_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_legal_experiences
    ADD CONSTRAINT jo_legal_experiences_pkey PRIMARY KEY (id);


--
-- TOC entry 2976 (class 2606 OID 31040)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_judicial_officer_id_reporting_officer_i; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_judicial_officer_id_reporting_officer_i UNIQUE (judicial_officer_id, reporting_officer_id);


--
-- TOC entry 2978 (class 2606 OID 31042)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_pkey PRIMARY KEY (id);


--
-- TOC entry 2980 (class 2606 OID 31044)
-- Name: jo_reportings jo_reportings_judicial_officer_id_posting_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings
    ADD CONSTRAINT jo_reportings_judicial_officer_id_posting_id_unique UNIQUE (judicial_officer_id, posting_id);


--
-- TOC entry 2982 (class 2606 OID 31046)
-- Name: jo_reportings jo_reportings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings
    ADD CONSTRAINT jo_reportings_pkey PRIMARY KEY (id);


--
-- TOC entry 2984 (class 2606 OID 31048)
-- Name: jo_zone_tenures jo_zone_tenures_judicial_officer_id_zone_id_from_date_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_judicial_officer_id_zone_id_from_date_unique UNIQUE (judicial_officer_id, zone_id, from_date);


--
-- TOC entry 2986 (class 2606 OID 31050)
-- Name: jo_zone_tenures jo_zone_tenures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_pkey PRIMARY KEY (id);


--
-- TOC entry 2988 (class 2606 OID 31052)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 2990 (class 2606 OID 31054)
-- Name: judicial_officer_postings judicial_officer_postings_judicial_officer_id_designation_id_co; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_judicial_officer_id_designation_id_co UNIQUE (judicial_officer_id, designation_id, court_id, mode_id, from_date);


--
-- TOC entry 2992 (class 2606 OID 31056)
-- Name: judicial_officer_postings judicial_officer_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_pkey PRIMARY KEY (id);


--
-- TOC entry 2994 (class 2606 OID 31058)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_judicial_officer_id_qualificati; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_judicial_officer_id_qualificati UNIQUE (judicial_officer_id, qualification_id);


--
-- TOC entry 2996 (class 2606 OID 31060)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2998 (class 2606 OID 31062)
-- Name: judicial_officers judicial_officers_aadhaar_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_aadhaar_no_unique UNIQUE (aadhaar_no);


--
-- TOC entry 3000 (class 2606 OID 31064)
-- Name: judicial_officers judicial_officers_email_id_1_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_email_id_1_unique UNIQUE (email_id_1);


--
-- TOC entry 3002 (class 2606 OID 31066)
-- Name: judicial_officers judicial_officers_email_id_2_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_email_id_2_unique UNIQUE (email_id_2);


--
-- TOC entry 3004 (class 2606 OID 31068)
-- Name: judicial_officers judicial_officers_gpf_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_gpf_no_unique UNIQUE (gpf_no);


--
-- TOC entry 3006 (class 2606 OID 31070)
-- Name: judicial_officers judicial_officers_jo_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_jo_code_unique UNIQUE (jo_code);


--
-- TOC entry 3008 (class 2606 OID 31072)
-- Name: judicial_officers judicial_officers_mobile_no_1_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_mobile_no_1_unique UNIQUE (mobile_no_1);


--
-- TOC entry 3010 (class 2606 OID 31074)
-- Name: judicial_officers judicial_officers_mobile_no_2_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_mobile_no_2_unique UNIQUE (mobile_no_2);


--
-- TOC entry 3012 (class 2606 OID 31076)
-- Name: judicial_officers judicial_officers_pan_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_pan_no_unique UNIQUE (pan_no);


--
-- TOC entry 3014 (class 2606 OID 31078)
-- Name: judicial_officers judicial_officers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_pkey PRIMARY KEY (id);


--
-- TOC entry 3016 (class 2606 OID 31080)
-- Name: judicial_officers judicial_officers_registration_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_registration_no_unique UNIQUE (registration_no);


--
-- TOC entry 3018 (class 2606 OID 31082)
-- Name: lcr_hc_ends lcr_hc_ends_memo_no_memo_date_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_memo_no_memo_date_unique UNIQUE (memo_no, memo_date);


--
-- TOC entry 3020 (class 2606 OID 31084)
-- Name: lcr_hc_ends lcr_hc_ends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_pkey PRIMARY KEY (id);


--
-- TOC entry 3022 (class 2606 OID 31086)
-- Name: lcr_lc_details lcr_lc_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details
    ADD CONSTRAINT lcr_lc_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3024 (class 2606 OID 31088)
-- Name: lcr_status_checks lcr_status_checks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_status_checks
    ADD CONSTRAINT lcr_status_checks_pkey PRIMARY KEY (id);


--
-- TOC entry 3026 (class 2606 OID 31090)
-- Name: lower_case_types lower_case_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types
    ADD CONSTRAINT lower_case_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3028 (class 2606 OID 31092)
-- Name: lower_case_types lower_case_types_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types
    ADD CONSTRAINT lower_case_types_type_name_unique UNIQUE (type_name);


--
-- TOC entry 3030 (class 2606 OID 31094)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3032 (class 2606 OID 31096)
-- Name: modes modes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_pkey PRIMARY KEY (id);


--
-- TOC entry 3034 (class 2606 OID 31098)
-- Name: modes modes_posting_mode_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_posting_mode_unique UNIQUE (posting_mode);


--
-- TOC entry 3037 (class 2606 OID 31100)
-- Name: qualifications qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3039 (class 2606 OID 31102)
-- Name: qualifications qualifications_qualification_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_qualification_name_unique UNIQUE (qualification_name);


--
-- TOC entry 3041 (class 2606 OID 31104)
-- Name: recruitment_batches recruitment_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches
    ADD CONSTRAINT recruitment_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 3043 (class 2606 OID 31106)
-- Name: recruitment_batches recruitment_batches_recruitment_batch_desc_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches
    ADD CONSTRAINT recruitment_batches_recruitment_batch_desc_unique UNIQUE (recruitment_batch_desc);


--
-- TOC entry 3045 (class 2606 OID 31108)
-- Name: religions religions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.religions
    ADD CONSTRAINT religions_pkey PRIMARY KEY (id);


--
-- TOC entry 3047 (class 2606 OID 31110)
-- Name: religions religions_religion_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.religions
    ADD CONSTRAINT religions_religion_name_unique UNIQUE (religion_name);


--
-- TOC entry 3049 (class 2606 OID 31112)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 3051 (class 2606 OID 31114)
-- Name: states states_state_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_state_name_unique UNIQUE (state_name);


--
-- TOC entry 3053 (class 2606 OID 31116)
-- Name: subdivisions subdivisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3055 (class 2606 OID 31118)
-- Name: subdivisions subdivisions_subdivision_name_district_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_subdivision_name_district_id_unique UNIQUE (subdivision_name, district_id);


--
-- TOC entry 3057 (class 2606 OID 31120)
-- Name: user_types user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_types
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3059 (class 2606 OID 31122)
-- Name: users users_court_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_court_id_unique UNIQUE (court_id);


--
-- TOC entry 3061 (class 2606 OID 31124)
-- Name: users users_department_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_department_id_unique UNIQUE (department_id);


--
-- TOC entry 3063 (class 2606 OID 31126)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3065 (class 2606 OID 31128)
-- Name: users users_jo_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_jo_code_unique UNIQUE (jo_code);


--
-- TOC entry 3067 (class 2606 OID 31130)
-- Name: users users_judicial_officer_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_judicial_officer_id_unique UNIQUE (judicial_officer_id);


--
-- TOC entry 3069 (class 2606 OID 31132)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3071 (class 2606 OID 31134)
-- Name: zone_subdivisions zone_subdivisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zone_subdivisions
    ADD CONSTRAINT zone_subdivisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3073 (class 2606 OID 31136)
-- Name: zone_subdivisions zone_subdivisions_zone_id_subdivision_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zone_subdivisions
    ADD CONSTRAINT zone_subdivisions_zone_id_subdivision_id_unique UNIQUE (zone_id, subdivision_id);


--
-- TOC entry 3075 (class 2606 OID 31138)
-- Name: zones zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- TOC entry 3077 (class 2606 OID 31140)
-- Name: zones zones_zone_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_zone_name_unique UNIQUE (zone_name);


--
-- TOC entry 3035 (class 1259 OID 31141)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 3120 (class 2620 OID 31142)
-- Name: judicial_officers movedeleted; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER movedeleted BEFORE DELETE ON public.judicial_officers FOR EACH ROW EXECUTE PROCEDURE public.movedeleted();


--
-- TOC entry 3118 (class 2620 OID 31143)
-- Name: judicial_officer_qualifications movedeleted; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER movedeleted BEFORE DELETE ON public.judicial_officer_qualifications FOR EACH ROW EXECUTE PROCEDURE public.movedeleted();


--
-- TOC entry 3116 (class 2620 OID 31144)
-- Name: judicial_officer_postings movedeleted; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER movedeleted BEFORE DELETE ON public.judicial_officer_postings FOR EACH ROW EXECUTE PROCEDURE public.movedeleted();


--
-- TOC entry 3121 (class 2620 OID 31145)
-- Name: judicial_officers moveupdated; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER moveupdated BEFORE UPDATE ON public.judicial_officers FOR EACH ROW EXECUTE PROCEDURE public.moveupdated();


--
-- TOC entry 3119 (class 2620 OID 31146)
-- Name: judicial_officer_qualifications moveupdated; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER moveupdated BEFORE UPDATE ON public.judicial_officer_qualifications FOR EACH ROW EXECUTE PROCEDURE public.moveupdated();


--
-- TOC entry 3117 (class 2620 OID 31147)
-- Name: judicial_officer_postings moveupdated; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER moveupdated BEFORE UPDATE ON public.judicial_officer_postings FOR EACH ROW EXECUTE PROCEDURE public.moveupdated();


--
-- TOC entry 3078 (class 2606 OID 31148)
-- Name: acr_histories acr_histories_grade_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_grade_id_foreign FOREIGN KEY (grade_id) REFERENCES public.grade_details(id);


--
-- TOC entry 3079 (class 2606 OID 31153)
-- Name: acr_histories acr_histories_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3080 (class 2606 OID 31158)
-- Name: courts courts_subdivision_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_subdivision_id_foreign FOREIGN KEY (subdivision_id) REFERENCES public.subdivisions(id);


--
-- TOC entry 3081 (class 2606 OID 31163)
-- Name: diaries diaries_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diaries
    ADD CONSTRAINT diaries_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3082 (class 2606 OID 31168)
-- Name: districts districts_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_state_id_foreign FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- TOC entry 3083 (class 2606 OID 31173)
-- Name: jo_legal_experiences jo_legal_experiences_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_legal_experiences
    ADD CONSTRAINT jo_legal_experiences_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3084 (class 2606 OID 31178)
-- Name: jo_legal_experiences jo_legal_experiences_subdivision_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_legal_experiences
    ADD CONSTRAINT jo_legal_experiences_subdivision_id_foreign FOREIGN KEY (subdivision_id) REFERENCES public.subdivisions(id);


--
-- TOC entry 3085 (class 2606 OID 31188)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3086 (class 2606 OID 31193)
-- Name: jo_reporting_reviewings jo_reporting_reviewings_reporting_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_reporting_officer_id_foreign FOREIGN KEY (reporting_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3087 (class 2606 OID 31198)
-- Name: jo_reportings jo_reportings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings
    ADD CONSTRAINT jo_reportings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3088 (class 2606 OID 31203)
-- Name: jo_reportings jo_reportings_posting_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings
    ADD CONSTRAINT jo_reportings_posting_id_foreign FOREIGN KEY (posting_id) REFERENCES public.judicial_officer_postings(id);


--
-- TOC entry 3089 (class 2606 OID 31208)
-- Name: jo_reportings jo_reportings_reporting_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings
    ADD CONSTRAINT jo_reportings_reporting_officer_id_foreign FOREIGN KEY (reporting_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3090 (class 2606 OID 31213)
-- Name: jo_zone_tenures jo_zone_tenures_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3091 (class 2606 OID 31218)
-- Name: jo_zone_tenures jo_zone_tenures_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 3092 (class 2606 OID 31223)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_judicial_officer_id_foreig; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_judicial_officer_id_foreig FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3093 (class 2606 OID 31228)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 3094 (class 2606 OID 31233)
-- Name: judicial_officer_postings judicial_officer_postings_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_court_id_foreign FOREIGN KEY (court_id) REFERENCES public.courts(id);


--
-- TOC entry 3095 (class 2606 OID 31238)
-- Name: judicial_officer_postings judicial_officer_postings_designation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_designation_id_foreign FOREIGN KEY (designation_id) REFERENCES public.designations(id);


--
-- TOC entry 3096 (class 2606 OID 31243)
-- Name: judicial_officer_postings judicial_officer_postings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3097 (class 2606 OID 31248)
-- Name: judicial_officer_postings judicial_officer_postings_mode_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_mode_id_foreign FOREIGN KEY (mode_id) REFERENCES public.modes(id);


--
-- TOC entry 3098 (class 2606 OID 31253)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3099 (class 2606 OID 31258)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_qualification_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_qualification_id_foreign FOREIGN KEY (qualification_id) REFERENCES public.qualifications(id);


--
-- TOC entry 3100 (class 2606 OID 31263)
-- Name: judicial_officers judicial_officers_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3101 (class 2606 OID 31268)
-- Name: judicial_officers judicial_officers_home_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_home_district_id_foreign FOREIGN KEY (home_district_id) REFERENCES public.districts(id);


--
-- TOC entry 3102 (class 2606 OID 31273)
-- Name: judicial_officers judicial_officers_home_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_home_state_id_foreign FOREIGN KEY (home_state_id) REFERENCES public.states(id);


--
-- TOC entry 3103 (class 2606 OID 31278)
-- Name: judicial_officers judicial_officers_recruitment_batch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_recruitment_batch_id_foreign FOREIGN KEY (recruitment_batch_id) REFERENCES public.recruitment_batches(id);


--
-- TOC entry 3104 (class 2606 OID 31283)
-- Name: judicial_officers judicial_officers_religion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_religion_id_foreign FOREIGN KEY (religion_id) REFERENCES public.religions(id);


--
-- TOC entry 3105 (class 2606 OID 31288)
-- Name: lcr_hc_ends lcr_hc_ends_court_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_court_foreign FOREIGN KEY (court) REFERENCES public.courts(id);


--
-- TOC entry 3106 (class 2606 OID 31293)
-- Name: lcr_hc_ends lcr_hc_ends_district_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_district_foreign FOREIGN KEY (district) REFERENCES public.districts(id);


--
-- TOC entry 3107 (class 2606 OID 31298)
-- Name: lcr_hc_ends lcr_hc_ends_forwarding_court_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_forwarding_court_foreign FOREIGN KEY (forwarding_court) REFERENCES public.courts(id);


--
-- TOC entry 3108 (class 2606 OID 31303)
-- Name: lcr_hc_ends lcr_hc_ends_subdivision_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_subdivision_foreign FOREIGN KEY (subdivision) REFERENCES public.subdivisions(id);


--
-- TOC entry 3109 (class 2606 OID 31308)
-- Name: subdivisions subdivisions_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_district_id_foreign FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- TOC entry 3110 (class 2606 OID 31313)
-- Name: subdivisions subdivisions_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 3111 (class 2606 OID 31318)
-- Name: users users_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_court_id_foreign FOREIGN KEY (court_id) REFERENCES public.courts(id);


--
-- TOC entry 3112 (class 2606 OID 31323)
-- Name: users users_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 3113 (class 2606 OID 31328)
-- Name: users users_user_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_type_id_foreign FOREIGN KEY (user_type_id) REFERENCES public.user_types(id);


--
-- TOC entry 3114 (class 2606 OID 31333)
-- Name: zone_subdivisions zone_subdivisions_subdivision_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zone_subdivisions
    ADD CONSTRAINT zone_subdivisions_subdivision_id_foreign FOREIGN KEY (subdivision_id) REFERENCES public.subdivisions(id);


--
-- TOC entry 3115 (class 2606 OID 31338)
-- Name: zone_subdivisions zone_subdivisions_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zone_subdivisions
    ADD CONSTRAINT zone_subdivisions_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


-- Completed on 2019-11-29 00:45:53

--
-- PostgreSQL database dump complete
--

