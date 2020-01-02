--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 11.1

-- Started on 2019-12-23 17:00:16

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

INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at) VALUES (4, 'ADJ FTC', 2, 11, '2019-11-26 15:43:35', '2019-11-26 15:43:35');
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at) VALUES (2, 'JM', 1, 11, '2019-11-26 15:42:01', '2019-11-26 15:43:14');
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at) VALUES (1, 'ACJM', 2, 2, '2019-11-22 18:04:31', '2019-11-22 18:04:31');
INSERT INTO public.designations (id, designation_name, rank_id, created_by, created_at, updated_at) VALUES (3, 'ADJ', 3, 11, '2019-11-26 15:43:22', '2019-11-26 15:43:22');


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



--
-- TOC entry 2484 (class 0 OID 452054)
-- Dependencies: 231
-- Data for Name: jo_legal_experiences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (1, 3, 68, 2018, 2019, '2019-12-17 16:46:47', '2019-12-17 16:46:47');
INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (3, 11, 129, 2017, 2019, '2019-12-17 17:12:14', '2019-12-17 17:12:14');
INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (4, 12, 57, 2017, 2018, '2019-12-18 13:02:42', '2019-12-18 13:02:42');
INSERT INTO public.jo_legal_experiences (id, judicial_officer_id, subdivision_id, from_year, to_year, created_at, updated_at) VALUES (6, 17, 129, 2017, 2019, '2019-12-19 15:51:30', '2019-12-19 15:51:30');


--
-- TOC entry 2454 (class 0 OID 451777)
-- Dependencies: 201
-- Data for Name: jo_reportings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_reportings (id, judicial_officer_id, posting_id, reporting_officer_id, other_reporting_officer_name, other_reporting_officer_designation, created_at, updated_at) VALUES (1, 11, 7, NULL, 'Test Officer                                                                                                                                                                                                                                                   ', 'Test Designation                                                                                                                                                                                                                                               ', '2019-12-17 17:12:14', '2019-12-17 17:12:14');
INSERT INTO public.jo_reportings (id, judicial_officer_id, posting_id, reporting_officer_id, other_reporting_officer_name, other_reporting_officer_designation, created_at, updated_at) VALUES (2, 17, 10, 9, '                                                                                                                                                                                                                                                               ', '                                                                                                                                                                                                                                                               ', '2019-12-19 15:51:30', '2019-12-19 15:51:30');


