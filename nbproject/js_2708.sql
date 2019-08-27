--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 9.5.5

-- Started on 2019-08-27 13:51:53

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
-- TOC entry 2369 (class 0 OID 0)
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
-- TOC entry 2370 (class 0 OID 0)
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
-- TOC entry 2371 (class 0 OID 0)
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
-- TOC entry 2372 (class 0 OID 0)
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
-- TOC entry 2373 (class 0 OID 0)
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
-- TOC entry 2374 (class 0 OID 0)
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
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 178
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE districts_id_seq OWNED BY districts.id;


--
-- TOC entry 217 (class 1259 OID 371960)
-- Name: hc_case_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE hc_case_types (
    id bigint NOT NULL,
    type_name character varying(255) NOT NULL,
    full_form character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 216 (class 1259 OID 371958)
-- Name: hc_case_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hc_case_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 216
-- Name: hc_case_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hc_case_types_id_seq OWNED BY hc_case_types.id;


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
-- TOC entry 2377 (class 0 OID 0)
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
-- TOC entry 2378 (class 0 OID 0)
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
-- TOC entry 2379 (class 0 OID 0)
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
-- TOC entry 2380 (class 0 OID 0)
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
-- TOC entry 2381 (class 0 OID 0)
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
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 196
-- Name: judicial_officers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE judicial_officers_id_seq OWNED BY judicial_officers.id;


--
-- TOC entry 213 (class 1259 OID 371924)
-- Name: lcr_hc_ends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lcr_hc_ends (
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
-- TOC entry 212 (class 1259 OID 371922)
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lcr_hc_ends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 212
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lcr_hc_ends_id_seq OWNED BY lcr_hc_ends.id;


--
-- TOC entry 215 (class 1259 OID 371947)
-- Name: lcr_lc_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lcr_lc_details (
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
-- TOC entry 214 (class 1259 OID 371945)
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lcr_lc_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 214
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lcr_lc_details_id_seq OWNED BY lcr_lc_details.id;


--
-- TOC entry 219 (class 1259 OID 371971)
-- Name: lower_case_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lower_case_types (
    id bigint NOT NULL,
    type_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 218 (class 1259 OID 371969)
-- Name: lower_case_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lower_case_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 218
-- Name: lower_case_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lower_case_types_id_seq OWNED BY lower_case_types.id;


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
-- TOC entry 2386 (class 0 OID 0)
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
-- TOC entry 2387 (class 0 OID 0)
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
-- TOC entry 2388 (class 0 OID 0)
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
-- TOC entry 2389 (class 0 OID 0)
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
-- TOC entry 2390 (class 0 OID 0)
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
-- TOC entry 2391 (class 0 OID 0)
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
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 180
-- Name: subdivisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subdivisions_id_seq OWNED BY subdivisions.id;


--
-- TOC entry 221 (class 1259 OID 371992)
-- Name: user_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_types (
    id bigint NOT NULL,
    type_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    created_by bigint NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 371990)
-- Name: user_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 220
-- Name: user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_types_id_seq OWNED BY user_types.id;


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
    judicial_officer_id bigint,
    user_id character varying(50) NOT NULL,
    user_type_id bigint
);


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN users.court_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN users.court_id IS 'For Court Login';


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN users.judicial_officer_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN users.judicial_officer_id IS 'For linking JO';


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
-- TOC entry 2396 (class 0 OID 0)
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
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 176
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE zones_id_seq OWNED BY zones.id;


--
-- TOC entry 2046 (class 2604 OID 286554)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY castes ALTER COLUMN id SET DEFAULT nextval('castes_id_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 286494)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes ALTER COLUMN id SET DEFAULT nextval('court_complexes_id_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 286519)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY courts ALTER COLUMN id SET DEFAULT nextval('courts_id_seq'::regclass);


--
-- TOC entry 2057 (class 2604 OID 321645)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dairies ALTER COLUMN id SET DEFAULT nextval('dairies_id_seq'::regclass);


--
-- TOC entry 2047 (class 2604 OID 286569)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY designations ALTER COLUMN id SET DEFAULT nextval('designations_id_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 286454)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts ALTER COLUMN id SET DEFAULT nextval('districts_id_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 371963)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hc_case_types ALTER COLUMN id SET DEFAULT nextval('hc_case_types_id_seq'::regclass);


--
-- TOC entry 2056 (class 2604 OID 311061)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_photos ALTER COLUMN id SET DEFAULT nextval('jo_photos_id_seq'::regclass);


--
-- TOC entry 2052 (class 2604 OID 286687)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings ALTER COLUMN id SET DEFAULT nextval('jo_reporting_reviewings_id_seq'::regclass);


--
-- TOC entry 2054 (class 2604 OID 286772)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_posting_preferences ALTER COLUMN id SET DEFAULT nextval('judicial_officer_posting_preferences_id_seq'::regclass);


--
-- TOC entry 2055 (class 2604 OID 310980)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings ALTER COLUMN id SET DEFAULT nextval('judicial_officer_postings_id_seq'::regclass);


--
-- TOC entry 2051 (class 2604 OID 286662)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications ALTER COLUMN id SET DEFAULT nextval('judicial_officer_qualifications_id_seq'::regclass);


--
-- TOC entry 2050 (class 2604 OID 286614)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers ALTER COLUMN id SET DEFAULT nextval('judicial_officers_id_seq'::regclass);


--
-- TOC entry 2058 (class 2604 OID 371927)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lcr_hc_ends ALTER COLUMN id SET DEFAULT nextval('lcr_hc_ends_id_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 371950)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lcr_lc_details ALTER COLUMN id SET DEFAULT nextval('lcr_lc_details_id_seq'::regclass);


--
-- TOC entry 2061 (class 2604 OID 371974)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lower_case_types ALTER COLUMN id SET DEFAULT nextval('lower_case_types_id_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 266870)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- TOC entry 2053 (class 2604 OID 286717)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY modes ALTER COLUMN id SET DEFAULT nextval('modes_id_seq'::regclass);


--
-- TOC entry 2045 (class 2604 OID 286539)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY qualifications ALTER COLUMN id SET DEFAULT nextval('qualifications_id_seq'::regclass);


--
-- TOC entry 2049 (class 2604 OID 286599)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recruitment_batches ALTER COLUMN id SET DEFAULT nextval('recruitment_batches_id_seq'::regclass);


--
-- TOC entry 2048 (class 2604 OID 286584)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY religions ALTER COLUMN id SET DEFAULT nextval('religions_id_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 286424)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- TOC entry 2042 (class 2604 OID 286474)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subdivisions ALTER COLUMN id SET DEFAULT nextval('subdivisions_id_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 371995)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_types ALTER COLUMN id SET DEFAULT nextval('user_types_id_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 286404)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 286439)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY zones ALTER COLUMN id SET DEFAULT nextval('zones_id_seq'::regclass);


--
-- TOC entry 2330 (class 0 OID 286551)
-- Dependencies: 189
-- Data for Name: castes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY castes (id, caste_name, created_by, created_at, updated_at) FROM stdin;
1	General	11	\N	\N
2	Scheduled Caste	11	2019-07-02 06:58:28	2019-07-02 06:58:28
3	Scheduled Tribe	11	2019-07-02 07:41:15	2019-07-03 08:42:41
\.


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 188
-- Name: castes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('castes_id_seq', 6, true);


--
-- TOC entry 2324 (class 0 OID 286491)
-- Dependencies: 183
-- Data for Name: court_complexes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) FROM stdin;
1	Grant, Legros and Feest	59.4822750000000013	-96.1092660000000052	2	1	11	2019-06-17 06:27:04	2019-06-17 06:27:04	\N
2	Yost, Kiehn and Bins	-79.1505310000000009	133.192214000000007	2	1	11	2019-06-17 06:27:04	2019-06-17 06:27:04	\N
3	O'Reilly, Reichert and White	-76.6286429999999967	-100.417776000000003	2	1	11	2019-06-17 06:27:04	2019-06-17 06:27:04	\N
4	Goldner, Swaniawski and Lockman	-11.1408070000000006	-16.4666139999999999	2	1	11	2019-06-17 06:27:04	2019-06-17 06:27:04	\N
5	Tillman, Barton and Durgan	-58.146720000000002	119.634581999999995	2	1	11	2019-06-17 06:27:04	2019-06-17 06:27:04	\N
6	Homenick-Schuppe	-84.0189189999999968	76.7095510000000047	5	2	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
7	Morar and Sons	54.6449149999999975	-152.375288000000012	5	2	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
8	Mraz Ltd	24.8595149999999983	91.8884549999999933	5	2	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
9	Lebsack-Harris	27.8115750000000013	-149.116534000000001	5	2	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
10	Stehr-Stiedemann	-54.9181129999999982	92.4165420000000069	5	2	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
11	Cartwright-Bogan	-63.101309999999998	102.337888000000007	8	3	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
12	Torphy, Durgan and Rosenbaum	9.79833400000000054	-16.7841440000000013	8	3	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
13	Balistreri, Zboncak and Will	77.9417799999999943	90.160460999999998	8	3	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
14	Schaefer-Altenwerth	22.2785019999999996	-79.8903300000000058	8	3	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
15	Streich PLC	18.1639869999999988	107.879433000000006	8	3	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
16	Cronin-Okuneva	25.0479979999999998	-170.069302999999991	11	4	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
17	Fisher-Waters	32.848042999999997	115.957533999999995	11	4	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
18	Ziemann, Von and Luettgen	10.8809909999999999	59.5612429999999975	11	4	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
19	Grady Group	42.9741909999999976	-144.757902000000001	11	4	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
20	Quigley, Yost and Thiel	0.727601000000000053	60.115434999999998	11	4	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
21	Wunsch-Reynolds	76.0070529999999991	-78.411280000000005	14	5	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
22	Zemlak, Nitzsche and Herzog	68.6196510000000046	150.824526999999989	14	5	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
23	Murphy-Heidenreich	-80.729173000000003	33.5590109999999981	14	5	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
24	Dare-Roob	-46.0030730000000005	-146.407841999999988	14	5	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
25	Monahan-Corwin	-25.4323300000000003	17.4266959999999997	14	5	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
26	Wunsch, Kulas and Bosco	-77.1542910000000006	177.631616000000008	17	6	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
27	Kshlerin Inc	-78.7014729999999929	-36.8657480000000035	17	6	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
28	Reichert, Becker and Heller	35.3807660000000013	-89.1107509999999934	17	6	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
29	Flatley PLC	51.4572939999999974	49.2173969999999983	17	6	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
30	Adams-Murazik	-24.2009679999999996	-131.898689999999988	17	6	11	2019-06-17 06:27:05	2019-06-17 06:27:05	\N
31	Nitzsche, Walter and Fisher	12.5273760000000003	-132.131987000000009	21	7	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
32	Beier-Boyer	-28.2756949999999989	-63.2722949999999997	21	7	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
33	Prohaska LLC	77.1226970000000023	22.0210219999999985	21	7	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
34	Emard-Cummerata	-87.006448000000006	111.820361000000005	21	7	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
35	Nitzsche, Dicki and Lang	-29.2436849999999993	72.0545960000000036	21	7	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
36	Kautzer, Collier and Waters	-62.2261080000000035	158.605680000000007	22	8	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
37	Jacobs, Sawayn and Bernhard	26.1563289999999995	130.479500999999999	22	8	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
38	Smith, Herman and Grant	10.7466050000000006	80.2505369999999942	22	8	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
39	Wilderman-Skiles	15.2570890000000006	-104.862395000000006	22	8	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
40	Schuppe, Mayert and Kulas	-76.4728020000000015	-47.190330000000003	22	8	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
41	Kessler, Witting and O'Hara	42.3038949999999971	34.2558429999999987	26	9	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
42	Breitenberg Group	39.3450309999999988	-165.894966000000011	26	9	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
43	Hills, Mertz and Torphy	-85.5495229999999935	-7.20302699999999962	26	9	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
44	Quigley LLC	61.9555119999999988	110.821385000000006	26	9	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
45	Paucek-Konopelski	43.3976359999999985	-24.9034499999999994	26	9	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
46	Walsh Ltd	-72.2693830000000048	66.7829550000000012	29	10	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
47	McDermott Ltd	63.0437089999999998	-25.2358049999999992	29	10	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
48	Yost-Goldner	-88.1598249999999979	68.2592199999999991	29	10	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
49	Mayer, Pfeffer and Boyer	-23.0909079999999989	74.1445020000000028	29	10	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
50	Olson, Padberg and Hintz	-70.6874329999999986	-93.6518640000000033	29	10	11	2019-06-17 06:27:06	2019-06-17 06:27:06	\N
\.


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 182
-- Name: court_complexes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('court_complexes_id_seq', 50, true);


--
-- TOC entry 2326 (class 0 OID 286516)
-- Dependencies: 185
-- Data for Name: courts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY courts (id, court_name, court_complex_id, created_by, created_at, updated_at) FROM stdin;
4	vel	8	11	2019-06-17 06:27:05	2019-06-17 06:27:05
5	nemo	8	11	2019-06-17 06:27:05	2019-06-17 06:27:05
6	odit	8	11	2019-06-17 06:27:05	2019-06-17 06:27:05
20	quidem	33	11	2019-06-17 06:27:06	2019-06-17 06:27:06
22	tempora	40	11	2019-06-17 06:27:06	2019-06-17 06:27:06
23	reiciendis	40	11	2019-06-17 06:27:06	2019-06-17 06:27:06
26	non	43	11	2019-06-17 06:27:06	2019-06-17 06:27:06
28	sit	46	11	2019-06-17 06:27:06	2019-06-17 06:27:06
3	Calcutta City Court	25	11	2019-06-17 06:27:05	2019-08-03 09:19:41
16	Malda 2nd court	30	11	2019-06-17 06:27:06	2019-08-03 09:21:24
24	North Dinajpur	40	11	2019-06-17 06:27:06	2019-08-03 09:22:33
30	Alipure duar	46	11	2019-06-17 06:27:06	2019-08-03 09:23:04
27	South Dinajpore	43	11	2019-06-17 06:27:06	2019-08-03 09:23:52
25	Bankura 1 st Court	43	11	2019-06-17 06:27:06	2019-08-03 09:25:14
17	Malda 1st Court	30	11	2019-06-17 06:27:06	2019-08-03 09:26:28
19	Birbhum 1st court	33	11	2019-06-17 06:27:06	2019-08-03 09:26:54
21	Birbhum 2nd Court	33	11	2019-06-17 06:27:06	2019-08-03 09:27:08
8	Bardhaman 1st Court	14	11	2019-06-17 06:27:05	2019-08-03 09:27:25
1	Darjeeling 1st Court	5	11	2019-06-17 06:27:05	2019-08-03 09:28:11
31	Malda 3rd Court	30	11	2019-08-03 09:24:36	2019-08-03 09:28:55
14	Howrah 1st Court	22	11	2019-06-17 06:27:05	2019-08-03 09:29:36
10	Barasat 1st Court	18	11	2019-06-17 06:27:05	2019-08-03 09:30:04
13	Howrah 2nd Court	22	11	2019-06-17 06:27:05	2019-08-03 09:30:49
12	Barasat 2nd Court	18	11	2019-06-17 06:27:05	2019-08-03 09:33:11
11	Barasat 4rth ADJ	18	11	2019-06-17 06:27:05	2019-08-03 09:35:10
18	Malda 4th Adj	30	11	2019-06-17 06:27:06	2019-08-03 09:40:50
15	Howrah 3rd Court	22	11	2019-06-17 06:27:05	2019-08-03 09:41:37
2	Darjeeling 2nd Court	5	11	2019-06-17 06:27:05	2019-08-03 09:42:18
9	Bardhaman 2nd Court	14	11	2019-06-17 06:27:05	2019-08-03 09:44:18
\.


--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 184
-- Name: courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('courts_id_seq', 31, true);


--
-- TOC entry 2352 (class 0 OID 321642)
-- Dependencies: 211
-- Data for Name: dairies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dairies (id, jo_code, date_of_schedule, description, created_at, updated_at) FROM stdin;
2	WB007	2019-03-07	<h3>All the <b><i>best</i></b></h3>	2019-07-24 00:00:00	2019-07-24 00:00:00
5	WB007	2019-02-07	<p><b>bhvbv﻿</b><b></b></p>	2019-07-24 00:00:00	2019-07-24 00:00:00
15	WB007	2019-10-07	<p>Hello world !! This is direct from <b></b><b>Chandrayan II</b><b></b></p>	2019-07-31 00:00:00	2019-07-31 00:00:00
18	WB007	2019-11-07	<p>CHANDRAYAN II</p>	2019-07-31 00:00:00	2019-07-31 00:00:00
19	WB007	2019-05-08	<p>Welcome!!!!</p>	2019-08-07 00:00:00	2019-08-07 00:00:00
\.


--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 210
-- Name: dairies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dairies_id_seq', 19, true);


--
-- TOC entry 2332 (class 0 OID 286566)
-- Dependencies: 191
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY designations (id, designation_name, created_by, created_at, updated_at) FROM stdin;
1	Transportation Manager	11	2019-06-17 06:27:05	2019-06-17 06:27:05
2	CFO	11	2019-06-17 06:27:05	2019-06-17 06:27:05
3	Construction Laborer	11	2019-06-17 06:27:05	2019-06-17 06:27:05
4	Ship Captain	11	2019-06-17 06:27:05	2019-06-17 06:27:05
5	Business Teacher	11	2019-06-17 06:27:05	2019-06-17 06:27:05
6	Administrative Law Judge	11	2019-06-17 06:27:05	2019-06-17 06:27:05
7	Corporate Trainer	11	2019-06-17 06:27:05	2019-06-17 06:27:05
8	Tree Trimmer	11	2019-06-17 06:27:05	2019-06-17 06:27:05
9	Plating Operator OR Coating Machine Operator	11	2019-06-17 06:27:05	2019-06-17 06:27:05
10	Electronic Drafter	11	2019-06-17 06:27:05	2019-06-17 06:27:05
11	Medical Laboratory Technologist	11	2019-06-17 06:27:06	2019-06-17 06:27:06
12	Real Estate Association Manager	11	2019-06-17 06:27:06	2019-06-17 06:27:06
13	Biological Scientist	11	2019-06-17 06:27:06	2019-06-17 06:27:06
14	Law Enforcement Teacher	11	2019-06-17 06:27:06	2019-06-17 06:27:06
15	Supervisor Fire Fighting Worker	11	2019-06-17 06:27:06	2019-06-17 06:27:06
16	Ticket Agent	11	2019-06-17 06:27:06	2019-06-17 06:27:06
17	Correspondence Clerk	11	2019-06-17 06:27:06	2019-06-17 06:27:06
18	Entertainer and Performer	11	2019-06-17 06:27:06	2019-06-17 06:27:06
19	Central Office Operator	11	2019-06-17 06:27:06	2019-06-17 06:27:06
20	Wellhead Pumper	11	2019-06-17 06:27:06	2019-06-17 06:27:06
23	demo3	11	2019-06-28 10:12:57	2019-06-28 10:12:57
24	demo6	11	2019-06-28 10:14:10	2019-07-03 09:21:23
\.


--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 190
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('designations_id_seq', 24, true);


--
-- TOC entry 2320 (class 0 OID 286451)
-- Dependencies: 179
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY districts (id, district_name, state_id, created_by, created_at, updated_at) FROM stdin;
1	Ullrichmouth	2	11	2019-06-17 06:27:04	2019-06-17 06:27:04
3	South Lucinda	2	11	2019-06-17 06:27:04	2019-06-17 06:27:04
4	West Alexys	7	11	2019-06-17 06:27:05	2019-06-17 06:27:05
9	Schneiderview	11	11	2019-06-17 06:27:05	2019-06-17 06:27:05
11	West Elta	17	11	2019-06-17 06:27:05	2019-06-17 06:27:05
12	Trantowborough	17	11	2019-06-17 06:27:05	2019-06-17 06:27:05
13	South Eldred	24	11	2019-06-17 06:27:05	2019-06-17 06:27:05
15	South Nathanaelview	24	11	2019-06-17 06:27:05	2019-06-17 06:27:05
17	Zboncakfort	30	11	2019-06-17 06:27:05	2019-06-17 06:27:05
18	West Magnusview	30	11	2019-06-17 06:27:05	2019-06-17 06:27:05
20	West Monteborough	31	11	2019-06-17 06:27:06	2019-06-17 06:27:06
21	South Westleyborough	31	11	2019-06-17 06:27:06	2019-06-17 06:27:06
23	Veronaside	38	11	2019-06-17 06:27:06	2019-06-17 06:27:06
30	West Madelynnhaven	48	11	2019-06-17 06:27:06	2019-06-17 06:27:06
36	Kolkata	51	11	2019-07-10 06:27:59	2019-07-10 06:27:59
2	East Midnapure	2	11	2019-06-17 06:27:04	2019-08-05 05:46:51
24	East Burdwan	38	11	2019-06-17 06:27:06	2019-08-05 05:47:04
14	West Burdwan	24	11	2019-06-17 06:27:05	2019-08-05 05:47:25
19	West Midnapure	31	11	2019-06-17 06:27:06	2019-08-05 05:47:42
26	Howrah	44	11	2019-06-17 06:27:06	2019-08-05 05:47:53
28	Hoogly	48	11	2019-06-17 06:27:06	2019-08-05 05:48:03
25	Bankura	44	11	2019-06-17 06:27:06	2019-08-05 05:48:21
5	Purulia	7	11	2019-06-17 06:27:05	2019-08-05 05:48:47
27	Birbhum	44	11	2019-06-17 06:27:06	2019-08-05 05:49:09
29	North Dinajpur	48	11	2019-06-17 06:27:06	2019-08-05 05:50:28
8	South Dinajpur	11	11	2019-06-17 06:27:05	2019-08-05 05:50:41
6	Malda	7	11	2019-06-17 06:27:05	2019-08-05 05:51:22
22	Alipure duar	38	11	2019-06-17 06:27:06	2019-08-05 05:54:08
10	Darjeeling	17	11	2019-06-17 06:27:05	2019-08-05 05:55:27
16	Coochbihar	30	11	2019-06-17 06:27:05	2019-08-05 05:56:27
7	Kalimpong	11	11	2019-06-17 06:27:05	2019-08-05 05:56:54
\.


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 178
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('districts_id_seq', 36, true);


--
-- TOC entry 2358 (class 0 OID 371960)
-- Dependencies: 217
-- Data for Name: hc_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY hc_case_types (id, type_name, full_form, created_at, updated_at) FROM stdin;
1	AA	ARBRITATION APPL.	\N	\N
2	ABWA	APPL.UND.BENGAL WAKFS ACT	\N	\N
3	AC	AWARD CASES	\N	\N
4	ACA	APPL.UNDER CHARTERED ACCOUNTANTS ACT, 1949	\N	\N
5	ACO	PET. IN COMP. APPL.	\N	\N
6	ACR	APPL.UND.CHARITABLE & RELIGIOUS TRUST ACT	\N	\N
7	ACRP	APPL.UND.SEC.151 OF THE CR.P.C.	\N	\N
8	ACWA	APPL.UND.SEC 21 COST&WORKS ACCOUNTACTS ACT, 1959	\N	\N
9	AED	APPL. U/S. 64 OF ESTATE DUTY ACT, 1953	\N	\N
10	AET	APPL. U/S 25 OF EXPENDITURE TAX ACT, 1957	\N	\N
11	AFP	APPL.FOR LEAVE TO SUE AS AN INDIGENT PERSON	\N	\N
12	AGA	APPL.UND.SEC.25 OF ADMINISTRATOR GENERALS' ACT	\N	\N
13	AGL	APPL.FOR APPOINTMENT OF GUARDIAN-AD-LITEM	\N	\N
14	AGT	APPL. U/S 26 GIFT TAX ACT, 1958	\N	\N
15	AGWA	APPL.UND.GUARDIANS & WARDS ACT	\N	\N
16	AHC	HABEAS CORPUS	\N	\N
17	AID	APPL. UNDER PATENTS & DESIGNS ACT, 1970	\N	\N
18	AIDR	APPL.UND.INDUSTRIAL DEVELOPMENT REGULATION ACT	\N	\N
19	AIFC	APPL.UND.INDUSTRIAL FINANCE CORP. ACT	\N	\N
20	AIRB	APPN.RECON.BANK OF I	\N	\N
21	ALP	APPL.UND.CLAUSE 13 OF LETTERS PATENT	\N	\N
22	ALP.ITL	APPL. UNDER CLAUSE 17 OF THE LETTERS PATENT	\N	\N
23	ALPII	APPL.UND.CLAUSE 17 L	\N	\N
24	ALPITL	APPL.CLAUSE-17 LP	\N	\N
25	AOR	CALCUTTA OFFICIAL RECEIVER'S ACT 1938	\N	\N
26	AORC	APPLICATION OMNIBUS RESIDUARY CLASS	\N	\N
27	AOT	APPL.UND.OFFICIAL TRUSTEES ACT	\N	\N
28	AP	ARBITRATION PETITION	\N	\N
29	APD	APPEAL FROM DECREE	\N	\N
30	APDT	APP. FR. DECR. TEND.	\N	\N
31	APO	APPEAL FROM ORDER	\N	\N
32	APOT	TEMP APO	\N	\N
33	AS	ADMIRALITY  SUITS	\N	\N
34	ASCI	APPL.FOR LEAVE TO APPEAL TO THE SUPREME COURT OF INDIA	\N	\N
35	ASFC	APPL.UND.STAE FINANCIAL CORP. ACT	\N	\N
36	ASM	APPL.SANCHAITA MATTERS	\N	\N
37	ATA	APPL.UNDER TRUST ACT	\N	\N
38	ATM	APPL.UND.TRADE&MERCHANDISE MARKS, ACT	\N	\N
39	AUDA	APPL.UND.UNCLAIMED DEPOSITS ACT	\N	\N
40	AWT	APPL. U/S 27 OF WEALTH TAX ACT, 1957	\N	\N
41	BBA	APPL.UND.BANKERS BOOKS EVIDENCE ACT, 1891	\N	\N
42	BIFR	BIFR	\N	\N
43	CA	COMPANY APPLICATION	\N	\N
44	CAA	COMMISSIONER OF PATENT APPEAL	\N	\N
45	CC	CONTEMPT OF COURT CASES	\N	\N
46	CEXA	APPL.UND.CENTRAL EXCISE ACT	\N	\N
47	CHS	CHAMBER SUMMONS	\N	\N
48	CP	COMPANY PETITIONS	\N	\N
49	CPA	COMMISSIONER OF PATE	\N	\N
50	CRA	COPYRIGHT APPEAL	\N	\N
51	CRCC	CRIMINAL CONTEMPT	\N	\N
52	CS	CIVIL SUITS	\N	\N
53	CS(O)	CIVIL SUIT(OLD)	\N	\N
54	CSOS	CIVIL SUIT ORIGINATING SUMMONS	\N	\N
55	CUSTA	APPL.UND.CUSTOMS ACT	\N	\N
56	DM	UND.CHAPTER V OF O.S. RULES	\N	\N
57	EC	EXECUTION CASES	\N	\N
58	EOPLA	EXTRA ORDINARY PROBATE PROCEEDINGS	\N	\N
59	EOS	EXTRA ORDINARY SUITS	\N	\N
60	EP	ELEC.PET.(PEOPLES REPRESENTATION ACT, 1951)	\N	\N
61	FEA	FOREIGN EXCHANGE APPEAL	\N	\N
62	FERA	APPL.UND.FOREIGN EXCHANGE REGULATION ACT	\N	\N
63	GCAL	APPL.UND.GOLD CONTROL ACT	\N	\N
64	IC	INSOLVENCY CASES	\N	\N
65	ICA	APPL.UNDER INDIAN COMPANIES ACT, 1913	\N	\N
66	IP	IT.PET.256(2)IT'61	\N	\N
67	ITA	INCOME TAX APPEAL	\N	\N
68	ITAT	INCOME TAX APPEAL TENDERED	\N	\N
69	ITP	INCOME TAX PET.(U/S. 256 (2) OF I.T. ACT, 1961)	\N	\N
70	ITR	INCOMETAX REF.SEC.256 (1) OF I.T. ACT, 1961	\N	\N
71	LM	LUNATIC MATTERS	\N	\N
72	LPA	LETTERS PATENT APPEAL	\N	\N
73	MM	MISFEAOUCE MATTERS	\N	\N
74	MS	MATRIMONIAL SUITS	\N	\N
75	NM	NOTICE OF MOTION	\N	\N
76	OCO	ORIGINAL SIDE CROSS OBJECTION	\N	\N
77	OCOT	ORIGINAL SIDE CROSS OBJECTION TENDER	\N	\N
78	OTS	ORDINANCE TRANSFER SUITS	\N	\N
79	PLA	APPL.FOR PROBATE & LETTERS OF ADMINISTRATION	\N	\N
80	PLR	UND.CHPT.XXXI-A OF O.S. RULES	\N	\N
81	PMS	PARSI MATRIMONIAL SUITS	\N	\N
82	REF	REFERENCE CASE	\N	\N
83	RVWO	MEMORANDUM OF REVIEWS	\N	\N
84	SALT	APPL.UND.SALT ACT	\N	\N
85	SANA	SANCHAITA APPEAL	\N	\N
86	SCO	SPECIAL CASE FOR OPINION OF COURT	\N	\N
87	SESS	SESSIONS CASES	\N	\N
88	SS	SPECIAL SUITS(SEC 20 OF THE ARBITRATION ACT, 1940	\N	\N
89	T	TEMP A(1)	\N	\N
90	TBCS	TRANSFERRED BANKING COMPANIES SUITS	\N	\N
91	TCS	TRANSFERRED COMPANY SUITS	\N	\N
92	TMA	TRADE MARK APPEAL	\N	\N
93	TS	TESTAMENTERY SUITS	\N	\N
94	TUA	TRADE UNION APPEAL	\N	\N
95	WPO	WRIT PETITION	\N	\N
96	WP.CT	WP(CENTRAL ADMIN TRIBUNAL)	\N	\N
97	WP.ST	WP(STATE ADMIN TRIBUNAL)	\N	\N
98	WP.TT	WP(WB TAX TRIBUNAL)	\N	\N
99	WPCR	WRIT PETITION(CIVIL RULE)	\N	\N
\.


--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 216
-- Name: hc_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('hc_case_types_id_seq', 1, false);


--
-- TOC entry 2350 (class 0 OID 311058)
-- Dependencies: 209
-- Data for Name: jo_photos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY jo_photos (id, judicial_officer_id, photo, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 208
-- Name: jo_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('jo_photos_id_seq', 1, false);


--
-- TOC entry 2342 (class 0 OID 286684)
-- Dependencies: 201
-- Data for Name: jo_reporting_reviewings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY jo_reporting_reviewings (id, judicial_officer_id, reporting_officer_id, reviewing_officer_id, from_date, to_date, created_by, created_at, updated_at) FROM stdin;
3	2	1	4	2012-12-01	2012-12-01	11	\N	\N
2	1	1	3	2012-12-01	2012-12-01	11	\N	2019-07-01 12:17:20
\.


--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 200
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('jo_reporting_reviewings_id_seq', 2, true);


--
-- TOC entry 2346 (class 0 OID 286769)
-- Dependencies: 205
-- Data for Name: judicial_officer_posting_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, created_by, created_at, updated_at) FROM stdin;
7	1	8	11	2019-06-28 11:14:24	2019-06-28 11:14:24
10	4	8	11	2019-06-28 11:28:50	2019-06-28 11:28:50
11	4	6	11	2019-06-28 11:33:08	2019-06-28 11:33:08
13	4	3	11	2019-06-28 11:37:31	2019-06-28 11:37:31
14	3	7	11	2019-06-28 11:39:59	2019-06-28 11:39:59
15	4	6	11	2019-06-28 11:41:07	2019-06-28 11:41:07
16	3	9	11	2019-06-28 11:44:11	2019-06-28 11:44:11
19	4	8	11	2019-06-29 05:50:17	2019-07-01 08:22:40
21	2	10	11	2019-07-03 08:30:03	2019-07-03 08:30:03
22	11	8	11	2019-07-16 08:14:17	2019-07-16 08:14:17
23	11	1	11	2019-07-16 08:14:17	2019-07-16 08:14:17
24	11	1	11	2019-07-19 05:49:20	2019-07-19 05:49:20
25	11	6	11	2019-07-19 05:49:20	2019-07-19 05:49:20
57	11	8	11	2019-07-23 06:38:54	2019-07-23 06:38:54
58	11	1	11	2019-07-23 06:38:54	2019-07-23 06:38:54
59	11	10	11	2019-08-13 07:51:06	2019-08-13 07:51:06
60	11	1	11	2019-08-13 07:51:06	2019-08-13 07:51:06
\.


--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 204
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officer_posting_preferences_id_seq', 60, true);


--
-- TOC entry 2348 (class 0 OID 310977)
-- Dependencies: 207
-- Data for Name: judicial_officer_postings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date, to_date, created_by, created_at, updated_at) FROM stdin;
3	11	8	27	43	2	2016-03-05	2017-03-04	11	\N	\N
4	11	7	24	40	2	2014-03-05	2016-03-04	11	\N	\N
2	11	2	30	46	2	2019-03-05	\N	11	\N	\N
5	13	7	24	40	2	2014-03-05	2016-03-04	11	\N	\N
6	12	3	1	5	1	2015-02-05	2017-02-04	11	\N	\N
1	12	1	30	46	1	2017-02-05	\N	11	\N	\N
\.


--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 206
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officer_postings_id_seq', 1, false);


--
-- TOC entry 2340 (class 0 OID 286659)
-- Dependencies: 199
-- Data for Name: judicial_officer_qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY judicial_officer_qualifications (id, judicial_officer_id, qualification_id, created_by, created_at, updated_at) FROM stdin;
1	2	5	11	\N	\N
\.


--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 198
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officer_qualifications_id_seq', 1, false);


--
-- TOC entry 2338 (class 0 OID 286611)
-- Dependencies: 197
-- Data for Name: judicial_officers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY judicial_officers (id, officer_name, guardian_name, gurdian_relation, jo_code, date_of_birth, date_of_joining, date_of_confirmation, date_of_retirement, present_address, permanent_address, hometown, home_district_id, home_state_id, caste_id, religion_id, recruitment_batch_id, aadhaar_no, pan_no, pf_no, blood_group, identification_marks_1, identification_marks_2, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, reporting_officer_id, reviewing_officer_id, created_at, updated_at, photo_id) FROM stdin;
2	Test1	G Test1	Father	WB001	1975-02-25	2000-01-25	2005-01-01	2035-02-28	Rabindra Pally, Kestopur, Kolkata-700058	Rabindra Pally, Kestopur, Kolkata-700058	Kolkata	5	7	1	1	1	\N	\N	\N	\N	\N	\N	9876543210	\r	\N	abc@abc.abc	\r	\N	1	1	\N	\N	\N
3	Test2	G Test2	Mother	WB002	1975-02-25	2000-01-25	2005-01-01	2035-02-28	Rabindra Pally, Kestopur, Kolkata-700058	Rabindra Pally, Kestopur, Kolkata-700058	Kolkata	5	7	1	1	1	\N	\N	\N	\N	\N	\N	9876543210	\r	\N	abc@abc.abc	\r	\N	1	1	\N	\N	\N
4	Test3	G Test3	Mother	WB003	1975-02-25	2000-01-25	2005-01-01	2035-02-28	Rabindra Pally, Kestopur, Kolkata-700058	Rabindra Pally, Kestopur, Kolkata-700058	Kolkata	5	7	1	1	1	\N	\N	\N	\N	\N	\N	9876543210	\r	\N	abc@abc.abc	\r	\N	1	1	\N	\N	\N
13	Arpan	A K Roy	Father	WB012	1987-01-14	2010-05-03	2012-05-12	2047-02-04	hello	73A Amherst Row, Kolkata 9	Kolkata	36	51	1	1	5	\N	\N	\N	A+	\N	\N	9830982655	\N	\N	arpanroy1987@gmail.com	\N	\N	1	1	\N	\N	\N
11	Rupsa Bose	S Ghosh	Husband	WB007	1989-03-05	2016-09-30	2016-09-30	2020-09-05	Saltlake sector 3, kolkata 97	73A Amherst Row, Kolkata 9	Kolkata	36	51	1	1	5	\N	\N	\N	A+	\N	\N	9830982655	\N	\N	rupsa@rupsa.rupsa	\N	\N	12	11	\N	\N	\N
12	Anabil Bhattacharya	S Bose	Mother	WB009	1990-12-31	2013-05-19	2013-05-19	2065-05-04	Belghoria	Belghoria	Kolkata	11	17	1	1	8	\N	\N	\N	\N	\N	\N	1234567891	\N	\N	banabil90@gmail.com	\N	\N	1	1	\N	2019-08-06 05:37:32	\N
1	Amitabha Das	Sumitava Das	Father	WB126	1975-02-25	2000-01-25	2005-01-01	2035-02-28	Rabindra Pally, Kestopur, Kolkata-700058	Rabindra Pally, Kestopur, Kolkata-700058	Kolkata	5	7	1	1	1	\N	\N	\N	B-	\N	\N	9876543210	\N	\N	abc@abc.abc	\N	\N	12	2	\N	2019-08-06 05:38:36	\N
\.


--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 196
-- Name: judicial_officers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officers_id_seq', 4, true);


--
-- TOC entry 2354 (class 0 OID 371924)
-- Dependencies: 213
-- Data for Name: lcr_hc_ends; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) FROM stdin;
8	2	5	1	1	200	2011	2019-08-23	11	\N	\N
9	22	40	22	7	1000	2005	2019-08-25	11	\N	\N
10	22	40	22	1	3000	2019	2019-08-31	11	\N	\N
13	22	40	22	8	2200	2018	2019-08-21	11	\N	\N
16	22	40	23	1	2222	2018	2019-08-30	11	\N	\N
17	2	5	1	1	123	2018	2019-08-21	11	\N	\N
\.


--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 212
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lcr_hc_ends_id_seq', 17, true);


--
-- TOC entry 2356 (class 0 OID 371947)
-- Dependencies: 215
-- Data for Name: lcr_lc_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) FROM stdin;
7	8	52	111	2018	11	\N	\N
8	8	58	222	2017	11	\N	\N
9	8	9	333	2016	11	\N	\N
10	9	52	111	2018	11	\N	\N
11	9	58	222	2017	11	\N	\N
12	10	1	111	2019	11	\N	\N
13	10	5	222	2010	11	\N	\N
14	10	59	333	2016	11	\N	\N
15	10	5	444	2006	11	\N	\N
16	13	52	222	2019	11	\N	\N
17	13	55	333	2018	11	\N	\N
18	16	1	2	2018	11	\N	\N
19	16	6	3	2017	11	\N	\N
20	17	58	258	2018	11	\N	\N
21	17	52	753	2018	11	\N	\N
22	17	1	741	2017	11	\N	\N
\.


--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 214
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lcr_lc_details_id_seq', 22, true);


--
-- TOC entry 2360 (class 0 OID 371971)
-- Dependencies: 219
-- Data for Name: lower_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lower_case_types (id, type_name, created_at, updated_at) FROM stdin;
52	Act 39	\N	\N
1	Act Viii Miscellaneous Case	\N	\N
51	Act Xiv	\N	\N
58	Bail	\N	\N
59	CEX - Excise Case	\N	\N
3	Civil Appeal	\N	\N
4	Civil Execution	\N	\N
5	Civil Misc	\N	\N
6	Civil Revision	\N	\N
7	Complaint Case	\N	\N
55	C R Case	\N	\N
8	Criminal Appeal	\N	\N
9	Criminal Case	\N	\N
11	Criminal Misc Case	\N	\N
12	Criminal Revision	\N	\N
10	Crl. Execution - Criminal Execution	\N	\N
23	Divorce On Mutual Consent - Matri Suit Divorce Mutual Cons	\N	\N
13	Electricity Act	\N	\N
14	Estate Acquisition Appeal	\N	\N
16	Gr Case	\N	\N
17	Hindu Adapt. and Maint Act - Hindu Adapt. and Maint Case	\N	\N
18	Insolvancy Petition	\N	\N
19	L A C - Land Acquisition Cases	\N	\N
20	L A Ex. - Land Acquisition Execution	\N	\N
53	L A Suit	\N	\N
21	M A C C - M.A.C.C	\N	\N
22	M A C C Ex. - MACC Execution	\N	\N
36	Maintenance Case - MR case for Maintenance	\N	\N
24	Matrimonial Suit	\N	\N
25	Mc - Misc Case	\N	\N
54	M C Case	\N	\N
29	Misc. Appeal	\N	\N
26	Misc Case (pre-emption)	\N	\N
30	Misc. Criminal Revision	\N	\N
27	Misc Crl Case - Misc Criminal Case	\N	\N
31	Misc. Execution Case	\N	\N
57	Misc Petition (156) - Misc Petition	\N	\N
28	Mjc - Misc Judicial Case	\N	\N
32	Money Appeal	\N	\N
33	Money Execution	\N	\N
34	Money Suit	\N	\N
35	M V Act - Motor Vehicle Case	\N	\N
37	N D P S Case - NDPS Case	\N	\N
38	NGR Case	\N	\N
39	Other Appeal	\N	\N
40	Other Suit	\N	\N
41	Probate Suit	\N	\N
15	S C C Ex. - Execution	\N	\N
42	S C C Suit - SCC SUIT	\N	\N
43	Sessions Case	\N	\N
44	Sessions Trial	\N	\N
45	Special Court Cases	\N	\N
46	Succession Case	\N	\N
47	Title Appeal	\N	\N
48	Title Execution	\N	\N
49	Title Suit	\N	\N
50	Trust Suit	\N	\N
\.


--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 218
-- Name: lower_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lower_case_types_id_seq', 1, false);


--
-- TOC entry 2311 (class 0 OID 266867)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migrations (id, migration, batch) FROM stdin;
577	2014_10_12_000000_create_users_table	1
578	2014_10_12_100000_create_password_resets_table	1
579	2019_06_12_000005_create_states_table	1
580	2019_06_12_000010_create_zones_table	1
581	2019_06_12_000020_create_districts_table	1
582	2019_06_12_000025_create_subdivisions_table	1
583	2019_06_12_000030_create_court_complexes_table	1
584	2019_06_12_000040_create_courts_table	1
585	2019_06_12_000050_create_qualifications_table	1
586	2019_06_12_000060_create_castes_table	1
587	2019_06_12_000070_create_designations_table	1
588	2019_06_12_000080_create_religions_table	1
589	2019_06_12_000090_create_recruitment_batches_table	1
590	2019_06_12_000100_create_judicial_officers_table	1
591	2019_06_13_091801_create_judicial_officer_qualifications_table	1
592	2019_06_13_092954_create_jo_reporting_reviewings_table	1
593	2019_06_13_093750_create_modes_table	1
595	2019_06_13_101842_create_judicial_officer_posting_preferences_table	1
596	2019_06_13_093852_create_judicial_officer_postings_table	2
601	2019_07_15_082047_alter_judicial_officers	5
602	2019_07_15_072014_alter_users	6
604	2019_07_22_064308_create_dairies_table	7
605	2019_08_13_091522_create_lcr_hc_ends_table	8
606	2019_08_13_091810_create_lcr_lc_details_table	8
607	2019_08_13_101720_create_hc_case_types_table	8
608	2019_08_13_102950_create_lower_case_types_table	8
609	2014_10_10_000000_create_user_types_table	9
610	2019_06_12_000110_create_jo_photos_table	10
\.


--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 169
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('migrations_id_seq', 609, true);


--
-- TOC entry 2344 (class 0 OID 286714)
-- Dependencies: 203
-- Data for Name: modes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY modes (id, posting_mode, created_by, created_at, updated_at) FROM stdin;
1	Transfer	11	\N	\N
2	Promotion	11	\N	\N
9	Deputation1	11	2019-07-01 11:24:25	2019-07-01 11:24:38
\.


--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 202
-- Name: modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('modes_id_seq', 9, true);


--
-- TOC entry 2314 (class 0 OID 286412)
-- Dependencies: 173
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY password_resets (email, token, created_at) FROM stdin;
banabil90@gmail.com	$2y$10$SyYTnMAUdAWOtCMHLjPKfesTpVjIb6WaogBUga8vayAjqzc73hvjS	2019-06-19 06:04:48
\.


--
-- TOC entry 2328 (class 0 OID 286536)
-- Dependencies: 187
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY qualifications (id, qualification_name, created_by, created_at, updated_at) FROM stdin;
5	BCom	11	2019-06-25 07:18:30	2019-06-25 07:18:30
7	MA LLB	11	2019-06-25 07:18:47	2019-06-25 07:18:47
8	BA LLB	11	2019-06-28 09:50:19	2019-07-01 10:14:25
10	M.Sc	11	2019-07-01 11:25:58	2019-07-01 11:27:09
\.


--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 186
-- Name: qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('qualifications_id_seq', 10, true);


--
-- TOC entry 2336 (class 0 OID 286596)
-- Dependencies: 195
-- Data for Name: recruitment_batches; Type: TABLE DATA; Schema: public; Owner: -
--

COPY recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) FROM stdin;
5	psc 2011	2011	11	2019-06-26 11:49:37	2019-06-26 11:49:37
8	CLAT 2011	2003	11	2019-06-26 11:55:19	2019-06-26 11:57:00
1	PSC 2000	2000	11	\N	2019-06-29 08:58:19
\.


--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 194
-- Name: recruitment_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recruitment_batches_id_seq', 14, true);


--
-- TOC entry 2334 (class 0 OID 286581)
-- Dependencies: 193
-- Data for Name: religions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY religions (id, religion_name, created_by, created_at, updated_at) FROM stdin;
1	Hindu	11	\N	\N
2	Muslim	11	2019-07-02 11:23:49	2019-07-02 11:24:02
\.


--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 192
-- Name: religions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('religions_id_seq', 3, true);


--
-- TOC entry 2316 (class 0 OID 286421)
-- Dependencies: 175
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY states (id, state_name, created_by, created_at, updated_at) FROM stdin;
2	Illinois	11	2019-06-17 06:27:04	2019-06-17 06:27:04
3	Montana	11	2019-06-17 06:27:04	2019-06-17 06:27:04
4	New York	11	2019-06-17 06:27:04	2019-06-17 06:27:04
5	North Dakota	11	2019-06-17 06:27:04	2019-06-17 06:27:04
6	Maryland	11	2019-06-17 06:27:05	2019-06-17 06:27:05
8	Wyoming	11	2019-06-17 06:27:05	2019-06-17 06:27:05
9	New Jersey	11	2019-06-17 06:27:05	2019-06-17 06:27:05
10	Nevada	11	2019-06-17 06:27:05	2019-06-17 06:27:05
12	Oklahoma	11	2019-06-17 06:27:05	2019-06-17 06:27:05
13	North Carolina	11	2019-06-17 06:27:05	2019-06-17 06:27:05
15	Kansas	11	2019-06-17 06:27:05	2019-06-17 06:27:05
16	Pennsylvania	11	2019-06-17 06:27:05	2019-06-17 06:27:05
18	Nebraska	11	2019-06-17 06:27:05	2019-06-17 06:27:05
19	Utah	11	2019-06-17 06:27:05	2019-06-17 06:27:05
20	Texas	11	2019-06-17 06:27:05	2019-06-17 06:27:05
21	Washington	11	2019-06-17 06:27:05	2019-06-17 06:27:05
22	Missouri	11	2019-06-17 06:27:05	2019-06-17 06:27:05
23	Wisconsin	11	2019-06-17 06:27:05	2019-06-17 06:27:05
24	West Virginia	11	2019-06-17 06:27:05	2019-06-17 06:27:05
26	Louisiana	11	2019-06-17 06:27:05	2019-06-17 06:27:05
27	South Dakota	11	2019-06-17 06:27:05	2019-06-17 06:27:05
29	Maine	11	2019-06-17 06:27:05	2019-06-17 06:27:05
30	Hawaii	11	2019-06-17 06:27:05	2019-06-17 06:27:05
32	Virginia	11	2019-06-17 06:27:06	2019-06-17 06:27:06
34	Tennessee	11	2019-06-17 06:27:06	2019-06-17 06:27:06
35	New Mexico	11	2019-06-17 06:27:06	2019-06-17 06:27:06
36	Indiana	11	2019-06-17 06:27:06	2019-06-17 06:27:06
37	Oregon	11	2019-06-17 06:27:06	2019-06-17 06:27:06
38	Kentucky	11	2019-06-17 06:27:06	2019-06-17 06:27:06
39	Ohio	11	2019-06-17 06:27:06	2019-06-17 06:27:06
40	Vermont	11	2019-06-17 06:27:06	2019-06-17 06:27:06
41	Georgia	11	2019-06-17 06:27:06	2019-06-17 06:27:06
43	Michigan	11	2019-06-17 06:27:06	2019-06-17 06:27:06
45	New Hampshire	11	2019-06-17 06:27:06	2019-06-17 06:27:06
47	Iowa	11	2019-06-17 06:27:06	2019-06-17 06:27:06
48	Massachusetts	11	2019-06-17 06:27:06	2019-06-17 06:27:06
49	Mississippi	11	2019-06-17 06:27:06	2019-06-17 06:27:06
50	Minnesota	11	2019-06-17 06:27:06	2019-06-17 06:27:06
51	West Bengal	11	2019-06-18 10:06:22	2019-06-18 10:06:22
52	Bihar	11	2019-06-18 10:10:49	2019-06-18 10:10:49
7	Odisha	11	2019-06-17 06:27:05	2019-08-05 05:57:55
31	Andhra Pradesh	11	2019-06-17 06:27:06	2019-08-05 05:59:14
68	Himachal Pradesh	11	2019-08-05 06:03:19	2019-08-05 06:03:19
69	Madhya Pradesh	11	2019-08-05 06:03:30	2019-08-05 06:03:30
11	Maharastra	11	2019-06-17 06:27:05	2019-08-05 06:03:46
28	Kerala	11	2019-06-17 06:27:05	2019-08-05 06:04:55
1	Rajasthan	11	2019-06-17 06:27:04	2019-08-05 06:05:07
17	Gujrat	11	2019-06-17 06:27:05	2019-08-05 06:07:42
46	Tamilnadu	11	2019-06-17 06:27:06	2019-08-05 06:07:52
25	Karntaka	11	2019-06-17 06:27:05	2019-08-05 06:16:44
44	Hyderabad	11	2019-06-17 06:27:06	2019-08-05 06:17:30
42	Jammu and Kahmir	11	2019-06-17 06:27:06	2019-08-05 06:17:59
70	Punjab	11	2019-08-05 06:18:05	2019-08-05 06:18:05
71	Hariyana	11	2019-08-05 06:18:12	2019-08-05 06:18:12
72	Jharkhand	11	2019-08-05 06:18:28	2019-08-05 06:18:28
73	Chattishgarh	11	2019-08-05 06:18:43	2019-08-05 06:18:43
\.


--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 174
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('states_id_seq', 73, true);


--
-- TOC entry 2322 (class 0 OID 286471)
-- Dependencies: 181
-- Data for Name: subdivisions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at) FROM stdin;
1	saepe	2	11	2019-06-17 06:27:05	2019-06-17 06:27:05
3	ut	2	11	2019-06-17 06:27:05	2019-06-17 06:27:05
7	quasi	5	11	2019-06-17 06:27:05	2019-06-17 06:27:05
8	quo	5	11	2019-06-17 06:27:05	2019-06-17 06:27:05
9	soluta	7	11	2019-06-17 06:27:05	2019-06-17 06:27:05
11	sunt	7	11	2019-06-17 06:27:05	2019-06-17 06:27:05
12	molestiae	7	11	2019-06-17 06:27:05	2019-06-17 06:27:05
13	provident	10	11	2019-06-17 06:27:05	2019-06-17 06:27:05
14	suscipit	10	11	2019-06-17 06:27:05	2019-06-17 06:27:05
16	quae	10	11	2019-06-17 06:27:05	2019-06-17 06:27:05
17	quisquam	13	11	2019-06-17 06:27:05	2019-06-17 06:27:05
19	voluptatem	13	11	2019-06-17 06:27:05	2019-06-17 06:27:05
20	recusandae	13	11	2019-06-17 06:27:05	2019-06-17 06:27:05
21	voluptates	17	11	2019-06-17 06:27:06	2019-06-17 06:27:06
25	voluptatum	19	11	2019-06-17 06:27:06	2019-06-17 06:27:06
26	sint	19	11	2019-06-17 06:27:06	2019-06-17 06:27:06
31	similique	24	11	2019-06-17 06:27:06	2019-06-17 06:27:06
32	nostrum	24	11	2019-06-17 06:27:06	2019-06-17 06:27:06
\.


--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 180
-- Name: subdivisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('subdivisions_id_seq', 43, true);


--
-- TOC entry 2362 (class 0 OID 371992)
-- Dependencies: 221
-- Data for Name: user_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY user_types (id, type_name, created_at, updated_at, created_by) FROM stdin;
1	Administrator	\N	\N	11
2	Judicial Officer	\N	\N	11
3	Departmental Officer	\N	\N	11
\.


--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 220
-- Name: user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_types_id_seq', 1, false);


--
-- TOC entry 2313 (class 0 OID 286401)
-- Dependencies: 172
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) FROM stdin;
11	Administrator 1	admin@admin.admin	\N	$2y$10$or1dBRoI3FxqDddrMTwDEO9MOo5MuHRX8EpLNPRd6Q94VU76L2rUy	j8ztlKap65uF0CMt6bWHd7aS2uYjIZyTlRyVf5EKyWXvhlP9ERJ7yCNXMuOK	2019-06-19 06:00:07	2019-06-19 06:00:07	\N	\N	admin	1
14	Rupsa Bose	rupsa@rupsa.rupsa	\N	$2y$10$or1dBRoI3FxqDddrMTwDEO9MOo5MuHRX8EpLNPRd6Q94VU76L2rUy	\N	\N	\N	\N	11	rupsa	2
13	Arpan	arpanroy1987@gmail.com	\N	$2y$10$SOW.J6WHttO1dhhf8u/2M.zdaiIVTygGyL03ZNLejwcPW8cmPj3Yq	\N	2019-06-19 06:04:30	2019-06-19 06:04:30	\N	13	arpan	2
12	Anabil Bhattacharya	banabil90@gmail.com	\N	$2y$10$SOW.J6WHttO1dhhf8u/2M.zdaiIVTygGyL03ZNLejwcPW8cmPj3Yq	\N	2019-06-19 06:04:30	2019-06-19 06:04:30	\N	12	anabil	2
\.


