--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 11.1

-- Started on 2020-02-11 13:51:45

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
-- TOC entry 2497 (class 0 OID 451926)
-- Dependencies: 217
-- Data for Name: acr_histories; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2521 (class 0 OID 468802)
-- Dependencies: 241
-- Data for Name: career_progression_stages; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.career_progression_stages VALUES (1, 'ACP-I', 1, '2020-01-24 00:00:00', '2020-01-24 00:00:00');
INSERT INTO public.career_progression_stages VALUES (2, 'ACP-II', 1, '2020-01-24 00:00:00', '2020-01-24 00:00:00');
INSERT INTO public.career_progression_stages VALUES (3, 'ACP-I', 2, '2020-01-24 00:00:00', '2020-01-24 00:00:00');
INSERT INTO public.career_progression_stages VALUES (4, 'ACP-II', 2, '2020-01-24 00:00:00', '2020-01-24 00:00:00');
INSERT INTO public.career_progression_stages VALUES (5, 'DJ (SG)', 3, '2020-01-24 00:00:00', '2020-01-24 00:00:00');
INSERT INTO public.career_progression_stages VALUES (6, 'DJ (ST)', 3, '2020-01-24 00:00:00', '2020-01-24 00:00:00');


--
-- TOC entry 2463 (class 0 OID 451613)
-- Dependencies: 183
-- Data for Name: courts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.courts VALUES (59, 'CIVIL JUDGE SR  DIV BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:20:52', '2019-11-15 17:20:52');
INSERT INTO public.courts VALUES (60, 'ACJM BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:21:23', '2019-11-15 17:21:23');
INSERT INTO public.courts VALUES (8, 'BARDHAMAN 1ST COURT', 51, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:27:25');
INSERT INTO public.courts VALUES (61, 'CIVIL JUDGE JR  DIV COURT BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:22:00', '2019-11-15 17:22:00');
INSERT INTO public.courts VALUES (62, 'JM 2ND COURT BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:22:25', '2019-11-15 17:22:25');
INSERT INTO public.courts VALUES (13, 'HOWRAH 2ND COURT', 77, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:30:49');
INSERT INTO public.courts VALUES (14, 'HOWRAH 1ST COURT', 80, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:29:36');
INSERT INTO public.courts VALUES (24, 'NORTH DINAJPUR 1ST COURT', 56, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-08-03 09:22:33');
INSERT INTO public.courts VALUES (25, 'BANKURA 1 ST COURT', 67, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-08-03 09:25:14');
INSERT INTO public.courts VALUES (27, 'SOUTH DINAJPORE', 81, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-08-03 09:23:52');
INSERT INTO public.courts VALUES (63, 'JM 3RD COURT BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:22:53', '2019-11-15 17:22:53');
INSERT INTO public.courts VALUES (30, 'DISTRICT JUDGE BANKURA', 75, NULL, NULL, 11, '2019-06-17 06:27:06', '2019-11-15 16:52:38');
INSERT INTO public.courts VALUES (35, 'CJM  BANKURA', 75, NULL, NULL, 11, '2019-11-15 16:54:32', '2019-11-15 16:55:50');
INSERT INTO public.courts VALUES (36, 'CJSD BANKURA', 75, NULL, NULL, 11, '2019-11-15 16:56:34', '2019-11-15 16:56:34');
INSERT INTO public.courts VALUES (38, 'CIVIL JUDGE JR DIV I BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:00:54', '2019-11-15 17:00:54');
INSERT INTO public.courts VALUES (37, 'CIVIL JUDGE SR DIV  ADDITIONAL  COURT  BANKURA', 75, NULL, NULL, 11, '2019-11-15 16:58:42', '2019-11-15 17:02:20');
INSERT INTO public.courts VALUES (39, 'CIVIL JUDGE JR DIV II BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:02:58', '2019-11-15 17:02:58');
INSERT INTO public.courts VALUES (40, 'CIVIL JUDGE JR DIV ADDITIONAL COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:03:41', '2019-11-15 17:03:41');
INSERT INTO public.courts VALUES (41, 'JM 3RD COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:04:13', '2019-11-15 17:04:13');
INSERT INTO public.courts VALUES (42, 'JM 4TH COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:04:33', '2019-11-15 17:04:33');
INSERT INTO public.courts VALUES (43, 'JM 5TH COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:04:47', '2019-11-15 17:04:47');
INSERT INTO public.courts VALUES (44, 'JM 6TH COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:05:13', '2019-11-15 17:05:13');
INSERT INTO public.courts VALUES (45, 'JM 7TH COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:05:44', '2019-11-15 17:05:44');
INSERT INTO public.courts VALUES (48, 'ADJ 2ND COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:07:40', '2019-11-15 17:07:40');
INSERT INTO public.courts VALUES (49, 'ADJ 3RD COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:08:14', '2019-11-15 17:08:14');
INSERT INTO public.courts VALUES (50, 'ADJ RE DESIGNATED COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:08:55', '2019-11-15 17:08:55');
INSERT INTO public.courts VALUES (51, 'ADJ FAST TRACK COURT  BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:10:22', '2019-11-15 17:10:22');
INSERT INTO public.courts VALUES (52, 'ADJ  KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:12:57', '2019-11-15 17:12:57');
INSERT INTO public.courts VALUES (53, 'CIVIL JUDGE SR  DIV KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:13:49', '2019-11-15 17:15:41');
INSERT INTO public.courts VALUES (54, 'CIVIL JUDGE JR  DIV 1ST COURT KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:16:33', '2019-11-15 17:16:33');
INSERT INTO public.courts VALUES (46, 'ADJ 1ST COURT BANKURA', 75, NULL, NULL, 11, '2019-11-15 17:06:11', '2019-11-15 17:17:38');
INSERT INTO public.courts VALUES (55, 'CIVIL JUDGE JR  DIV 2ND COURT KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:19:00', '2019-11-15 17:19:00');
INSERT INTO public.courts VALUES (56, 'ACJM KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:19:35', '2019-11-15 17:19:35');
INSERT INTO public.courts VALUES (57, 'JM KHATRA', 77, NULL, NULL, 11, '2019-11-15 17:19:54', '2019-11-15 17:19:54');
INSERT INTO public.courts VALUES (58, 'ADJ BISHNUPUR', 76, NULL, NULL, 11, '2019-11-15 17:20:23', '2019-11-15 17:20:23');
INSERT INTO public.courts VALUES (64, 'DISTRICT JUDGE BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:23:43', '2019-11-15 17:25:11');
INSERT INTO public.courts VALUES (65, 'ADJ 1ST COURT BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:25:48', '2019-11-15 17:25:48');
INSERT INTO public.courts VALUES (66, 'ADJ 2ND COURT BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:26:50', '2019-11-15 17:26:50');
INSERT INTO public.courts VALUES (67, 'ADJ 3RD COURT BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:27:21', '2019-11-15 17:27:21');
INSERT INTO public.courts VALUES (68, 'ADJ 4TH COURT BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:27:42', '2019-11-15 17:27:42');
INSERT INTO public.courts VALUES (69, 'ADJ FTC COURT BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:28:20', '2019-11-15 17:28:40');
INSERT INTO public.courts VALUES (70, 'CJM BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:29:02', '2019-11-15 17:29:02');
INSERT INTO public.courts VALUES (71, 'ACJM BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:29:17', '2019-11-15 17:29:17');
INSERT INTO public.courts VALUES (72, ' CIVIL JUDGE SR DIV BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:30:10', '2019-11-15 17:30:10');
INSERT INTO public.courts VALUES (73, 'CIVIL JUDGE JR DIV SADAR COURT BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:31:20', '2019-11-15 17:31:20');
INSERT INTO public.courts VALUES (74, 'CIVIL JUDGE JR DIV ADDITIONAL COURT BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:32:52', '2019-11-15 17:32:52');
INSERT INTO public.courts VALUES (75, 'JM 1ST COURT BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:33:18', '2019-11-15 17:33:18');
INSERT INTO public.courts VALUES (76, 'JM 2ND COURT BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:34:00', '2019-11-15 17:34:00');
INSERT INTO public.courts VALUES (77, 'JM 3RD COURT BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:34:18', '2019-11-15 17:34:18');
INSERT INTO public.courts VALUES (78, 'SECRETARY DLSA BIRBHUM', 78, NULL, NULL, 11, '2019-11-15 17:34:37', '2019-11-15 17:34:37');
INSERT INTO public.courts VALUES (79, 'ADJ FTC DUBRAJPUR BIRBHUM', 81, NULL, NULL, 11, '2019-11-15 17:35:06', '2019-11-15 17:35:35');
INSERT INTO public.courts VALUES (80, 'CIVIL JUDGE JR DIV COURT DUBRAJPUR BIRBHUM', 81, NULL, NULL, 11, '2019-11-15 17:37:19', '2019-11-15 17:37:19');
INSERT INTO public.courts VALUES (81, 'JM DUBRAJPUR BIRBHUM', 81, NULL, NULL, 11, '2019-11-15 17:37:57', '2019-11-15 17:37:57');
INSERT INTO public.courts VALUES (1, 'DARJEELING 1ST COURT', 118, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:28:11');
INSERT INTO public.courts VALUES (3, 'CALCUTTA CITY COURT', 51, NULL, NULL, 11, '2019-06-17 06:27:05', '2019-08-03 09:19:41');


--
-- TOC entry 2509 (class 0 OID 452046)
-- Dependencies: 229
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2467 (class 0 OID 451638)
-- Dependencies: 187
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.designations VALUES (3, 'Munsif Additional Court, Asansol', 1, 1, NULL, NULL);
INSERT INTO public.designations VALUES (4, 'JM, 5th Court, Asansol', 1, 1, NULL, NULL);
INSERT INTO public.designations VALUES (5, 'JM 3rd Court, Beherampur', 1, 1, NULL, NULL);
INSERT INTO public.designations VALUES (6, 'Munsif, 2nd Court, Arambag', 1, 1, NULL, NULL);
INSERT INTO public.designations VALUES (7, 'JM, 2nd Court, Arambag', 1, 1, NULL, NULL);
INSERT INTO public.designations VALUES (8, 'JM, 2n Court, Purulia', 1, 1, NULL, NULL);
INSERT INTO public.designations VALUES (9, 'On Probation', 1, 1, NULL, NULL);
INSERT INTO public.designations VALUES (10, 'JM, 5th Court, Burdwan Sadar', 1, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (13, 'Leave Reserve Officer,Hoogly Sadar', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (12, 'JM,Jhargram', 1, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (15, 'Additional District & Sessions Judge,2nd Court,Jhargram', 3, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (14, 'Additional District and Session Judge, F.T.C-1,Dinhata', 3, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (16, 'Additional District & Sessions Judge,3rd Court,Darjeeling Sadar', 3, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (17, 'Civil Judge (Sr.Div),Dinhata', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (18, 'Additional District And Sessions Judge 2nd F.T.C,Diamond Harbour', 3, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (19, 'Additional District and Sessions Judge,F.T.C, Baruipur', 3, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (11, 'Civil Judge(Jr. Div) 1st Additional Court,Contai', 1, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (20, 'JM 1st  Court,Contai', 1, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (21, 'Civil Judge(Jr.Div),Contai', 1, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (22, 'Civil Judge(Sr.Div),Hoogly Sadar', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (26, 'Civil Judge(Jr Div) 4th Court,Howrah Sadar', 1, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (25, 'JM 4th  Court,Burdwan Sadar', 1, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (27, 'Civil Judge(Jr Div) 2nd Court,Contai', 1, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (28, 'Civil Judge(Jr Div)1st Court,Contai', 1, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (29, 'Additional Chief Judicial magistrate,Serampore', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (30, 'Civil Judge(Sr. Div),Jhargram', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (31, 'Additional Chief Judicial Magistrate, Jhargram', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (33, 'Additional District & Sessions Judge F.T.C,Baruipur', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (32, 'Additional District & Sessions Judge F.T.C 2nd Court,Dinhata ', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (34, 'Additional District & Sessions Judge,Baruipur', 3, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (35, 'Additional District & Sessions Judge 1st Court,Jhargram', 3, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (36, 'Additional District & Sessions Judge, 1st Court , Darjeeling Sadar', 3, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (37, 'Registrar,District Judge,Purba Bardhaman', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (38, 'Registrar,District Judge,Howrah', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (39, 'Registrar,City Civil Court,Calcutta', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (40, 'Registrar,City Sessions Court, Calcutta', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (41, 'Registrar,District Judge,Barasat,North 24-Parganas', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (42, 'Registrar,District Judge,Paschim Medinipur ', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (43, 'Registrar,District Judge, Alipore,North 24-Parganas', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (24, 'Registrar,MM 7th Court,Bankshall Court', 1, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (44, 'Registrar,Bankshall Court', 2, NULL, NULL, NULL);
INSERT INTO public.designations VALUES (45, 'Registrar,Presidency Small Cause Court,Calcutta', 1, NULL, NULL, NULL);


--
-- TOC entry 2485 (class 0 OID 451826)
-- Dependencies: 205
-- Data for Name: diaries; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2459 (class 0 OID 451573)
-- Dependencies: 179
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.districts VALUES (48, 'JALPAIGURI', 51, 8, 11, '2019-11-11 13:42:40', '2019-11-11 13:42:40');
INSERT INTO public.districts VALUES (50, 'ANDAMAN AND NICOBAR ISLAND', 75, 8, 11, '2019-11-11 14:07:53', '2019-11-11 14:07:53');
INSERT INTO public.districts VALUES (44, 'MURSHIDABAD', 51, 7, 11, '2019-11-11 13:20:46', '2019-11-11 13:20:46');
INSERT INTO public.districts VALUES (45, 'PURBA MEDINIPUR', 51, 6, 11, '2019-11-11 13:30:59', '2019-11-11 13:30:59');
INSERT INTO public.districts VALUES (46, 'NADIA', 51, 6, 11, '2019-11-11 13:31:32', '2019-11-11 13:31:32');
INSERT INTO public.districts VALUES (47, 'COOCH BEHAR', 51, 8, 11, '2019-11-11 13:32:34', '2019-11-11 13:32:34');
INSERT INTO public.districts VALUES (14, 'WEST BURDWAN', 24, 6, 11, '2019-06-17 06:27:05', '2019-08-05 05:47:25');
INSERT INTO public.districts VALUES (38, 'NORTH 24 PARGANAS', 51, 4, 11, '2019-11-11 12:26:13', '2019-11-11 12:26:13');
INSERT INTO public.districts VALUES (36, 'KOLKATA', 51, 4, 11, '2019-07-10 06:27:59', '2019-07-10 06:27:59');
INSERT INTO public.districts VALUES (41, 'PASCHIM BARDHAMAN', 51, 6, 11, '2019-11-11 13:19:29', '2019-11-11 13:19:29');
INSERT INTO public.districts VALUES (40, 'PURBA BARDHAMAN', 51, 6, 11, '2019-11-11 13:19:11', '2019-11-11 13:19:11');
INSERT INTO public.districts VALUES (43, 'PASCHIM MEDINIPUR', 51, 6, 11, '2019-11-11 13:20:14', '2019-11-11 13:20:14');
INSERT INTO public.districts VALUES (42, 'JHARGRAM', 51, 6, 11, '2019-11-11 13:19:58', '2019-11-11 13:19:58');
INSERT INTO public.districts VALUES (28, 'HOOGLY', 51, 4, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:03');
INSERT INTO public.districts VALUES (27, 'BIRBHUM', 51, 7, 11, '2019-06-17 06:27:06', '2019-08-05 05:49:09');
INSERT INTO public.districts VALUES (29, 'NORTH DINAJPUR', 51, 8, 11, '2019-06-17 06:27:06', '2019-11-11 13:54:30');
INSERT INTO public.districts VALUES (6, 'MALDA', 51, 7, 11, '2019-06-17 06:27:05', '2019-08-05 05:51:22');
INSERT INTO public.districts VALUES (5, 'PURULIA', 51, 7, 11, '2019-06-17 06:27:05', '2019-08-05 05:48:47');
INSERT INTO public.districts VALUES (8, 'SOUTH DINAJPUR', 51, 8, 11, '2019-06-17 06:27:05', '2019-08-05 05:50:41');
INSERT INTO public.districts VALUES (13, 'SOUTH 24 PARGANAS', 51, 4, 11, '2019-06-17 06:27:05', '2019-11-11 12:28:19');
INSERT INTO public.districts VALUES (10, 'DARJEELING', 51, 8, 11, '2019-06-17 06:27:05', '2019-08-05 05:55:27');
INSERT INTO public.districts VALUES (22, 'ALIPURE DUAR', 51, 8, 11, '2019-06-17 06:27:06', '2019-08-05 05:54:08');
INSERT INTO public.districts VALUES (26, 'HOWRAH', 51, 4, 11, '2019-06-17 06:27:06', '2019-08-05 05:47:53');
INSERT INTO public.districts VALUES (25, 'BANKURA', 51, 7, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:21');
INSERT INTO public.districts VALUES (7, 'KALIMPONG', 51, 8, 11, '2019-06-17 06:27:05', '2019-08-05 05:56:54');


--
-- TOC entry 2515 (class 0 OID 452082)
-- Dependencies: 235
-- Data for Name: document_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.document_types VALUES (1, 'Leave', '2020-02-01 00:00:00', '2020-02-01 00:00:00');
INSERT INTO public.document_types VALUES (4, 'Home Loan', '2020-02-11 12:51:03', '2020-02-11 12:51:03');


--
-- TOC entry 2495 (class 0 OID 451916)
-- Dependencies: 215
-- Data for Name: grade_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.grade_details VALUES (1, 'good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details VALUES (2, 'average', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details VALUES (3, 'very good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details VALUES (4, 'outstanding', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
INSERT INTO public.grade_details VALUES (5, 'poor', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');


--
-- TOC entry 2491 (class 0 OID 451891)
-- Dependencies: 211
-- Data for Name: hc_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hc_case_types VALUES (1, 'AA', 'ARBRITATION APPL.', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (2, 'ABWA', 'APPL.UND.BENGAL WAKFS ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (3, 'AC', 'AWARD CASES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (4, 'ACA', 'APPL.UNDER CHARTERED ACCOUNTANTS ACT, 1949', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (5, 'ACO', 'PET. IN COMP. APPL.', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (6, 'ACR', 'APPL.UND.CHARITABLE & RELIGIOUS TRUST ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (7, 'ACRP', 'APPL.UND.SEC.151 OF THE CR.P.C.', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (8, 'ACWA', 'APPL.UND.SEC 21 COST&WORKS ACCOUNTACTS ACT, 1959', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (9, 'AED', 'APPL. U/S. 64 OF ESTATE DUTY ACT, 1953', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (10, 'AET', 'APPL. U/S 25 OF EXPENDITURE TAX ACT, 1957', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (11, 'AFP', 'APPL.FOR LEAVE TO SUE AS AN INDIGENT PERSON', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (12, 'AGA', 'APPL.UND.SEC.25 OF ADMINISTRATOR GENERALS'' ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (13, 'AGL', 'APPL.FOR APPOINTMENT OF GUARDIAN-AD-LITEM', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (14, 'AGT', 'APPL. U/S 26 GIFT TAX ACT, 1958', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (15, 'AGWA', 'APPL.UND.GUARDIANS & WARDS ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (16, 'AHC', 'HABEAS CORPUS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (17, 'AID', 'APPL. UNDER PATENTS & DESIGNS ACT, 1970', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (18, 'AIDR', 'APPL.UND.INDUSTRIAL DEVELOPMENT REGULATION ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (19, 'AIFC', 'APPL.UND.INDUSTRIAL FINANCE CORP. ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (20, 'AIRB', 'APPN.RECON.BANK OF I', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (21, 'ALP', 'APPL.UND.CLAUSE 13 OF LETTERS PATENT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (22, 'ALP.ITL', 'APPL. UNDER CLAUSE 17 OF THE LETTERS PATENT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (23, 'ALPII', 'APPL.UND.CLAUSE 17 L', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (24, 'ALPITL', 'APPL.CLAUSE-17 LP', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (25, 'AOR', 'CALCUTTA OFFICIAL RECEIVER''S ACT 1938', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (26, 'AORC', 'APPLICATION OMNIBUS RESIDUARY CLASS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (27, 'AOT', 'APPL.UND.OFFICIAL TRUSTEES ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (28, 'AP', 'ARBITRATION PETITION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (29, 'APD', 'APPEAL FROM DECREE', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (30, 'APDT', 'APP. FR. DECR. TEND.', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (31, 'APO', 'APPEAL FROM ORDER', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (32, 'APOT', 'TEMP APO', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (33, 'AS', 'ADMIRALITY  SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (34, 'ASCI', 'APPL.FOR LEAVE TO APPEAL TO THE SUPREME COURT OF INDIA', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (35, 'ASFC', 'APPL.UND.STAE FINANCIAL CORP. ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (36, 'ASM', 'APPL.SANCHAITA MATTERS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (37, 'ATA', 'APPL.UNDER TRUST ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (38, 'ATM', 'APPL.UND.TRADE&MERCHANDISE MARKS, ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (39, 'AUDA', 'APPL.UND.UNCLAIMED DEPOSITS ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (40, 'AWT', 'APPL. U/S 27 OF WEALTH TAX ACT, 1957', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (41, 'BBA', 'APPL.UND.BANKERS BOOKS EVIDENCE ACT, 1891', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (42, 'BIFR', 'BIFR', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (43, 'CA', 'COMPANY APPLICATION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (44, 'CAA', 'COMMISSIONER OF PATENT APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (45, 'CC', 'CONTEMPT OF COURT CASES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (46, 'CEXA', 'APPL.UND.CENTRAL EXCISE ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (47, 'CHS', 'CHAMBER SUMMONS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (48, 'CP', 'COMPANY PETITIONS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (49, 'CPA', 'COMMISSIONER OF PATE', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (50, 'CRA', 'COPYRIGHT APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (51, 'CRCC', 'CRIMINAL CONTEMPT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (52, 'CS', 'CIVIL SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (53, 'CS(O)', 'CIVIL SUIT(OLD)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (54, 'CSOS', 'CIVIL SUIT ORIGINATING SUMMONS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (55, 'CUSTA', 'APPL.UND.CUSTOMS ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (56, 'DM', 'UND.CHAPTER V OF O.S. RULES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (57, 'EC', 'EXECUTION CASES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (58, 'EOPLA', 'EXTRA ORDINARY PROBATE PROCEEDINGS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (59, 'EOS', 'EXTRA ORDINARY SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (60, 'EP', 'ELEC.PET.(PEOPLES REPRESENTATION ACT, 1951)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (61, 'FEA', 'FOREIGN EXCHANGE APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (62, 'FERA', 'APPL.UND.FOREIGN EXCHANGE REGULATION ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (63, 'GCAL', 'APPL.UND.GOLD CONTROL ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (64, 'IC', 'INSOLVENCY CASES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (65, 'ICA', 'APPL.UNDER INDIAN COMPANIES ACT, 1913', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (66, 'IP', 'IT.PET.256(2)IT''61', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (67, 'ITA', 'INCOME TAX APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (68, 'ITAT', 'INCOME TAX APPEAL TENDERED', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (69, 'ITP', 'INCOME TAX PET.(U/S. 256 (2) OF I.T. ACT, 1961)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (70, 'ITR', 'INCOMETAX REF.SEC.256 (1) OF I.T. ACT, 1961', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (71, 'LM', 'LUNATIC MATTERS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (72, 'LPA', 'LETTERS PATENT APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (73, 'MM', 'MISFEAOUCE MATTERS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (74, 'MS', 'MATRIMONIAL SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (75, 'NM', 'NOTICE OF MOTION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (76, 'OCO', 'ORIGINAL SIDE CROSS OBJECTION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (77, 'OCOT', 'ORIGINAL SIDE CROSS OBJECTION TENDER', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (78, 'OTS', 'ORDINANCE TRANSFER SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (79, 'PLA', 'APPL.FOR PROBATE & LETTERS OF ADMINISTRATION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (80, 'PLR', 'UND.CHPT.XXXI-A OF O.S. RULES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (81, 'PMS', 'PARSI MATRIMONIAL SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (82, 'REF', 'REFERENCE CASE', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (83, 'RVWO', 'MEMORANDUM OF REVIEWS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (84, 'SALT', 'APPL.UND.SALT ACT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (85, 'SANA', 'SANCHAITA APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (86, 'SCO', 'SPECIAL CASE FOR OPINION OF COURT', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (87, 'SESS', 'SESSIONS CASES', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (88, 'SS', 'SPECIAL SUITS(SEC 20 OF THE ARBITRATION ACT, 1940', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (89, 'T', 'TEMP A(1)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (90, 'TBCS', 'TRANSFERRED BANKING COMPANIES SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (91, 'TCS', 'TRANSFERRED COMPANY SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (92, 'TMA', 'TRADE MARK APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (93, 'TS', 'TESTAMENTERY SUITS', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (94, 'TUA', 'TRADE UNION APPEAL', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (95, 'WPO', 'WRIT PETITION', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (96, 'WP.CT', 'WP(CENTRAL ADMIN TRIBUNAL)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (97, 'WP.ST', 'WP(STATE ADMIN TRIBUNAL)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (98, 'WP.TT', 'WP(WB TAX TRIBUNAL)', NULL, NULL, NULL);
INSERT INTO public.hc_case_types VALUES (99, 'WPCR', 'WRIT PETITION(CIVIL RULE)', NULL, NULL, NULL);



--
-- TOC entry 2523 (class 0 OID 468817)
-- Dependencies: 243
-- Data for Name: jo_career_progressions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2517 (class 0 OID 452090)
-- Dependencies: 237
-- Data for Name: jo_documents; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_documents VALUES (4, 1, 11, '702_1_1580969128_0.pdf', '2020-02-06 11:35:28', '2020-02-06 11:35:28', 'Test Remark');


--
-- TOC entry 2519 (class 0 OID 452164)
-- Dependencies: 239
-- Data for Name: jo_grades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_grades VALUES (3, 2, 2, 1, '2019-12-05', 'test1', 'Finalized', NULL, '2020-01-08 15:27:36');
INSERT INTO public.jo_grades VALUES (2, 3, 2, 2, '2019-12-05', '', 'Finalized', NULL, '2020-01-08 15:27:36');
INSERT INTO public.jo_grades VALUES (4, 2, 2, 1, '2019-12-03', '', 'Draft', NULL, NULL);
INSERT INTO public.jo_grades VALUES (5, 3, 2, 2, '2019-12-03', '', 'Draft', NULL, NULL);
INSERT INTO public.jo_grades VALUES (6, 12, 3, 1, '2019-12-03', 'cc', 'Draft', NULL, NULL);
INSERT INTO public.jo_grades VALUES (7, 11, 3, 2, '2019-12-03', '', 'Draft', NULL, NULL);
INSERT INTO public.jo_grades VALUES (8, 11, 3, 1, '2019-12-04', '', 'Draft', NULL, NULL);
INSERT INTO public.jo_grades VALUES (9, 12, 3, 2, '2019-12-04', '', 'Draft', NULL, NULL);
INSERT INTO public.jo_grades VALUES (10, 11, 3, 1, '2019-12-05', '', 'Draft', NULL, NULL);
INSERT INTO public.jo_grades VALUES (11, 12, 3, 2, '2019-12-05', '', 'Draft', NULL, NULL);


--
-- TOC entry 2511 (class 0 OID 452054)
-- Dependencies: 231
-- Data for Name: jo_legal_experiences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_legal_experiences VALUES (4, 2, 57, 1990, 1997, '2020-01-17 13:34:20', '2020-01-17 13:34:20');
INSERT INTO public.jo_legal_experiences VALUES (5, 2, 61, 1985, 1990, '2020-01-17 13:34:20', '2020-01-17 13:34:20');


--
-- TOC entry 2481 (class 0 OID 451777)
-- Dependencies: 201
-- Data for Name: jo_reportings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_reportings VALUES (3, 3, 11, 2, '                                                                                                                                                                                                                                                               ', '                                                                                                                                                                                                                                                               ', '2020-01-08 15:23:12', '2020-01-08 15:23:12');


--
-- TOC entry 2499 (class 0 OID 451946)
-- Dependencies: 219
-- Data for Name: jo_zone_tenures; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jo_zone_tenures VALUES (115, 13, 4, '2019-12-01', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures VALUES (116, 11, 6, '2001-10-16', '2009-07-27', NULL, '2020-02-07 10:53:28');
INSERT INTO public.jo_zone_tenures VALUES (6, 3, 6, '2000-01-20', '2005-06-20', NULL, '2020-01-08 15:23:12');
INSERT INTO public.jo_zone_tenures VALUES (7, 3, 7, '2005-12-09', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures VALUES (117, 11, 4, '2007-06-26', '2011-11-08', NULL, '2020-02-07 10:53:28');
INSERT INTO public.jo_zone_tenures VALUES (118, 11, 8, '2011-02-04', '2014-02-06', NULL, '2020-02-07 10:53:28');
INSERT INTO public.jo_zone_tenures VALUES (119, 11, 4, '2013-02-11', '2018-10-04', NULL, '2020-02-07 10:53:28');
INSERT INTO public.jo_zone_tenures VALUES (120, 11, 6, '2016-01-11', '2018-10-04', NULL, '2020-02-07 10:53:28');
INSERT INTO public.jo_zone_tenures VALUES (121, 11, 8, '2018-10-11', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures VALUES (88, 12, 4, '1997-11-28', '2001-06-06', NULL, '2020-01-20 15:44:49');
INSERT INTO public.jo_zone_tenures VALUES (17, 2, 6, '1991-08-30', '1993-05-14', NULL, '2020-01-09 16:59:31');
INSERT INTO public.jo_zone_tenures VALUES (18, 2, 7, '1995-07-20', NULL, NULL, NULL);
INSERT INTO public.jo_zone_tenures VALUES (89, 12, 6, '1998-07-23', '2001-11-21', NULL, '2020-01-20 15:44:49');
INSERT INTO public.jo_zone_tenures VALUES (90, 12, 4, '2001-06-16', '2002-08-07', NULL, '2020-01-20 15:44:49');
INSERT INTO public.jo_zone_tenures VALUES (91, 12, 6, '2001-11-29', '2011-01-05', NULL, '2020-01-20 15:44:49');
INSERT INTO public.jo_zone_tenures VALUES (92, 12, 4, '2007-07-04', '2013-01-22', NULL, '2020-01-20 15:44:49');
INSERT INTO public.jo_zone_tenures VALUES (93, 12, 8, '2011-01-07', '2013-04-01', NULL, '2020-01-20 15:44:49');
INSERT INTO public.jo_zone_tenures VALUES (94, 12, 4, '2013-01-24', '2018-10-04', NULL, '2020-01-20 15:44:49');
INSERT INTO public.jo_zone_tenures VALUES (95, 12, 6, '2016-02-05', '2018-10-04', NULL, '2020-01-20 15:44:49');
INSERT INTO public.jo_zone_tenures VALUES (96, 12, 8, '2018-10-11', NULL, NULL, NULL);


--
-- TOC entry 2483 (class 0 OID 451805)
-- Dependencies: 203
-- Data for Name: judicial_officer_posting_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_posting_preferences VALUES (3, 2, 4, 'SOUTH 24 PARGANAS', 'Zone d is most prefered', 'N', 5, '2020-01-09 00:00:00', '2020-01-09 00:00:00');
INSERT INTO public.judicial_officer_posting_preferences VALUES (2, 2, 8, 'ANDAMAN AND NICOBAR ISLAND', 'Zone d is most prefered', 'N', 5, '2020-01-09 00:00:00', '2020-01-09 00:00:00');
INSERT INTO public.judicial_officer_posting_preferences VALUES (7, 3, 4, 'HOOGLY
 Except :ARAMBAGH', '', 'Y', 6, '2020-01-09 00:00:00', '2020-01-09 00:00:00');
INSERT INTO public.judicial_officer_posting_preferences VALUES (4, 2, 4, 'KALYANI', 'Zone d is most prefered', 'N', 5, '2020-01-09 00:00:00', '2020-01-09 00:00:00');
INSERT INTO public.judicial_officer_posting_preferences VALUES (20, 12, 4, 'NORTH 24 PARGANAS
 except :BASIRHAT , BONGAON', '', 'Y', 15, '2020-01-27 00:00:00', '2020-01-27 00:00:00');
INSERT INTO public.judicial_officer_posting_preferences VALUES (8, 3, 8, 'COOCH BEHAR', '', 'Y', 6, '2020-01-09 00:00:00', '2020-01-09 00:00:00');


--
-- TOC entry 2479 (class 0 OID 451746)
-- Dependencies: 199
-- Data for Name: judicial_officer_postings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_postings VALUES (137, 12, 1, 1, 9, '', '', '1997-11-28', '1998-07-17', 'Posted at Hoogly Sadar', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 4);
INSERT INTO public.judicial_officer_postings VALUES (138, 12, 1, 1, 25, '', '', '1998-07-23', '2001-06-06', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 6);
INSERT INTO public.judicial_officer_postings VALUES (139, 12, 1, 1, 26, '', '', '2001-06-16', '2001-11-21', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 4);
INSERT INTO public.judicial_officer_postings VALUES (140, 12, 1, 1, 27, '', '', '2001-11-29', '2002-08-07', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 6);
INSERT INTO public.judicial_officer_postings VALUES (141, 12, 1, 1, 28, '', '', '2002-08-07', '2004-06-29', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 6);
INSERT INTO public.judicial_officer_postings VALUES (142, 12, 1, 2, 31, '', '', '2004-07-08', '2006-06-07', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 6);
INSERT INTO public.judicial_officer_postings VALUES (143, 12, 1, 2, 30, '', '', '2006-06-07', '2007-06-28', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 6);
INSERT INTO public.judicial_officer_postings VALUES (10, 3, 1, 1, 4, '', '', '2000-01-20', '2003-03-06', '', '2020-01-08 15:23:12', '2020-01-08 15:23:12', NULL, 6);
INSERT INTO public.judicial_officer_postings VALUES (11, 3, 1, 1, 7, '', '', '2004-08-09', '2005-06-20', '', '2020-01-08 15:23:12', '2020-01-08 15:23:12', NULL, 6);
INSERT INTO public.judicial_officer_postings VALUES (12, 3, 1, 2, 8, '', '', '2005-12-09', NULL, '', '2020-01-08 15:23:12', '2020-01-08 15:23:12', NULL, 7);
INSERT INTO public.judicial_officer_postings VALUES (144, 12, 1, 2, 29, '', '', '2007-07-04', '2011-01-05', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 4);
INSERT INTO public.judicial_officer_postings VALUES (145, 12, 1, 2, 32, '', '', '2011-01-07', '2013-01-22', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 8);
INSERT INTO public.judicial_officer_postings VALUES (146, 12, 1, 2, 19, '', '', '2013-01-24', '2013-04-01', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 4);
INSERT INTO public.judicial_officer_postings VALUES (147, 12, 1, 3, 34, '', '', '2013-04-01', '2016-01-29', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 4);
INSERT INTO public.judicial_officer_postings VALUES (148, 12, 1, 3, 35, '', '', '2016-02-05', '2018-10-04', '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 6);
INSERT INTO public.judicial_officer_postings VALUES (149, 12, 1, 3, 36, '', '', '2018-10-11', NULL, '', '2020-01-20 15:44:49', '2020-01-20 15:44:49', '', 8);
INSERT INTO public.judicial_officer_postings VALUES (38, 2, 1, 1, 2, '', '', '1991-08-30', '1992-05-16', 'Prob. Munsif', '2020-01-09 16:59:31', '2020-01-09 16:59:31', 'Test Designation', 6);
INSERT INTO public.judicial_officer_postings VALUES (39, 2, 1, 1, 4, '', '', '1992-05-18', '1993-01-29', '', '2020-01-09 16:59:31', '2020-01-09 16:59:31', '', 6);
INSERT INTO public.judicial_officer_postings VALUES (40, 2, 1, 1, 3, '', '', '1992-05-18', '1993-01-29', '', '2020-01-09 16:59:31', '2020-01-09 16:59:31', '', 6);
INSERT INTO public.judicial_officer_postings VALUES (41, 2, 1, 1, 6, '', '', '1993-01-30', '1993-05-14', '', '2020-01-09 16:59:31', '2020-01-09 16:59:31', '', 6);
INSERT INTO public.judicial_officer_postings VALUES (42, 2, 1, 2, NULL, 'test', 'writters building', '1995-07-20', NULL, '', '2020-01-09 16:59:31', '2020-01-09 16:59:31', NULL, 7);
INSERT INTO public.judicial_officer_postings VALUES (174, 13, 1, 1, 31, '', '', '2019-12-01', NULL, '', '2020-02-04 12:15:35', '2020-02-04 12:15:35', '', 4);
INSERT INTO public.judicial_officer_postings VALUES (175, 11, 1, 1, 11, '', '', '2001-10-16', '2004-06-30', '', '2020-02-07 10:53:28', '2020-02-07 10:53:28', 'JM 1st Court,Contai', 6);
INSERT INTO public.judicial_officer_postings VALUES (176, 11, 1, 1, 21, '', '', '2004-07-05', '2005-10-16', '', '2020-02-07 10:53:28', '2020-02-07 10:53:28', 'JM,Jhargram', 6);
INSERT INTO public.judicial_officer_postings VALUES (177, 11, 1, 1, 24, '', '', '2007-06-26', '2009-07-27', '', '2020-02-07 10:53:28', '2020-02-07 10:53:28', 'Principal Magistrate,Juvenile Justice Board,Bankshall Court From 11.06.2008 To 27.07.2009', 4);
INSERT INTO public.judicial_officer_postings VALUES (178, 11, 1, 2, 22, '', '', '2009-07-27', '2011-02-02', '', '2020-02-07 10:53:28', '2020-02-07 10:53:28', 'Leave Reserve Officer,Hoogly Sadar', 4);
INSERT INTO public.judicial_officer_postings VALUES (179, 11, 1, 2, 17, '', '', '2011-02-04', '2011-11-08', '', '2020-02-07 10:53:28', '2020-02-07 10:53:28', 'Additional District & Sessions Judge F.T.C Court - 1,DInhata From 8.11.2011(FN) to 8.02.2013 (FN)', 8);
INSERT INTO public.judicial_officer_postings VALUES (180, 11, 1, 2, 18, '', '', '2013-02-11', '2014-02-06', '', '2020-02-07 10:53:28', '2020-02-07 10:53:28', 'Additional District & Sessions Judge F.T.C,Baruipur From 06.02.2014 To 04.01.2016', 4);
INSERT INTO public.judicial_officer_postings VALUES (181, 11, 1, 3, 15, '', '', '2016-01-11', '2018-10-04', '', '2020-02-07 10:53:28', '2020-02-07 10:53:28', '', 6);
INSERT INTO public.judicial_officer_postings VALUES (182, 11, 1, 3, 16, '', '', '2018-10-11', NULL, '', '2020-02-07 10:53:28', '2020-02-07 10:53:28', '', 8);


--
-- TOC entry 2475 (class 0 OID 451716)
-- Dependencies: 195
-- Data for Name: judicial_officer_qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officer_qualifications VALUES (2, 2, 7, 1981, '2020-01-08 15:10:09', '2020-01-08 15:10:09');
INSERT INTO public.judicial_officer_qualifications VALUES (3, 2, 5, 1983, '2020-01-08 15:10:09', '2020-01-08 15:10:09');
INSERT INTO public.judicial_officer_qualifications VALUES (4, 3, 7, 1976, '2020-01-08 15:21:45', '2020-01-08 15:21:45');
INSERT INTO public.judicial_officer_qualifications VALUES (5, 3, 5, 1978, '2020-01-08 15:21:45', '2020-01-08 15:21:45');
INSERT INTO public.judicial_officer_qualifications VALUES (14, 11, 3, 1997, '2020-01-18 16:26:27', '2020-01-18 16:26:27');
INSERT INTO public.judicial_officer_qualifications VALUES (15, 11, 5, 2000, '2020-01-18 16:26:27', '2020-01-18 16:26:27');
INSERT INTO public.judicial_officer_qualifications VALUES (16, 12, 1, 1993, '2020-01-20 13:57:33', '2020-01-20 13:57:33');
INSERT INTO public.judicial_officer_qualifications VALUES (17, 12, 5, 1996, '2020-01-20 13:57:33', '2020-01-20 13:57:33');


--
-- TOC entry 2473 (class 0 OID 451671)
-- Dependencies: 193
-- Data for Name: judicial_officers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.judicial_officers VALUES (3, '621', 'WB621', 'Syed Neyazuddin Azad', 'M', 3, '1964-01-02', 51, 41, 'Burnpur', 'Rahmat nagar', 'Rahmat nagar', '9400000001', NULL, 'neyazuddin @gmail.com', NULL, 1, 1981, '1980-01-02', NULL, '2024-03-03', NULL, NULL, '2020-01-27 00:00:00', '', NULL, '2020-01-27', NULL);
INSERT INTO public.judicial_officers VALUES (13, '999', '', 'Amol Kumar Haldar', 'M', NULL, '1992-01-01', 51, 10, '', 'test address', 'test address', '', NULL, 'amol@gmail.com', NULL, 2, 2019, '2019-02-01', '2020-02-03', '2020-02-01', NULL, NULL, '2020-02-04 12:24:21', 'fdfdfdfdf', NULL, NULL, NULL);
INSERT INTO public.judicial_officers VALUES (11, '702', 'WB702', 'BIBHAS CHATTERJEE', 'M', 12, '1967-01-25', 51, 28, 'Chandannagar', 'BARALBAGAN 2ND LANE, BAGBAZAR,
PO & P.S. - CHANDANNAGAR,
DIST : HOOGHLY, PIN - 712136', 'BARALBAGAN 2ND LANE, BAGBAZAR,
PO & P.S. - CHANDANNAGAR,
DIST : HOOGHLY, PIN - 712136', '9830123456', NULL, 'bibhas@gmail.com', NULL, 1, 2000, '2001-03-22', NULL, '2027-01-31', '702_1579285800.jpg', NULL, '2020-02-05 15:22:32', '', 'Y', '2020-02-01', NULL);
INSERT INTO public.judicial_officers VALUES (12, '580', 'WB580', 'SMT SUDESHNA DE (CHATTERJEE)', 'F', 11, '1968-10-27', 51, 28, 'Chandannagar', 'C/O BIBHAS CHATTERJEE,
BARAL BAGAN, BAGBAZAR,
P.O. + P.S. - CHANDANNAGAR, 
DIST - HOOGHLY, PIN - 712136', 'C/O BIBHAS CHATTERJEE,
BARAL BAGAN, BAGBAZAR,
P.O. + P.S. - CHANDANNAGAR, 
DIST - HOOGHLY, PIN - 712136', '1234567890', NULL, 'sudeshna@gmail.com', NULL, 1, 1997, '1997-11-28', NULL, '2028-10-31', '580_1579458600.jpg', NULL, '2020-02-05 15:22:32', '', 'Y', '2020-01-27', NULL);
INSERT INTO public.judicial_officers VALUES (2, '208', 'WB208', 'Sukhendu Das', 'M', NULL, '1960-01-10', 51, 44, 'Bisnupur', 'Bisnupur', 'Bisnupur', '9400000000', NULL, 'sukhendu@gmail.com', NULL, 1, 1990, '1991-08-30', NULL, '2030-01-31', NULL, NULL, '2020-02-07 00:00:00', '', 'N', '2020-02-04', NULL);


--
-- TOC entry 2513 (class 0 OID 452072)
-- Dependencies: 233
-- Data for Name: lcr_departments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2487 (class 0 OID 451842)
-- Dependencies: 207
-- Data for Name: lcr_hc_ends; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2489 (class 0 OID 451875)
-- Dependencies: 209
-- Data for Name: lcr_lc_details; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2503 (class 0 OID 452002)
-- Dependencies: 223
-- Data for Name: lcr_status_checks; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2493 (class 0 OID 451906)
-- Dependencies: 213
-- Data for Name: lower_case_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lower_case_types VALUES (52, 'Act 39', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (1, 'Act Viii Miscellaneous Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (51, 'Act Xiv', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (58, 'Bail', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (59, 'CEX - Excise Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (3, 'Civil Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (4, 'Civil Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (5, 'Civil Misc', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (6, 'Civil Revision', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (7, 'Complaint Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (55, 'C R Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (8, 'Criminal Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (9, 'Criminal Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (11, 'Criminal Misc Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (12, 'Criminal Revision', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (10, 'Crl. Execution - Criminal Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (23, 'Divorce On Mutual Consent - Matri Suit Divorce Mutual Cons', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (13, 'Electricity Act', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (14, 'Estate Acquisition Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (16, 'Gr Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (17, 'Hindu Adapt. and Maint Act - Hindu Adapt. and Maint Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (18, 'Insolvancy Petition', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (19, 'L A C - Land Acquisition Cases', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (20, 'L A Ex. - Land Acquisition Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (53, 'L A Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (21, 'M A C C - M.A.C.C', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (22, 'M A C C Ex. - MACC Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (36, 'Maintenance Case - MR case for Maintenance', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (24, 'Matrimonial Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (25, 'Mc - Misc Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (54, 'M C Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (29, 'Misc. Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (26, 'Misc Case (pre-emption)', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (30, 'Misc. Criminal Revision', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (27, 'Misc Crl Case - Misc Criminal Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (31, 'Misc. Execution Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (57, 'Misc Petition (156) - Misc Petition', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (28, 'Mjc - Misc Judicial Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (32, 'Money Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (33, 'Money Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (34, 'Money Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (35, 'M V Act - Motor Vehicle Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (37, 'N D P S Case - NDPS Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (38, 'NGR Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (39, 'Other Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (40, 'Other Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (41, 'Probate Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (15, 'S C C Ex. - Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (42, 'S C C Suit - SCC SUIT', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (43, 'Sessions Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (44, 'Sessions Trial', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (45, 'Special Court Cases', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (46, 'Succession Case', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (47, 'Title Appeal', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (48, 'Title Execution', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (49, 'Title Suit', NULL, NULL, NULL);
INSERT INTO public.lower_case_types VALUES (50, 'Trust Suit', NULL, NULL, NULL);


--
-- TOC entry 2450 (class 0 OID 451530)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations VALUES (1, '2014_10_10_000000_create_user_types_table', 1);
INSERT INTO public.migrations VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations VALUES (3, '2019_06_12_000005_create_states_table', 1);
INSERT INTO public.migrations VALUES (4, '2019_06_12_000010_create_zones_table', 1);
INSERT INTO public.migrations VALUES (5, '2019_06_12_000020_create_districts_table', 1);
INSERT INTO public.migrations VALUES (6, '2019_06_12_000025_create_subdivisions_table', 1);
INSERT INTO public.migrations VALUES (7, '2019_06_12_000026_create_courts_table', 1);
INSERT INTO public.migrations VALUES (8, '2019_06_12_000027_create_ranks_table', 1);
INSERT INTO public.migrations VALUES (9, '2019_06_12_000040_create_designations_table', 1);
INSERT INTO public.migrations VALUES (10, '2019_06_12_000050_create_qualifications_table', 1);
INSERT INTO public.migrations VALUES (11, '2019_06_12_000090_create_recruitment_batches_table', 1);
INSERT INTO public.migrations VALUES (12, '2019_06_12_000100_create_judicial_officers_table', 1);
INSERT INTO public.migrations VALUES (13, '2019_06_13_091801_create_judicial_officer_qualifications_table', 1);
INSERT INTO public.migrations VALUES (14, '2019_06_13_092952_create_modes_table', 1);
INSERT INTO public.migrations VALUES (15, '2019_06_13_092953_create_judicial_officer_postings_table', 1);
INSERT INTO public.migrations VALUES (16, '2019_06_13_092955_create_jo_reportings_table', 1);
INSERT INTO public.migrations VALUES (17, '2019_06_13_101842_create_judicial_officer_posting_preferences_table', 1);
INSERT INTO public.migrations VALUES (18, '2019_07_22_064308_create_diaries_table', 1);
INSERT INTO public.migrations VALUES (19, '2019_08_13_091522_create_lcr_hc_ends_table', 1);
INSERT INTO public.migrations VALUES (20, '2019_08_13_091810_create_lcr_lc_details_table', 1);
INSERT INTO public.migrations VALUES (21, '2019_08_13_101720_create_hc_case_types_table', 1);
INSERT INTO public.migrations VALUES (22, '2019_08_13_102950_create_lower_case_types_table', 1);
INSERT INTO public.migrations VALUES (23, '2019_09_24_102032_create_grade_details_table', 1);
INSERT INTO public.migrations VALUES (24, '2019_09_24_102258_create_acr_histories_table', 1);
INSERT INTO public.migrations VALUES (25, '2019_11_14_163154_create_jo_zone_tenures_table', 1);
INSERT INTO public.migrations VALUES (26, '2019_11_14_163155_create_users_table', 1);
INSERT INTO public.migrations VALUES (27, '2019_11_21_113129_create_lcr_status_checks_table', 1);
INSERT INTO public.migrations VALUES (28, '2019_11_27_153252_create_history_updated_deleted_table', 1);
INSERT INTO public.migrations VALUES (29, '2019_11_27_153905_create_update_delete_procedure', 1);
INSERT INTO public.migrations VALUES (30, '2019_11_27_154543_create_update_delete_trigger', 1);
INSERT INTO public.migrations VALUES (31, '2019_11_28_121009_create_departments_table', 1);
INSERT INTO public.migrations VALUES (32, '2019_11_28_162816_create_jo_legal_experiences_table', 1);
INSERT INTO public.migrations VALUES (33, '2019_12_05_120846_create_lcr_departments_table', 1);
INSERT INTO public.migrations VALUES (34, '2019_12_05_151849_create_document_types_table', 1);
INSERT INTO public.migrations VALUES (35, '2019_12_05_151936_create_jo_documents_table', 1);
INSERT INTO public.migrations VALUES (38, '2019_12_12_140136_create_jo_grades_table', 2);
INSERT INTO public.migrations VALUES (44, '2020_01_17_112241_create_career_progression_stages_table', 3);
INSERT INTO public.migrations VALUES (45, '2020_01_17_112242_create_jo_career_progressions_table', 3);


--
-- TOC entry 2477 (class 0 OID 451736)
-- Dependencies: 197
-- Data for Name: modes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.modes VALUES (1, 'Court Posting', '2019-11-26 11:33:19', '2019-11-26 11:33:19');
INSERT INTO public.modes VALUES (2, 'Special Posting', '2019-11-26 11:33:26', '2019-11-26 11:33:26');
INSERT INTO public.modes VALUES (3, 'Deputation', '2019-11-26 11:33:26', '2019-11-26 11:33:26');


--
-- TOC entry 2453 (class 0 OID 451544)
-- Dependencies: 173
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2469 (class 0 OID 451651)
-- Dependencies: 189
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.qualifications VALUES (1, 'B.Sc (Hons.)', 1, '2020-01-08 14:14:29', '2020-01-08 14:17:18');
INSERT INTO public.qualifications VALUES (2, 'B.Sc', 1, '2020-01-08 14:17:33', '2020-01-08 14:17:33');
INSERT INTO public.qualifications VALUES (3, 'B.Com (Hons.)', 1, '2020-01-08 14:17:47', '2020-01-08 14:17:47');
INSERT INTO public.qualifications VALUES (4, 'B.Com', 1, '2020-01-08 14:18:01', '2020-01-08 14:18:01');
INSERT INTO public.qualifications VALUES (5, 'LL.B', 1, '2020-01-08 14:18:19', '2020-01-08 14:18:19');
INSERT INTO public.qualifications VALUES (6, 'B.A (Hons.)', 1, '2020-01-08 14:18:33', '2020-01-08 14:18:33');
INSERT INTO public.qualifications VALUES (7, 'B.A', 1, '2020-01-08 14:18:38', '2020-01-08 14:18:38');
INSERT INTO public.qualifications VALUES (8, 'M.A', 1, '2020-01-08 14:18:46', '2020-01-08 14:18:46');
INSERT INTO public.qualifications VALUES (9, 'M.Com', 1, '2020-01-08 14:18:52', '2020-01-08 14:18:52');
INSERT INTO public.qualifications VALUES (10, 'M.Sc', 1, '2020-01-08 14:18:57', '2020-01-08 14:18:57');
INSERT INTO public.qualifications VALUES (11, 'LL.M', 1, '2020-01-08 14:19:18', '2020-01-08 14:19:18');


--
-- TOC entry 2465 (class 0 OID 451628)
-- Dependencies: 185
-- Data for Name: ranks; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ranks VALUES (2, 'CJSD', '2019-12-15 00:00:00', '2019-12-15 00:00:00', 2);
INSERT INTO public.ranks VALUES (3, 'DJ(EL)', '2019-12-15 00:00:00', '2019-12-15 00:00:00', 1);
INSERT INTO public.ranks VALUES (1, 'CJJD/MUNSIF', '2019-12-15 00:00:00', '2019-12-15 00:00:00', 3);


--
-- TOC entry 2471 (class 0 OID 451661)
-- Dependencies: 191
-- Data for Name: recruitment_batches; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.recruitment_batches VALUES (1, 'PSC', NULL, '2019-12-15 00:00:00', '2019-12-15 00:00:00');
INSERT INTO public.recruitment_batches VALUES (2, 'Direct Entry', NULL, '2019-12-15 00:00:00', '2019-12-15 00:00:00');


--
-- TOC entry 2455 (class 0 OID 451553)
-- Dependencies: 175
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.states VALUES (51, 'WEST BENGAL', 11, '2019-06-18 10:06:22', '2019-06-18 10:06:22');
INSERT INTO public.states VALUES (52, 'BIHAR', 11, '2019-06-18 10:10:49', '2019-06-18 10:10:49');
INSERT INTO public.states VALUES (7, 'ODISHA', 11, '2019-06-17 06:27:05', '2019-08-05 05:57:55');
INSERT INTO public.states VALUES (31, 'ANDHRA PRADESH', 11, '2019-06-17 06:27:06', '2019-08-05 05:59:14');
INSERT INTO public.states VALUES (68, 'HIMACHAL PRADESH', 11, '2019-08-05 06:03:19', '2019-08-05 06:03:19');
INSERT INTO public.states VALUES (69, 'MADHYA PRADESH', 11, '2019-08-05 06:03:30', '2019-08-05 06:03:30');
INSERT INTO public.states VALUES (11, 'MAHARASTRA', 11, '2019-06-17 06:27:05', '2019-08-05 06:03:46');
INSERT INTO public.states VALUES (28, 'KERALA', 11, '2019-06-17 06:27:05', '2019-08-05 06:04:55');
INSERT INTO public.states VALUES (1, 'RAJASTHAN', 11, '2019-06-17 06:27:04', '2019-08-05 06:05:07');
INSERT INTO public.states VALUES (46, 'TAMILNADU', 11, '2019-06-17 06:27:06', '2019-08-05 06:07:52');
INSERT INTO public.states VALUES (25, 'KARNTAKA', 11, '2019-06-17 06:27:05', '2019-08-05 06:16:44');
INSERT INTO public.states VALUES (44, 'HYDERABAD', 11, '2019-06-17 06:27:06', '2019-08-05 06:17:30');
INSERT INTO public.states VALUES (42, 'JAMMU AND KAHMIR', 11, '2019-06-17 06:27:06', '2019-08-05 06:17:59');
INSERT INTO public.states VALUES (70, 'PUNJAB', 11, '2019-08-05 06:18:05', '2019-08-05 06:18:05');
INSERT INTO public.states VALUES (71, 'HARIYANA', 11, '2019-08-05 06:18:12', '2019-08-05 06:18:12');
INSERT INTO public.states VALUES (72, 'JHARKHAND', 11, '2019-08-05 06:18:28', '2019-08-05 06:18:28');
INSERT INTO public.states VALUES (73, 'CHATTISHGARH', 11, '2019-08-05 06:18:43', '2019-08-05 06:18:43');
INSERT INTO public.states VALUES (75, 'ANDAMAN AND NICOBAR ISLAND', 11, '2019-11-11 14:04:17', '2019-11-11 14:04:17');
INSERT INTO public.states VALUES (17, 'GUJRAT', 11, '2019-06-17 06:27:05', '2019-11-22 15:57:57');
INSERT INTO public.states VALUES (2, 'ILLINOIS', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
INSERT INTO public.states VALUES (24, 'WEST VIRGINIA', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
INSERT INTO public.states VALUES (48, 'MASSACHUSETTS', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states VALUES (38, 'KENTUCKY', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
INSERT INTO public.states VALUES (8, 'WYOMING', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');


--
-- TOC entry 2461 (class 0 OID 451593)
-- Dependencies: 181
-- Data for Name: subdivisions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subdivisions VALUES (152, 'CAMPVELL BAY', 50, 8, 11, '2019-11-15 13:28:21', '2019-11-15 13:28:21');
INSERT INTO public.subdivisions VALUES (133, 'MAYABUNDER', 50, 8, 11, '2019-11-11 14:08:37', '2019-11-11 14:08:37');
INSERT INTO public.subdivisions VALUES (132, 'CAR NICOBAR', 50, 8, 11, '2019-11-11 14:08:27', '2019-11-11 14:08:27');
INSERT INTO public.subdivisions VALUES (131, 'PORT BLAIR', 50, 8, 11, '2019-11-11 14:08:16', '2019-11-11 14:08:16');
INSERT INTO public.subdivisions VALUES (130, 'MAL', 48, 8, 11, '2019-11-11 14:02:42', '2019-11-11 14:02:42');
INSERT INTO public.subdivisions VALUES (129, 'ALIPURDUAR', 48, 8, 11, '2019-11-11 14:02:34', '2019-11-11 14:02:34');
INSERT INTO public.subdivisions VALUES (128, 'JALPAIGURI SADAR', 48, 8, 11, '2019-11-11 14:02:08', '2019-11-11 14:02:08');
INSERT INTO public.subdivisions VALUES (127, 'BUNIADPUR', 8, 8, 11, '2019-11-11 14:01:48', '2019-11-11 14:01:48');
INSERT INTO public.subdivisions VALUES (125, 'BALURGHAT', 8, 8, 11, '2019-11-11 14:01:02', '2019-11-11 14:01:02');
INSERT INTO public.subdivisions VALUES (124, 'GORUBATHAN', 7, 8, 11, '2019-11-11 13:59:52', '2019-11-11 13:59:52');
INSERT INTO public.subdivisions VALUES (123, 'KALIMPONG SADAR', 7, 8, 11, '2019-11-11 13:59:32', '2019-11-11 13:59:32');
INSERT INTO public.subdivisions VALUES (122, 'MUNGPOO', 10, 8, 11, '2019-11-11 13:59:14', '2019-11-11 13:59:14');
INSERT INTO public.subdivisions VALUES (121, 'MIRIK', 10, 8, 11, '2019-11-11 13:59:04', '2019-11-11 13:59:04');
INSERT INTO public.subdivisions VALUES (120, 'KURSEONG', 10, 8, 11, '2019-11-11 13:58:55', '2019-11-11 13:58:55');
INSERT INTO public.subdivisions VALUES (119, 'SILIGURI', 10, 8, 11, '2019-11-11 13:58:43', '2019-11-11 13:58:43');
INSERT INTO public.subdivisions VALUES (118, 'DARJEELING SADAR', 10, 8, 11, '2019-11-11 13:58:19', '2019-11-11 13:58:19');
INSERT INTO public.subdivisions VALUES (117, 'MEKHLIGUNJ', 47, 8, 11, '2019-11-11 13:57:57', '2019-11-11 13:57:57');
INSERT INTO public.subdivisions VALUES (116, 'MATHABHANGA', 47, 8, 11, '2019-11-11 13:57:43', '2019-11-11 13:57:43');
INSERT INTO public.subdivisions VALUES (115, 'TUFANGUNJ', 47, 8, 11, '2019-11-11 13:57:27', '2019-11-11 13:57:27');
INSERT INTO public.subdivisions VALUES (113, 'DINHATA', 47, 8, 11, '2019-11-11 13:56:39', '2019-11-11 13:56:39');
INSERT INTO public.subdivisions VALUES (112, 'COOCH BEHAR SADAR', 47, 8, 11, '2019-11-11 13:56:24', '2019-11-11 13:56:24');
INSERT INTO public.subdivisions VALUES (111, 'ISLAMPUR', 29, 8, 11, '2019-11-11 13:56:03', '2019-11-11 13:56:03');
INSERT INTO public.subdivisions VALUES (110, 'RAIGANJ', 29, 8, 11, '2019-11-11 13:55:49', '2019-11-11 13:55:49');
INSERT INTO public.subdivisions VALUES (109, 'LALBAGH', 44, 7, 11, '2019-11-11 13:53:14', '2019-11-11 13:53:14');
INSERT INTO public.subdivisions VALUES (108, 'KANDI', 44, 7, 11, '2019-11-11 13:52:34', '2019-11-11 13:52:34');
INSERT INTO public.subdivisions VALUES (106, 'BERHAMPORE', 44, 7, 11, '2019-11-11 13:52:11', '2019-11-11 13:52:11');
INSERT INTO public.subdivisions VALUES (107, 'JANGIPUR', 44, 7, 11, '2019-11-11 13:52:25', '2019-11-11 13:52:25');
INSERT INTO public.subdivisions VALUES (105, 'HALDIA', 43, 6, 11, '2019-11-11 13:51:34', '2019-11-11 13:51:34');
INSERT INTO public.subdivisions VALUES (104, 'CONTAI', 43, 6, 11, '2019-11-11 13:48:53', '2019-11-11 13:48:53');
INSERT INTO public.subdivisions VALUES (103, 'TAMLUK', 45, 6, 11, '2019-11-11 13:48:14', '2019-11-11 13:48:33');
INSERT INTO public.subdivisions VALUES (102, 'NABADWIP', 46, 6, 11, '2019-11-11 13:47:28', '2019-11-11 13:47:28');
INSERT INTO public.subdivisions VALUES (101, 'TEHATTA', 46, 6, 11, '2019-11-11 13:47:06', '2019-11-11 13:47:06');
INSERT INTO public.subdivisions VALUES (100, 'RANAGHAT', 46, 6, 11, '2019-11-11 13:46:53', '2019-11-11 13:46:53');
INSERT INTO public.subdivisions VALUES (99, 'KALYANI', 46, 4, 11, '2019-11-11 13:46:33', '2019-11-11 13:46:33');
INSERT INTO public.subdivisions VALUES (98, 'KRISHNANAGAR', 46, 6, 11, '2019-11-11 13:46:17', '2019-11-11 13:46:17');
INSERT INTO public.subdivisions VALUES (97, 'KHARAGPUR', 43, 6, 11, '2019-11-11 13:28:42', '2019-11-11 13:28:42');
INSERT INTO public.subdivisions VALUES (96, 'GARBETA', 43, 6, 11, '2019-11-11 13:28:13', '2019-11-11 13:28:13');
INSERT INTO public.subdivisions VALUES (95, 'DANTAN', 43, 6, 11, '2019-11-11 13:27:47', '2019-11-11 13:27:47');
INSERT INTO public.subdivisions VALUES (94, 'GHATAL', 43, 6, 11, '2019-11-11 13:27:28', '2019-11-11 13:27:28');
INSERT INTO public.subdivisions VALUES (93, 'PASCHIM MEDINIPUR SADAR', 43, 6, 11, '2019-11-11 13:27:14', '2019-11-11 13:27:14');
INSERT INTO public.subdivisions VALUES (92, 'DURGAPUR', 41, 6, 11, '2019-11-11 13:24:04', '2019-11-11 13:24:04');
INSERT INTO public.subdivisions VALUES (91, 'ASANSOL', 41, 6, 11, '2019-11-11 13:23:34', '2019-11-11 13:23:34');
INSERT INTO public.subdivisions VALUES (90, 'JHARGRAM', 42, 6, 11, '2019-11-11 13:23:05', '2019-11-11 13:23:05');
INSERT INTO public.subdivisions VALUES (89, 'KATWA', 40, 6, 11, '2019-11-11 13:22:40', '2019-11-11 13:22:40');
INSERT INTO public.subdivisions VALUES (88, 'KALNA', 40, 6, 11, '2019-11-11 13:22:20', '2019-11-11 13:22:20');
INSERT INTO public.subdivisions VALUES (87, 'PURBA BARDHAMAN SADAR', 40, 6, 11, '2019-11-11 13:22:06', '2019-11-11 13:22:06');
INSERT INTO public.subdivisions VALUES (86, 'RAGHUNATHPUR', 5, 7, 11, '2019-11-11 13:07:24', '2019-11-11 13:07:24');
INSERT INTO public.subdivisions VALUES (85, 'PURULIA SADAR', 5, 7, 11, '2019-11-11 13:07:06', '2019-11-11 13:07:06');
INSERT INTO public.subdivisions VALUES (83, 'CHANCHAL', 6, 7, 11, '2019-11-11 13:04:39', '2019-11-11 13:04:39');
INSERT INTO public.subdivisions VALUES (82, 'MALDA SADAR', 6, 7, 11, '2019-11-11 13:04:24', '2019-11-11 13:04:24');
INSERT INTO public.subdivisions VALUES (81, 'DUBRAJPUR', 27, 7, 11, '2019-11-11 13:04:02', '2019-11-11 13:04:02');
INSERT INTO public.subdivisions VALUES (80, 'RAMPURHAT', 27, 7, 11, '2019-11-11 13:03:39', '2019-11-11 13:03:39');
INSERT INTO public.subdivisions VALUES (79, 'BOLPUR', 27, 7, 11, '2019-11-11 13:03:21', '2019-11-11 13:03:21');
INSERT INTO public.subdivisions VALUES (78, 'BIRBHUM SADAR', 27, 7, 11, '2019-11-11 13:03:09', '2019-11-11 13:03:09');
INSERT INTO public.subdivisions VALUES (77, 'KHATRA', 25, 7, 11, '2019-11-11 13:02:41', '2019-11-11 13:02:41');
INSERT INTO public.subdivisions VALUES (76, 'BISHNUPUR', 25, 7, 11, '2019-11-11 13:02:30', '2019-11-11 13:02:30');
INSERT INTO public.subdivisions VALUES (75, 'BANKURA SADAR', 25, 7, 11, '2019-11-11 13:02:17', '2019-11-11 13:02:17');
INSERT INTO public.subdivisions VALUES (74, 'SEALDAH', 13, 4, 11, '2019-11-11 12:56:33', '2019-11-11 12:56:33');
INSERT INTO public.subdivisions VALUES (71, 'KAKDWIP', 13, 4, 11, '2019-11-11 12:39:24', '2019-11-11 12:39:24');
INSERT INTO public.subdivisions VALUES (70, 'DIAMOND HARBOUR', 13, 4, 11, '2019-11-11 12:38:53', '2019-11-11 12:38:53');
INSERT INTO public.subdivisions VALUES (69, 'BARUIPORE', 13, 4, 11, '2019-11-11 12:38:32', '2019-11-11 12:38:32');
INSERT INTO public.subdivisions VALUES (68, 'ALIPORE', 13, 4, 11, '2019-11-11 12:38:18', '2019-11-15 14:35:01');
INSERT INTO public.subdivisions VALUES (67, 'BASIRHAT', 38, 6, 11, '2019-11-11 12:37:43', '2019-11-11 12:37:43');
INSERT INTO public.subdivisions VALUES (66, 'BONGAON', 38, 6, 11, '2019-11-11 12:37:28', '2019-11-11 12:37:28');
INSERT INTO public.subdivisions VALUES (65, 'SEALDAH', 38, 4, 11, '2019-11-11 12:37:00', '2019-11-11 12:37:00');
INSERT INTO public.subdivisions VALUES (64, 'BIDHANNAGAR', 38, 4, 11, '2019-11-11 12:36:40', '2019-11-11 12:36:40');
INSERT INTO public.subdivisions VALUES (63, 'BARRACKPORE', 38, 4, 11, '2019-11-11 12:36:18', '2019-11-11 12:36:18');
INSERT INTO public.subdivisions VALUES (62, 'BARASAT', 38, 4, 11, '2019-11-11 12:35:41', '2019-11-11 12:35:41');
INSERT INTO public.subdivisions VALUES (61, 'AMTA', 26, 4, 11, '2019-11-11 12:25:28', '2019-11-11 12:25:28');
INSERT INTO public.subdivisions VALUES (60, 'ULUBERIA', 26, 4, 11, '2019-11-11 12:25:19', '2019-11-11 12:25:19');
INSERT INTO public.subdivisions VALUES (58, 'HOWRAH SADAR', 26, 4, 11, '2019-11-11 12:24:01', '2019-11-11 12:24:01');
INSERT INTO public.subdivisions VALUES (57, 'ARAMBAGH', 28, 6, 11, '2019-11-11 12:18:01', '2019-11-11 12:18:01');
INSERT INTO public.subdivisions VALUES (56, 'CHANDANNAGAR', 28, 4, 11, '2019-11-11 12:17:46', '2019-11-11 12:17:46');
INSERT INTO public.subdivisions VALUES (55, 'SERAMPORE', 28, 4, 11, '2019-11-11 12:17:18', '2019-11-11 12:17:18');
INSERT INTO public.subdivisions VALUES (54, 'HOOGLY SADAR', 28, 4, 11, '2019-11-11 12:16:48', '2019-11-11 12:24:53');
INSERT INTO public.subdivisions VALUES (53, 'PROVINCIAL  SMALL CAUSES COURT (PSCC)', 36, 4, 11, '2019-11-11 12:14:15', '2019-11-11 12:15:22');
INSERT INTO public.subdivisions VALUES (52, 'CITY CIVIL COURT', 36, 4, 11, '2019-11-11 12:14:01', '2019-11-11 12:14:01');
INSERT INTO public.subdivisions VALUES (51, 'CITY SESSIONS COURT', 36, 4, 11, '2019-11-11 12:13:44', '2019-11-11 12:13:44');


--
-- TOC entry 2452 (class 0 OID 451538)
-- Dependencies: 172
-- Data for Name: user_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.user_types VALUES (6, 'Court', '2019-08-30 06:31:42', '2019-08-30 06:31:42');
INSERT INTO public.user_types VALUES (1, 'Administrator', NULL, NULL);
INSERT INTO public.user_types VALUES (5, 'Inspection', '2019-08-28 08:33:30', '2019-11-22 14:23:26');
INSERT INTO public.user_types VALUES (2, 'Judicial Officer', NULL, '2019-11-22 14:24:03');
INSERT INTO public.user_types VALUES (7, 'Central Dispatch Section', '2019-11-22 17:41:12', '2019-11-22 17:41:12');
INSERT INTO public.user_types VALUES (8, 'Department', '2019-11-28 16:17:12', '2019-11-28 16:17:12');
INSERT INTO public.user_types VALUES (9, 'Appointment', '2019-11-28 16:17:12', '2019-11-28 16:17:12');


--
-- TOC entry 2501 (class 0 OID 451966)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (14, 'jo00011', 'BIBHAS CHATTERJEE', 2, NULL, 11, NULL, NULL, 'bibhas@gmail.com', NULL, '$2y$10$TwN7i5cA5UgC.8Y1x0UjN.WKPQ8JKe2ieOy3rT2kCA1wCb.Lu/Lvm', NULL, '2020-01-18 16:26:27', '2020-01-18 16:26:27');
INSERT INTO public.users VALUES (2, 'appt', 'Appointment Section', 9, NULL, NULL, NULL, NULL, 'app@gmail.com', NULL, '$2y$10$aBAFK1T59AzcJVKBGLkV4uMOHGSxxYUkuFR0IE84imZjK55wryJ2u', NULL, '2019-06-19 06:00:07', '2019-06-19 06:00:07');
INSERT INTO public.users VALUES (3, 'court1', 'Court', 6, 3, NULL, NULL, NULL, 'court1@court1.court1', NULL, '$2y$10$aBAFK1T59AzcJVKBGLkV4uMOHGSxxYUkuFR0IE84imZjK55wryJ2u', NULL, '2019-09-16 10:59:20', '2019-09-16 10:59:20');
INSERT INTO public.users VALUES (15, 'jo00012', 'SMT SUDESHNA DE (CHATTERJEE)', 2, NULL, 12, NULL, NULL, 'sudeshna@gmail.com', NULL, '$2y$10$7rO8yiUlPyFlLy3i8NmsUeo6WwprwNJnSWa1KrD.keNdxbYbBIOwG', NULL, '2020-01-20 13:57:33', '2020-01-20 13:57:33');
INSERT INTO public.users VALUES (5, 'jo00002', 'Sukhendu Das', 2, NULL, 2, NULL, NULL, 'sukhendu@gmail.com', NULL, '$2y$10$ZKGSBBN0zEOzPvIjj.wP3OQ959nnGwrVzXk3vSvINEhl4t.XCY8a6', NULL, '2020-01-08 15:10:09', '2020-01-08 15:10:09');
INSERT INTO public.users VALUES (16, 'jo00013', 'Amol Kumar Haldar', 2, NULL, 13, NULL, NULL, 'amol@gmail.com', NULL, '$2y$10$fYdivg51Vn5CALgFJxcEIutmVo7bCZEnkkEJ9j0G40qIvjSLSYqja', NULL, '2020-02-04 12:05:00', '2020-02-04 12:05:00');
INSERT INTO public.users VALUES (6, 'jo00003', 'Syed Neyazuddin Azad', 2, NULL, 3, NULL, NULL, 'neyazuddin@gmail.com', NULL, '$2y$10$35GZkej/RM0ctJHtBcp3Mu7bAyssLhyuNS7537YDBOav0sBgDrM4C', NULL, '2020-01-08 15:21:45', '2020-01-08 15:21:45');
INSERT INTO public.users VALUES (1, 'admin', 'Administrator', 1, 1, NULL, NULL, NULL, 'admin@admin.admin', NULL, '$2y$10$aBAFK1T59AzcJVKBGLkV4uMOHGSxxYUkuFR0IE84imZjK55wryJ2u', '2YnvjnqLApTCf9k6f7ELRUCNLZV5DOMc7X6UvujgyAhDfBG4VyiqrucPmAKg', '2019-06-19 06:00:07', '2019-06-19 06:00:07');


--
-- TOC entry 2457 (class 0 OID 451563)
-- Dependencies: 177
-- Data for Name: zones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.zones VALUES (6, 'B', 1095, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones VALUES (8, 'D', 730, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
INSERT INTO public.zones VALUES (7, 'C', 1095, 11, '2019-11-13 00:00:00', '2019-11-15 11:31:20');
INSERT INTO public.zones VALUES (4, 'A', 1095, 1, '2019-11-13 00:00:00', '2020-02-11 12:00:42');


--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 216
-- Name: acr_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.acr_histories_id_seq', 1, false);


--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 240
-- Name: career_progression_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.career_progression_stages_id_seq', 6, true);


--
-- TOC entry 2568 (class 0 OID 0)
-- Dependencies: 182
-- Name: courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courts_id_seq', 2, true);


--
-- TOC entry 2569 (class 0 OID 0)
-- Dependencies: 228
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.departments_id_seq', 1, false);


--
-- TOC entry 2570 (class 0 OID 0)
-- Dependencies: 186
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.designations_id_seq', 8, true);


--
-- TOC entry 2571 (class 0 OID 0)
-- Dependencies: 204
-- Name: diaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.diaries_id_seq', 1, false);


--
-- TOC entry 2572 (class 0 OID 0)
-- Dependencies: 178
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.districts_id_seq', 1, true);


--
-- TOC entry 2573 (class 0 OID 0)
-- Dependencies: 234
-- Name: document_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.document_types_id_seq', 4, true);


--
-- TOC entry 2574 (class 0 OID 0)
-- Dependencies: 214
-- Name: grade_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grade_details_id_seq', 1, false);


--
-- TOC entry 2575 (class 0 OID 0)
-- Dependencies: 210
-- Name: hc_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hc_case_types_id_seq', 1, false);


--
-- TOC entry 2576 (class 0 OID 0)
-- Dependencies: 226
-- Name: history_deleted_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.history_deleted_data_id_seq', 224, true);


--
-- TOC entry 2577 (class 0 OID 0)
-- Dependencies: 224
-- Name: history_updated_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.history_updated_data_id_seq', 166, true);


--
-- TOC entry 2578 (class 0 OID 0)
-- Dependencies: 242
-- Name: jo_career_progressions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_career_progressions_id_seq', 1, false);


--
-- TOC entry 2579 (class 0 OID 0)
-- Dependencies: 236
-- Name: jo_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_documents_id_seq', 4, true);


--
-- TOC entry 2580 (class 0 OID 0)
-- Dependencies: 238
-- Name: jo_grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_grades_id_seq', 11, true);


--
-- TOC entry 2581 (class 0 OID 0)
-- Dependencies: 230
-- Name: jo_legal_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_legal_experiences_id_seq', 5, true);


--
-- TOC entry 2582 (class 0 OID 0)
-- Dependencies: 200
-- Name: jo_reportings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_reportings_id_seq', 3, true);


--
-- TOC entry 2583 (class 0 OID 0)
-- Dependencies: 218
-- Name: jo_zone_tenures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jo_zone_tenures_id_seq', 121, true);


--
-- TOC entry 2584 (class 0 OID 0)
-- Dependencies: 202
-- Name: judicial_officer_posting_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_posting_preferences_id_seq', 20, true);


--
-- TOC entry 2585 (class 0 OID 0)
-- Dependencies: 198
-- Name: judicial_officer_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_postings_id_seq', 182, true);


--
-- TOC entry 2586 (class 0 OID 0)
-- Dependencies: 194
-- Name: judicial_officer_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officer_qualifications_id_seq', 17, true);


--
-- TOC entry 2587 (class 0 OID 0)
-- Dependencies: 192
-- Name: judicial_officers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.judicial_officers_id_seq', 13, true);


--
-- TOC entry 2588 (class 0 OID 0)
-- Dependencies: 232
-- Name: lcr_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_departments_id_seq', 1, false);


--
-- TOC entry 2589 (class 0 OID 0)
-- Dependencies: 206
-- Name: lcr_hc_ends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_hc_ends_id_seq', 1, false);


--
-- TOC entry 2590 (class 0 OID 0)
-- Dependencies: 208
-- Name: lcr_lc_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_lc_details_id_seq', 1, false);


--
-- TOC entry 2591 (class 0 OID 0)
-- Dependencies: 222
-- Name: lcr_status_checks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lcr_status_checks_id_seq', 1, false);


--
-- TOC entry 2592 (class 0 OID 0)
-- Dependencies: 212
-- Name: lower_case_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lower_case_types_id_seq', 1, false);


--
-- TOC entry 2593 (class 0 OID 0)
-- Dependencies: 169
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 45, true);


--
-- TOC entry 2594 (class 0 OID 0)
-- Dependencies: 196
-- Name: modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.modes_id_seq', 1, false);


--
-- TOC entry 2595 (class 0 OID 0)
-- Dependencies: 188
-- Name: qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.qualifications_id_seq', 12, true);


--
-- TOC entry 2596 (class 0 OID 0)
-- Dependencies: 184
-- Name: ranks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ranks_id_seq', 1, false);


--
-- TOC entry 2597 (class 0 OID 0)
-- Dependencies: 190
-- Name: recruitment_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recruitment_batches_id_seq', 1, false);


--
-- TOC entry 2598 (class 0 OID 0)
-- Dependencies: 174
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 1, false);


--
-- TOC entry 2599 (class 0 OID 0)
-- Dependencies: 180
-- Name: subdivisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subdivisions_id_seq', 1, true);


--
-- TOC entry 2600 (class 0 OID 0)
-- Dependencies: 171
-- Name: user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_types_id_seq', 1, false);


--
-- TOC entry 2601 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 16, true);


--
-- TOC entry 2602 (class 0 OID 0)
-- Dependencies: 176
-- Name: zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zones_id_seq', 1, false);


-- Completed on 2020-02-11 13:51:46

--
-- PostgreSQL database dump complete
--

