--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 11.1

-- Started on 2020-01-06 16:30:02

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
-- TOC entry 252 (class 1255 OID 448495)
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
-- TOC entry 253 (class 1255 OID 448496)
-- Name: moveupdated(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.moveupdated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                BEGIN
                    insert into history_updated_data(table_name,updated_data,updated_time)
                    values(TG_TABLE_NAME,row_to_json(OLD),now());
                    return NEW;
                END;
            $$;


SET default_with_oids = false;

--
-- TOC entry 217 (class 1259 OID 451926)
-- Name: acr_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.acr_histories (
    id bigint NOT NULL,
    jo_code character varying(255) NOT NULL,
    judicial_officer_id bigint NOT NULL,
    grade_id integer NOT NULL,
    year integer NOT NULL,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 216 (class 1259 OID 451924)
-- Name: acr_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.acr_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 216
-- Name: acr_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.acr_histories_id_seq OWNED BY public.acr_histories.id;


--
-- TOC entry 183 (class 1259 OID 451613)
-- Name: courts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courts (
    id integer NOT NULL,
    court_name character varying(255) NOT NULL,
    subdivision_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 182 (class 1259 OID 451611)
-- Name: courts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 182
-- Name: courts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courts_id_seq OWNED BY public.courts.id;


--
-- TOC entry 229 (class 1259 OID 452046)
-- Name: departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.departments (
    id bigint NOT NULL,
    dept_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 228 (class 1259 OID 452044)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 228
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 187 (class 1259 OID 451638)
-- Name: designations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.designations (
    id integer NOT NULL,
    designation_name character varying(255) NOT NULL,
    rank_id integer,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    subdivision_id integer
);


--
-- TOC entry 186 (class 1259 OID 451636)
-- Name: designations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.designations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 186
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.designations_id_seq OWNED BY public.designations.id;


--
-- TOC entry 205 (class 1259 OID 451826)
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
-- TOC entry 204 (class 1259 OID 451824)
-- Name: diaries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.diaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 204
-- Name: diaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.diaries_id_seq OWNED BY public.diaries.id;


--
-- TOC entry 179 (class 1259 OID 451573)
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.districts (
    id integer NOT NULL,
    district_name character varying(255) NOT NULL,
    state_id integer NOT NULL,
    zone_id integer,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 178 (class 1259 OID 451571)
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 178
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;


--
-- TOC entry 235 (class 1259 OID 452082)
-- Name: document_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.document_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 234 (class 1259 OID 452080)
-- Name: document_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.document_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 234
-- Name: document_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.document_types_id_seq OWNED BY public.document_types.id;


--
-- TOC entry 215 (class 1259 OID 451916)
-- Name: grade_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grade_details (
    id integer NOT NULL,
    grade_name character varying(255) NOT NULL,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 214 (class 1259 OID 451914)
-- Name: grade_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grade_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 214
-- Name: grade_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grade_details_id_seq OWNED BY public.grade_details.id;


--
-- TOC entry 211 (class 1259 OID 451891)
-- Name: hc_case_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hc_case_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    full_form character varying(255) NOT NULL,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 210 (class 1259 OID 451889)
-- Name: hc_case_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hc_case_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 210
-- Name: hc_case_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hc_case_types_id_seq OWNED BY public.hc_case_types.id;


--
-- TOC entry 227 (class 1259 OID 452029)
-- Name: history_deleted_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.history_deleted_data (
    id bigint NOT NULL,
    table_name character varying(255) NOT NULL,
    deleted_data json NOT NULL,
    deleted_time timestamp(0) without time zone NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 452027)
-- Name: history_deleted_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.history_deleted_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 226
-- Name: history_deleted_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.history_deleted_data_id_seq OWNED BY public.history_deleted_data.id;


--
-- TOC entry 225 (class 1259 OID 452018)
-- Name: history_updated_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.history_updated_data (
    id bigint NOT NULL,
    table_name character varying(255) NOT NULL,
    updated_data json NOT NULL,
    updated_time timestamp(0) without time zone NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 452016)
-- Name: history_updated_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.history_updated_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 224
-- Name: history_updated_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.history_updated_data_id_seq OWNED BY public.history_updated_data.id;


--
-- TOC entry 237 (class 1259 OID 452090)
-- Name: jo_documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jo_documents (
    id bigint NOT NULL,
    document_type_id integer NOT NULL,
    judicial_officer_id bigint NOT NULL,
    document_path character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 236 (class 1259 OID 452088)
-- Name: jo_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 236
-- Name: jo_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_documents_id_seq OWNED BY public.jo_documents.id;


--
-- TOC entry 239 (class 1259 OID 452164)
-- Name: jo_grades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jo_grades (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    rank_id integer NOT NULL,
    grade integer NOT NULL,
    date_of_gradation date NOT NULL,
    remark text NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 238 (class 1259 OID 452162)
-- Name: jo_grades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 238
-- Name: jo_grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_grades_id_seq OWNED BY public.jo_grades.id;


--
-- TOC entry 231 (class 1259 OID 452054)
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
-- TOC entry 230 (class 1259 OID 452052)
-- Name: jo_legal_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_legal_experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 230
-- Name: jo_legal_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_legal_experiences_id_seq OWNED BY public.jo_legal_experiences.id;


--
-- TOC entry 201 (class 1259 OID 451777)
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
-- TOC entry 200 (class 1259 OID 451775)
-- Name: jo_reportings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_reportings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 200
-- Name: jo_reportings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_reportings_id_seq OWNED BY public.jo_reportings.id;


--
-- TOC entry 219 (class 1259 OID 451946)
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
-- TOC entry 218 (class 1259 OID 451944)
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jo_zone_tenures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2513 (class 0 OID 0)
-- Dependencies: 218
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jo_zone_tenures_id_seq OWNED BY public.jo_zone_tenures.id;


--
-- TOC entry 203 (class 1259 OID 451805)
-- Name: judicial_officer_posting_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officer_posting_preferences (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    zone_id integer NOT NULL,
    station_name text NOT NULL,
    remarks text,
    final_submission character varying(255) NOT NULL,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 202 (class 1259 OID 451803)
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_posting_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2514 (class 0 OID 0)
-- Dependencies: 202
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_posting_preferences_id_seq OWNED BY public.judicial_officer_posting_preferences.id;


--
-- TOC entry 199 (class 1259 OID 451746)
-- Name: judicial_officer_postings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officer_postings (
    id bigint NOT NULL,
    judicial_officer_id bigint NOT NULL,
    mode_id integer NOT NULL,
    rank_id integer NOT NULL,
    designation_id integer,
    deputation_designation character varying(255),
    deputation_posting_place character varying(255),
    from_date date NOT NULL,
    to_date date,
    posting_remark text,
    acp_1 character varying(255),
    acp_1_doc date,
    acp_2 character varying(255),
    acp_2_doc date,
    dj_se character varying(255),
    dj_se_doc date,
    dj_st character varying(255),
    dj_st_doc date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 198 (class 1259 OID 451744)
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_postings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2515 (class 0 OID 0)
-- Dependencies: 198
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_postings_id_seq OWNED BY public.judicial_officer_postings.id;


--
-- TOC entry 195 (class 1259 OID 451716)
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
-- TOC entry 194 (class 1259 OID 451714)
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officer_qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 194
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officer_qualifications_id_seq OWNED BY public.judicial_officer_qualifications.id;


--
-- TOC entry 193 (class 1259 OID 451671)
-- Name: judicial_officers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.judicial_officers (
    id bigint NOT NULL,
    registration_no character varying(255) NOT NULL,
    jo_code character varying(255),
    officer_name character varying(255) NOT NULL,
    gender character varying(255) NOT NULL,
    spouse bigint,
    date_of_birth date NOT NULL,
    home_state_id integer NOT NULL,
    home_district_id integer,
    hometown character varying(255),
    present_address text NOT NULL,
    permanent_address text NOT NULL,
    mobile_no_1 character varying(255) NOT NULL,
    mobile_no_2 character varying(255),
    email_id_1 character varying(255) NOT NULL,
    email_id_2 character varying(255),
    recruitment_batch_id integer NOT NULL,
    recruitment_batch_year integer NOT NULL,
    date_of_joining date NOT NULL,
    date_of_confirmation date,
    date_of_retirement date NOT NULL,
    profile_image character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    other_home_district character varying(255),
    posting_preference_window_flag character varying(1),
    posting_preference_window_open_on date
);


--
-- TOC entry 192 (class 1259 OID 451669)
-- Name: judicial_officers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.judicial_officers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 192
-- Name: judicial_officers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.judicial_officers_id_seq OWNED BY public.judicial_officers.id;


--
-- TOC entry 233 (class 1259 OID 452072)
-- Name: lcr_departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lcr_departments (
    id bigint NOT NULL,
    lcr_department_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 232 (class 1259 OID 452070)
-- Name: lcr_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2518 (class 0 OID 0)
-- Dependencies: 232
-- Name: lcr_departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_departments_id_seq OWNED BY public.lcr_departments.id;


--
-- TOC entry 207 (class 1259 OID 451842)
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
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 206 (class 1259 OID 451840)
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_hc_ends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2519 (class 0 OID 0)
-- Dependencies: 206
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_hc_ends_id_seq OWNED BY public.lcr_hc_ends.id;


--
-- TOC entry 209 (class 1259 OID 451875)
-- Name: lcr_lc_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lcr_lc_details (
    id bigint NOT NULL,
    hc_id bigint NOT NULL,
    lower_case_record character varying(255) NOT NULL,
    lower_case_no integer NOT NULL,
    lower_case_year integer NOT NULL,
    compliance_flag character varying(255),
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 208 (class 1259 OID 451873)
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_lc_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2520 (class 0 OID 0)
-- Dependencies: 208
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_lc_details_id_seq OWNED BY public.lcr_lc_details.id;


--
-- TOC entry 223 (class 1259 OID 452002)
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
-- TOC entry 222 (class 1259 OID 452000)
-- Name: lcr_status_checks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lcr_status_checks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 222
-- Name: lcr_status_checks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lcr_status_checks_id_seq OWNED BY public.lcr_status_checks.id;


--
-- TOC entry 213 (class 1259 OID 451906)
-- Name: lower_case_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lower_case_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 212 (class 1259 OID 451904)
-- Name: lower_case_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lower_case_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 212
-- Name: lower_case_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lower_case_types_id_seq OWNED BY public.lower_case_types.id;


--
-- TOC entry 170 (class 1259 OID 451530)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 169 (class 1259 OID 451528)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2523 (class 0 OID 0)
-- Dependencies: 169
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 197 (class 1259 OID 451736)
-- Name: modes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modes (
    id integer NOT NULL,
    posting_mode character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 196 (class 1259 OID 451734)
-- Name: modes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2524 (class 0 OID 0)
-- Dependencies: 196
-- Name: modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modes_id_seq OWNED BY public.modes.id;


--
-- TOC entry 173 (class 1259 OID 451544)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- TOC entry 189 (class 1259 OID 451651)
-- Name: qualifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.qualifications (
    id integer NOT NULL,
    qualification_name character varying(255) NOT NULL,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 188 (class 1259 OID 451649)
-- Name: qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2525 (class 0 OID 0)
-- Dependencies: 188
-- Name: qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.qualifications_id_seq OWNED BY public.qualifications.id;


--
-- TOC entry 185 (class 1259 OID 451628)
-- Name: ranks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ranks (
    id integer NOT NULL,
    rank_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    rank_order integer NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 451626)
-- Name: ranks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ranks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2526 (class 0 OID 0)
-- Dependencies: 184
-- Name: ranks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ranks_id_seq OWNED BY public.ranks.id;


--
-- TOC entry 191 (class 1259 OID 451661)
-- Name: recruitment_batches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recruitment_batches (
    id integer NOT NULL,
    recruitment_batch_desc character varying(255) NOT NULL,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 190 (class 1259 OID 451659)
-- Name: recruitment_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recruitment_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2527 (class 0 OID 0)
-- Dependencies: 190
-- Name: recruitment_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recruitment_batches_id_seq OWNED BY public.recruitment_batches.id;


--
-- TOC entry 175 (class 1259 OID 451553)
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id integer NOT NULL,
    state_name character varying(255) NOT NULL,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 174 (class 1259 OID 451551)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2528 (class 0 OID 0)
-- Dependencies: 174
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 181 (class 1259 OID 451593)
-- Name: subdivisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subdivisions (
    id integer NOT NULL,
    subdivision_name character varying(255) NOT NULL,
    district_id integer NOT NULL,
    zone_id integer NOT NULL,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 180 (class 1259 OID 451591)
-- Name: subdivisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subdivisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2529 (class 0 OID 0)
-- Dependencies: 180
-- Name: subdivisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subdivisions_id_seq OWNED BY public.subdivisions.id;


--
-- TOC entry 172 (class 1259 OID 451538)
-- Name: user_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 171 (class 1259 OID 451536)
-- Name: user_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2530 (class 0 OID 0)
-- Dependencies: 171
-- Name: user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_types_id_seq OWNED BY public.user_types.id;


--
-- TOC entry 221 (class 1259 OID 451966)
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
-- TOC entry 220 (class 1259 OID 451964)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2531 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 177 (class 1259 OID 451563)
-- Name: zones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zones (
    id bigint NOT NULL,
    zone_name character varying(255) NOT NULL,
    min_service_days integer,
    created_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 176 (class 1259 OID 451561)
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2532 (class 0 OID 0)
-- Dependencies: 176
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zones_id_seq OWNED BY public.zones.id;


--
-- TOC entry 2123 (class 2604 OID 451929)
-- Name: acr_histories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories ALTER COLUMN id SET DEFAULT nextval('public.acr_histories_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 451616)
-- Name: courts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts ALTER COLUMN id SET DEFAULT nextval('public.courts_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 452049)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 2108 (class 2604 OID 451641)
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- TOC entry 2117 (class 2604 OID 451829)
-- Name: diaries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diaries ALTER COLUMN id SET DEFAULT nextval('public.diaries_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 451576)
-- Name: districts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 452085)
-- Name: document_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.document_types ALTER COLUMN id SET DEFAULT nextval('public.document_types_id_seq'::regclass);


--
-- TOC entry 2122 (class 2604 OID 451919)
-- Name: grade_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade_details ALTER COLUMN id SET DEFAULT nextval('public.grade_details_id_seq'::regclass);


--
-- TOC entry 2120 (class 2604 OID 451894)
-- Name: hc_case_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types ALTER COLUMN id SET DEFAULT nextval('public.hc_case_types_id_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 452032)
-- Name: history_deleted_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.history_deleted_data ALTER COLUMN id SET DEFAULT nextval('public.history_deleted_data_id_seq'::regclass);


--
-- TOC entry 2127 (class 2604 OID 452021)
-- Name: history_updated_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.history_updated_data ALTER COLUMN id SET DEFAULT nextval('public.history_updated_data_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 452093)
-- Name: jo_documents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_documents ALTER COLUMN id SET DEFAULT nextval('public.jo_documents_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 452167)
-- Name: jo_grades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_grades ALTER COLUMN id SET DEFAULT nextval('public.jo_grades_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 452057)
-- Name: jo_legal_experiences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_legal_experiences ALTER COLUMN id SET DEFAULT nextval('public.jo_legal_experiences_id_seq'::regclass);


--
-- TOC entry 2115 (class 2604 OID 451780)
-- Name: jo_reportings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings ALTER COLUMN id SET DEFAULT nextval('public.jo_reportings_id_seq'::regclass);


--
-- TOC entry 2124 (class 2604 OID 451949)
-- Name: jo_zone_tenures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures ALTER COLUMN id SET DEFAULT nextval('public.jo_zone_tenures_id_seq'::regclass);


--
-- TOC entry 2116 (class 2604 OID 451808)
-- Name: judicial_officer_posting_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_posting_preferences_id_seq'::regclass);


--
-- TOC entry 2114 (class 2604 OID 451749)
-- Name: judicial_officer_postings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_postings_id_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 451719)
-- Name: judicial_officer_qualifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications ALTER COLUMN id SET DEFAULT nextval('public.judicial_officer_qualifications_id_seq'::regclass);


--
-- TOC entry 2111 (class 2604 OID 451674)
-- Name: judicial_officers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers ALTER COLUMN id SET DEFAULT nextval('public.judicial_officers_id_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 452075)
-- Name: lcr_departments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_departments ALTER COLUMN id SET DEFAULT nextval('public.lcr_departments_id_seq'::regclass);


--
-- TOC entry 2118 (class 2604 OID 451845)
-- Name: lcr_hc_ends id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends ALTER COLUMN id SET DEFAULT nextval('public.lcr_hc_ends_id_seq'::regclass);


--
-- TOC entry 2119 (class 2604 OID 451878)
-- Name: lcr_lc_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details ALTER COLUMN id SET DEFAULT nextval('public.lcr_lc_details_id_seq'::regclass);


--
-- TOC entry 2126 (class 2604 OID 452005)
-- Name: lcr_status_checks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_status_checks ALTER COLUMN id SET DEFAULT nextval('public.lcr_status_checks_id_seq'::regclass);


--
-- TOC entry 2121 (class 2604 OID 451909)
-- Name: lower_case_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types ALTER COLUMN id SET DEFAULT nextval('public.lower_case_types_id_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 451533)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2113 (class 2604 OID 451739)
-- Name: modes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes ALTER COLUMN id SET DEFAULT nextval('public.modes_id_seq'::regclass);


--
-- TOC entry 2109 (class 2604 OID 451654)
-- Name: qualifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications ALTER COLUMN id SET DEFAULT nextval('public.qualifications_id_seq'::regclass);


--
-- TOC entry 2107 (class 2604 OID 451631)
-- Name: ranks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranks ALTER COLUMN id SET DEFAULT nextval('public.ranks_id_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 451664)
-- Name: recruitment_batches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches ALTER COLUMN id SET DEFAULT nextval('public.recruitment_batches_id_seq'::regclass);


--
-- TOC entry 2102 (class 2604 OID 451556)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 451596)
-- Name: subdivisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions ALTER COLUMN id SET DEFAULT nextval('public.subdivisions_id_seq'::regclass);


--
-- TOC entry 2101 (class 2604 OID 451541)
-- Name: user_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_types ALTER COLUMN id SET DEFAULT nextval('public.user_types_id_seq'::regclass);


--
-- TOC entry 2125 (class 2604 OID 451969)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 451566)
-- Name: zones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones ALTER COLUMN id SET DEFAULT nextval('public.zones_id_seq'::regclass);


--
-- TOC entry 2470 (class 0 OID 451926)
-- Dependencies: 217
-- Data for Name: acr_histories; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2436 (class 0 OID 451613)
-- Dependencies: 183
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
-- TOC entry 2482 (class 0 OID 452046)
-- Dependencies: 229
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2440 (class 0 OID 451638)
-- Dependencies: 187
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at, subdivision_id) VALUES (4, 'civil judge sr  div bishnupur', 2, 11, '2019-11-26 15:43:35', '2019-11-26 15:43:35', 76);
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at, subdivision_id) VALUES (2, 'acjm bishnupur', 1, 11, '2019-11-26 15:42:01', '2019-11-26 15:43:14', 76);
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at, subdivision_id) VALUES (1, 'adj bardhaman 1st court', 2, 2, '2019-11-22 18:04:31', '2019-11-22 18:04:31', 67);
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at, subdivision_id) VALUES (3, 'civil judge jr  div court bishnupur', 3, 11, '2019-11-26 15:43:22', '2019-11-26 15:43:22', 51);
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at, subdivision_id) VALUES (5, 'cjsd bankura', 2, 11, '2019-11-26 15:43:22', '2019-11-26 15:43:22', 65);
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at, subdivision_id) VALUES (6, 'civil judge jr div i bankura', 1, 11, '2019-11-26 15:43:22', '2019-11-26 15:43:22', 65);
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at, subdivision_id) VALUES (7, 'jm 3rd court bankura', 1, 11, '2019-11-26 15:43:22', '2019-11-26 15:43:22', 65);
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at, subdivision_id) VALUES (8, 'adj fast track court  bankura', 2, 11, '2019-11-26 15:43:22', '2019-11-26 15:43:22', 71);
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at, subdivision_id) VALUES (9, 'adj 1st court birbhum', 2, 11, '2019-11-26 15:43:22', '2019-11-26 15:43:22', 56);
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at, subdivision_id) VALUES (10, 'adj ftc dubrajpur birbhum', 2, 11, '2019-11-26 15:43:22', '2019-11-26 15:43:22', 80);


--
-- TOC entry 2458 (class 0 OID 451826)
-- Dependencies: 205
-- Data for Name: diaries; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2432 (class 0 OID 451573)
-- Dependencies: 179
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (48, 'jalpaiguri', 51, 8, 11, '2019-11-11 13:42:40', '2019-11-11 13:42:40');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (50, 'andaman and nicobar island', 75, 8, 11, '2019-11-11 14:07:53', '2019-11-11 14:07:53');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (44, 'murshidabad', 51, 7, 11, '2019-11-11 13:20:46', '2019-11-11 13:20:46');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (45, 'purba medinipur', 51, 6, 11, '2019-11-11 13:30:59', '2019-11-11 13:30:59');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (46, 'nadia', 51, 6, 11, '2019-11-11 13:31:32', '2019-11-11 13:31:32');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (47, 'cooch behar', 51, 8, 11, '2019-11-11 13:32:34', '2019-11-11 13:32:34');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (5, 'purulia', 7, 7, 11, '2019-06-17 06:27:05', '2019-08-05 05:48:47');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (7, 'kalimpong', 11, 8, 11, '2019-06-17 06:27:05', '2019-08-05 05:56:54');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (6, 'malda', 8, 7, 11, '2019-06-17 06:27:05', '2019-08-05 05:51:22');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (10, 'darjeeling', 17, 8, 11, '2019-06-17 06:27:05', '2019-08-05 05:55:27');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (8, 'south dinajpur', 11, 8, 11, '2019-06-17 06:27:05', '2019-08-05 05:50:41');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (14, 'west burdwan', 24, 6, 11, '2019-06-17 06:27:05', '2019-08-05 05:47:25');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (13, 'south 24 parganas', 24, 4, 11, '2019-06-17 06:27:05', '2019-11-11 12:28:19');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (25, 'bankura', 44, 7, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:21');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (22, 'alipure duar', 38, 8, 11, '2019-06-17 06:27:06', '2019-08-05 05:54:08');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (27, 'birbhum', 44, 7, 11, '2019-06-17 06:27:06', '2019-08-05 05:49:09');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (26, 'howrah', 44, 4, 11, '2019-06-17 06:27:06', '2019-08-05 05:47:53');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (29, 'north dinajpur', 48, 8, 11, '2019-06-17 06:27:06', '2019-11-11 13:54:30');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (28, 'hoogly', 48, 4, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:03');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (38, 'north 24 parganas', 51, 4, 11, '2019-11-11 12:26:13', '2019-11-11 12:26:13');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (36, 'kolkata', 51, 4, 11, '2019-07-10 06:27:59', '2019-07-10 06:27:59');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (41, 'paschim bardhaman', 51, 6, 11, '2019-11-11 13:19:29', '2019-11-11 13:19:29');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (40, 'purba bardhaman', 51, 6, 11, '2019-11-11 13:19:11', '2019-11-11 13:19:11');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (43, 'paschim medinipur', 51, 6, 11, '2019-11-11 13:20:14', '2019-11-11 13:20:14');
INSERT INTO public.districts (id, district_name, state_id, zone_id, created_by, created_at, updated_at) VALUES (42, 'jhargram', 51, 6, 11, '2019-11-11 13:19:58', '2019-11-11 13:19:58');


--
-- TOC entry 2488 (class 0 OID 452082)
-- Dependencies: 235
-- Data for Name: document_types; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2468 (class 0 OID 451916)
-- Dependencies: 215
-- Data for Name: grade_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (1, 'good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (2, 'average', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (3, 'very good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (4, 'outstanding', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (5, 'poor', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');


--
-- TOC entry 2464 (class 0 OID 451891)
-- Dependencies: 211
-- Data for Name: hc_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (1, 'AA', 'ARBRITATION APPL.', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (2, 'ABWA', 'APPL.UND.BENGAL WAKFS ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (3, 'AC', 'AWARD CASES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (4, 'ACA', 'APPL.UNDER CHARTERED ACCOUNTANTS ACT, 1949', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (5, 'ACO', 'PET. IN COMP. APPL.', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (6, 'ACR', 'APPL.UND.CHARITABLE & RELIGIOUS TRUST ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (7, 'ACRP', 'APPL.UND.SEC.151 OF THE CR.P.C.', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (8, 'ACWA', 'APPL.UND.SEC 21 COST&WORKS ACCOUNTACTS ACT, 1959', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (9, 'AED', 'APPL. U/S. 64 OF ESTATE DUTY ACT, 1953', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (10, 'AET', 'APPL. U/S 25 OF EXPENDITURE TAX ACT, 1957', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (11, 'AFP', 'APPL.FOR LEAVE TO SUE AS AN INDIGENT PERSON', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (12, 'AGA', 'APPL.UND.SEC.25 OF ADMINISTRATOR GENERALS'' ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (13, 'AGL', 'APPL.FOR APPOINTMENT OF GUARDIAN-AD-LITEM', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (14, 'AGT', 'APPL. U/S 26 GIFT TAX ACT, 1958', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (15, 'AGWA', 'APPL.UND.GUARDIANS & WARDS ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (16, 'AHC', 'HABEAS CORPUS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (17, 'AID', 'APPL. UNDER PATENTS & DESIGNS ACT, 1970', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (18, 'AIDR', 'APPL.UND.INDUSTRIAL DEVELOPMENT REGULATION ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (19, 'AIFC', 'APPL.UND.INDUSTRIAL FINANCE CORP. ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (20, 'AIRB', 'APPN.RECON.BANK OF I', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (21, 'ALP', 'APPL.UND.CLAUSE 13 OF LETTERS PATENT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (22, 'ALP.ITL', 'APPL. UNDER CLAUSE 17 OF THE LETTERS PATENT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (23, 'ALPII', 'APPL.UND.CLAUSE 17 L', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (24, 'ALPITL', 'APPL.CLAUSE-17 LP', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (25, 'AOR', 'CALCUTTA OFFICIAL RECEIVER''S ACT 1938', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (26, 'AORC', 'APPLICATION OMNIBUS RESIDUARY CLASS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (27, 'AOT', 'APPL.UND.OFFICIAL TRUSTEES ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (28, 'AP', 'ARBITRATION PETITION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (29, 'APD', 'APPEAL FROM DECREE', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (30, 'APDT', 'APP. FR. DECR. TEND.', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (31, 'APO', 'APPEAL FROM ORDER', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (32, 'APOT', 'TEMP APO', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (33, 'AS', 'ADMIRALITY  SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (34, 'ASCI', 'APPL.FOR LEAVE TO APPEAL TO THE SUPREME COURT OF INDIA', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (35, 'ASFC', 'APPL.UND.STAE FINANCIAL CORP. ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (36, 'ASM', 'APPL.SANCHAITA MATTERS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (37, 'ATA', 'APPL.UNDER TRUST ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (38, 'ATM', 'APPL.UND.TRADE&MERCHANDISE MARKS, ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (39, 'AUDA', 'APPL.UND.UNCLAIMED DEPOSITS ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (40, 'AWT', 'APPL. U/S 27 OF WEALTH TAX ACT, 1957', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (41, 'BBA', 'APPL.UND.BANKERS BOOKS EVIDENCE ACT, 1891', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (42, 'BIFR', 'BIFR', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (43, 'CA', 'COMPANY APPLICATION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (44, 'CAA', 'COMMISSIONER OF PATENT APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (45, 'CC', 'CONTEMPT OF COURT CASES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (46, 'CEXA', 'APPL.UND.CENTRAL EXCISE ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (47, 'CHS', 'CHAMBER SUMMONS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (48, 'CP', 'COMPANY PETITIONS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (49, 'CPA', 'COMMISSIONER OF PATE', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (50, 'CRA', 'COPYRIGHT APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (51, 'CRCC', 'CRIMINAL CONTEMPT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (52, 'CS', 'CIVIL SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (53, 'CS(O)', 'CIVIL SUIT(OLD)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (54, 'CSOS', 'CIVIL SUIT ORIGINATING SUMMONS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (55, 'CUSTA', 'APPL.UND.CUSTOMS ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (56, 'DM', 'UND.CHAPTER V OF O.S. RULES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (57, 'EC', 'EXECUTION CASES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (58, 'EOPLA', 'EXTRA ORDINARY PROBATE PROCEEDINGS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (59, 'EOS', 'EXTRA ORDINARY SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (60, 'EP', 'ELEC.PET.(PEOPLES REPRESENTATION ACT, 1951)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (61, 'FEA', 'FOREIGN EXCHANGE APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (62, 'FERA', 'APPL.UND.FOREIGN EXCHANGE REGULATION ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (63, 'GCAL', 'APPL.UND.GOLD CONTROL ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (64, 'IC', 'INSOLVENCY CASES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (65, 'ICA', 'APPL.UNDER INDIAN COMPANIES ACT, 1913', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (66, 'IP', 'IT.PET.256(2)IT''61', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (67, 'ITA', 'INCOME TAX APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (68, 'ITAT', 'INCOME TAX APPEAL TENDERED', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (69, 'ITP', 'INCOME TAX PET.(U/S. 256 (2) OF I.T. ACT, 1961)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (70, 'ITR', 'INCOMETAX REF.SEC.256 (1) OF I.T. ACT, 1961', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (71, 'LM', 'LUNATIC MATTERS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (72, 'LPA', 'LETTERS PATENT APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (73, 'MM', 'MISFEAOUCE MATTERS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (74, 'MS', 'MATRIMONIAL SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (75, 'NM', 'NOTICE OF MOTION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (76, 'OCO', 'ORIGINAL SIDE CROSS OBJECTION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (77, 'OCOT', 'ORIGINAL SIDE CROSS OBJECTION TENDER', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (78, 'OTS', 'ORDINANCE TRANSFER SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (79, 'PLA', 'APPL.FOR PROBATE & LETTERS OF ADMINISTRATION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (80, 'PLR', 'UND.CHPT.XXXI-A OF O.S. RULES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (81, 'PMS', 'PARSI MATRIMONIAL SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (82, 'REF', 'REFERENCE CASE', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (83, 'RVWO', 'MEMORANDUM OF REVIEWS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (84, 'SALT', 'APPL.UND.SALT ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (85, 'SANA', 'SANCHAITA APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (86, 'SCO', 'SPECIAL CASE FOR OPINION OF COURT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (87, 'SESS', 'SESSIONS CASES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (88, 'SS', 'SPECIAL SUITS(SEC 20 OF THE ARBITRATION ACT, 1940', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (89, 'T', 'TEMP A(1)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (90, 'TBCS', 'TRANSFERRED BANKING COMPANIES SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (91, 'TCS', 'TRANSFERRED COMPANY SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (92, 'TMA', 'TRADE MARK APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (93, 'TS', 'TESTAMENTERY SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (94, 'TUA', 'TRADE UNION APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (95, 'WPO', 'WRIT PETITION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (96, 'WP.CT', 'WP(CENTRAL ADMIN TRIBUNAL)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (97, 'WP.ST', 'WP(STATE ADMIN TRIBUNAL)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (98, 'WP.TT', 'WP(WB TAX TRIBUNAL)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) VALUES (99, 'WPCR', 'WRIT PETITION(CIVIL RULE)', NULL, NULL, NULL);


--
-- TOC entry 2480 (class 0 OID 452029)
-- Dependencies: 227
-- Data for Name: history_deleted_data; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (1, 'judicial_officers', '{"id":1,"registration_no":"123","jo_code":"wb123","officer_name":"Rupsa Bose","gender":"Female","spouse":null,"date_of_birth":"1989-03-05","home_state_id":1,"home_district_id":36,"hometown":"Manikala","present_address":"Maniktala","permanent_address":"Maniktala","mobile_no_1":"9830982611","mobile_no_2":null,"email_id_1":"rupsa2494@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2013,"date_of_joining":"2018-09-18","date_of_confirmation":"0201-09-19","date_of_retirement":"2058-09-18","profile_image":"Rupsa.jpg","created_at":null,"updated_at":null}', '2019-12-15 06:05:53');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (2, 'judicial_officer_qualifications', '{"id":8,"judicial_officer_id":9,"qualification_id":10,"passing_year":2018,"created_at":"2019-12-19 15:51:30","updated_at":"2019-12-19 15:51:30"}', '2019-12-23 09:07:22');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (3, 'judicial_officer_qualifications', '{"id":9,"judicial_officer_id":9,"qualification_id":5,"passing_year":2019,"created_at":"2019-12-19 15:51:30","updated_at":"2019-12-19 15:51:30"}', '2019-12-23 09:07:22');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (23, 'judicial_officer_postings', '{"id":5,"judicial_officer_id":9,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-01-01","to_date":null,"posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 16:59:47","updated_at":"2019-12-17 16:59:47"}', '2020-01-03 09:50:55');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (24, 'judicial_officer_postings', '{"id":16,"judicial_officer_id":9,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata1","from_date":"2018-01-01","to_date":null,"posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-04 15:18:09","updated_at":"2020-01-04 15:18:09"}', '2020-01-03 10:28:07');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (25, 'judicial_officer_postings', '{"id":17,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":71,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata1","from_date":"2018-01-01","to_date":null,"posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-04 15:55:20","updated_at":"2020-01-04 15:55:20"}', '2020-01-03 10:54:18');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (28, 'judicial_officer_postings', '{"id":18,"judicial_officer_id":9,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata1","from_date":"2018-01-01","to_date":null,"posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-04 16:21:31","updated_at":"2020-01-04 16:21:31"}', '2020-01-03 11:08:18');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (33, 'judicial_officer_postings', '{"id":20,"judicial_officer_id":9,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata1","from_date":"2018-01-01","to_date":"2020-01-01","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-04 16:35:32","updated_at":"2020-01-04 16:35:32"}', '2020-01-03 11:18:14');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (34, 'judicial_officer_postings', '{"id":21,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":71,"deputation_designation":"","deputation_posting_place":"","from_date":"2020-01-01","to_date":null,"posting_remark":"abc","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-04 16:35:32","updated_at":"2020-01-04 16:35:32"}', '2020-01-03 11:18:14');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (38, 'judicial_officer_postings', '{"id":22,"judicial_officer_id":9,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata1","from_date":"2018-01-01","to_date":"2020-01-01","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-04 16:46:28","updated_at":"2020-01-04 16:46:28"}', '2020-01-05 05:19:54');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (39, 'judicial_officer_postings', '{"id":23,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":71,"deputation_designation":"","deputation_posting_place":"","from_date":"2020-01-01","to_date":"2020-01-01","posting_remark":"abc","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-04 16:46:28","updated_at":"2020-01-04 16:46:28"}', '2020-01-05 05:19:54');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (40, 'judicial_officer_postings', '{"id":24,"judicial_officer_id":9,"mode_id":1,"rank_id":2,"designation_id":56,"deputation_designation":"","deputation_posting_place":"","from_date":"2020-01-02","to_date":null,"posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-04 16:46:28","updated_at":"2020-01-04 16:46:28"}', '2020-01-05 05:19:54');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (41, 'judicial_officer_postings', '{"id":25,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":56,"deputation_designation":"","deputation_posting_place":"","from_date":"2018-01-01","to_date":"2020-01-01","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 10:47:06","updated_at":"2020-01-06 10:47:06"}', '2020-01-05 05:23:22');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (42, 'judicial_officer_postings', '{"id":26,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":71,"deputation_designation":"","deputation_posting_place":"","from_date":"2020-01-01","to_date":"2020-01-01","posting_remark":"abc","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 10:47:06","updated_at":"2020-01-06 10:47:06"}', '2020-01-05 05:23:22');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (43, 'judicial_officer_postings', '{"id":27,"judicial_officer_id":9,"mode_id":1,"rank_id":2,"designation_id":56,"deputation_designation":"","deputation_posting_place":"","from_date":"2020-01-02","to_date":null,"posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 10:47:06","updated_at":"2020-01-06 10:47:06"}', '2020-01-05 05:23:22');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (44, 'judicial_officer_qualifications', '{"id":8,"judicial_officer_id":9,"qualification_id":8,"passing_year":2020,"created_at":"2020-01-06 11:51:16","updated_at":"2020-01-06 11:51:16"}', '2020-01-05 06:24:18');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (45, 'judicial_officer_qualifications', '{"id":9,"judicial_officer_id":9,"qualification_id":8,"passing_year":2020,"created_at":"2020-01-06 11:51:30","updated_at":"2020-01-06 11:51:30"}', '2020-01-05 06:24:29');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (46, 'judicial_officer_qualifications', '{"id":10,"judicial_officer_id":9,"qualification_id":7,"passing_year":2019,"created_at":"2020-01-06 11:51:30","updated_at":"2020-01-06 11:51:30"}', '2020-01-05 06:24:29');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (47, 'judicial_officer_postings', '{"id":28,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":56,"deputation_designation":"","deputation_posting_place":"","from_date":"2018-01-01","to_date":"2020-01-01","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 10:50:34","updated_at":"2020-01-06 10:50:34"}', '2020-01-05 06:25:20');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (48, 'judicial_officer_postings', '{"id":29,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":71,"deputation_designation":"","deputation_posting_place":"","from_date":"2020-01-01","to_date":"2020-01-01","posting_remark":"abc","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 10:50:34","updated_at":"2020-01-06 10:50:34"}', '2020-01-05 06:25:20');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (49, 'judicial_officer_postings', '{"id":30,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":56,"deputation_designation":"","deputation_posting_place":"","from_date":"2018-01-01","to_date":"2020-01-01","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 11:52:32","updated_at":"2020-01-06 11:52:32"}', '2020-01-05 06:25:47');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (50, 'judicial_officer_postings', '{"id":31,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":71,"deputation_designation":"","deputation_posting_place":"","from_date":"2020-01-01","to_date":"2020-01-01","posting_remark":"abc","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 11:52:32","updated_at":"2020-01-06 11:52:32"}', '2020-01-05 06:25:47');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (51, 'judicial_officer_postings', '{"id":32,"judicial_officer_id":9,"mode_id":3,"rank_id":3,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2020-01-04","to_date":null,"posting_remark":"dsfdsfsdf","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 11:52:32","updated_at":"2020-01-06 11:52:32"}', '2020-01-05 06:25:47');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (52, 'judicial_officer_postings', '{"id":33,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":56,"deputation_designation":"","deputation_posting_place":"","from_date":"2018-01-01","to_date":"2020-01-01","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 11:52:58","updated_at":"2020-01-06 11:52:58"}', '2020-01-05 06:27:52');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (53, 'judicial_officer_postings', '{"id":34,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":71,"deputation_designation":"","deputation_posting_place":"","from_date":"2020-01-01","to_date":"2020-01-01","posting_remark":"abc","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 11:52:59","updated_at":"2020-01-06 11:52:59"}', '2020-01-05 06:27:52');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (54, 'judicial_officer_postings', '{"id":35,"judicial_officer_id":9,"mode_id":1,"rank_id":3,"designation_id":46,"deputation_designation":"","deputation_posting_place":"","from_date":"2020-01-04","to_date":null,"posting_remark":"dsfdsfsdf","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 11:52:59","updated_at":"2020-01-06 11:52:59"}', '2020-01-05 06:27:52');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (55, 'judicial_officer_postings', '{"id":39,"judicial_officer_id":18,"mode_id":1,"rank_id":1,"designation_id":2,"deputation_designation":"","deputation_posting_place":"","from_date":"1991-08-30","to_date":"1992-05-17","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 15:40:23","updated_at":"2020-01-06 15:40:23"}', '2020-01-05 10:21:02');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (56, 'judicial_officer_postings', '{"id":40,"judicial_officer_id":18,"mode_id":1,"rank_id":1,"designation_id":2,"deputation_designation":"","deputation_posting_place":"","from_date":"1991-08-30","to_date":"1992-05-17","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 15:46:50","updated_at":"2020-01-06 15:46:50"}', '2020-01-05 10:27:23');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (57, 'judicial_officer_postings', '{"id":41,"judicial_officer_id":18,"mode_id":1,"rank_id":1,"designation_id":9,"deputation_designation":"","deputation_posting_place":"","from_date":"1992-05-18","to_date":"1993-05-14","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 15:46:50","updated_at":"2020-01-06 15:46:50"}', '2020-01-05 10:27:23');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (58, 'judicial_officer_postings', '{"id":42,"judicial_officer_id":18,"mode_id":1,"rank_id":1,"designation_id":1,"deputation_designation":"","deputation_posting_place":"","from_date":"1993-05-24","to_date":"1994-04-05","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 15:46:50","updated_at":"2020-01-06 15:46:50"}', '2020-01-05 10:27:23');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (59, 'judicial_officer_postings', '{"id":43,"judicial_officer_id":18,"mode_id":1,"rank_id":1,"designation_id":8,"deputation_designation":"","deputation_posting_place":"","from_date":"1994-05-24","to_date":"1994-04-05","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 15:46:50","updated_at":"2020-01-06 15:46:50"}', '2020-01-05 10:27:23');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (60, 'judicial_officer_postings', '{"id":44,"judicial_officer_id":18,"mode_id":1,"rank_id":1,"designation_id":2,"deputation_designation":"","deputation_posting_place":"","from_date":"1991-08-30","to_date":"1992-05-17","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 15:53:11","updated_at":"2020-01-06 15:53:11"}', '2020-01-05 10:34:02');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (61, 'judicial_officer_postings', '{"id":45,"judicial_officer_id":18,"mode_id":1,"rank_id":1,"designation_id":9,"deputation_designation":"","deputation_posting_place":"","from_date":"1992-05-18","to_date":"1993-05-14","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 15:53:11","updated_at":"2020-01-06 15:53:11"}', '2020-01-05 10:34:02');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (62, 'judicial_officer_postings', '{"id":46,"judicial_officer_id":18,"mode_id":1,"rank_id":1,"designation_id":1,"deputation_designation":"","deputation_posting_place":"","from_date":"1993-05-24","to_date":"1994-04-05","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 15:53:11","updated_at":"2020-01-06 15:53:11"}', '2020-01-05 10:34:02');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (63, 'judicial_officer_postings', '{"id":47,"judicial_officer_id":18,"mode_id":1,"rank_id":1,"designation_id":8,"deputation_designation":"","deputation_posting_place":"","from_date":"1994-05-24","to_date":"1994-04-05","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 15:53:11","updated_at":"2020-01-06 15:53:11"}', '2020-01-05 10:34:02');
INSERT INTO public.history_deleted_data (id, table_name, deleted_data, deleted_time) VALUES (64, 'judicial_officer_postings', '{"id":48,"judicial_officer_id":18,"mode_id":1,"rank_id":3,"designation_id":3,"deputation_designation":"","deputation_posting_place":"","from_date":"1994-04-16","to_date":"1997-01-24","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 15:53:11","updated_at":"2020-01-06 15:53:11"}', '2020-01-05 10:34:02');


--
-- TOC entry 2478 (class 0 OID 452018)
-- Dependencies: 225
-- Data for Name: history_updated_data; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (1, 'judicial_officers', '{"id":2,"registration_no":"321","jo_code":"WB321","officer_name":"ANABIL BHATTACHARYA","gender":"Male","spouse":null,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":13,"hometown":"Belghoria","present_address":"21/2/1 B.N. Road","permanent_address":"21/2/1 B.N. Road","mobile_no_1":"9830983011","mobile_no_2":null,"email_id_1":"banabil90@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2015,"date_of_joining":"2019-09-18","date_of_confirmation":"2018-09-20","date_of_retirement":"2081-09-18","profile_image":null,"created_at":null,"updated_at":null}', '2019-12-15 06:06:29');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (2, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":null,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2045-12-29","profile_image":null,"created_at":null,"updated_at":null,"other_home_district":""}', '2019-12-16 11:32:12');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (3, 'judicial_officers', '{"id":11,"registration_no":"1567","jo_code":"WB1567","officer_name":"XYZ","gender":"M","spouse":null,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":null,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"1234567890","mobile_no_2":null,"email_id_1":"abc@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2045-09-18","profile_image":null,"created_at":null,"updated_at":null,"other_home_district":"Test District"}', '2019-12-16 11:44:39');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (4, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":null,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-17 16:59:47","other_home_district":""}', '2019-12-17 07:35:08');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (5, 'judicial_officer_postings', '{"id":2,"judicial_officer_id":1,"mode_id":1,"rank_id":1,"designation_id":1,"deputation_designation":null,"deputation_posting_place":null,"from_date":"2019-09-20","to_date":null,"posting_remark":null,"acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":null,"updated_at":null}', '2019-12-17 10:16:34');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (6, 'judicial_officers', '{"id":12,"registration_no":"150","jo_code":"WB150","officer_name":"Arpan Kr Roy","gender":"M","spouse":9,"date_of_birth":"1990-12-29","home_state_id":46,"home_district_id":null,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"1234567891","mobile_no_2":null,"email_id_1":"abcd@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2040-12-18","profile_image":null,"created_at":null,"updated_at":null,"other_home_district":"Test District"}', '2019-12-17 10:31:56');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (7, 'judicial_officers', '{"id":11,"registration_no":"1567","jo_code":"WB1567","officer_name":"XYZ","gender":"M","spouse":null,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":null,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"1234567890","mobile_no_2":null,"email_id_1":"abc@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2045-09-18","profile_image":"1567_1576521000.jpg","created_at":null,"updated_at":"2019-12-17 17:12:14","other_home_district":"Test District"}', '2019-12-17 10:32:10');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (11, 'judicial_officers', '{"id":11,"registration_no":"1567","jo_code":"WB1567","officer_name":"XYZ","gender":"M","spouse":null,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":null,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"1234567890","mobile_no_2":null,"email_id_1":"abc@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2019,"date_of_joining":"2018-09-13","date_of_confirmation":null,"date_of_retirement":"2045-09-18","profile_image":"1567_1576521000.jpg","created_at":null,"updated_at":"2019-12-17 17:12:14","other_home_district":"Test District"}', '2019-12-18 10:23:58');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (12, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":12,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-18 13:02:41","other_home_district":""}', '2019-12-19 07:43:30');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (13, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":null,"officer_name":"Abhisek Gayen","gender":"M","spouse":12,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-18 13:02:41","other_home_district":""}', '2019-12-19 09:31:04');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (14, 'judicial_officers', '{"id":17,"registration_no":"2912","jo_code":"WB2912","officer_name":"Anabil Bhattacharya","gender":"M","spouse":11,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":38,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"7605893512","mobile_no_2":null,"email_id_1":"banabil89@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2040-12-29","profile_image":null,"created_at":null,"updated_at":null,"other_home_district":""}', '2019-12-22 08:30:43');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (15, 'judicial_officers', '{"id":17,"registration_no":"2912","jo_code":"WB2912","officer_name":"Anabil Bhatt","gender":"M","spouse":11,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":38,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"7605893512","mobile_no_2":null,"email_id_1":"banabil89@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2040-12-29","profile_image":null,"created_at":null,"updated_at":null,"other_home_district":""}', '2019-12-22 08:31:05');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (16, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":12,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-18 13:02:41","other_home_district":""}', '2019-12-29 07:13:06');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (17, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayenn","gender":"M","spouse":12,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-30 12:40:27","other_home_district":""}', '2019-12-29 07:13:18');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (18, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayenn","gender":"M","spouse":12,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-18","date_of_confirmation":null,"date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-30 12:40:39","other_home_district":""}', '2019-12-29 07:13:37');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (20, 'judicial_officers', '{"id":12,"registration_no":"150","jo_code":"WB150","officer_name":"Arpan Kr Roy","gender":"M","spouse":9,"date_of_birth":"1990-12-29","home_state_id":46,"home_district_id":null,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"1234567891","mobile_no_2":null,"email_id_1":"abcd@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2018-09-12","date_of_confirmation":null,"date_of_retirement":"2040-12-18","profile_image":null,"created_at":null,"updated_at":null,"other_home_district":"Test District"}', '2019-12-29 07:17:14');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (22, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayenn","gender":"M","spouse":12,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-30 12:40:58","other_home_district":""}', '2019-12-29 07:17:40');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (23, 'judicial_officers', '{"id":3,"registration_no":"1234","jo_code":"WB1234","officer_name":"ABC","gender":"M","spouse":null,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":48,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660218","mobile_no_2":null,"email_id_1":"banabil901@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2015,"date_of_joining":"2018-09-18","date_of_confirmation":"2018-09-18","date_of_retirement":"2040-09-18","profile_image":null,"created_at":null,"updated_at":null,"other_home_district":""}', '2019-12-29 07:17:40');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (24, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayenn","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-30 12:45:01","other_home_district":""}', '2019-12-29 07:17:52');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (25, 'judicial_officers', '{"id":3,"registration_no":"1234","jo_code":"WB1234","officer_name":"ABC","gender":"M","spouse":9,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":48,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660218","mobile_no_2":null,"email_id_1":"banabil901@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2015,"date_of_joining":"2018-09-18","date_of_confirmation":"2018-09-18","date_of_retirement":"2040-09-18","profile_image":null,"created_at":null,"updated_at":"2019-12-30 12:45:01","other_home_district":""}', '2019-12-29 07:17:52');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (26, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-30 12:45:13","other_home_district":""}', '2019-12-29 07:18:34');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (27, 'judicial_officers', '{"id":3,"registration_no":"1234","jo_code":"WB1234","officer_name":"ABC","gender":"M","spouse":9,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":48,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660218","mobile_no_2":null,"email_id_1":"banabil901@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2015,"date_of_joining":"2018-09-18","date_of_confirmation":"2018-09-18","date_of_retirement":"2040-09-18","profile_image":null,"created_at":null,"updated_at":"2019-12-30 12:45:13","other_home_district":""}', '2019-12-29 07:18:34');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (28, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"F","spouse":3,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-30 12:45:55","other_home_district":""}', '2019-12-29 07:18:43');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (29, 'judicial_officers', '{"id":3,"registration_no":"1234","jo_code":"WB1234","officer_name":"ABC","gender":"M","spouse":9,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":48,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660218","mobile_no_2":null,"email_id_1":"banabil901@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2015,"date_of_joining":"2018-09-18","date_of_confirmation":"2018-09-18","date_of_retirement":"2040-09-18","profile_image":null,"created_at":null,"updated_at":"2019-12-30 12:45:55","other_home_district":""}', '2019-12-29 07:18:43');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (30, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":null,"email_id_1":"banabil9012@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-30 12:46:04","other_home_district":""}', '2019-12-29 08:12:56');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (31, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoriaa","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-34\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":"","email_id_1":"banabil9012@gmail.com","email_id_2":"abc@gmail.com","recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-30 13:40:17","other_home_district":""}', '2019-12-29 08:13:20');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (32, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":"","email_id_1":"banabil9012@gmail.com","email_id_2":"","recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1576521000.jpg","created_at":null,"updated_at":"2019-12-30 13:40:41","other_home_district":""}', '2019-12-29 09:47:25');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (33, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":"","email_id_1":"banabil9012@gmail.com","email_id_2":"","recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1577644200.jpg","created_at":null,"updated_at":"2019-12-30 15:14:46","other_home_district":""}', '2019-12-29 09:49:13');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (34, 'judicial_officers', '{"id":11,"registration_no":"1567","jo_code":"WB1567","officer_name":"XYZ","gender":"M","spouse":17,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":null,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"1234567890","mobile_no_2":null,"email_id_1":"abc@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2019,"date_of_joining":"2018-09-13","date_of_confirmation":null,"date_of_retirement":"2045-09-18","profile_image":"1567_1576521000.jpg","created_at":null,"updated_at":"2019-12-19 15:51:30","other_home_district":"Test District"}', '2020-01-02 07:27:13');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (35, 'judicial_officers', '{"id":11,"registration_no":"1567","jo_code":"WB1567","officer_name":"XYZ","gender":"M","spouse":17,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":null,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"1234567890","mobile_no_2":null,"email_id_1":"abc@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2019,"date_of_joining":"2018-09-13","date_of_confirmation":null,"date_of_retirement":"2018-09-18","profile_image":"1567_1576521000.jpg","created_at":null,"updated_at":"2019-12-19 15:51:30","other_home_district":"Test District"}', '2020-01-02 07:27:30');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (36, 'judicial_officer_postings', '{"id":7,"judicial_officer_id":11,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-08-01","to_date":null,"posting_remark":"Test Remark","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 17:12:14","updated_at":"2019-12-17 17:12:14"}', '2020-01-02 08:07:02');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (37, 'judicial_officers', '{"id":11,"registration_no":"1567","jo_code":"WB1567","officer_name":"XYZ","gender":"M","spouse":17,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":null,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"1234567890","mobile_no_2":null,"email_id_1":"abc@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2019,"date_of_joining":"2018-09-13","date_of_confirmation":null,"date_of_retirement":"2045-09-18","profile_image":"1567_1576521000.jpg","created_at":null,"updated_at":"2019-12-19 15:51:30","other_home_district":"Test District"}', '2020-01-02 08:44:00');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (38, 'judicial_officers', '{"id":11,"registration_no":"1567","jo_code":"WB1567","officer_name":"XYZ","gender":"M","spouse":17,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":null,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"1234567890","mobile_no_2":null,"email_id_1":"abc@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2019,"date_of_joining":"2018-09-13","date_of_confirmation":null,"date_of_retirement":"2018-09-18","profile_image":"1567_1576521000.jpg","created_at":null,"updated_at":"2019-12-19 15:51:30","other_home_district":"Test District"}', '2020-01-02 08:44:25');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (39, 'judicial_officer_postings', '{"id":7,"judicial_officer_id":11,"mode_id":3,"rank_id":2,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-08-01","to_date":null,"posting_remark":"Test Remark","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 17:12:14","updated_at":"2019-12-17 17:12:14"}', '2020-01-02 10:23:25');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (40, 'judicial_officer_postings', '{"id":7,"judicial_officer_id":9,"mode_id":3,"rank_id":2,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-08-01","to_date":null,"posting_remark":"Test Remark","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 17:12:14","updated_at":"2019-12-17 17:12:14"}', '2020-01-02 10:24:11');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (41, 'judicial_officer_postings', '{"id":7,"judicial_officer_id":11,"mode_id":3,"rank_id":2,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-08-01","to_date":null,"posting_remark":"Test Remark","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 17:12:14","updated_at":"2019-12-17 17:12:14"}', '2020-01-02 10:24:25');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (42, 'judicial_officer_postings', '{"id":7,"judicial_officer_id":9,"mode_id":3,"rank_id":2,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-08-01","to_date":null,"posting_remark":"Test Remark","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 17:12:14","updated_at":"2019-12-17 17:12:14"}', '2020-01-02 10:29:36');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (43, 'judicial_officer_postings', '{"id":7,"judicial_officer_id":11,"mode_id":3,"rank_id":2,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-08-01","to_date":null,"posting_remark":"Test Remark","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 17:12:14","updated_at":"2019-12-17 17:12:14"}', '2020-01-02 10:43:21');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (44, 'judicial_officer_postings', '{"id":5,"judicial_officer_id":9,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-01-01","to_date":null,"posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 16:59:47","updated_at":"2019-12-17 16:59:47"}', '2020-01-02 11:30:00');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (45, 'judicial_officer_postings', '{"id":7,"judicial_officer_id":9,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-08-01","to_date":null,"posting_remark":"Test Remark","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 17:12:14","updated_at":"2019-12-17 17:12:14"}', '2020-01-02 11:30:06');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (46, 'judicial_officer_postings', '{"id":5,"judicial_officer_id":11,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-01-01","to_date":null,"posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 16:59:47","updated_at":"2019-12-17 16:59:47"}', '2020-01-02 11:32:01');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (47, 'judicial_officer_postings', '{"id":7,"judicial_officer_id":9,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-08-01","to_date":null,"posting_remark":"Test Remark","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 17:12:14","updated_at":"2019-12-17 17:12:14"}', '2020-01-02 11:32:28');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (48, 'judicial_officer_postings', '{"id":5,"judicial_officer_id":9,"mode_id":3,"rank_id":1,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-01-01","to_date":null,"posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 16:59:47","updated_at":"2019-12-17 16:59:47"}', '2020-01-02 11:38:07');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (49, 'judicial_officer_postings', '{"id":5,"judicial_officer_id":9,"mode_id":3,"rank_id":2,"designation_id":null,"deputation_designation":"Test Designation","deputation_posting_place":"Kolkata","from_date":"2018-01-01","to_date":null,"posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2019-12-17 16:59:47","updated_at":"2019-12-17 16:59:47"}', '2020-01-02 11:48:20');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (50, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":"","email_id_1":"banabil9012@gmail.com","email_id_2":"","recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1577644200.jpg","created_at":null,"updated_at":"2019-12-30 15:16:34","other_home_district":""}', '2020-01-03 07:07:27');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (51, 'judicial_officers', '{"id":1,"registration_no":"123","jo_code":"WB123","officer_name":"Rupsa Bose","gender":"Female","spouse":null,"date_of_birth":"1989-03-05","home_state_id":1,"home_district_id":36,"hometown":"Maniktala","present_address":"Amherst Row","permanent_address":"Amherst Row","mobile_no_1":"9830982611","mobile_no_2":null,"email_id_1":"rupsa@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2013,"date_of_joining":"2018-09-18","date_of_confirmation":"2018-09-20","date_of_retirement":"2079-09-18","profile_image":"rohini.jpg","created_at":null,"updated_at":null,"other_home_district":null,"posting_preference_window_flag":null,"posting_preference_window_open_on":null}', '2020-01-03 11:01:54');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (52, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":"","email_id_1":"banabil9012@gmail.com","email_id_2":"","recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1577644200.jpg","created_at":null,"updated_at":"2020-01-04 12:34:41","other_home_district":"Test District","posting_preference_window_flag":null,"posting_preference_window_open_on":null}', '2020-01-03 11:14:35');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (53, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":"","email_id_1":"banabil9012@gmail.com","email_id_2":"","recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1578076200.png","created_at":null,"updated_at":"2020-01-04 16:42:49","other_home_district":"Test District","posting_preference_window_flag":null,"posting_preference_window_open_on":null}', '2020-01-03 11:19:21');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (54, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Row\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Row\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":"","email_id_1":"banabil9012@gmail.com","email_id_2":"","recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1578076200.png","created_at":null,"updated_at":"2020-01-04 16:47:34","other_home_district":"Test District","posting_preference_window_flag":null,"posting_preference_window_open_on":null}', '2020-01-05 05:21:12');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (55, 'judicial_officers', '{"id":2,"registration_no":"321","jo_code":"WB321","officer_name":"ANABIL BHATTACHARYA","gender":"Male","spouse":null,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":13,"hometown":"Belghoria","present_address":"21/2/1 B.N. Road","permanent_address":"21/2/1 B.N. Road","mobile_no_1":"9830983011","mobile_no_2":null,"email_id_1":"banabil90@gmail.com","email_id_2":null,"recruitment_batch_id":2,"recruitment_batch_year":2015,"date_of_joining":"2019-09-18","date_of_confirmation":"2018-09-20","date_of_retirement":"2081-09-18","profile_image":"Rupsa.jpg","created_at":null,"updated_at":null,"other_home_district":null,"posting_preference_window_flag":null,"posting_preference_window_open_on":null}', '2020-01-05 07:18:44');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (56, 'judicial_officers', '{"id":9,"registration_no":"126","jo_code":"WB126","officer_name":"Abhisek Gayen","gender":"M","spouse":3,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":44,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Row\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Row\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660215","mobile_no_2":"","email_id_1":"banabil9012@gmail.com","email_id_2":"","recruitment_batch_id":2,"recruitment_batch_year":2019,"date_of_joining":"2019-12-19","date_of_confirmation":"2019-12-20","date_of_retirement":"2045-12-29","profile_image":"126_1578249000.jpg","created_at":null,"updated_at":"2020-01-06 10:48:24","other_home_district":"Test District","posting_preference_window_flag":null,"posting_preference_window_open_on":null}', '2020-01-05 07:18:44');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (57, 'judicial_officers', '{"id":3,"registration_no":"1234","jo_code":"WB1234","officer_name":"ABC","gender":"M","spouse":9,"date_of_birth":"1990-12-29","home_state_id":51,"home_district_id":48,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"8981660218","mobile_no_2":null,"email_id_1":"banabil901@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2015,"date_of_joining":"2018-09-18","date_of_confirmation":"2018-09-18","date_of_retirement":"2040-09-18","profile_image":null,"created_at":null,"updated_at":"2019-12-30 12:46:04","other_home_district":"","posting_preference_window_flag":null,"posting_preference_window_open_on":null}', '2020-01-05 07:18:44');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (58, 'judicial_officers', '{"id":11,"registration_no":"1567","jo_code":"WB1567","officer_name":"XYZ","gender":"M","spouse":17,"date_of_birth":"1990-12-29","home_state_id":1,"home_district_id":null,"hometown":"Belghoria","present_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","permanent_address":"21/2/1, B.N.Ghosal Road\nRajani Apartment, Flat-3\nBelghoria","mobile_no_1":"1234567890","mobile_no_2":null,"email_id_1":"abc@gmail.com","email_id_2":null,"recruitment_batch_id":1,"recruitment_batch_year":2019,"date_of_joining":"2018-09-13","date_of_confirmation":null,"date_of_retirement":"2045-09-18","profile_image":"1567_1576521000.jpg","created_at":null,"updated_at":"2019-12-19 15:51:30","other_home_district":"Test District","posting_preference_window_flag":null,"posting_preference_window_open_on":null}', '2020-01-05 07:18:44');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (59, 'judicial_officer_postings', '{"id":36,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":56,"deputation_designation":"","deputation_posting_place":"","from_date":"2018-01-01","to_date":"2020-01-01","posting_remark":"","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 11:55:04","updated_at":"2020-01-06 11:55:04"}', '2020-01-05 09:04:26');
INSERT INTO public.history_updated_data (id, table_name, updated_data, updated_time) VALUES (60, 'judicial_officer_postings', '{"id":37,"judicial_officer_id":9,"mode_id":1,"rank_id":1,"designation_id":71,"deputation_designation":"","deputation_posting_place":"","from_date":"2020-01-01","to_date":"2020-01-01","posting_remark":"abc","acp_1":null,"acp_1_doc":null,"acp_2":null,"acp_2_doc":null,"dj_se":null,"dj_se_doc":null,"dj_st":null,"dj_st_doc":null,"created_at":"2020-01-06 11:55:04","updated_at":"2020-01-06 11:55:04"}', '2020-01-05 09:04:34');


--
-- TOC entry 2490 (class 0 OID 452090)
-- Dependencies: 237
-- Data for Name: jo_documents; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2492 (class 0 OID 452164)
-- Dependencies: 239
-- Data for Name: jo_grades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_grades (id, judicial_officer_id, rank_id, grade, date_of_gradation, remark, status, created_at, updated_at) VALUES (101, 9, 1, 1, '2019-12-03', '', 'Finalized', NULL, '2020-01-03 11:25:14');
INSERT INTO public.jo_grades (id, judicial_officer_id, rank_id, grade, date_of_gradation, remark, status, created_at, updated_at) VALUES (102, 2, 1, 2, '2019-12-03', '', 'Finalized', NULL, '2020-01-03 11:25:14');
INSERT INTO public.jo_grades (id, judicial_officer_id, rank_id, grade, date_of_gradation, remark, status, created_at, updated_at) VALUES (103, 1, 1, 3, '2019-12-03', '', 'Finalized', NULL, '2020-01-03 11:25:14');
INSERT INTO public.jo_grades (id, judicial_officer_id, rank_id, grade, date_of_gradation, remark, status, created_at, updated_at) VALUES (104, 11, 1, 4, '2019-12-03', '', 'Finalized', NULL, '2020-01-03 11:25:14');
INSERT INTO public.jo_grades (id, judicial_officer_id, rank_id, grade, date_of_gradation, remark, status, created_at, updated_at) VALUES (105, 17, 1, 5, '2019-12-03', '', 'Finalized', NULL, '2020-01-03 11:25:14');
INSERT INTO public.jo_grades (id, judicial_officer_id, rank_id, grade, date_of_gradation, remark, status, created_at, updated_at) VALUES (107, 12, 2, 1, '2019-12-04', '', 'Draft', NULL, NULL);
INSERT INTO public.jo_grades (id, judicial_officer_id, rank_id, grade, date_of_gradation, remark, status, created_at, updated_at) VALUES (108, 9, 2, 2, '2019-12-04', '', 'Draft', NULL, NULL);


--
-- TOC entry 2484 (class 0 OID 452054)
-- Dependencies: 231
-- Data for Name: jo_legal_experiences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (1, 3, 68, 2018, 2019, '2019-12-17 16:46:47', '2019-12-17 16:46:47');
INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (3, 11, 129, 2017, 2019, '2019-12-17 17:12:14', '2019-12-17 17:12:14');
INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (4, 12, 57, 2017, 2018, '2019-12-18 13:02:42', '2019-12-18 13:02:42');
INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (6, 17, 129, 2017, 2019, '2019-12-19 15:51:30', '2019-12-19 15:51:30');
INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (9, 9, 61, 2016, 2018, '2020-01-06 11:42:30', '2020-01-06 11:42:30');


--
-- TOC entry 2454 (class 0 OID 451777)
-- Dependencies: 201
-- Data for Name: jo_reportings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_reportings (id, judicial_officer_id, posting_id, reporting_officer_id, other_reporting_officer_name, other_reporting_officer_designation, created_at, updated_at) VALUES (1, 11, 7, NULL, 'Test Officer                                                                                                                                                                                                                                                   ', 'Test Designation                                                                                                                                                                                                                                               ', '2019-12-17 17:12:14', '2019-12-17 17:12:14');
INSERT INTO public.jo_reportings (id, judicial_officer_id, posting_id, reporting_officer_id, other_reporting_officer_name, other_reporting_officer_designation, created_at, updated_at) VALUES (2, 17, 10, 9, '                                                                                                                                                                                                                                                               ', '                                                                                                                                                                                                                                                               ', '2019-12-19 15:51:30', '2019-12-19 15:51:30');
INSERT INTO public.jo_reportings (id, judicial_officer_id, posting_id, reporting_officer_id, other_reporting_officer_name, other_reporting_officer_designation, created_at, updated_at) VALUES (15, 9, 36, 2, '                                                                                                                                                                                                                                                               ', '                                                                                                                                                                                                                                                               ', '2020-01-06 11:55:04', '2020-01-06 11:55:04');
INSERT INTO public.jo_reportings (id, judicial_officer_id, posting_id, reporting_officer_id, other_reporting_officer_name, other_reporting_officer_designation, created_at, updated_at) VALUES (16, 9, 37, 2, '                                                                                                                                                                                                                                                               ', '                                                                                                                                                                                                                                                               ', '2020-01-06 11:55:04', '2020-01-06 11:55:04');
INSERT INTO public.jo_reportings (id, judicial_officer_id, posting_id, reporting_officer_id, other_reporting_officer_name, other_reporting_officer_designation, created_at, updated_at) VALUES (17, 9, 38, NULL, '                                                                                                                                                                                                                                                               ', '                                                                                                                                                                                                                                                               ', '2020-01-06 11:55:04', '2020-01-06 11:55:04');


--
-- TOC entry 2472 (class 0 OID 451946)
-- Dependencies: 219
-- Data for Name: jo_zone_tenures; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (1, 1, 7, '2018-09-19', '2019-09-19', NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (2, 1, 8, '2019-09-20', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (4, 11, 7, '2018-08-01', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (5, 12, 6, '2009-01-02', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (6, 17, 7, '2019-02-01', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (22, 9, 7, '2018-01-01', '2020-01-01', NULL, '2020-01-06 11:55:04');
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (23, 9, 8, '2020-01-04', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (33, 18, 7, '1991-08-30', '1993-05-14', NULL, '2020-01-06 15:59:50');
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (34, 18, 4, '1992-05-18', '1994-04-05', NULL, '2020-01-06 15:59:50');
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (35, 18, 6, '1993-05-24', '1997-01-24', NULL, '2020-01-06 15:59:50');
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (36, 18, 4, '1994-04-16', '1997-01-24', NULL, '2020-01-06 15:59:50');
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (37, 18, 7, '1994-04-06', NULL, NULL, NULL);


--
-- TOC entry 2456 (class 0 OID 451805)
-- Dependencies: 203
-- Data for Name: judicial_officer_posting_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, station_name, remarks, final_submission, created_by, created_at, updated_at) VALUES (12, 1, 4, 'north 24 parganas
 except :basirhat , bongaon', '', 'Y', 2, '2020-01-04 15:57:51', '2020-01-04 15:57:51');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, station_name, remarks, final_submission, created_by, created_at, updated_at) VALUES (13, 1, 6, 'paschim bardhaman', '', 'Y', 2, '2020-01-04 15:57:51', '2020-01-04 15:57:51');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, station_name, remarks, final_submission, created_by, created_at, updated_at) VALUES (14, 9, 8, 'south dinajpur', 'First pref Zone A', 'Y', 7, '2020-01-04 16:23:08', '2020-01-04 16:23:08');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, station_name, remarks, final_submission, created_by, created_at, updated_at) VALUES (15, 9, 6, 'bongaon', 'First pref Zone A', 'Y', 7, '2020-01-04 16:23:08', '2020-01-04 16:23:08');
INSERT INTO public.judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, station_name, remarks, final_submission, created_by, created_at, updated_at) VALUES (16, 9, 4, 'south 24 parganas', 'First pref Zone A', 'Y', 7, '2020-01-04 16:23:08', '2020-01-04 16:23:08');


--
-- TOC entry 2452 (class 0 OID 451746)
-- Dependencies: 199
-- Data for Name: judicial_officer_postings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (1, 1, 1, 1, 1, NULL, NULL, '2018-09-19', '2019-09-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (8, 12, 3, 2, NULL, 'Test Designation 2', 'Demo Place 2', '2009-01-02', NULL, 'sadasdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-18 13:02:42', '2019-12-18 13:02:42');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (2, 2, 1, 1, 1, NULL, NULL, '2019-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (10, 17, 1, 1, 71, '', '', '2019-02-01', '2019-02-01', 'Test Remark 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-19 15:51:30', '2019-12-19 15:51:30');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (7, 11, 3, 1, NULL, 'Test Designation', 'Kolkata', '2018-08-01', NULL, 'Test Remark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-17 17:12:14', '2019-12-17 17:12:14');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (38, 9, 3, 3, NULL, 'lkjlkj', 'dsfsdf', '2020-01-04', NULL, 'dsfdsfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 11:55:04', '2020-01-06 11:55:04');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (36, 9, 1, 1, 1, '', '', '2018-01-01', '2020-01-01', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 11:55:04', '2020-01-06 11:55:04');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (37, 9, 1, 1, 2, '', '', '2020-01-01', '2020-01-01', 'abc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 11:55:04', '2020-01-06 11:55:04');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (49, 18, 1, 1, 2, '', '', '1991-08-30', '1992-05-17', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 15:59:50', '2020-01-06 15:59:50');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (50, 18, 1, 1, 9, '', '', '1992-05-18', '1993-05-14', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 15:59:50', '2020-01-06 15:59:50');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (51, 18, 1, 1, 1, '', '', '1993-05-24', '1994-04-05', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 15:59:50', '2020-01-06 15:59:50');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (52, 18, 1, 3, 3, '', '', '1994-04-16', '1997-01-24', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 15:59:50', '2020-01-06 15:59:50');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (53, 18, 1, 1, 8, '', '', '1994-05-24', '1994-04-05', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 15:59:50', '2020-01-06 15:59:50');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (54, 18, 1, 4, 4, '', '', '1994-04-06', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 15:59:50', '2020-01-06 15:59:50');


--
-- TOC entry 2448 (class 0 OID 451716)
-- Dependencies: 195
-- Data for Name: judicial_officer_qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (1, 3, 8, 2018, '2019-12-17 16:46:47', '2019-12-17 16:46:47');
INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (3, 11, 7, 2019, '2019-12-17 17:12:14', '2019-12-17 17:12:14');
INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (6, 17, 10, 2019, '2019-12-19 15:51:30', '2019-12-19 15:51:30');
INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (7, 17, 5, 2017, '2019-12-19 15:51:30', '2019-12-19 15:51:30');
INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (11, 9, 7, 2019, '2020-01-06 11:51:41', '2020-01-06 11:51:41');


--
-- TOC entry 2446 (class 0 OID 451671)
-- Dependencies: 193
-- Data for Name: judicial_officers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district, posting_preference_window_flag, posting_preference_window_open_on) VALUES (11, '1567', 'WB1567', 'XYZ', 'M', 17, '1990-12-29', 1, NULL, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '1234567890', NULL, 'abc@gmail.com', NULL, 1, 2019, '2018-09-13', NULL, '2045-09-18', '1567_1576521000.jpg', NULL, '2019-12-19 15:51:30', 'Test District', 'Y', '2019-09-30');
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district, posting_preference_window_flag, posting_preference_window_open_on) VALUES (17, '2912', 'WB2912', 'Bhatt Anabil', 'M', 11, '1990-12-29', 51, 38, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '7605893512', NULL, 'banabil89@gmail.com', NULL, 2, 2019, '2018-09-18', NULL, '2040-12-29', NULL, NULL, NULL, '', NULL, NULL);
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district, posting_preference_window_flag, posting_preference_window_open_on) VALUES (18, '208', 'WB208', 'Sukhendu Das', 'M', NULL, '1970-08-30', 51, 47, 'balurghat', 'balurghat', 'balurghat', '9474699490', NULL, 'sukhendu@gmail.com', NULL, 1, 1990, '1991-08-31', NULL, '2020-08-31', NULL, NULL, NULL, '', NULL, NULL);
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district, posting_preference_window_flag, posting_preference_window_open_on) VALUES (12, '150', 'WB150', 'Arpan Kr Roy', 'M', 1, '1990-12-29', 46, NULL, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '1234567891', NULL, 'abcd@gmail.com', NULL, 2, 2019, '2018-09-12', NULL, '2040-12-18', NULL, NULL, '2019-12-30 12:44:35', 'Test District', NULL, NULL);
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district, posting_preference_window_flag, posting_preference_window_open_on) VALUES (1, '123', 'WB123', 'Rupsa Bose', 'Female', NULL, '1989-03-05', 1, 36, 'Maniktala', 'Amherst Row', 'Amherst Row', '9830982611', NULL, 'rupsa@gmail.com', NULL, 1, 2013, '2018-09-18', '2018-09-20', '2079-09-18', 'rohini.jpg', NULL, NULL, NULL, 'Y', '2020-01-04');
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district, posting_preference_window_flag, posting_preference_window_open_on) VALUES (2, '321', 'WB321', 'ANABIL BHATTACHARYA', 'Male', NULL, '1990-12-29', 1, 13, 'Belghoria', '21/2/1 B.N. Road', '21/2/1 B.N. Road', '9830983011', NULL, 'banabil90@gmail.com', NULL, 2, 2015, '2019-09-18', '2018-09-20', '2081-09-18', 'Rupsa.jpg', NULL, NULL, NULL, 'Y', '2019-12-12');
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district, posting_preference_window_flag, posting_preference_window_open_on) VALUES (9, '126', 'WB126', 'Abhisek Gayen', 'M', 3, '1990-12-29', 1, 44, 'Belghoria', '21/2/1, B.N.Ghosal Row
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Row
Rajani Apartment, Flat-3
Belghoria', '8981660215', '', 'banabil9012@gmail.com', '', 2, 2019, '2019-12-19', '2019-12-20', '2045-12-29', '126_1578249000.jpg', NULL, '2020-01-06 10:48:24', 'Test District', 'Y', '2020-01-02');
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district, posting_preference_window_flag, posting_preference_window_open_on) VALUES (3, '1234', 'WB1234', 'ABC', 'M', 9, '1990-12-29', 51, 48, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '8981660218', NULL, 'banabil901@gmail.com', NULL, 1, 2015, '2018-09-18', '2018-09-18', '2040-09-18', NULL, NULL, '2019-12-30 12:46:04', '', 'Y', '2019-12-31');


--
-- TOC entry 2486 (class 0 OID 452072)
-- Dependencies: 233
-- Data for Name: lcr_departments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2460 (class 0 OID 451842)
-- Dependencies: 207
-- Data for Name: lcr_hc_ends; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2462 (class 0 OID 451875)
-- Dependencies: 209
-- Data for Name: lcr_lc_details; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2476 (class 0 OID 452002)
-- Dependencies: 223
-- Data for Name: lcr_status_checks; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2466 (class 0 OID 451906)
-- Dependencies: 213
-- Data for Name: lower_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (52, 'Act 39', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (1, 'Act Viii Miscellaneous Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (51, 'Act Xiv', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (58, 'Bail', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (59, 'CEX - Excise Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (3, 'Civil Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (4, 'Civil Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (5, 'Civil Misc', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (6, 'Civil Revision', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (7, 'Complaint Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (55, 'C R Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (8, 'Criminal Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (9, 'Criminal Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (11, 'Criminal Misc Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (12, 'Criminal Revision', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (10, 'Crl. Execution - Criminal Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (23, 'Divorce On Mutual Consent - Matri Suit Divorce Mutual Cons', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (13, 'Electricity Act', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (14, 'Estate Acquisition Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (16, 'Gr Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (17, 'Hindu Adapt. and Maint Act - Hindu Adapt. and Maint Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (18, 'Insolvancy Petition', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (19, 'L A C - Land Acquisition Cases', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (20, 'L A Ex. - Land Acquisition Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (53, 'L A Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (21, 'M A C C - M.A.C.C', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (22, 'M A C C Ex. - MACC Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (36, 'Maintenance Case - MR case for Maintenance', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (24, 'Matrimonial Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (25, 'Mc - Misc Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (54, 'M C Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (29, 'Misc. Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (26, 'Misc Case (pre-emption)', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (30, 'Misc. Criminal Revision', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (27, 'Misc Crl Case - Misc Criminal Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (31, 'Misc. Execution Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (57, 'Misc Petition (156) - Misc Petition', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (28, 'Mjc - Misc Judicial Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (32, 'Money Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (33, 'Money Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (34, 'Money Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (35, 'M V Act - Motor Vehicle Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (37, 'N D P S Case - NDPS Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (38, 'NGR Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (39, 'Other Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (40, 'Other Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (41, 'Probate Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (15, 'S C C Ex. - Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (42, 'S C C Suit - SCC SUIT', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (43, 'Sessions Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (44, 'Sessions Trial', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (45, 'Special Court Cases', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (46, 'Succession Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (47, 'Title Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (48, 'Title Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (49, 'Title Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types (id, type_name, created_by, created_at, updated_at) VALUES (50, 'Trust Suit', NULL, NULL, NULL);


--
-- TOC entry 2423 (class 0 OID 451530)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations (id, migration, batch) VALUES (1, '2014_10_10_000000_create_user_types_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (3, '2019_06_12_000005_create_states_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (4, '2019_06_12_000010_create_zones_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (5, '2019_06_12_000020_create_districts_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (6, '2019_06_12_000025_create_subdivisions_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (7, '2019_06_12_000026_create_courts_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (8, '2019_06_12_000027_create_ranks_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (9, '2019_06_12_000040_create_designations_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (10, '2019_06_12_000050_create_qualifications_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (11, '2019_06_12_000090_create_recruitment_batches_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (12, '2019_06_12_000100_create_judicial_officers_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (13, '2019_06_13_091801_create_judicial_officer_qualifications_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (14, '2019_06_13_092952_create_modes_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (15, '2019_06_13_092953_create_judicial_officer_postings_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (16, '2019_06_13_092955_create_jo_reportings_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (17, '2019_06_13_101842_create_judicial_officer_posting_preferences_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (18, '2019_07_22_064308_create_diaries_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (19, '2019_08_13_091522_create_lcr_hc_ends_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (20, '2019_08_13_091810_create_lcr_lc_details_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (21, '2019_08_13_101720_create_hc_case_types_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (22, '2019_08_13_102950_create_lower_case_types_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (23, '2019_09_24_102032_create_grade_details_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (24, '2019_09_24_102258_create_acr_histories_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (25, '2019_11_14_163154_create_jo_zone_tenures_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (26, '2019_11_14_163155_create_users_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (27, '2019_11_21_113129_create_lcr_status_checks_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (28, '2019_11_27_153252_create_history_updated_deleted_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (29, '2019_11_27_153905_create_update_delete_procedure', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (30, '2019_11_27_154543_create_update_delete_trigger', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (31, '2019_11_28_121009_create_departments_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (32, '2019_11_28_162816_create_jo_legal_experiences_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (33, '2019_12_05_120846_create_lcr_departments_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (34, '2019_12_05_151849_create_document_types_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (35, '2019_12_05_151936_create_jo_documents_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (38, '2019_12_12_140136_create_jo_grades_table', 2);


--
-- TOC entry 2450 (class 0 OID 451736)
-- Dependencies: 197
-- Data for Name: modes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.modes (id, posting_mode, created_at, updated_at) VALUES (1, 'Court Posting', '2019-11-26 11:33:19', '2019-11-26 11:33:19');
INSERT INTO public.modes (id, posting_mode, created_at, updated_at) VALUES (2, 'Special Posting', '2019-11-26 11:33:26', '2019-11-26 11:33:26');
INSERT INTO public.modes (id, posting_mode, created_at, updated_at) VALUES (3, 'Deputation', '2019-11-26 11:33:26', '2019-11-26 11:33:26');


--
-- TOC entry 2426 (class 0 OID 451544)
-- Dependencies: 173
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2442 (class 0 OID 451651)
-- Dependencies: 189
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (5, 'bcom', 11, '2019-06-25 07:18:30', '2019-06-25 07:18:30');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (7, 'ma llb', 11, '2019-06-25 07:18:47', '2019-06-25 07:18:47');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (8, 'ba llb', 11, '2019-06-28 09:50:19', '2019-07-01 10:14:25');
INSERT INTO public.qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (10, 'm.sc', 11, '2019-07-01 11:25:58', '2019-07-01 11:27:09');


--
-- TOC entry 2438 (class 0 OID 451628)
-- Dependencies: 185
-- Data for Name: ranks; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ranks (id, rank_name, created_at, updated_at, rank_order) VALUES (1, 'CJJD', '2019-12-15 00:00:00', '2019-12-15 00:00:00', 1);
INSERT INTO public.ranks (id, rank_name, created_at, updated_at, rank_order) VALUES (2, 'CJSD', '2019-12-15 00:00:00', '2019-12-15 00:00:00', 2);
INSERT INTO public.ranks (id, rank_name, created_at, updated_at, rank_order) VALUES (3, 'DJ (EL)', '2019-12-15 00:00:00', '2019-12-15 00:00:00', 3);
INSERT INTO public.ranks (id, rank_name, created_at, updated_at, rank_order) VALUES (4, 'DJ (SG)', '2019-12-15 00:00:00', '2019-12-15 00:00:00', 4);
INSERT INTO public.ranks (id, rank_name, created_at, updated_at, rank_order) VALUES (5, 'DJ (ST)', '2019-12-15 00:00:00', '2019-12-15 00:00:00', 5);


--
-- TOC entry 2444 (class 0 OID 451661)
-- Dependencies: 191
-- Data for Name: recruitment_batches; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, created_by, created_at, updated_at) VALUES (1, 'PSC', NULL, '2019-12-15 00:00:00', '2019-12-15 00:00:00');
INSERT INTO public.recruitment_batches (id, recruitment_batch_desc, created_by, created_at, updated_at) VALUES (2, 'Direct Entry', NULL, '2019-12-15 00:00:00', '2019-12-15 00:00:00');


--
-- TOC entry 2428 (class 0 OID 451553)
-- Dependencies: 175
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

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
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (2, 'illinois', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (24, 'west virginia', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (48, 'massachusetts', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (38, 'kentucky', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states (id, state_name, created_by, created_at, updated_at) VALUES (8, 'wyoming', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');


--
-- TOC entry 2434 (class 0 OID 451593)
-- Dependencies: 181
-- Data for Name: subdivisions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (152, 'campvell bay', 50, 8, 11, '2019-11-15 13:28:21', '2019-11-15 13:28:21');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (133, 'mayabunder', 50, 8, 11, '2019-11-11 14:08:37', '2019-11-11 14:08:37');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (132, 'car nicobar', 50, 8, 11, '2019-11-11 14:08:27', '2019-11-11 14:08:27');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (131, 'port blair', 50, 8, 11, '2019-11-11 14:08:16', '2019-11-11 14:08:16');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (130, 'mal', 48, 8, 11, '2019-11-11 14:02:42', '2019-11-11 14:02:42');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (129, 'alipurduar', 48, 8, 11, '2019-11-11 14:02:34', '2019-11-11 14:02:34');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (128, 'jalpaiguri sadar', 48, 8, 11, '2019-11-11 14:02:08', '2019-11-11 14:02:08');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (127, 'buniadpur', 8, 8, 11, '2019-11-11 14:01:48', '2019-11-11 14:01:48');
INSERT INTO public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) VALUES (125, 'balurghat', 8, 8, 11, '2019-11-11 14:01:02', '2019-11-11 14:01:02');
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


--
-- TOC entry 2425 (class 0 OID 451538)
-- Dependencies: 172
-- Data for Name: user_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (6, 'Court', '2019-08-30 06:31:42', '2019-08-30 06:31:42');
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (1, 'Administrator', NULL, NULL);
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (5, 'Inspection', '2019-08-28 08:33:30', '2019-11-22 14:23:26');
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (2, 'Judicial Officer', NULL, '2019-11-22 14:24:03');
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (7, 'Central Dispatch Section', '2019-11-22 17:41:12', '2019-11-22 17:41:12');
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (8, 'Department', '2019-11-28 16:17:12', '2019-11-28 16:17:12');
INSERT INTO public.user_types (id, type_name, created_at, updated_at) VALUES (9, 'Appointment', '2019-11-28 16:17:12', '2019-11-28 16:17:12');


--
-- TOC entry 2474 (class 0 OID 451966)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (30, 'court1', 'Court', 6, 3, NULL, NULL, NULL, 'court1@court1.court1', NULL, '$2y$10$aBAFK1T59AzcJVKBGLkV4uMOHGSxxYUkuFR0IE84imZjK55wryJ2u', NULL, '2019-09-16 10:59:20', '2019-09-16 10:59:20');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (12, 'appt', 'Appointment Section', 9, NULL, NULL, NULL, NULL, 'app@gmail.com', NULL, '$2y$10$aBAFK1T59AzcJVKBGLkV4uMOHGSxxYUkuFR0IE84imZjK55wryJ2u', NULL, '2019-06-19 06:00:07', '2019-06-19 06:00:07');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (2, 'Rupsa Bose', 'Rupsa Bose', 2, NULL, 1, 'WB123', NULL, 'rupsa@gmail.com', NULL, '$2y$10$aBAFK1T59AzcJVKBGLkV4uMOHGSxxYUkuFR0IE84imZjK55wryJ2u', NULL, '2019-06-19 06:00:07', '2019-06-19 06:00:07');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (11, 'admin', 'Administrator', 1, 1, NULL, NULL, NULL, 'admin@admin.admin', NULL, '$2y$10$aBAFK1T59AzcJVKBGLkV4uMOHGSxxYUkuFR0IE84imZjK55wryJ2u', '6yufRqnAWFVOdEvHX9wUk0MZ3a7ZeKZwtrCFAdASgrR2zGdVPRYZ8SxIMhrv', '2019-06-19 06:00:07', '2019-06-19 06:00:07');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (1, 'jo00003', 'ABC', 2, NULL, 3, NULL, NULL, 'banabil901@gmail.com', NULL, '$2y$10$AbBmKAN7tTbjwkNateT9b.TBs58wdJv4eIU7EF5EcQV2t.1s6378K', NULL, '2019-12-17 16:46:47', '2019-12-17 16:46:47');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (7, 'jo00009', 'Abhisek Gayen', 2, NULL, 9, NULL, NULL, 'banabil9012@gmail.com', NULL, '$2y$10$/M6tCd.l6bHTq/vYOtd0p..l7WyVwMSt1N.ed5Bp3IHOQMqwFVypS', NULL, '2019-12-17 16:59:47', '2019-12-17 16:59:47');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (9, 'jo00011', 'XYZ', 2, NULL, 11, NULL, NULL, 'abc@gmail.com', NULL, '$2y$10$qHZ7HvUNzhpGkMNzxbh3j.apZwgvxbyTBcSnorILWJGieAMnJljQW', NULL, '2019-12-17 17:12:14', '2019-12-17 17:12:14');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (10, 'jo00012', 'Arpan Kr Roy', 2, NULL, 12, NULL, NULL, 'abcd@gmail.com', NULL, '$2y$10$.qfHv2kNWl0l8qA4PNylQOyXEYQ2wdK5A6VUYH51PsoAwPTE6CxRG', NULL, '2019-12-18 13:02:42', '2019-12-18 13:02:42');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (14, 'jo00017', 'Anabil Bhattacharya', 2, NULL, 17, NULL, NULL, 'banabil89@gmail.com', NULL, '$2y$10$1oY58B.vRF8D.U/nUsw.MupXf.IZL8DHLkfps5JYicT8BFYUvGNLu', NULL, '2019-12-19 15:51:30', '2019-12-19 15:51:30');
INSERT INTO public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (15, 'jo00018', 'Sukhendu Das', 2, NULL, 18, NULL, NULL, 'sukhendu@gmail.com', NULL, '$2y$10$1t.3BPftUSNXYrHY0IYtbu8Xb0GVc9/xiYfUK7m/4TXwRG9BexGy.', NULL, '2020-01-06 15:40:23', '2020-01-06 15:40:23');


--
-- TOC entry 2430 (class 0 OID 451563)
-- Dependencies: 177
-- Data for Name: zones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (4, 'a', 1095, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (6, 'b', 1095, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (8, 'd', 730, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) VALUES (7, 'c', 1095, 11, '2019-11-13 00:00:00', '2019-11-15 11:31:20');


--
-- TOC entry 2533 (class 0 OID 0)
-- Dependencies: 216
-- Name: acr_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acr_histories_id_seq', 1, false);


--
-- TOC entry 2534 (class 0 OID 0)
-- Dependencies: 182
-- Name: courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courts_id_seq', 1, false);


--
-- TOC entry 2535 (class 0 OID 0)
-- Dependencies: 228
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.departments_id_seq', 1, false);


--
-- TOC entry 2536 (class 0 OID 0)
-- Dependencies: 186
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.designations_id_seq', 2, true);


--
-- TOC entry 2537 (class 0 OID 0)
-- Dependencies: 204
-- Name: diaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.diaries_id_seq', 1, false);


--
-- TOC entry 2538 (class 0 OID 0)
-- Dependencies: 178
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.districts_id_seq', 1, false);


--
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 234
-- Name: document_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.document_types_id_seq', 1, false);


--
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 214
-- Name: grade_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grade_details_id_seq', 1, false);


--
-- TOC entry 2541 (class 0 OID 0)
-- Dependencies: 210
-- Name: hc_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hc_case_types_id_seq', 1, false);


--
-- TOC entry 2542 (class 0 OID 0)
-- Dependencies: 226
-- Name: history_deleted_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.history_deleted_data_id_seq', 64, true);


--
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 224
-- Name: history_updated_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.history_updated_data_id_seq', 60, true);


--
-- TOC entry 2544 (class 0 OID 0)
-- Dependencies: 236
-- Name: jo_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_documents_id_seq', 1, false);


--
-- TOC entry 2545 (class 0 OID 0)
-- Dependencies: 238
-- Name: jo_grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_grades_id_seq', 108, true);


--
-- TOC entry 2546 (class 0 OID 0)
-- Dependencies: 230
-- Name: jo_legal_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_legal_experiences_id_seq', 9, true);


--
-- TOC entry 2547 (class 0 OID 0)
-- Dependencies: 200
-- Name: jo_reportings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_reportings_id_seq', 17, true);


--
-- TOC entry 2548 (class 0 OID 0)
-- Dependencies: 218
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_zone_tenures_id_seq', 37, true);


--
-- TOC entry 2549 (class 0 OID 0)
-- Dependencies: 202
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_posting_preferences_id_seq', 16, true);


--
-- TOC entry 2550 (class 0 OID 0)
-- Dependencies: 198
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_postings_id_seq', 54, true);


--
-- TOC entry 2551 (class 0 OID 0)
-- Dependencies: 194
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_qualifications_id_seq', 11, true);


--
-- TOC entry 2552 (class 0 OID 0)
-- Dependencies: 192
-- Name: judicial_officers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officers_id_seq', 18, true);


--
-- TOC entry 2553 (class 0 OID 0)
-- Dependencies: 232
-- Name: lcr_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_departments_id_seq', 1, false);


--
-- TOC entry 2554 (class 0 OID 0)
-- Dependencies: 206
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_hc_ends_id_seq', 1, false);


--
-- TOC entry 2555 (class 0 OID 0)
-- Dependencies: 208
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_lc_details_id_seq', 1, false);


--
-- TOC entry 2556 (class 0 OID 0)
-- Dependencies: 222
-- Name: lcr_status_checks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_status_checks_id_seq', 1, false);


--
-- TOC entry 2557 (class 0 OID 0)
-- Dependencies: 212
-- Name: lower_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lower_case_types_id_seq', 1, false);


--
-- TOC entry 2558 (class 0 OID 0)
-- Dependencies: 169
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 38, true);


--
-- TOC entry 2559 (class 0 OID 0)
-- Dependencies: 196
-- Name: modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.modes_id_seq', 1, false);


--
-- TOC entry 2560 (class 0 OID 0)
-- Dependencies: 188
-- Name: qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.qualifications_id_seq', 1, false);


--
-- TOC entry 2561 (class 0 OID 0)
-- Dependencies: 184
-- Name: ranks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ranks_id_seq', 1, false);


--
-- TOC entry 2562 (class 0 OID 0)
-- Dependencies: 190
-- Name: recruitment_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recruitment_batches_id_seq', 1, false);


--
-- TOC entry 2563 (class 0 OID 0)
-- Dependencies: 174
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 1, false);


--
-- TOC entry 2564 (class 0 OID 0)
-- Dependencies: 180
-- Name: subdivisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subdivisions_id_seq', 1, false);


--
-- TOC entry 2565 (class 0 OID 0)
-- Dependencies: 171
-- Name: user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_types_id_seq', 1, false);


--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 176
-- Name: zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zones_id_seq', 1, false);


--
-- TOC entry 2229 (class 2606 OID 451933)
-- Name: acr_histories acr_histories_judicial_officer_id_year_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_judicial_officer_id_year_unique UNIQUE (judicial_officer_id, year);


--
-- TOC entry 2231 (class 2606 OID 451931)
-- Name: acr_histories acr_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 2157 (class 2606 OID 451625)
-- Name: courts courts_court_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_court_name_unique UNIQUE (court_name);


--
-- TOC entry 2159 (class 2606 OID 451618)
-- Name: courts courts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 452051)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2165 (class 2606 OID 451643)
-- Name: designations designations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- TOC entry 2207 (class 2606 OID 451834)
-- Name: diaries diaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diaries
    ADD CONSTRAINT diaries_pkey PRIMARY KEY (id);


--
-- TOC entry 2149 (class 2606 OID 451590)
-- Name: districts districts_district_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_district_name_unique UNIQUE (district_name);


--
-- TOC entry 2151 (class 2606 OID 451578)
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 452087)
-- Name: document_types document_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.document_types
    ADD CONSTRAINT document_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 451923)
-- Name: grade_details grade_details_grade_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade_details
    ADD CONSTRAINT grade_details_grade_name_unique UNIQUE (grade_name);


--
-- TOC entry 2227 (class 2606 OID 451921)
-- Name: grade_details grade_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade_details
    ADD CONSTRAINT grade_details_pkey PRIMARY KEY (id);


--
-- TOC entry 2215 (class 2606 OID 451903)
-- Name: hc_case_types hc_case_types_full_form_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types
    ADD CONSTRAINT hc_case_types_full_form_unique UNIQUE (full_form);


--
-- TOC entry 2217 (class 2606 OID 451899)
-- Name: hc_case_types hc_case_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types
    ADD CONSTRAINT hc_case_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2219 (class 2606 OID 451901)
-- Name: hc_case_types hc_case_types_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hc_case_types
    ADD CONSTRAINT hc_case_types_type_name_unique UNIQUE (type_name);


--
-- TOC entry 2253 (class 2606 OID 452037)
-- Name: history_deleted_data history_deleted_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.history_deleted_data
    ADD CONSTRAINT history_deleted_data_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 452026)
-- Name: history_updated_data history_updated_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.history_updated_data
    ADD CONSTRAINT history_updated_data_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 452095)
-- Name: jo_documents jo_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_documents
    ADD CONSTRAINT jo_documents_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 452174)
-- Name: jo_grades jo_grades_judicial_officer_id_rank_id_grade_date_of_gradation_u; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_grades
    ADD CONSTRAINT jo_grades_judicial_officer_id_rank_id_grade_date_of_gradation_u UNIQUE (judicial_officer_id, rank_id, grade, date_of_gradation);


--
-- TOC entry 2269 (class 2606 OID 452172)
-- Name: jo_grades jo_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_grades
    ADD CONSTRAINT jo_grades_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 452059)
-- Name: jo_legal_experiences jo_legal_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_legal_experiences
    ADD CONSTRAINT jo_legal_experiences_pkey PRIMARY KEY (id);


--
-- TOC entry 2201 (class 2606 OID 451787)
-- Name: jo_reportings jo_reportings_judicial_officer_id_posting_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings
    ADD CONSTRAINT jo_reportings_judicial_officer_id_posting_id_unique UNIQUE (judicial_officer_id, posting_id);


--
-- TOC entry 2203 (class 2606 OID 451785)
-- Name: jo_reportings jo_reportings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings
    ADD CONSTRAINT jo_reportings_pkey PRIMARY KEY (id);


--
-- TOC entry 2233 (class 2606 OID 451953)
-- Name: jo_zone_tenures jo_zone_tenures_judicial_officer_id_zone_id_from_date_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_judicial_officer_id_zone_id_from_date_unique UNIQUE (judicial_officer_id, zone_id, from_date);


--
-- TOC entry 2235 (class 2606 OID 451951)
-- Name: jo_zone_tenures jo_zone_tenures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_pkey PRIMARY KEY (id);


--
-- TOC entry 2205 (class 2606 OID 451813)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 2199 (class 2606 OID 451754)
-- Name: judicial_officer_postings judicial_officer_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_pkey PRIMARY KEY (id);


--
-- TOC entry 2191 (class 2606 OID 451723)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_judicial_officer_id_qualificati; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_judicial_officer_id_qualificati UNIQUE (judicial_officer_id, qualification_id);


--
-- TOC entry 2193 (class 2606 OID 451721)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2175 (class 2606 OID 451711)
-- Name: judicial_officers judicial_officers_email_id_1_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_email_id_1_unique UNIQUE (email_id_1);


--
-- TOC entry 2177 (class 2606 OID 451713)
-- Name: judicial_officers judicial_officers_email_id_2_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_email_id_2_unique UNIQUE (email_id_2);


--
-- TOC entry 2179 (class 2606 OID 451703)
-- Name: judicial_officers judicial_officers_jo_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_jo_code_unique UNIQUE (jo_code);


--
-- TOC entry 2181 (class 2606 OID 451707)
-- Name: judicial_officers judicial_officers_mobile_no_1_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_mobile_no_1_unique UNIQUE (mobile_no_1);


--
-- TOC entry 2183 (class 2606 OID 451709)
-- Name: judicial_officers judicial_officers_mobile_no_2_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_mobile_no_2_unique UNIQUE (mobile_no_2);


--
-- TOC entry 2185 (class 2606 OID 451679)
-- Name: judicial_officers judicial_officers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_pkey PRIMARY KEY (id);


--
-- TOC entry 2187 (class 2606 OID 451701)
-- Name: judicial_officers judicial_officers_registration_no_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_registration_no_unique UNIQUE (registration_no);


--
-- TOC entry 2189 (class 2606 OID 451705)
-- Name: judicial_officers judicial_officers_spouse_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_spouse_unique UNIQUE (spouse);


--
-- TOC entry 2259 (class 2606 OID 452079)
-- Name: lcr_departments lcr_departments_lcr_department_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_departments
    ADD CONSTRAINT lcr_departments_lcr_department_name_unique UNIQUE (lcr_department_name);


--
-- TOC entry 2261 (class 2606 OID 452077)
-- Name: lcr_departments lcr_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_departments
    ADD CONSTRAINT lcr_departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2209 (class 2606 OID 451852)
-- Name: lcr_hc_ends lcr_hc_ends_memo_no_memo_date_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_memo_no_memo_date_unique UNIQUE (memo_no, memo_date);


--
-- TOC entry 2211 (class 2606 OID 451850)
-- Name: lcr_hc_ends lcr_hc_ends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_pkey PRIMARY KEY (id);


--
-- TOC entry 2213 (class 2606 OID 451883)
-- Name: lcr_lc_details lcr_lc_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details
    ADD CONSTRAINT lcr_lc_details_pkey PRIMARY KEY (id);


--
-- TOC entry 2249 (class 2606 OID 452010)
-- Name: lcr_status_checks lcr_status_checks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_status_checks
    ADD CONSTRAINT lcr_status_checks_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 451911)
-- Name: lower_case_types lower_case_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types
    ADD CONSTRAINT lower_case_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2223 (class 2606 OID 451913)
-- Name: lower_case_types lower_case_types_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lower_case_types
    ADD CONSTRAINT lower_case_types_type_name_unique UNIQUE (type_name);


--
-- TOC entry 2136 (class 2606 OID 451535)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2195 (class 2606 OID 451741)
-- Name: modes modes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_pkey PRIMARY KEY (id);


--
-- TOC entry 2197 (class 2606 OID 451743)
-- Name: modes modes_posting_mode_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_posting_mode_unique UNIQUE (posting_mode);


--
-- TOC entry 2167 (class 2606 OID 451656)
-- Name: qualifications qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2169 (class 2606 OID 451658)
-- Name: qualifications qualifications_qualification_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_qualification_name_unique UNIQUE (qualification_name);


--
-- TOC entry 2161 (class 2606 OID 451633)
-- Name: ranks ranks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranks
    ADD CONSTRAINT ranks_pkey PRIMARY KEY (id);


--
-- TOC entry 2163 (class 2606 OID 451635)
-- Name: ranks ranks_rank_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranks
    ADD CONSTRAINT ranks_rank_name_unique UNIQUE (rank_name);


--
-- TOC entry 2171 (class 2606 OID 451666)
-- Name: recruitment_batches recruitment_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches
    ADD CONSTRAINT recruitment_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 2173 (class 2606 OID 451668)
-- Name: recruitment_batches recruitment_batches_recruitment_batch_desc_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recruitment_batches
    ADD CONSTRAINT recruitment_batches_recruitment_batch_desc_unique UNIQUE (recruitment_batch_desc);


--
-- TOC entry 2141 (class 2606 OID 451558)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 2143 (class 2606 OID 451560)
-- Name: states states_state_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_state_name_unique UNIQUE (state_name);


--
-- TOC entry 2153 (class 2606 OID 451598)
-- Name: subdivisions subdivisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_pkey PRIMARY KEY (id);


--
-- TOC entry 2155 (class 2606 OID 451600)
-- Name: subdivisions subdivisions_subdivision_name_district_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_subdivision_name_district_id_unique UNIQUE (subdivision_name, district_id);


--
-- TOC entry 2138 (class 2606 OID 451543)
-- Name: user_types user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_types
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2237 (class 2606 OID 451991)
-- Name: users users_court_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_court_id_unique UNIQUE (court_id);


--
-- TOC entry 2239 (class 2606 OID 451997)
-- Name: users users_department_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_department_id_unique UNIQUE (department_id);


--
-- TOC entry 2241 (class 2606 OID 451999)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2243 (class 2606 OID 451995)
-- Name: users users_jo_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_jo_code_unique UNIQUE (jo_code);


--
-- TOC entry 2245 (class 2606 OID 451993)
-- Name: users users_judicial_officer_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_judicial_officer_id_unique UNIQUE (judicial_officer_id);


--
-- TOC entry 2247 (class 2606 OID 451974)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2145 (class 2606 OID 451568)
-- Name: zones zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- TOC entry 2147 (class 2606 OID 451570)
-- Name: zones zones_zone_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_zone_name_unique UNIQUE (zone_name);


--
-- TOC entry 2139 (class 1259 OID 451550)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 2310 (class 2620 OID 452038)
-- Name: judicial_officers movedeleted; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER movedeleted BEFORE DELETE ON public.judicial_officers FOR EACH ROW EXECUTE PROCEDURE public.movedeleted();


--
-- TOC entry 2312 (class 2620 OID 452040)
-- Name: judicial_officer_qualifications movedeleted; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER movedeleted BEFORE DELETE ON public.judicial_officer_qualifications FOR EACH ROW EXECUTE PROCEDURE public.movedeleted();


--
-- TOC entry 2314 (class 2620 OID 452042)
-- Name: judicial_officer_postings movedeleted; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER movedeleted BEFORE DELETE ON public.judicial_officer_postings FOR EACH ROW EXECUTE PROCEDURE public.movedeleted();


--
-- TOC entry 2311 (class 2620 OID 452039)
-- Name: judicial_officers moveupdated; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER moveupdated BEFORE UPDATE ON public.judicial_officers FOR EACH ROW EXECUTE PROCEDURE public.moveupdated();


--
-- TOC entry 2313 (class 2620 OID 452041)
-- Name: judicial_officer_qualifications moveupdated; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER moveupdated BEFORE UPDATE ON public.judicial_officer_qualifications FOR EACH ROW EXECUTE PROCEDURE public.moveupdated();


--
-- TOC entry 2315 (class 2620 OID 452043)
-- Name: judicial_officer_postings moveupdated; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER moveupdated BEFORE UPDATE ON public.judicial_officer_postings FOR EACH ROW EXECUTE PROCEDURE public.moveupdated();


--
-- TOC entry 2297 (class 2606 OID 451939)
-- Name: acr_histories acr_histories_grade_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_grade_id_foreign FOREIGN KEY (grade_id) REFERENCES public.grade_details(id);


--
-- TOC entry 2296 (class 2606 OID 451934)
-- Name: acr_histories acr_histories_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.acr_histories
    ADD CONSTRAINT acr_histories_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2274 (class 2606 OID 451619)
-- Name: courts courts_subdivision_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_subdivision_id_foreign FOREIGN KEY (subdivision_id) REFERENCES public.subdivisions(id);


--
-- TOC entry 2275 (class 2606 OID 451644)
-- Name: designations designations_rank_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_rank_id_foreign FOREIGN KEY (rank_id) REFERENCES public.ranks(id);


--
-- TOC entry 2290 (class 2606 OID 451835)
-- Name: diaries diaries_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diaries
    ADD CONSTRAINT diaries_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2270 (class 2606 OID 451579)
-- Name: districts districts_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_state_id_foreign FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- TOC entry 2271 (class 2606 OID 451584)
-- Name: districts districts_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 2307 (class 2606 OID 452101)
-- Name: jo_documents jo_documents_document_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_documents
    ADD CONSTRAINT jo_documents_document_type_id_foreign FOREIGN KEY (document_type_id) REFERENCES public.document_types(id);


--
-- TOC entry 2306 (class 2606 OID 452096)
-- Name: jo_documents jo_documents_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_documents
    ADD CONSTRAINT jo_documents_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2308 (class 2606 OID 452175)
-- Name: jo_grades jo_grades_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_grades
    ADD CONSTRAINT jo_grades_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2309 (class 2606 OID 452180)
-- Name: jo_grades jo_grades_rank_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_grades
    ADD CONSTRAINT jo_grades_rank_id_foreign FOREIGN KEY (rank_id) REFERENCES public.ranks(id);


--
-- TOC entry 2304 (class 2606 OID 452060)
-- Name: jo_legal_experiences jo_legal_experiences_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_legal_experiences
    ADD CONSTRAINT jo_legal_experiences_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2305 (class 2606 OID 452065)
-- Name: jo_legal_experiences jo_legal_experiences_subdivision_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_legal_experiences
    ADD CONSTRAINT jo_legal_experiences_subdivision_id_foreign FOREIGN KEY (subdivision_id) REFERENCES public.subdivisions(id);


--
-- TOC entry 2285 (class 2606 OID 451788)
-- Name: jo_reportings jo_reportings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings
    ADD CONSTRAINT jo_reportings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2287 (class 2606 OID 451798)
-- Name: jo_reportings jo_reportings_posting_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings
    ADD CONSTRAINT jo_reportings_posting_id_foreign FOREIGN KEY (posting_id) REFERENCES public.judicial_officer_postings(id);


--
-- TOC entry 2286 (class 2606 OID 451793)
-- Name: jo_reportings jo_reportings_reporting_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_reportings
    ADD CONSTRAINT jo_reportings_reporting_officer_id_foreign FOREIGN KEY (reporting_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2298 (class 2606 OID 451954)
-- Name: jo_zone_tenures jo_zone_tenures_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2299 (class 2606 OID 451959)
-- Name: jo_zone_tenures jo_zone_tenures_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jo_zone_tenures
    ADD CONSTRAINT jo_zone_tenures_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 2288 (class 2606 OID 451814)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_judicial_officer_id_foreig; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_judicial_officer_id_foreig FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2289 (class 2606 OID 451819)
-- Name: judicial_officer_posting_preferences judicial_officer_posting_preferences_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 2282 (class 2606 OID 451755)
-- Name: judicial_officer_postings judicial_officer_postings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2284 (class 2606 OID 451770)
-- Name: judicial_officer_postings judicial_officer_postings_mode_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_mode_id_foreign FOREIGN KEY (mode_id) REFERENCES public.modes(id);


--
-- TOC entry 2283 (class 2606 OID 451760)
-- Name: judicial_officer_postings judicial_officer_postings_rank_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_rank_id_foreign FOREIGN KEY (rank_id) REFERENCES public.ranks(id);


--
-- TOC entry 2280 (class 2606 OID 451724)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2281 (class 2606 OID 451729)
-- Name: judicial_officer_qualifications judicial_officer_qualifications_qualification_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_qualification_id_foreign FOREIGN KEY (qualification_id) REFERENCES public.qualifications(id);


--
-- TOC entry 2276 (class 2606 OID 451680)
-- Name: judicial_officers judicial_officers_home_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_home_district_id_foreign FOREIGN KEY (home_district_id) REFERENCES public.districts(id);


--
-- TOC entry 2277 (class 2606 OID 451685)
-- Name: judicial_officers judicial_officers_home_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_home_state_id_foreign FOREIGN KEY (home_state_id) REFERENCES public.states(id);


--
-- TOC entry 2278 (class 2606 OID 451690)
-- Name: judicial_officers judicial_officers_recruitment_batch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_recruitment_batch_id_foreign FOREIGN KEY (recruitment_batch_id) REFERENCES public.recruitment_batches(id);


--
-- TOC entry 2279 (class 2606 OID 451695)
-- Name: judicial_officers judicial_officers_spouse_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.judicial_officers
    ADD CONSTRAINT judicial_officers_spouse_foreign FOREIGN KEY (spouse) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2291 (class 2606 OID 451853)
-- Name: lcr_hc_ends lcr_hc_ends_court_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_court_foreign FOREIGN KEY (court) REFERENCES public.courts(id);


--
-- TOC entry 2294 (class 2606 OID 451868)
-- Name: lcr_hc_ends lcr_hc_ends_district_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_district_foreign FOREIGN KEY (district) REFERENCES public.districts(id);


--
-- TOC entry 2292 (class 2606 OID 451858)
-- Name: lcr_hc_ends lcr_hc_ends_forwarding_court_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_forwarding_court_foreign FOREIGN KEY (forwarding_court) REFERENCES public.courts(id);


--
-- TOC entry 2293 (class 2606 OID 451863)
-- Name: lcr_hc_ends lcr_hc_ends_subdivision_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_subdivision_foreign FOREIGN KEY (subdivision) REFERENCES public.subdivisions(id);


--
-- TOC entry 2295 (class 2606 OID 451884)
-- Name: lcr_lc_details lcr_lc_details_hc_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_lc_details
    ADD CONSTRAINT lcr_lc_details_hc_id_foreign FOREIGN KEY (hc_id) REFERENCES public.lcr_hc_ends(id);


--
-- TOC entry 2303 (class 2606 OID 452011)
-- Name: lcr_status_checks lcr_status_checks_hc_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lcr_status_checks
    ADD CONSTRAINT lcr_status_checks_hc_id_foreign FOREIGN KEY (hc_id) REFERENCES public.lcr_hc_ends(id);


--
-- TOC entry 2272 (class 2606 OID 451601)
-- Name: subdivisions subdivisions_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_district_id_foreign FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- TOC entry 2273 (class 2606 OID 451606)
-- Name: subdivisions subdivisions_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subdivisions
    ADD CONSTRAINT subdivisions_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id);


--
-- TOC entry 2300 (class 2606 OID 451975)
-- Name: users users_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_court_id_foreign FOREIGN KEY (court_id) REFERENCES public.courts(id);


--
-- TOC entry 2301 (class 2606 OID 451980)
-- Name: users users_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES public.judicial_officers(id);


--
-- TOC entry 2302 (class 2606 OID 451985)
-- Name: users users_user_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_type_id_foreign FOREIGN KEY (user_type_id) REFERENCES public.user_types(id);


-- Completed on 2020-01-06 16:30:02

--
-- PostgreSQL database dump complete
--