--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 171
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 12, true);


--
-- TOC entry 2318 (class 0 OID 286436)
-- Dependencies: 177
-- Data for Name: zones; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zones (id, zone_name, created_by, created_at, updated_at, min_service_days) FROM stdin;
1	g	11	2019-06-17 06:27:04	2019-06-17 06:27:04	547
3	v	11	2019-06-17 06:27:05	2019-06-17 06:27:05	730
5	x	11	2019-06-17 06:27:05	2019-06-17 06:27:05	730
7	w	11	2019-06-17 06:27:06	2019-06-17 06:27:06	730
9	h	11	2019-06-17 06:27:06	2019-06-17 06:27:06	730
2	n	11	2019-06-17 06:27:05	2019-06-17 06:27:05	913
4	y	11	2019-06-17 06:27:05	2019-06-17 06:27:05	547
6	k	11	2019-06-17 06:27:05	2019-06-17 06:27:05	913
12	zap	11	2019-07-01 11:37:00	2019-07-01 11:37:16	913
10	e	11	2019-06-17 06:27:06	2019-07-03 07:19:55	47
8	d	11	2019-06-17 06:27:06	2019-07-03 07:20:01	91
\.


--
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 176
-- Name: zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('zones_id_seq', 25, true);


--
-- TOC entry 2101 (class 2606 OID 286563)
-- Name: castes_caste_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY castes
    ADD CONSTRAINT castes_caste_name_unique UNIQUE (caste_name);


