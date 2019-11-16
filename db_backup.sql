--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 9.5.5

-- Started on 2019-11-16 15:36:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2412 (class 0 OID 406385)
-- Dependencies: 223
-- Data for Name: acr_histories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO acr_histories (id, jo_code, judicial_officer_id, grade_id, year, created_by, created_at, updated_at) VALUES (61, 'JO258', 2, 6, 2019, 11, '2019-11-07 00:00:00', '2019-11-07 00:00:00');
INSERT INTO acr_histories (id, jo_code, judicial_officer_id, grade_id, year, created_by, created_at, updated_at) VALUES (62, 'JO258', 2, 1, 2018, 11, '2019-11-07 00:00:00', '2019-11-07 00:00:00');


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 222
-- Name: acr_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('acr_histories_id_seq', 62, true);


--
-- TOC entry 2358 (class 0 OID 398100)
-- Dependencies: 169
-- Data for Name: castes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO castes (id, caste_name, created_by, created_at, updated_at) VALUES (1, 'General', 11, NULL, NULL);
INSERT INTO castes (id, caste_name, created_by, created_at, updated_at) VALUES (2, 'Scheduled Caste', 11, '2019-07-02 06:58:28', '2019-07-02 06:58:28');
INSERT INTO castes (id, caste_name, created_by, created_at, updated_at) VALUES (3, 'Scheduled Tribe', 11, '2019-07-02 07:41:15', '2019-07-03 08:42:41');


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 170
-- Name: castes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('castes_id_seq', 6, true);