--
-- TOC entry 2472 (class 0 OID 451946)
-- Dependencies: 219
-- Data for Name: jo_zone_tenures; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (1, 1, 7, '2018-09-19', '2019-09-19', NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (2, 1, 8, '2019-09-20', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (3, 9, 4, '2018-01-01', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (4, 11, 7, '2018-08-01', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (5, 12, 6, '2009-01-02', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_at, updated_at) VALUES (6, 17, 7, '2019-02-01', NULL, NULL, NULL);


--
-- TOC entry 2456 (class 0 OID 451805)
-- Dependencies: 203
-- Data for Name: judicial_officer_posting_preferences; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2452 (class 0 OID 451746)
-- Dependencies: 199
-- Data for Name: judicial_officer_postings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (1, 1, 1, 1, 1, NULL, NULL, '2018-09-19', '2019-09-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (5, 9, 3, 1, NULL, 'Test Designation', 'Kolkata', '2018-01-01', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-17 16:59:47', '2019-12-17 16:59:47');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (7, 11, 3, 1, NULL, 'Test Designation', 'Kolkata', '2018-08-01', NULL, 'Test Remark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-17 17:12:14', '2019-12-17 17:12:14');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (8, 12, 3, 2, NULL, 'Test Designation 2', 'Demo Place 2', '2009-01-02', NULL, 'sadasdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-18 13:02:42', '2019-12-18 13:02:42');
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (2, 2, 1, 1, 1, NULL, NULL, '2019-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.judicial_officer_postings (id, judicial_officer_id, mode_id, rank_id, designation_id, deputation_designation, deputation_posting_place, from_date, to_date, posting_remark, acp_1, acp_1_doc, acp_2, acp_2_doc, dj_se, dj_se_doc, dj_st, dj_st_doc, created_at, updated_at) VALUES (10, 17, 1, 1, 71, '', '', '2019-02-01', '2019-02-01', 'Test Remark 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-19 15:51:30', '2019-12-19 15:51:30');


--
-- TOC entry 2448 (class 0 OID 451716)
-- Dependencies: 195
-- Data for Name: judicial_officer_qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (1, 3, 8, 2018, '2019-12-17 16:46:47', '2019-12-17 16:46:47');
INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (3, 11, 7, 2019, '2019-12-17 17:12:14', '2019-12-17 17:12:14');
INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (6, 17, 10, 2019, '2019-12-19 15:51:30', '2019-12-19 15:51:30');
INSERT INTO public.judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_at, updated_at) VALUES (7, 17, 5, 2017, '2019-12-19 15:51:30', '2019-12-19 15:51:30');


--
-- TOC entry 2446 (class 0 OID 451671)
-- Dependencies: 193
-- Data for Name: judicial_officers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district) VALUES (1, '123', 'WB123', 'Rupsa Bose', 'Female', NULL, '1989-03-05', 1, 36, 'Maniktala', 'Amherst Row', 'Amherst Row', '9830982611', NULL, 'rupsa@gmail.com', NULL, 1, 2013, '2018-09-18', '2018-09-20', '2079-09-18', 'rohini.jpg', NULL, NULL, NULL);
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district) VALUES (2, '321', 'WB321', 'ANABIL BHATTACHARYA', 'Male', NULL, '1990-12-29', 1, 13, 'Belghoria', '21/2/1 B.N. Road', '21/2/1 B.N. Road', '9830983011', NULL, 'banabil90@gmail.com', NULL, 2, 2015, '2019-09-18', '2018-09-20', '2081-09-18', 'Rupsa.jpg', NULL, NULL, NULL);
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district) VALUES (3, '1234', 'WB1234', 'ABC', 'M', NULL, '1990-12-29', 51, 48, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '8981660218', NULL, 'banabil901@gmail.com', NULL, 1, 2015, '2018-09-18', '2018-09-18', '2040-09-18', NULL, NULL, NULL, '');
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district) VALUES (12, '150', 'WB150', 'Arpan Kr Roy', 'M', 9, '1990-12-29', 46, NULL, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '1234567891', NULL, 'abcd@gmail.com', NULL, 2, 2019, '2018-09-12', NULL, '2040-12-18', NULL, NULL, NULL, 'Test District');
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district) VALUES (11, '1567', 'WB1567', 'XYZ', 'M', 17, '1990-12-29', 1, NULL, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '1234567890', NULL, 'abc@gmail.com', NULL, 1, 2019, '2018-09-13', NULL, '2045-09-18', '1567_1576521000.jpg', NULL, '2019-12-19 15:51:30', 'Test District');
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district) VALUES (9, '126', 'WB126', 'Abhisek Gayen', 'M', 12, '1990-12-29', 51, 44, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '8981660215', NULL, 'banabil9012@gmail.com', NULL, 2, 2019, '2018-09-18', NULL, '2045-12-29', '126_1576521000.jpg', NULL, '2019-12-18 13:02:41', '');
INSERT INTO public.judicial_officers (id, registration_no, jo_code, officer_name, gender, spouse, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, mobile_no_1, mobile_no_2, email_id_1, email_id_2, recruitment_batch_id, recruitment_batch_year, date_of_joining, date_of_confirmation, date_of_retirement, profile_image, created_at, updated_at, other_home_district) VALUES (17, '2912', 'WB2912', 'Bhatt Anabil', 'M', 11, '1990-12-29', 51, 38, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '7605893512', NULL, 'banabil89@gmail.com', NULL, 2, 2019, '2018-09-18', NULL, '2040-12-29', NULL, NULL, NULL, '');


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

SELECT pg_catalog.setval('public.designations_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.history_deleted_data_id_seq', 1, true);


--
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 224
-- Name: history_updated_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.history_updated_data_id_seq', 15, true);


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

SELECT pg_catalog.setval('public.jo_grades_id_seq', 1, false);


--
-- TOC entry 2546 (class 0 OID 0)
-- Dependencies: 230
-- Name: jo_legal_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_legal_experiences_id_seq', 6, true);


--
-- TOC entry 2547 (class 0 OID 0)
-- Dependencies: 200
-- Name: jo_reportings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_reportings_id_seq', 2, true);


--
-- TOC entry 2548 (class 0 OID 0)
-- Dependencies: 218
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_zone_tenures_id_seq', 6, true);


--
-- TOC entry 2549 (class 0 OID 0)
-- Dependencies: 202
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_posting_preferences_id_seq', 3, true);


--
-- TOC entry 2550 (class 0 OID 0)
-- Dependencies: 198
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_postings_id_seq', 10, true);


--
-- TOC entry 2551 (class 0 OID 0)
-- Dependencies: 194
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_qualifications_id_seq', 7, true);


--
-- TOC entry 2552 (class 0 OID 0)
-- Dependencies: 192
-- Name: judicial_officers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officers_id_seq', 17, true);


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

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 176
-- Name: zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zones_id_seq', 1, false);


-- Completed on 2019-12-23 17:00:16

--
-- PostgreSQL database dump complete
--