--
-- TOC entry 2103 (class 2606 OID 286556)
-- Name: castes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY castes
    ADD CONSTRAINT castes_pkey PRIMARY KEY (id);


--
-- TOC entry 2089 (class 2606 OID 286513)
-- Name: court_complexes_court_complex_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_court_complex_name_unique UNIQUE (court_complex_name);


--
-- TOC entry 2091 (class 2606 OID 286496)
-- Name: court_complexes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_pkey PRIMARY KEY (id);


--
-- TOC entry 2093 (class 2606 OID 286533)
-- Name: courts_court_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courts
    ADD CONSTRAINT courts_court_name_unique UNIQUE (court_name);


--
-- TOC entry 2095 (class 2606 OID 286521)
-- Name: courts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courts
    ADD CONSTRAINT courts_pkey PRIMARY KEY (id);


--
-- TOC entry 2141 (class 2606 OID 321650)
-- Name: dairies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dairies
    ADD CONSTRAINT dairies_pkey PRIMARY KEY (id);


--
-- TOC entry 2105 (class 2606 OID 286578)
-- Name: designations_designation_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY designations
    ADD CONSTRAINT designations_designation_name_unique UNIQUE (designation_name);


--
-- TOC entry 2107 (class 2606 OID 286571)
-- Name: designations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- TOC entry 2081 (class 2606 OID 286468)
-- Name: districts_district_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_district_name_unique UNIQUE (district_name);