--
-- TOC entry 2360 (class 0 OID 398105)
-- Dependencies: 171
-- Data for Name: court_complexes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (8, 'Mraz Ltd', 24.8595149999999983, 91.8884549999999933, 5, 4, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (14, 'Schaefer-Altenwerth', 22.2785019999999996, -79.8903300000000058, 8, 4, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (18, 'Ziemann, Von and Luettgen', 10.8809909999999999, 59.5612429999999975, 11, 4, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (22, 'Zemlak, Nitzsche and Herzog', 68.6196510000000046, 150.824526999999989, 14, 6, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (24, 'Dare-Roob', -46.0030730000000005, -146.407841999999988, 14, 6, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (25, 'Monahan-Corwin', -25.4323300000000003, 17.4266959999999997, 14, 6, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (30, 'Adams-Murazik', -24.2009679999999996, -131.898689999999988, 17, 6, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (33, 'Prohaska LLC', 77.1226970000000023, 22.0210219999999985, 21, 7, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (40, 'Schuppe, Mayert and Kulas', -76.4728020000000015, -47.190330000000003, 22, 7, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (42, 'Breitenberg Group', 39.3450309999999988, -165.894966000000011, 26, 7, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (43, 'Hills, Mertz and Torphy', -85.5495229999999935, -7.20302699999999962, 26, 7, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (45, 'Paucek-Konopelski', 43.3976359999999985, -24.9034499999999994, 26, 8, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (46, 'Walsh Ltd', -72.2693830000000048, 66.7829550000000012, 29, 8, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06', NULL);
INSERT INTO court_complexes (id, court_complex_name, latitude, longitude, district_id, zone_id, created_by, created_at, updated_at, subdivision_id) VALUES (5, 'Tillman, Barton and Durgan', -58.146720000000002, 119.634581999999995, 2, 4, 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04', NULL);


--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 172
-- Name: court_complexes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('court_complexes_id_seq', 50, true);


--
-- TOC entry 2362 (class 0 OID 398110)
-- Dependencies: 173
-- Data for Name: courts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (59, 'Civil Judge Sr  DIV BISHNUPUR', 11, '2019-11-15 17:20:52', '2019-11-15 17:20:52', 76);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (60, 'ACJM BISHNUPUR', 11, '2019-11-15 17:21:23', '2019-11-15 17:21:23', 76);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (8, 'Bardhaman 1st Court', 11, '2019-06-17 06:27:05', '2019-08-03 09:27:25', 51);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (61, 'Civil Judge Jr  DIV COURT BISHNUPUR', 11, '2019-11-15 17:22:00', '2019-11-15 17:22:00', 76);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (34, 'asc', 11, '2019-11-15 16:34:18', '2019-11-15 16:48:00', 57);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (1, 'Darjeeling 1st Court', 11, '2019-06-17 06:27:05', '2019-08-03 09:28:11', 52);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (2, 'Darjeeling 2nd Court', 11, '2019-06-17 06:27:05', '2019-08-03 09:42:18', 51);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (62, 'JM 2nd COURT BISHNUPUR', 11, '2019-11-15 17:22:25', '2019-11-15 17:22:25', 76);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (3, 'Calcutta City Court', 11, '2019-06-17 06:27:05', '2019-08-03 09:19:41', 66);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (13, 'Howrah 2nd Court', 11, '2019-06-17 06:27:05', '2019-08-03 09:30:49', 77);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (14, 'Howrah 1st Court', 11, '2019-06-17 06:27:05', '2019-08-03 09:29:36', 80);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (24, 'North Dinajpur 1st Court', 11, '2019-06-17 06:27:06', '2019-08-03 09:22:33', 56);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (25, 'Bankura 1 st Court', 11, '2019-06-17 06:27:06', '2019-08-03 09:25:14', 67);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (27, 'South Dinajpore', 11, '2019-06-17 06:27:06', '2019-08-03 09:23:52', 81);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (63, 'JM 3rd Court BISHNUPUR', 11, '2019-11-15 17:22:53', '2019-11-15 17:22:53', 76);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (30, 'District Judge BANKURA', 11, '2019-06-17 06:27:06', '2019-11-15 16:52:38', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (35, 'CJM  BANKURA', 11, '2019-11-15 16:54:32', '2019-11-15 16:55:50', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (36, 'CJSD BANKURA', 11, '2019-11-15 16:56:34', '2019-11-15 16:56:34', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (38, 'Civil Judge Jr DIV I BANKURA', 11, '2019-11-15 17:00:54', '2019-11-15 17:00:54', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (37, 'Civil Judge Sr DIV  Additional  Court  BANKURA', 11, '2019-11-15 16:58:42', '2019-11-15 17:02:20', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (39, 'Civil Judge Jr DIV II BANKURA', 11, '2019-11-15 17:02:58', '2019-11-15 17:02:58', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (40, 'Civil Judge Jr DIV Additional Court BANKURA', 11, '2019-11-15 17:03:41', '2019-11-15 17:03:41', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (41, 'JM 3rd COURT BANKURA', 11, '2019-11-15 17:04:13', '2019-11-15 17:04:13', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (42, 'JM 4th COURT BANKURA', 11, '2019-11-15 17:04:33', '2019-11-15 17:04:33', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (43, 'JM 5th COURT BANKURA', 11, '2019-11-15 17:04:47', '2019-11-15 17:04:47', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (44, 'JM 6th Court BANKURA', 11, '2019-11-15 17:05:13', '2019-11-15 17:05:13', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (45, 'JM 7th Court BANKURA', 11, '2019-11-15 17:05:44', '2019-11-15 17:05:44', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (48, 'ADJ 2nd Court BANKURA', 11, '2019-11-15 17:07:40', '2019-11-15 17:07:40', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (49, 'ADJ 3rd Court BANKURA', 11, '2019-11-15 17:08:14', '2019-11-15 17:08:14', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (50, 'ADJ Re Designated Court BANKURA', 11, '2019-11-15 17:08:55', '2019-11-15 17:08:55', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (51, 'ADJ Fast Track Court  BANKURA', 11, '2019-11-15 17:10:22', '2019-11-15 17:10:22', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (52, 'ADJ  KHATRA', 11, '2019-11-15 17:12:57', '2019-11-15 17:12:57', 77);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (53, 'Civil Judge Sr  DIV KHATRA', 11, '2019-11-15 17:13:49', '2019-11-15 17:15:41', 77);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (54, 'Civil Judge Jr  DIV 1st Court KHATRA', 11, '2019-11-15 17:16:33', '2019-11-15 17:16:33', 77);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (46, 'ADJ 1st Court BANKURA', 11, '2019-11-15 17:06:11', '2019-11-15 17:17:38', 75);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (55, 'Civil Judge Jr  DIV 2nd Court KHATRA', 11, '2019-11-15 17:19:00', '2019-11-15 17:19:00', 77);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (56, 'ACJM KHATRA', 11, '2019-11-15 17:19:35', '2019-11-15 17:19:35', 77);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (57, 'JM KHATRA', 11, '2019-11-15 17:19:54', '2019-11-15 17:19:54', 77);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (58, 'ADJ BISHNUPUR', 11, '2019-11-15 17:20:23', '2019-11-15 17:20:23', 76);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (64, 'District Judge BIRBHUM', 11, '2019-11-15 17:23:43', '2019-11-15 17:25:11', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (65, 'ADJ 1st Court BIRBHUM', 11, '2019-11-15 17:25:48', '2019-11-15 17:25:48', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (66, 'ADJ 2nd Court BIRBHUM', 11, '2019-11-15 17:26:50', '2019-11-15 17:26:50', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (67, 'ADJ 3rd Court BIRBHUM', 11, '2019-11-15 17:27:21', '2019-11-15 17:27:21', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (68, 'ADJ 4th Court BIRBHUM', 11, '2019-11-15 17:27:42', '2019-11-15 17:27:42', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (69, 'ADJ FTC Court BIRBHUM', 11, '2019-11-15 17:28:20', '2019-11-15 17:28:40', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (70, 'CJM BIRBHUM', 11, '2019-11-15 17:29:02', '2019-11-15 17:29:02', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (71, 'ACJM BIRBHUM', 11, '2019-11-15 17:29:17', '2019-11-15 17:29:17', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (72, ' Civil Judge Sr DIV BIRBHUM', 11, '2019-11-15 17:30:10', '2019-11-15 17:30:10', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (73, 'Civil Judge Jr DIV Sadar Court BIRBHUM', 11, '2019-11-15 17:31:20', '2019-11-15 17:31:20', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (74, 'Civil Judge Jr DIV Additional Court BIRBHUM', 11, '2019-11-15 17:32:52', '2019-11-15 17:32:52', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (75, 'JM 1st Court BIRBHUM', 11, '2019-11-15 17:33:18', '2019-11-15 17:33:18', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (76, 'JM 2nd Court BIRBHUM', 11, '2019-11-15 17:34:00', '2019-11-15 17:34:00', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (77, 'JM 3rd Court BIRBHUM', 11, '2019-11-15 17:34:18', '2019-11-15 17:34:18', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (78, 'Secretary DLSA BIRBHUM', 11, '2019-11-15 17:34:37', '2019-11-15 17:34:37', 78);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (79, 'ADJ FTC Dubrajpur BIRBHUM', 11, '2019-11-15 17:35:06', '2019-11-15 17:35:35', 81);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (80, 'Civil Judge Jr DIV Court Dubrajpur BIRBHUM', 11, '2019-11-15 17:37:19', '2019-11-15 17:37:19', 81);
INSERT INTO courts (id, court_name, created_by, created_at, updated_at, subdivision_id) VALUES (81, 'JM Dubrajpur BIRBHUM', 11, '2019-11-15 17:37:57', '2019-11-15 17:37:57', 81);


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 174
-- Name: courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('courts_id_seq', 81, true);


--
-- TOC entry 2364 (class 0 OID 398123)
-- Dependencies: 175
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (1, 'Transportation Manager', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (8, 'Tree Trimmer', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (12, 'Real Estate Association Manager', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (14, 'Law Enforcement Teacher', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (6, 'Civil Judge Junior Division', 11, '2019-06-17 06:27:05', '2019-09-27 12:59:46');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (13, 'Civil Judge Junior Division ACP   I', 11, '2019-06-17 06:27:06', '2019-09-27 13:00:27');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (5, 'Civil Judge Junior Division ACP II', 11, '2019-06-17 06:27:05', '2019-09-27 13:00:51');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (19, 'Civil Judge Senior Division', 11, '2019-06-17 06:27:06', '2019-09-27 13:01:07');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (2, 'Civil Judge Senior Division ACP I', 11, '2019-06-17 06:27:05', '2019-09-27 13:01:30');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (3, 'Civil Judge Senior Division ACP II', 11, '2019-06-17 06:27:05', '2019-09-27 13:02:07');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (7, 'District Judge Entry Level', 11, '2019-06-17 06:27:05', '2019-09-27 13:02:25');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (24, 'District Judge Selection Grade', 11, '2019-06-28 10:14:10', '2019-09-27 13:02:45');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (23, 'District Judge Super Time Scale', 11, '2019-06-28 10:12:57', '2019-09-27 13:03:09');
INSERT INTO designations (id, designation_name, created_by, created_at, updated_at) VALUES (25, 'ADJ Fast Track Court', 11, '2019-10-24 08:56:11', '2019-10-24 08:56:11');


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 176
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('designations_id_seq', 25, true);


--
-- TOC entry 2406 (class 0 OID 406309)
-- Dependencies: 217
-- Data for Name: diaries; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO diaries (id, judicial_officer_id, date_of_schedule, description, created_at, updated_at) VALUES (2, 11, '2019-05-07', '<p>HELLO ABC</p>', '2019-09-12 00:00:00', '2019-09-12 00:00:00');
INSERT INTO diaries (id, judicial_officer_id, date_of_schedule, description, created_at, updated_at) VALUES (3, 11, '2019-05-10', '<p>vdzcvd</p>', '2019-09-12 00:00:00', '2019-09-12 00:00:00');
INSERT INTO diaries (id, judicial_officer_id, date_of_schedule, description, created_at, updated_at) VALUES (5, 14, '2019-05-31', '<p>

CHANDRAYAN II

<br></p>', '2019-09-12 00:00:00', '2019-09-12 00:00:00');
INSERT INTO diaries (id, judicial_officer_id, date_of_schedule, description, created_at, updated_at) VALUES (7, 14, '2019-05-02', '<p>HSSJH</p>', '2019-09-12 00:00:00', '2019-09-12 00:00:00');
INSERT INTO diaries (id, judicial_officer_id, date_of_schedule, description, created_at, updated_at) VALUES (8, 14, '2019-05-08', '<p>HSSJH</p>', '2019-09-12 00:00:00', '2019-09-12 00:00:00');
INSERT INTO diaries (id, judicial_officer_id, date_of_schedule, description, created_at, updated_at) VALUES (9, 14, '2019-05-11', '<p>CHANDRAYAN II</p>', '2019-09-12 00:00:00', '2019-09-12 00:00:00');
INSERT INTO diaries (id, judicial_officer_id, date_of_schedule, description, created_at, updated_at) VALUES (10, 14, '2019-09-10', '<p>abcd12345</p>', '2019-09-13 00:00:00', '2019-09-13 00:00:00');
INSERT INTO diaries (id, judicial_officer_id, date_of_schedule, description, created_at, updated_at) VALUES (11, 11, '2019-09-23', 'hello', '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO diaries (id, judicial_officer_id, date_of_schedule, description, created_at, updated_at) VALUES (12, 11, '2019-01-01', 'Hello World !!', '2019-11-02 00:00:00', '2019-11-02 00:00:00');
INSERT INTO diaries (id, judicial_officer_id, date_of_schedule, description, created_at, updated_at) VALUES (13, 11, '2019-11-12', 'HELLO SIR', '2019-11-15 00:00:00', '2019-11-15 00:00:00');


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 216
-- Name: diaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('diaries_id_seq', 13, true);


--
-- TOC entry 2366 (class 0 OID 398128)
-- Dependencies: 177
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (4, 'West Alexys', 7, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (11, 'West Elta', 17, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (12, 'Trantowborough', 17, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (15, 'South Nathanaelview', 24, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (17, 'Zboncakfort', 30, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (18, 'West Magnusview', 30, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (20, 'West Monteborough', 31, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (21, 'South Westleyborough', 31, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (36, 'Kolkata', 51, 11, '2019-07-10 06:27:59', '2019-07-10 06:27:59');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (2, 'East Midnapure', 2, 11, '2019-06-17 06:27:04', '2019-08-05 05:46:51');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (14, 'West Burdwan', 24, 11, '2019-06-17 06:27:05', '2019-08-05 05:47:25');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (26, 'Howrah', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:47:53');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (28, 'Hoogly', 48, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:03');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (25, 'Bankura', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:21');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (5, 'Purulia', 7, 11, '2019-06-17 06:27:05', '2019-08-05 05:48:47');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (27, 'Birbhum', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:49:09');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (8, 'South Dinajpur', 11, 11, '2019-06-17 06:27:05', '2019-08-05 05:50:41');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (22, 'Alipure duar', 38, 11, '2019-06-17 06:27:06', '2019-08-05 05:54:08');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (10, 'Darjeeling', 17, 11, '2019-06-17 06:27:05', '2019-08-05 05:55:27');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (7, 'Kalimpong', 11, 11, '2019-06-17 06:27:05', '2019-08-05 05:56:54');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (6, 'Malda', 8, 11, '2019-06-17 06:27:05', '2019-08-05 05:51:22');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (38, 'North 24 Parganas', 51, 11, '2019-11-11 12:26:13', '2019-11-11 12:26:13');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (13, 'South 24 Parganas', 24, 11, '2019-06-17 06:27:05', '2019-11-11 12:28:19');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (40, 'Purba Bardhaman', 51, 11, '2019-11-11 13:19:11', '2019-11-11 13:19:11');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (41, 'Paschim Bardhaman', 51, 11, '2019-11-11 13:19:29', '2019-11-11 13:19:29');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (42, 'Jhargram', 51, 11, '2019-11-11 13:19:58', '2019-11-11 13:19:58');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (43, 'Paschim Medinipur', 51, 11, '2019-11-11 13:20:14', '2019-11-11 13:20:14');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (44, 'Murshidabad', 51, 11, '2019-11-11 13:20:46', '2019-11-11 13:20:46');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (45, 'Purba Medinipur', 51, 11, '2019-11-11 13:30:59', '2019-11-11 13:30:59');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (46, 'Nadia', 51, 11, '2019-11-11 13:31:32', '2019-11-11 13:31:32');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (47, 'Cooch Behar', 51, 11, '2019-11-11 13:32:34', '2019-11-11 13:32:34');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (48, 'Jalpaiguri', 51, 11, '2019-11-11 13:42:40', '2019-11-11 13:42:40');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (29, 'U Dinajpur', 48, 11, '2019-06-17 06:27:06', '2019-11-11 13:54:30');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (49, 'D Dinajpur', 51, 11, '2019-11-11 14:00:30', '2019-11-11 14:00:30');
INSERT INTO districts (id, district_name, state_id, created_by, created_at, updated_at) VALUES (50, 'Andaman and Nicobar Island', 75, 11, '2019-11-11 14:07:53', '2019-11-11 14:07:53');


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 178
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('districts_id_seq', 50, true);


--
-- TOC entry 2410 (class 0 OID 406372)
-- Dependencies: 221
-- Data for Name: grade_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (1, 'Good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (2, 'Average', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (3, 'Very Good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (4, 'Outstanding', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (5, 'Poor', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (6, 'A', 11, '2019-09-27 00:00:00', '2019-09-27 00:00:00');
INSERT INTO grade_details (id, grade_name, created_by, created_at, updated_at) VALUES (7, 'B', 11, '2019-09-27 00:00:00', '2019-09-27 00:00:00');


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 220
-- Name: grade_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('grade_details_id_seq', 7, true);


--
-- TOC entry 2368 (class 0 OID 398133)
-- Dependencies: 179
-- Data for Name: hc_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (1, 'AA', 'ARBRITATION APPL.', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (2, 'ABWA', 'APPL.UND.BENGAL WAKFS ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (3, 'AC', 'AWARD CASES', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (4, 'ACA', 'APPL.UNDER CHARTERED ACCOUNTANTS ACT, 1949', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (5, 'ACO', 'PET. IN COMP. APPL.', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (6, 'ACR', 'APPL.UND.CHARITABLE & RELIGIOUS TRUST ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (7, 'ACRP', 'APPL.UND.SEC.151 OF THE CR.P.C.', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (8, 'ACWA', 'APPL.UND.SEC 21 COST&WORKS ACCOUNTACTS ACT, 1959', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (9, 'AED', 'APPL. U/S. 64 OF ESTATE DUTY ACT, 1953', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (10, 'AET', 'APPL. U/S 25 OF EXPENDITURE TAX ACT, 1957', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (11, 'AFP', 'APPL.FOR LEAVE TO SUE AS AN INDIGENT PERSON', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (12, 'AGA', 'APPL.UND.SEC.25 OF ADMINISTRATOR GENERALS'' ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (13, 'AGL', 'APPL.FOR APPOINTMENT OF GUARDIAN-AD-LITEM', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (14, 'AGT', 'APPL. U/S 26 GIFT TAX ACT, 1958', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (15, 'AGWA', 'APPL.UND.GUARDIANS & WARDS ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (16, 'AHC', 'HABEAS CORPUS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (17, 'AID', 'APPL. UNDER PATENTS & DESIGNS ACT, 1970', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (18, 'AIDR', 'APPL.UND.INDUSTRIAL DEVELOPMENT REGULATION ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (19, 'AIFC', 'APPL.UND.INDUSTRIAL FINANCE CORP. ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (20, 'AIRB', 'APPN.RECON.BANK OF I', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (21, 'ALP', 'APPL.UND.CLAUSE 13 OF LETTERS PATENT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (22, 'ALP.ITL', 'APPL. UNDER CLAUSE 17 OF THE LETTERS PATENT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (23, 'ALPII', 'APPL.UND.CLAUSE 17 L', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (24, 'ALPITL', 'APPL.CLAUSE-17 LP', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (25, 'AOR', 'CALCUTTA OFFICIAL RECEIVER''S ACT 1938', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (26, 'AORC', 'APPLICATION OMNIBUS RESIDUARY CLASS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (27, 'AOT', 'APPL.UND.OFFICIAL TRUSTEES ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (28, 'AP', 'ARBITRATION PETITION', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (29, 'APD', 'APPEAL FROM DECREE', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (30, 'APDT', 'APP. FR. DECR. TEND.', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (31, 'APO', 'APPEAL FROM ORDER', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (32, 'APOT', 'TEMP APO', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (33, 'AS', 'ADMIRALITY  SUITS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (34, 'ASCI', 'APPL.FOR LEAVE TO APPEAL TO THE SUPREME COURT OF INDIA', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (35, 'ASFC', 'APPL.UND.STAE FINANCIAL CORP. ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (36, 'ASM', 'APPL.SANCHAITA MATTERS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (37, 'ATA', 'APPL.UNDER TRUST ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (38, 'ATM', 'APPL.UND.TRADE&MERCHANDISE MARKS, ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (39, 'AUDA', 'APPL.UND.UNCLAIMED DEPOSITS ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (40, 'AWT', 'APPL. U/S 27 OF WEALTH TAX ACT, 1957', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (41, 'BBA', 'APPL.UND.BANKERS BOOKS EVIDENCE ACT, 1891', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (42, 'BIFR', 'BIFR', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (43, 'CA', 'COMPANY APPLICATION', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (44, 'CAA', 'COMMISSIONER OF PATENT APPEAL', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (45, 'CC', 'CONTEMPT OF COURT CASES', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (46, 'CEXA', 'APPL.UND.CENTRAL EXCISE ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (47, 'CHS', 'CHAMBER SUMMONS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (48, 'CP', 'COMPANY PETITIONS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (49, 'CPA', 'COMMISSIONER OF PATE', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (50, 'CRA', 'COPYRIGHT APPEAL', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (51, 'CRCC', 'CRIMINAL CONTEMPT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (52, 'CS', 'CIVIL SUITS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (53, 'CS(O)', 'CIVIL SUIT(OLD)', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (54, 'CSOS', 'CIVIL SUIT ORIGINATING SUMMONS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (55, 'CUSTA', 'APPL.UND.CUSTOMS ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (56, 'DM', 'UND.CHAPTER V OF O.S. RULES', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (57, 'EC', 'EXECUTION CASES', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (58, 'EOPLA', 'EXTRA ORDINARY PROBATE PROCEEDINGS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (59, 'EOS', 'EXTRA ORDINARY SUITS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (60, 'EP', 'ELEC.PET.(PEOPLES REPRESENTATION ACT, 1951)', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (61, 'FEA', 'FOREIGN EXCHANGE APPEAL', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (62, 'FERA', 'APPL.UND.FOREIGN EXCHANGE REGULATION ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (63, 'GCAL', 'APPL.UND.GOLD CONTROL ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (64, 'IC', 'INSOLVENCY CASES', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (65, 'ICA', 'APPL.UNDER INDIAN COMPANIES ACT, 1913', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (66, 'IP', 'IT.PET.256(2)IT''61', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (67, 'ITA', 'INCOME TAX APPEAL', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (68, 'ITAT', 'INCOME TAX APPEAL TENDERED', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (69, 'ITP', 'INCOME TAX PET.(U/S. 256 (2) OF I.T. ACT, 1961)', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (70, 'ITR', 'INCOMETAX REF.SEC.256 (1) OF I.T. ACT, 1961', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (71, 'LM', 'LUNATIC MATTERS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (72, 'LPA', 'LETTERS PATENT APPEAL', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (73, 'MM', 'MISFEAOUCE MATTERS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (74, 'MS', 'MATRIMONIAL SUITS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (75, 'NM', 'NOTICE OF MOTION', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (76, 'OCO', 'ORIGINAL SIDE CROSS OBJECTION', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (77, 'OCOT', 'ORIGINAL SIDE CROSS OBJECTION TENDER', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (78, 'OTS', 'ORDINANCE TRANSFER SUITS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (79, 'PLA', 'APPL.FOR PROBATE & LETTERS OF ADMINISTRATION', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (80, 'PLR', 'UND.CHPT.XXXI-A OF O.S. RULES', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (81, 'PMS', 'PARSI MATRIMONIAL SUITS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (82, 'REF', 'REFERENCE CASE', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (83, 'RVWO', 'MEMORANDUM OF REVIEWS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (84, 'SALT', 'APPL.UND.SALT ACT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (85, 'SANA', 'SANCHAITA APPEAL', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (86, 'SCO', 'SPECIAL CASE FOR OPINION OF COURT', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (87, 'SESS', 'SESSIONS CASES', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (88, 'SS', 'SPECIAL SUITS(SEC 20 OF THE ARBITRATION ACT, 1940', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (89, 'T', 'TEMP A(1)', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (90, 'TBCS', 'TRANSFERRED BANKING COMPANIES SUITS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (91, 'TCS', 'TRANSFERRED COMPANY SUITS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (92, 'TMA', 'TRADE MARK APPEAL', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (93, 'TS', 'TESTAMENTERY SUITS', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (94, 'TUA', 'TRADE UNION APPEAL', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (95, 'WPO', 'WRIT PETITION', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (96, 'WP.CT', 'WP(CENTRAL ADMIN TRIBUNAL)', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (97, 'WP.ST', 'WP(STATE ADMIN TRIBUNAL)', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (98, 'WP.TT', 'WP(WB TAX TRIBUNAL)', NULL, NULL);
INSERT INTO hc_case_types (id, type_name, full_form, created_at, updated_at) VALUES (99, 'WPCR', 'WRIT PETITION(CIVIL RULE)', NULL, NULL);


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 180
-- Name: hc_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('hc_case_types_id_seq', 1, false);


--
-- TOC entry 2370 (class 0 OID 398141)
-- Dependencies: 181
-- Data for Name: jo_photos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO jo_photos (id, judicial_officer_id, photo, created_at, updated_at) VALUES (13, 14, NULL, NULL, NULL);


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 182
-- Name: jo_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('jo_photos_id_seq', 14, true);


--
-- TOC entry 2408 (class 0 OID 406325)
-- Dependencies: 219
-- Data for Name: jo_reporting_reviewings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO jo_reporting_reviewings (id, judicial_officer_id, reporting_officer_id, reviewing_officer_id, from_date, to_date, created_by, created_at, updated_at) VALUES (1, 2, 14, 11, '2012-09-19', '2017-09-19', 11, NULL, NULL);
INSERT INTO jo_reporting_reviewings (id, judicial_officer_id, reporting_officer_id, reviewing_officer_id, from_date, to_date, created_by, created_at, updated_at) VALUES (2, 14, 2, 11, '2012-09-19', '2017-09-19', 11, NULL, NULL);
INSERT INTO jo_reporting_reviewings (id, judicial_officer_id, reporting_officer_id, reviewing_officer_id, from_date, to_date, created_by, created_at, updated_at) VALUES (3, 14, 11, 2, '2010-09-19', '2012-09-19', 11, NULL, NULL);


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 218
-- Name: jo_reporting_reviewings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('jo_reporting_reviewings_id_seq', 1, false);


--
-- TOC entry 2416 (class 0 OID 430969)
-- Dependencies: 227
-- Data for Name: jo_zone_tenures; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_by, created_at, updated_at) VALUES (1, 11, 6, '2017-01-10', '2018-07-11', 11, NULL, NULL);
INSERT INTO jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_by, created_at, updated_at) VALUES (2, 11, 7, '2018-07-11', NULL, 11, NULL, NULL);
INSERT INTO jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_by, created_at, updated_at) VALUES (3, 2, 7, '2019-09-18', NULL, 11, NULL, NULL);
INSERT INTO jo_zone_tenures (id, judicial_officer_id, zone_id, from_date, to_date, created_by, created_at, updated_at) VALUES (4, 2, 4, '2018-01-10', '2018-09-17', 11, NULL, NULL);


--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 226
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('jo_zone_tenures_id_seq', 1, false);


--
-- TOC entry 2414 (class 0 OID 422756)
-- Dependencies: 225
-- Data for Name: judicial_officer_posting_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (9, 14, 5, NULL, 14, '2018-11-04 07:09:37', '2018-11-04 07:09:37');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (14, 14, 3, NULL, 14, '2019-11-04 10:53:17', '2019-11-04 10:53:17');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (15, 14, 10, NULL, 14, '2019-11-04 10:53:17', '2019-11-04 10:53:17');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (16, 14, 2, NULL, 14, '2019-11-04 11:07:38', '2019-11-04 11:07:38');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (17, 14, 3, NULL, 14, '2019-11-04 11:07:38', '2019-11-04 11:07:38');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (18, 14, 3, NULL, 14, '2019-11-04 11:10:38', '2019-11-04 11:10:38');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (19, 14, 6, NULL, 14, '2019-11-04 11:10:38', '2019-11-04 11:10:38');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (10, 11, 2, NULL, 14, '2019-11-04 07:36:59', '2019-11-04 07:36:59');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (11, 11, 10, NULL, 14, '2019-11-04 07:36:59', '2019-11-04 07:36:59');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (12, 11, 2, NULL, 14, '2020-11-04 10:10:10', '2019-11-04 10:10:10');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (13, 11, 3, NULL, 14, '2020-11-04 10:10:10', '2019-11-04 10:10:10');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (20, 14, 3, NULL, 14, '2019-11-04 12:35:07', '2019-11-04 12:35:07');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (22, 14, 2, NULL, 14, '2019-11-04 12:44:23', '2019-11-04 12:44:23');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (23, 14, 6, NULL, 14, '2019-11-04 12:44:23', '2019-11-04 12:44:23');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (24, 14, 2, NULL, 14, '2019-11-05 05:54:24', '2019-11-05 05:54:24');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (25, 14, 3, NULL, 14, '2019-11-05 05:54:24', '2019-11-05 05:54:24');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (26, 14, 3, NULL, 14, '2019-11-05 06:41:22', '2019-11-05 06:41:22');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (27, 14, 10, NULL, 14, '2019-11-05 06:41:22', '2019-11-05 06:41:22');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (28, 14, 2, NULL, 14, '2019-11-05 06:54:03', '2019-11-05 06:54:03');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (29, 14, 3, NULL, 14, '2019-11-05 06:54:03', '2019-11-05 06:54:03');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (30, 14, 2, NULL, 14, '2019-11-05 06:58:44', '2019-11-05 06:58:44');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (31, 14, 3, NULL, 14, '2019-11-05 06:58:44', '2019-11-05 06:58:44');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (32, 14, 2, NULL, 14, '2019-11-05 07:27:34', '2019-11-05 07:27:34');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (33, 14, 3, NULL, 14, '2019-11-05 07:27:34', '2019-11-05 07:27:34');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (34, 14, 2, NULL, 14, '2019-11-05 15:05:28', '2019-11-05 15:05:28');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (35, 14, 3, NULL, 14, '2019-11-05 15:05:28', '2019-11-05 15:05:28');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (36, 14, 2, NULL, 14, '2019-11-05 15:45:55', '2019-11-05 15:45:55');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (37, 14, 3, NULL, 14, '2019-11-05 15:45:55', '2019-11-05 15:45:55');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (38, 14, 2, NULL, 14, '2019-11-05 15:57:23', '2019-11-05 15:57:23');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (39, 14, 3, NULL, 14, '2019-11-05 15:57:23', '2019-11-05 15:57:23');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (40, 14, 3, NULL, 14, '2019-11-05 15:58:14', '2019-11-05 15:58:14');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (41, 14, 7, NULL, 14, '2019-11-05 15:58:14', '2019-11-05 15:58:14');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (42, 14, 1, NULL, 14, '2019-11-05 16:00:00', '2019-11-05 16:00:00');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (43, 14, 3, NULL, 14, '2019-11-05 16:00:00', '2019-11-05 16:00:00');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (44, 14, 6, NULL, 14, '2019-11-05 16:10:41', '2019-11-05 16:10:41');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (45, 14, 7, NULL, 14, '2019-11-05 16:10:41', '2019-11-05 16:10:41');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (46, 14, 6, NULL, 14, '2019-11-05 16:23:25', '2019-11-05 16:23:25');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (47, 14, 7, NULL, 14, '2019-11-05 16:23:25', '2019-11-05 16:23:25');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (48, 14, 10, 'frd', 14, '2019-11-05 16:24:44', '2019-11-05 16:24:44');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (49, 14, 6, 'frd', 14, '2019-11-05 16:24:44', '2019-11-05 16:24:44');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (21, 14, 6, 'frd', 14, '2019-11-04 12:35:07', '2019-11-04 12:35:07');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (6, 14, 1, 'frd', 14, '2017-11-04 06:52:44', '2019-11-04 06:52:44');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (7, 14, 2, 'frd', 14, '2017-11-04 06:52:44', '2019-11-04 06:52:44');
INSERT INTO judicial_officer_posting_preferences (id, judicial_officer_id, zone_id, remarks, created_by, created_at, updated_at) VALUES (8, 14, 10, 'frd', 14, '2018-11-04 07:09:37', '2018-11-04 07:09:37');


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 224
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officer_posting_preferences_id_seq', 49, true);


--
-- TOC entry 2372 (class 0 OID 398159)
-- Dependencies: 183
-- Data for Name: judicial_officer_postings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (6, 12, 3, 1, 1, '2015-02-05', '2017-02-04', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (1, 12, 1, 30, 1, '2017-02-05', NULL, 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (3, 11, 8, 27, 2, '2014-04-05', '2014-11-24', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (10, 11, 1, 1, 1, '2015-02-05', '2015-07-23', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (11, 11, 25, 13, 9, '2015-08-24', '2016-01-23', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (12, 11, 7, 30, 9, '2016-01-24', '2017-01-01', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (5, 13, 7, 24, 2, '2015-03-05', '2016-03-04', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (2, 11, 2, 14, 2, '2014-12-01', '2015-02-05', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (4, 11, 7, 25, 2, '2014-03-05', '2014-03-24', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (9, 2, 7, 14, 1, '2019-09-18', NULL, 11, '2019-09-11 10:58:05', '2019-09-11 10:58:05');
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (8, 2, 2, 24, 1, '2018-01-10', '2018-09-17', 11, '2019-09-11 10:58:05', '2019-09-11 10:58:05');
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (13, 11, 13, 14, 2, '2017-01-10', '2018-07-11', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (15, 11, 8, 24, 1, '2019-07-26', NULL, 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (16, 2, 8, 27, 2, '2017-02-17', '2018-01-18', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (17, 2, 2, 14, 9, '2017-02-10', '2018-01-10', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (18, 2, 13, 30, 9, '2016-07-05', '2017-02-10', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (7, 14, 13, 30, 9, '2017-02-10', '2018-09-11', 11, '2019-09-11 10:58:05', '2019-09-11 10:58:05');
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (19, 14, 7, 14, 1, '2018-10-15', '2019-10-09', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (20, 14, 8, 27, 2, '2016-02-10', '2017-02-10', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (21, 14, 1, 1, 1, '2015-03-10', '2016-02-10', 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (22, 14, 7, 30, 9, '2019-10-09', NULL, 11, NULL, NULL);
INSERT INTO judicial_officer_postings (id, judicial_officer_id, designation_id, court_id, mode_id, from_date, to_date, created_by, created_at, updated_at) VALUES (14, 11, 25, 27, 2, '2018-07-11', '2019-07-25', 11, NULL, NULL);


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 184
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officer_postings_id_seq', 9, true);


--
-- TOC entry 2404 (class 0 OID 398763)
-- Dependencies: 215
-- Data for Name: judicial_officer_qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_by, created_at, updated_at) VALUES (1, 2, 8, 2019, 11, '2019-09-09 09:43:19', '2019-09-09 09:43:19');
INSERT INTO judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_by, created_at, updated_at) VALUES (14, 14, 8, 2019, 11, '2019-09-11 10:58:05', '2019-09-11 10:58:05');
INSERT INTO judicial_officer_qualifications (id, judicial_officer_id, qualification_id, passing_year, created_by, created_at, updated_at) VALUES (15, 14, 7, 1987, 11, '2019-09-11 10:58:05', '2019-09-11 10:58:05');


--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 214
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officer_qualifications_id_seq', 15, true);


--
-- TOC entry 2402 (class 0 OID 398697)
-- Dependencies: 213
-- Data for Name: judicial_officers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO judicial_officers (id, jo_code, officer_name, gender, guardian_name, gurdian_relation, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, religion_id, category_id, blood_group, identification_mark, aadhaar_no, pan_no, gpf_no, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, recruitment_batch_id, date_of_joining, date_of_confirmation, date_of_retirement, present_reporting_officer_id, present_reviewing_officer_id, created_at, updated_at) VALUES (2, 'JO258', 'Kallol Chattopadhyay', 'M', 'Mr Chattopadhyay', 'Father', '1967-09-09', 51, 36, 'Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', '21/2/1, B.N.Ghosal Road
Rajani Apartment, Flat-3
Belghoria', 1, 1, 'A+', 'mole on left throat', '464646464646', '6556      ', '123456789', '8981660217', NULL, NULL, 'abc@gmail.com', NULL, NULL, 1, '1972-01-01', '1975-01-01', '2019-09-09', NULL, NULL, NULL, '2019-09-11 06:26:02');
INSERT INTO judicial_officers (id, jo_code, officer_name, gender, guardian_name, gurdian_relation, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, religion_id, category_id, blood_group, identification_mark, aadhaar_no, pan_no, gpf_no, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, recruitment_batch_id, date_of_joining, date_of_confirmation, date_of_retirement, present_reporting_officer_id, present_reviewing_officer_id, created_at, updated_at) VALUES (11, 'JO007', 'Rupsa Bose', 'f', 'Pradip  Kumar Bose', 'Father', '1989-03-05', 51, 7, 'Kolkata', 'Ia 26 saltlake sector 3', 'Ia 26 saltlake sector 3', 1, 1, 'O+', NULL, NULL, NULL, NULL, '09830982611', NULL, NULL, 'rupsa2494@gmail.com', NULL, NULL, 8, '2018-09-19', '2018-10-19', '2079-09-19', NULL, NULL, '2019-09-12 07:09:54', '2019-09-12 07:09:54');
INSERT INTO judicial_officers (id, jo_code, officer_name, gender, guardian_name, gurdian_relation, date_of_birth, home_state_id, home_district_id, hometown, present_address, permanent_address, religion_id, category_id, blood_group, identification_mark, aadhaar_no, pan_no, gpf_no, mobile_no_1, mobile_no_2, mobile_no_3, email_id_1, email_id_2, email_id_3, recruitment_batch_id, date_of_joining, date_of_confirmation, date_of_retirement, present_reporting_officer_id, present_reviewing_officer_id, created_at, updated_at) VALUES (14, 'WB123', 'Subhendu Bhattacharya', 'M', 'Sumitava Das', 'f', '2019-09-11', 31, 20, 'sdffd', 'fdgdfgdfgd g 
gdd 
fdg d', 'fdgdfgdfgd g 
gdd 
fdg d', 1, 1, 'A+', 'mole on left throat', '464646464647', '6557      ', '223456789', '9876543210', '9876543210', '9876543210', 'daasd@sddsd.cxsdf', 'daasd@sddsd.cxsdf', 'daasd@sddsd.cxsdf', 8, '2019-09-11', '2019-09-11', '2019-09-11', NULL, NULL, NULL, '2019-09-12 06:27:46');


--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 212
-- Name: judicial_officers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('judicial_officers_id_seq', 15, true);


--
-- TOC entry 2374 (class 0 OID 398177)
-- Dependencies: 185
-- Data for Name: lcr_hc_ends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (8, 2, 5, 1, 1, 200, 2011, '2019-08-23', 11, NULL, NULL);
INSERT INTO lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (17, 2, 5, 1, 1, 123, 2018, '2019-08-21', 11, NULL, NULL);
INSERT INTO lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (9, 22, 40, 3, 7, 1000, 2005, '2019-08-25', 11, NULL, NULL);
INSERT INTO lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (10, 22, 40, 3, 1, 3000, 2019, '2019-08-31', 11, NULL, NULL);
INSERT INTO lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (13, 22, 40, 3, 8, 2200, 2018, '2019-08-21', 11, NULL, NULL);
INSERT INTO lcr_hc_ends (id, district, complex, court, hc_case_record, hc_case_no, hc_case_year, deadline, created_by, created_at, updated_at) VALUES (16, 22, 40, 8, 1, 2222, 2018, '2019-08-30', 11, NULL, NULL);


--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 186
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lcr_hc_ends_id_seq', 17, true);


--
-- TOC entry 2376 (class 0 OID 398182)
-- Dependencies: 187
-- Data for Name: lcr_lc_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (7, 8, 52, 111, 2018, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (8, 8, 58, 222, 2017, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (9, 8, 9, 333, 2016, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (10, 9, 52, 111, 2018, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (11, 9, 58, 222, 2017, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (12, 10, 1, 111, 2019, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (13, 10, 5, 222, 2010, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (14, 10, 59, 333, 2016, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (15, 10, 5, 444, 2006, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (16, 13, 52, 222, 2019, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (17, 13, 55, 333, 2018, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (18, 16, 1, 2, 2018, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (19, 16, 6, 3, 2017, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (20, 17, 58, 258, 2018, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (21, 17, 52, 753, 2018, 11, NULL, NULL);
INSERT INTO lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, created_by, created_at, updated_at) VALUES (22, 17, 1, 741, 2017, 11, NULL, NULL);


--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 188
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lcr_lc_details_id_seq', 22, true);


--
-- TOC entry 2378 (class 0 OID 398187)
-- Dependencies: 189
-- Data for Name: lower_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (52, 'Act 39', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (1, 'Act Viii Miscellaneous Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (51, 'Act Xiv', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (58, 'Bail', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (59, 'CEX - Excise Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (3, 'Civil Appeal', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (4, 'Civil Execution', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (5, 'Civil Misc', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (6, 'Civil Revision', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (7, 'Complaint Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (55, 'C R Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (8, 'Criminal Appeal', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (9, 'Criminal Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (11, 'Criminal Misc Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (12, 'Criminal Revision', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (10, 'Crl. Execution - Criminal Execution', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (23, 'Divorce On Mutual Consent - Matri Suit Divorce Mutual Cons', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (13, 'Electricity Act', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (14, 'Estate Acquisition Appeal', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (16, 'Gr Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (17, 'Hindu Adapt. and Maint Act - Hindu Adapt. and Maint Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (18, 'Insolvancy Petition', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (19, 'L A C - Land Acquisition Cases', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (20, 'L A Ex. - Land Acquisition Execution', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (53, 'L A Suit', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (21, 'M A C C - M.A.C.C', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (22, 'M A C C Ex. - MACC Execution', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (36, 'Maintenance Case - MR case for Maintenance', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (24, 'Matrimonial Suit', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (25, 'Mc - Misc Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (54, 'M C Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (29, 'Misc. Appeal', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (26, 'Misc Case (pre-emption)', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (30, 'Misc. Criminal Revision', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (27, 'Misc Crl Case - Misc Criminal Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (31, 'Misc. Execution Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (57, 'Misc Petition (156) - Misc Petition', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (28, 'Mjc - Misc Judicial Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (32, 'Money Appeal', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (33, 'Money Execution', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (34, 'Money Suit', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (35, 'M V Act - Motor Vehicle Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (37, 'N D P S Case - NDPS Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (38, 'NGR Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (39, 'Other Appeal', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (40, 'Other Suit', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (41, 'Probate Suit', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (15, 'S C C Ex. - Execution', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (42, 'S C C Suit - SCC SUIT', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (43, 'Sessions Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (44, 'Sessions Trial', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (45, 'Special Court Cases', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (46, 'Succession Case', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (47, 'Title Appeal', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (48, 'Title Execution', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (49, 'Title Suit', NULL, NULL);
INSERT INTO lower_case_types (id, type_name, created_at, updated_at) VALUES (50, 'Trust Suit', NULL, NULL);


--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 190
-- Name: lower_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lower_case_types_id_seq', 1, false);


--
-- TOC entry 2380 (class 0 OID 398192)
-- Dependencies: 191
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
INSERT INTO migrations (id, migration, batch) VALUES (593, '2019_06_13_093750_create_modes_table', 1);
INSERT INTO migrations (id, migration, batch) VALUES (596, '2019_06_13_093852_create_judicial_officer_postings_table', 2);
INSERT INTO migrations (id, migration, batch) VALUES (602, '2019_07_15_072014_alter_users', 6);
INSERT INTO migrations (id, migration, batch) VALUES (605, '2019_08_13_091522_create_lcr_hc_ends_table', 8);
INSERT INTO migrations (id, migration, batch) VALUES (606, '2019_08_13_091810_create_lcr_lc_details_table', 8);
INSERT INTO migrations (id, migration, batch) VALUES (607, '2019_08_13_101720_create_hc_case_types_table', 8);
INSERT INTO migrations (id, migration, batch) VALUES (608, '2019_08_13_102950_create_lower_case_types_table', 8);
INSERT INTO migrations (id, migration, batch) VALUES (609, '2014_10_10_000000_create_user_types_table', 9);
INSERT INTO migrations (id, migration, batch) VALUES (610, '2019_06_12_000110_create_jo_photos_table', 10);
INSERT INTO migrations (id, migration, batch) VALUES (612, '2019_06_12_000100_create_judicial_officers_table', 11);
INSERT INTO migrations (id, migration, batch) VALUES (613, '2019_06_13_091801_create_judicial_officer_qualifications_table', 12);
INSERT INTO migrations (id, migration, batch) VALUES (615, '2019_07_22_064308_create_diaries_table', 13);
INSERT INTO migrations (id, migration, batch) VALUES (616, '2019_06_13_092954_create_jo_reporting_reviewings_table', 14);
INSERT INTO migrations (id, migration, batch) VALUES (617, '2019_09_24_102032_create_grade_details_table', 15);
INSERT INTO migrations (id, migration, batch) VALUES (618, '2019_09_24_102258_create_acr_histories_table', 15);
INSERT INTO migrations (id, migration, batch) VALUES (619, '2019_06_13_101842_create_judicial_officer_posting_preferences_table', 16);
INSERT INTO migrations (id, migration, batch) VALUES (622, '2019_11_14_163154_create_jo_zone_tenures_table', 18);


--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 192
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('migrations_id_seq', 622, true);


--
-- TOC entry 2382 (class 0 OID 398197)
-- Dependencies: 193
-- Data for Name: modes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO modes (id, posting_mode, created_by, created_at, updated_at) VALUES (1, 'Transfer', 11, NULL, NULL);
INSERT INTO modes (id, posting_mode, created_by, created_at, updated_at) VALUES (2, 'Promotion', 11, NULL, NULL);
INSERT INTO modes (id, posting_mode, created_by, created_at, updated_at) VALUES (9, 'Deputation1', 11, '2019-07-01 11:24:25', '2019-07-01 11:24:38');


--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 194
-- Name: modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('modes_id_seq', 9, true);


--
-- TOC entry 2384 (class 0 OID 398202)
-- Dependencies: 195
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO password_resets (email, token, created_at) VALUES ('banabil90@gmail.com', '$2y$10$SyYTnMAUdAWOtCMHLjPKfesTpVjIb6WaogBUga8vayAjqzc73hvjS', '2019-06-19 06:04:48');


--
-- TOC entry 2385 (class 0 OID 398208)
-- Dependencies: 196
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (5, 'BCom', 11, '2019-06-25 07:18:30', '2019-06-25 07:18:30');
INSERT INTO qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (7, 'MA LLB', 11, '2019-06-25 07:18:47', '2019-06-25 07:18:47');
INSERT INTO qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (8, 'BA LLB', 11, '2019-06-28 09:50:19', '2019-07-01 10:14:25');
INSERT INTO qualifications (id, qualification_name, created_by, created_at, updated_at) VALUES (10, 'M.Sc', 11, '2019-07-01 11:25:58', '2019-07-01 11:27:09');


--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 197
-- Name: qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('qualifications_id_seq', 10, true);


--
-- TOC entry 2387 (class 0 OID 398213)
-- Dependencies: 198
-- Data for Name: recruitment_batches; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (5, 'psc 2011', 2011, 11, '2019-06-26 11:49:37', '2019-06-26 11:49:37');
INSERT INTO recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (8, 'CLAT 2011', 2003, 11, '2019-06-26 11:55:19', '2019-06-26 11:57:00');
INSERT INTO recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) VALUES (1, 'PSC 2000', 2000, 11, NULL, '2019-06-29 08:58:19');


--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 199
-- Name: recruitment_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recruitment_batches_id_seq', 14, true);


--
-- TOC entry 2389 (class 0 OID 398218)
-- Dependencies: 200
-- Data for Name: religions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO religions (id, religion_name, created_by, created_at, updated_at) VALUES (1, 'Hindu', 11, NULL, NULL);
INSERT INTO religions (id, religion_name, created_by, created_at, updated_at) VALUES (2, 'Muslim', 11, '2019-07-02 11:23:49', '2019-07-02 11:24:02');


--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 201
-- Name: religions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('religions_id_seq', 3, true);


--
-- TOC entry 2391 (class 0 OID 398223)
-- Dependencies: 202
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (2, 'Illinois', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (3, 'Montana', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (4, 'New York', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (5, 'North Dakota', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (6, 'Maryland', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (8, 'Wyoming', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (9, 'New Jersey', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (10, 'Nevada', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (12, 'Oklahoma', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (13, 'North Carolina', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (15, 'Kansas', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (16, 'Pennsylvania', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (18, 'Nebraska', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (19, 'Utah', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (20, 'Texas', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (21, 'Washington', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (22, 'Missouri', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (23, 'Wisconsin', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (24, 'West Virginia', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (26, 'Louisiana', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (27, 'South Dakota', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (29, 'Maine', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (30, 'Hawaii', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (32, 'Virginia', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (34, 'Tennessee', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (35, 'New Mexico', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (36, 'Indiana', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (37, 'Oregon', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (38, 'Kentucky', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (39, 'Ohio', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (40, 'Vermont', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (41, 'Georgia', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (43, 'Michigan', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (45, 'New Hampshire', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (47, 'Iowa', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (48, 'Massachusetts', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (49, 'Mississippi', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (50, 'Minnesota', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (51, 'West Bengal', 11, '2019-06-18 10:06:22', '2019-06-18 10:06:22');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (52, 'Bihar', 11, '2019-06-18 10:10:49', '2019-06-18 10:10:49');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (7, 'Odisha', 11, '2019-06-17 06:27:05', '2019-08-05 05:57:55');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (31, 'Andhra Pradesh', 11, '2019-06-17 06:27:06', '2019-08-05 05:59:14');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (68, 'Himachal Pradesh', 11, '2019-08-05 06:03:19', '2019-08-05 06:03:19');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (69, 'Madhya Pradesh', 11, '2019-08-05 06:03:30', '2019-08-05 06:03:30');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (11, 'Maharastra', 11, '2019-06-17 06:27:05', '2019-08-05 06:03:46');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (28, 'Kerala', 11, '2019-06-17 06:27:05', '2019-08-05 06:04:55');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (1, 'Rajasthan', 11, '2019-06-17 06:27:04', '2019-08-05 06:05:07');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (17, 'Gujrat', 11, '2019-06-17 06:27:05', '2019-08-05 06:07:42');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (46, 'Tamilnadu', 11, '2019-06-17 06:27:06', '2019-08-05 06:07:52');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (25, 'Karntaka', 11, '2019-06-17 06:27:05', '2019-08-05 06:16:44');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (44, 'Hyderabad', 11, '2019-06-17 06:27:06', '2019-08-05 06:17:30');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (42, 'Jammu and Kahmir', 11, '2019-06-17 06:27:06', '2019-08-05 06:17:59');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (70, 'Punjab', 11, '2019-08-05 06:18:05', '2019-08-05 06:18:05');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (71, 'Hariyana', 11, '2019-08-05 06:18:12', '2019-08-05 06:18:12');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (72, 'Jharkhand', 11, '2019-08-05 06:18:28', '2019-08-05 06:18:28');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (73, 'Chattishgarh', 11, '2019-08-05 06:18:43', '2019-08-05 06:18:43');
INSERT INTO states (id, state_name, created_by, created_at, updated_at) VALUES (75, 'Andaman and Nicobar Island', 11, '2019-11-11 14:04:17', '2019-11-11 14:04:17');


--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 203
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('states_id_seq', 75, true);


--
-- TOC entry 2393 (class 0 OID 398228)
-- Dependencies: 204
-- Data for Name: subdivisions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (152, 'Campvell bay', 50, 11, '2019-11-15 13:28:21', '2019-11-15 13:28:21', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (133, 'Mayabunder', 50, 11, '2019-11-11 14:08:37', '2019-11-11 14:08:37', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (132, 'Car Nicobar', 50, 11, '2019-11-11 14:08:27', '2019-11-11 14:08:27', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (131, 'Port Blair', 50, 11, '2019-11-11 14:08:16', '2019-11-11 14:08:16', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (130, 'Mal', 48, 11, '2019-11-11 14:02:42', '2019-11-11 14:02:42', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (129, 'Alipurduar', 48, 11, '2019-11-11 14:02:34', '2019-11-11 14:02:34', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (128, 'Jalpaiguri Sadar', 48, 11, '2019-11-11 14:02:08', '2019-11-11 14:02:08', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (127, 'Buniadpur', 49, 11, '2019-11-11 14:01:48', '2019-11-11 14:01:48', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (125, 'Balurghat', 49, 11, '2019-11-11 14:01:02', '2019-11-11 14:01:02', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (124, 'Gorubathan', 7, 11, '2019-11-11 13:59:52', '2019-11-11 13:59:52', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (123, 'Kalimpong Sadar', 7, 11, '2019-11-11 13:59:32', '2019-11-11 13:59:32', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (122, 'Mungpoo', 10, 11, '2019-11-11 13:59:14', '2019-11-11 13:59:14', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (121, 'Mirik', 10, 11, '2019-11-11 13:59:04', '2019-11-11 13:59:04', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (120, 'Kurseong', 10, 11, '2019-11-11 13:58:55', '2019-11-11 13:58:55', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (119, 'Siliguri', 10, 11, '2019-11-11 13:58:43', '2019-11-11 13:58:43', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (118, 'Darjeeling Sadar', 10, 11, '2019-11-11 13:58:19', '2019-11-11 13:58:19', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (117, 'Mekhligunj', 47, 11, '2019-11-11 13:57:57', '2019-11-11 13:57:57', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (116, 'Mathabhanga', 47, 11, '2019-11-11 13:57:43', '2019-11-11 13:57:43', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (115, 'Tufangunj', 47, 11, '2019-11-11 13:57:27', '2019-11-11 13:57:27', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (113, 'Dinhata', 47, 11, '2019-11-11 13:56:39', '2019-11-11 13:56:39', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (112, 'Cooch Behar Sadar', 47, 11, '2019-11-11 13:56:24', '2019-11-11 13:56:24', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (111, 'islampur', 29, 11, '2019-11-11 13:56:03', '2019-11-11 13:56:03', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (110, 'Raiganj', 29, 11, '2019-11-11 13:55:49', '2019-11-11 13:55:49', 8);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (109, 'Lalbagh', 44, 11, '2019-11-11 13:53:14', '2019-11-11 13:53:14', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (108, 'Kandi', 44, 11, '2019-11-11 13:52:34', '2019-11-11 13:52:34', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (106, 'Berhampore', 44, 11, '2019-11-11 13:52:11', '2019-11-11 13:52:11', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (107, 'Jangipur', 44, 11, '2019-11-11 13:52:25', '2019-11-11 13:52:25', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (105, 'Haldia', 43, 11, '2019-11-11 13:51:34', '2019-11-11 13:51:34', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (104, 'Contai', 43, 11, '2019-11-11 13:48:53', '2019-11-11 13:48:53', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (103, 'Tamluk', 45, 11, '2019-11-11 13:48:14', '2019-11-11 13:48:33', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (102, 'Nabadwip', 46, 11, '2019-11-11 13:47:28', '2019-11-11 13:47:28', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (101, 'Tehatta', 46, 11, '2019-11-11 13:47:06', '2019-11-11 13:47:06', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (100, 'Ranaghat', 46, 11, '2019-11-11 13:46:53', '2019-11-11 13:46:53', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (99, 'Kalyani', 46, 11, '2019-11-11 13:46:33', '2019-11-11 13:46:33', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (98, 'Krishnanagar', 46, 11, '2019-11-11 13:46:17', '2019-11-11 13:46:17', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (97, 'Kharagpur', 43, 11, '2019-11-11 13:28:42', '2019-11-11 13:28:42', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (96, 'Garbeta', 43, 11, '2019-11-11 13:28:13', '2019-11-11 13:28:13', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (95, 'Dantan', 43, 11, '2019-11-11 13:27:47', '2019-11-11 13:27:47', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (94, 'Ghatal', 43, 11, '2019-11-11 13:27:28', '2019-11-11 13:27:28', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (93, 'Paschim Medinipur Sadar', 43, 11, '2019-11-11 13:27:14', '2019-11-11 13:27:14', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (92, 'Durgapur', 41, 11, '2019-11-11 13:24:04', '2019-11-11 13:24:04', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (91, 'Asansol', 41, 11, '2019-11-11 13:23:34', '2019-11-11 13:23:34', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (90, 'Jhargram', 42, 11, '2019-11-11 13:23:05', '2019-11-11 13:23:05', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (89, 'Katwa', 40, 11, '2019-11-11 13:22:40', '2019-11-11 13:22:40', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (88, 'Kalna', 40, 11, '2019-11-11 13:22:20', '2019-11-11 13:22:20', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (87, 'Purba Bardhaman Sadar', 40, 11, '2019-11-11 13:22:06', '2019-11-11 13:22:06', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (86, 'Raghunathpur', 5, 11, '2019-11-11 13:07:24', '2019-11-11 13:07:24', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (85, 'Purulia Sadar', 5, 11, '2019-11-11 13:07:06', '2019-11-11 13:07:06', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (83, 'Chanchal', 6, 11, '2019-11-11 13:04:39', '2019-11-11 13:04:39', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (82, 'Malda Sadar', 6, 11, '2019-11-11 13:04:24', '2019-11-11 13:04:24', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (81, 'Dubrajpur', 27, 11, '2019-11-11 13:04:02', '2019-11-11 13:04:02', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (80, 'Rampurhat', 27, 11, '2019-11-11 13:03:39', '2019-11-11 13:03:39', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (79, 'Bolpur', 27, 11, '2019-11-11 13:03:21', '2019-11-11 13:03:21', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (78, 'Birbhum Sadar', 27, 11, '2019-11-11 13:03:09', '2019-11-11 13:03:09', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (77, 'Khatra', 25, 11, '2019-11-11 13:02:41', '2019-11-11 13:02:41', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (76, 'Bishnupur', 25, 11, '2019-11-11 13:02:30', '2019-11-11 13:02:30', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (75, 'Bankura Sadar', 25, 11, '2019-11-11 13:02:17', '2019-11-11 13:02:17', 7);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (74, 'Sealdah', 13, 11, '2019-11-11 12:56:33', '2019-11-11 12:56:33', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (71, 'Kakdwip', 13, 11, '2019-11-11 12:39:24', '2019-11-11 12:39:24', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (70, 'Diamond Harbour', 13, 11, '2019-11-11 12:38:53', '2019-11-11 12:38:53', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (69, 'BARUIPORE', 13, 11, '2019-11-11 12:38:32', '2019-11-11 12:38:32', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (68, 'Alipore', 13, 11, '2019-11-11 12:38:18', '2019-11-15 14:35:01', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (67, 'Basirhat', 38, 11, '2019-11-11 12:37:43', '2019-11-11 12:37:43', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (66, 'Bongaon', 38, 11, '2019-11-11 12:37:28', '2019-11-11 12:37:28', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (65, 'Sealdah', 38, 11, '2019-11-11 12:37:00', '2019-11-11 12:37:00', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (64, 'Bidhannagar', 38, 11, '2019-11-11 12:36:40', '2019-11-11 12:36:40', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (63, 'Barrackpore', 38, 11, '2019-11-11 12:36:18', '2019-11-11 12:36:18', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (62, 'Barasat', 38, 11, '2019-11-11 12:35:41', '2019-11-11 12:35:41', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (61, 'Amta', 26, 11, '2019-11-11 12:25:28', '2019-11-11 12:25:28', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (60, 'Uluberia', 26, 11, '2019-11-11 12:25:19', '2019-11-11 12:25:19', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (58, 'Howrah Sadar', 26, 11, '2019-11-11 12:24:01', '2019-11-11 12:24:01', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (57, 'Arambagh', 28, 11, '2019-11-11 12:18:01', '2019-11-11 12:18:01', 6);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (56, 'Chandannagar', 28, 11, '2019-11-11 12:17:46', '2019-11-11 12:17:46', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (55, 'Serampore', 28, 11, '2019-11-11 12:17:18', '2019-11-11 12:17:18', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (54, 'Hoogly Sadar', 28, 11, '2019-11-11 12:16:48', '2019-11-11 12:24:53', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (53, 'Provincial  Small Causes Court (PSCC)', 36, 11, '2019-11-11 12:14:15', '2019-11-11 12:15:22', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (52, 'City Civil Court', 36, 11, '2019-11-11 12:14:01', '2019-11-11 12:14:01', 4);
INSERT INTO subdivisions (id, subdivision_name, district_id, created_by, created_at, updated_at, zone_id) VALUES (51, 'City Sessions Court', 36, 11, '2019-11-11 12:13:44', '2019-11-11 12:13:44', 4);


--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 205
-- Name: subdivisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('subdivisions_id_seq', 152, true);


--
-- TOC entry 2395 (class 0 OID 398233)
-- Dependencies: 206
-- Data for Name: user_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_types (id, type_name, created_at, updated_at, created_by) VALUES (1, 'Administrator', NULL, NULL, 11);
INSERT INTO user_types (id, type_name, created_at, updated_at, created_by) VALUES (2, 'Judicial Officer', NULL, NULL, 11);
INSERT INTO user_types (id, type_name, created_at, updated_at, created_by) VALUES (3, 'Departmental Officer', NULL, NULL, 11);
INSERT INTO user_types (id, type_name, created_at, updated_at, created_by) VALUES (6, 'Court', '2019-08-30 06:31:42', '2019-08-30 06:31:42', 11);
INSERT INTO user_types (id, type_name, created_at, updated_at, created_by) VALUES (5, 'Inspection', '2019-08-28 08:33:30', '2019-08-28 08:34:39', 11);


--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 207
-- Name: user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_types_id_seq', 6, true);


--
-- TOC entry 2397 (class 0 OID 398238)
-- Dependencies: 208
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (14, 'Rupsa Bose', 'rupsa@rupsa.rupsa', NULL, '$2y$10$or1dBRoI3FxqDddrMTwDEO9MOo5MuHRX8EpLNPRd6Q94VU76L2rUy', NULL, NULL, NULL, NULL, 11, 'rupsa', 2);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (13, 'Arpan', 'arpanroy1987@gmail.com', NULL, '$2y$10$SOW.J6WHttO1dhhf8u/2M.zdaiIVTygGyL03ZNLejwcPW8cmPj3Yq', NULL, '2019-06-19 06:04:30', '2019-06-19 06:04:30', NULL, 13, 'arpan', 2);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (12, 'Anabil Bhattacharya', 'banabil90@gmail.com', NULL, '$2y$10$SOW.J6WHttO1dhhf8u/2M.zdaiIVTygGyL03ZNLejwcPW8cmPj3Yq', NULL, '2019-06-19 06:04:30', '2019-06-19 06:04:30', NULL, 12, 'anabil', 2);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (22, 'Kallol Chattopadhyay', 'abc@gmail.com', NULL, '$2y$10$UyNlR7k.8eyl1jxdlrLLY.UK4sOmG2E9.G8IeNNWw13M4Kijqrs3e', NULL, '2019-09-09 09:43:19', '2019-09-09 09:43:19', NULL, 2, 'jo00002', 5);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (29, 'sdd dsa', 'daasd@sddsd.cxsdf', NULL, '$2y$10$XnXOxSKNDai8X7C9a0Zt1uxThE.7N3CGHNv3bldT93pFEnOCIybuK', NULL, '2019-09-11 10:58:05', '2019-09-11 10:58:05', NULL, 14, 'jo00014', 2);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (30, 'ABC', 'court1@court1.court1', NULL, '$2y$10$Y58W8jF73HGnjMo4KtjLV.XRK76uu7LKNQzAhYmU8BCqO86hQ06/a', NULL, '2019-09-16 10:59:20', '2019-09-16 10:59:20', 3, NULL, 'Court1', 6);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (31, 'xyz', 'xyz@xyz.xyz', NULL, '$2y$10$1lmW4WSrw0pAW/N9DJPkN.EtEy.jkNPb1Bxw1GrTiRs4Qv7epaS7S', NULL, '2019-09-16 11:03:01', '2019-09-16 11:03:01', 8, NULL, 'XYZ', 6);
INSERT INTO users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, court_id, judicial_officer_id, user_id, user_type_id) VALUES (11, 'Administrator 1', 'admin@admin.admin', NULL, '$2y$10$or1dBRoI3FxqDddrMTwDEO9MOo5MuHRX8EpLNPRd6Q94VU76L2rUy', 'VAX5uQEmi51s3j7l6t4AKzYKZFN70dghQ2nGqKYZCyQELpibGSYMLf7HqqLm', '2019-06-19 06:00:07', '2019-06-19 06:00:07', 1, NULL, 'admin', 1);


--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 31, true);


--
-- TOC entry 2399 (class 0 OID 398246)
-- Dependencies: 210
-- Data for Name: zones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (4, 'A', 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00', 1095);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (6, 'B', 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00', 1095);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (8, 'D', 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00', 730);
INSERT INTO zones (id, zone_name, created_by, created_at, updated_at, min_service_days) VALUES (7, 'C', 11, '2019-11-13 00:00:00', '2019-11-15 11:31:20', 1095);


--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 211
-- Name: zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('zones_id_seq', 10, true);


-- Completed on 2019-11-16 15:36:33

--
-- PostgreSQL database dump complete
--