--
-- TOC entry 2083 (class 2606 OID 286456)
-- Name: districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- TOC entry 2147 (class 2606 OID 371968)
-- Name: hc_case_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hc_case_types
    ADD CONSTRAINT hc_case_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2139 (class 2606 OID 311066)
-- Name: jo_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_photos
    ADD CONSTRAINT jo_photos_pkey PRIMARY KEY (id);


--
-- TOC entry 2125 (class 2606 OID 286689)
-- Name: jo_reporting_reviewings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_pkey PRIMARY KEY (id);


--
-- TOC entry 2133 (class 2606 OID 286774)
-- Name: judicial_officer_posting_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 2135 (class 2606 OID 310984)
-- Name: judicial_officer_postings_judicial_officer_id_designation_id_co; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_judicial_officer_id_designation_id_co UNIQUE (judicial_officer_id, designation_id, court_id, court_complex_id, mode_id, from_date);


--
-- TOC entry 2137 (class 2606 OID 310982)
-- Name: judicial_officer_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_pkey PRIMARY KEY (id);


--
-- TOC entry 2121 (class 2606 OID 286664)
-- Name: judicial_officer_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2117 (class 2606 OID 286656)
-- Name: judicial_officers_jo_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_jo_code_unique UNIQUE (jo_code);


--
-- TOC entry 2119 (class 2606 OID 286619)
-- Name: judicial_officers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_pkey PRIMARY KEY (id);


--
-- TOC entry 2143 (class 2606 OID 371929)
-- Name: lcr_hc_ends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_pkey PRIMARY KEY (id);


--
-- TOC entry 2145 (class 2606 OID 371952)
-- Name: lcr_lc_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lcr_lc_details
    ADD CONSTRAINT lcr_lc_details_pkey PRIMARY KEY (id);


--
-- TOC entry 2149 (class 2606 OID 371979)
-- Name: lower_case_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lower_case_types
    ADD CONSTRAINT lower_case_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2064 (class 2606 OID 266872)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2129 (class 2606 OID 286719)
-- Name: modes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY modes
    ADD CONSTRAINT modes_pkey PRIMARY KEY (id);


--
-- TOC entry 2131 (class 2606 OID 286726)
-- Name: modes_posting_mode_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY modes
    ADD CONSTRAINT modes_posting_mode_unique UNIQUE (posting_mode);


--
-- TOC entry 2123 (class 2606 OID 286666)
-- Name: qualification_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications
    ADD CONSTRAINT qualification_id UNIQUE (judicial_officer_id);


--
-- TOC entry 2097 (class 2606 OID 286541)
-- Name: qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY qualifications
    ADD CONSTRAINT qualifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2099 (class 2606 OID 286548)
-- Name: qualifications_qualification_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY qualifications
    ADD CONSTRAINT qualifications_qualification_name_unique UNIQUE (qualification_name);


--
-- TOC entry 2113 (class 2606 OID 286601)
-- Name: recruitment_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recruitment_batches
    ADD CONSTRAINT recruitment_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 2115 (class 2606 OID 286608)
-- Name: recruitment_batches_recruitment_batch_desc_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recruitment_batches
    ADD CONSTRAINT recruitment_batches_recruitment_batch_desc_unique UNIQUE (recruitment_batch_desc);


--
-- TOC entry 2109 (class 2606 OID 286586)
-- Name: religions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religions_pkey PRIMARY KEY (id);


--
-- TOC entry 2111 (class 2606 OID 286593)
-- Name: religions_religion_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religions_religion_name_unique UNIQUE (religion_name);


--
-- TOC entry 2127 (class 2606 OID 286691)
-- Name: reporting_officer_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT reporting_officer_id UNIQUE (judicial_officer_id);


--
-- TOC entry 2073 (class 2606 OID 286426)
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 286433)
-- Name: states_state_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_state_name_unique UNIQUE (state_name);


--
-- TOC entry 2085 (class 2606 OID 286476)
-- Name: subdivisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subdivisions
    ADD CONSTRAINT subdivisions_pkey PRIMARY KEY (id);


--
-- TOC entry 2087 (class 2606 OID 286488)
-- Name: subdivisions_subdivision_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subdivisions
    ADD CONSTRAINT subdivisions_subdivision_name_unique UNIQUE (subdivision_name);


--
-- TOC entry 2151 (class 2606 OID 371997)
-- Name: user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_types
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2066 (class 2606 OID 286411)
-- Name: users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2068 (class 2606 OID 286409)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2070 (class 2606 OID 372020)
-- Name: users_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_user_id_key UNIQUE (user_id);


--
-- TOC entry 2077 (class 2606 OID 286441)
-- Name: zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- TOC entry 2079 (class 2606 OID 286448)
-- Name: zones_zone_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_zone_name_unique UNIQUE (zone_name);


--
-- TOC entry 2071 (class 1259 OID 286418)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX password_resets_email_index ON password_resets USING btree (email);


--
-- TOC entry 2170 (class 2606 OID 286557)
-- Name: castes_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY castes
    ADD CONSTRAINT castes_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2165 (class 2606 OID 286507)
-- Name: court_complexes_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2163 (class 2606 OID 286497)
-- Name: court_complexes_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_district_id_foreign FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- TOC entry 2166 (class 2606 OID 322915)
-- Name: court_complexes_subdivision_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_subdivision_id FOREIGN KEY (subdivision_id) REFERENCES subdivisions(id);


--
-- TOC entry 2164 (class 2606 OID 286502)
-- Name: court_complexes_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY court_complexes
    ADD CONSTRAINT court_complexes_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES zones(id);


--
-- TOC entry 2167 (class 2606 OID 286522)
-- Name: courts_court_complex_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courts
    ADD CONSTRAINT courts_court_complex_id_foreign FOREIGN KEY (court_complex_id) REFERENCES court_complexes(id);


--
-- TOC entry 2168 (class 2606 OID 286527)
-- Name: courts_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courts
    ADD CONSTRAINT courts_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2171 (class 2606 OID 286572)
-- Name: designations_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY designations
    ADD CONSTRAINT designations_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2160 (class 2606 OID 286462)
-- Name: districts_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2159 (class 2606 OID 286457)
-- Name: districts_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_state_id_foreign FOREIGN KEY (state_id) REFERENCES states(id);


--
-- TOC entry 2198 (class 2606 OID 311067)
-- Name: jo_photos_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_photos
    ADD CONSTRAINT jo_photos_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2188 (class 2606 OID 286707)
-- Name: jo_reporting_reviewings_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2185 (class 2606 OID 286692)
-- Name: jo_reporting_reviewings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2186 (class 2606 OID 286697)
-- Name: jo_reporting_reviewings_reporting_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_reporting_officer_id_foreign FOREIGN KEY (reporting_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2187 (class 2606 OID 286702)
-- Name: jo_reporting_reviewings_reviewing_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jo_reporting_reviewings
    ADD CONSTRAINT jo_reporting_reviewings_reviewing_officer_id_foreign FOREIGN KEY (reviewing_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2191 (class 2606 OID 286785)
-- Name: judicial_officer_posting_preferences_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2190 (class 2606 OID 286775)
-- Name: judicial_officer_posting_preferences_judicial_officer_id_foreig; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_posting_preferences
    ADD CONSTRAINT judicial_officer_posting_preferences_judicial_officer_id_foreig FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2195 (class 2606 OID 311000)
-- Name: judicial_officer_postings_court_complex_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_court_complex_id_foreign FOREIGN KEY (court_complex_id) REFERENCES court_complexes(id);


--
-- TOC entry 2194 (class 2606 OID 310995)
-- Name: judicial_officer_postings_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_court_id_foreign FOREIGN KEY (court_id) REFERENCES courts(id);


--
-- TOC entry 2197 (class 2606 OID 311010)
-- Name: judicial_officer_postings_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2193 (class 2606 OID 310990)
-- Name: judicial_officer_postings_designation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_designation_id_foreign FOREIGN KEY (designation_id) REFERENCES designations(id);


--
-- TOC entry 2192 (class 2606 OID 310985)
-- Name: judicial_officer_postings_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2196 (class 2606 OID 311005)
-- Name: judicial_officer_postings_mode_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_postings
    ADD CONSTRAINT judicial_officer_postings_mode_id_foreign FOREIGN KEY (mode_id) REFERENCES modes(id);


--
-- TOC entry 2184 (class 2606 OID 286677)
-- Name: judicial_officer_qualifications_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2182 (class 2606 OID 286667)
-- Name: judicial_officer_qualifications_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2183 (class 2606 OID 286672)
-- Name: judicial_officer_qualifications_qualification_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officer_qualifications
    ADD CONSTRAINT judicial_officer_qualifications_qualification_id_foreign FOREIGN KEY (qualification_id) REFERENCES qualifications(id);


--
-- TOC entry 2176 (class 2606 OID 286630)
-- Name: judicial_officers_caste_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_caste_id_foreign FOREIGN KEY (caste_id) REFERENCES castes(id);


--
-- TOC entry 2174 (class 2606 OID 286620)
-- Name: judicial_officers_home_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_home_district_id_foreign FOREIGN KEY (home_district_id) REFERENCES districts(id);


--
-- TOC entry 2175 (class 2606 OID 286625)
-- Name: judicial_officers_home_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_home_state_id_foreign FOREIGN KEY (home_state_id) REFERENCES states(id);


--
-- TOC entry 2181 (class 2606 OID 311077)
-- Name: judicial_officers_photo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_photo_id_foreign FOREIGN KEY (photo_id) REFERENCES jo_photos(id);


--
-- TOC entry 2178 (class 2606 OID 286640)
-- Name: judicial_officers_recruitment_batch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_recruitment_batch_id_foreign FOREIGN KEY (recruitment_batch_id) REFERENCES recruitment_batches(id);


--
-- TOC entry 2177 (class 2606 OID 286635)
-- Name: judicial_officers_religion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_religion_id_foreign FOREIGN KEY (religion_id) REFERENCES religions(id);


--
-- TOC entry 2179 (class 2606 OID 286645)
-- Name: judicial_officers_reporting_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_reporting_officer_id_foreign FOREIGN KEY (reporting_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2180 (class 2606 OID 286650)
-- Name: judicial_officers_reviewing_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judicial_officers
    ADD CONSTRAINT judicial_officers_reviewing_officer_id_foreign FOREIGN KEY (reviewing_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2200 (class 2606 OID 371935)
-- Name: lcr_hc_ends_complex_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_complex_foreign FOREIGN KEY (complex) REFERENCES court_complexes(id);


--
-- TOC entry 2199 (class 2606 OID 371930)
-- Name: lcr_hc_ends_court_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_court_foreign FOREIGN KEY (court) REFERENCES courts(id);


--
-- TOC entry 2201 (class 2606 OID 371940)
-- Name: lcr_hc_ends_district_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lcr_hc_ends
    ADD CONSTRAINT lcr_hc_ends_district_foreign FOREIGN KEY (district) REFERENCES districts(id);


--
-- TOC entry 2202 (class 2606 OID 371953)
-- Name: lcr_lc_details_hc_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lcr_lc_details
    ADD CONSTRAINT lcr_lc_details_hc_id_foreign FOREIGN KEY (hc_id) REFERENCES lcr_hc_ends(id);


--
-- TOC entry 2189 (class 2606 OID 286720)
-- Name: modes_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY modes
    ADD CONSTRAINT modes_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2169 (class 2606 OID 286542)
-- Name: qualifications_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY qualifications
    ADD CONSTRAINT qualifications_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2173 (class 2606 OID 286602)
-- Name: recruitment_batches_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recruitment_batches
    ADD CONSTRAINT recruitment_batches_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2172 (class 2606 OID 286587)
-- Name: religions_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religions_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2157 (class 2606 OID 286427)
-- Name: states_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2162 (class 2606 OID 286482)
-- Name: subdivisions_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subdivisions
    ADD CONSTRAINT subdivisions_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2161 (class 2606 OID 286477)
-- Name: subdivisions_district_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subdivisions
    ADD CONSTRAINT subdivisions_district_id_foreign FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- TOC entry 2203 (class 2606 OID 372021)
-- Name: user_types_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_types
    ADD CONSTRAINT user_types_created_by_fkey FOREIGN KEY (created_by) REFERENCES users(id);


--
-- TOC entry 2155 (class 2606 OID 372009)
-- Name: users_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_court_id_fkey FOREIGN KEY (court_id) REFERENCES courts(id);


--
-- TOC entry 2152 (class 2606 OID 311082)
-- Name: users_court_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_court_id_foreign FOREIGN KEY (court_id) REFERENCES courts(id);


--
-- TOC entry 2156 (class 2606 OID 372014)
-- Name: users_judicial_officer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_judicial_officer_id_fkey FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2153 (class 2606 OID 311097)
-- Name: users_judicial_officer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_judicial_officer_id_foreign FOREIGN KEY (judicial_officer_id) REFERENCES judicial_officers(id);


--
-- TOC entry 2154 (class 2606 OID 372004)
-- Name: users_user_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_user_type_id_fkey FOREIGN KEY (user_type_id) REFERENCES user_types(id);


--
-- TOC entry 2158 (class 2606 OID 286442)
-- Name: zones_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


-- Completed on 2019-08-27 13:51:54

--
-- PostgreSQL database dump complete
--

