



create table public.acr_histories (
    id bigint not null,
    jo_code character varying(255) not null,
    judicial_officer_id bigint not null,
    grade_id integer not null,
    year integer not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);



create sequence public.acr_histories_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.acr_histories_id_seq owned by public.acr_histories.id;




create table public.categories (
    id integer not null,
    category_name character varying(255) not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);




create sequence public.categories_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.categories_id_seq owned by public.categories.id;




create table public.courts (
    id integer not null,
    court_name character varying(255) not null,
    subdivision_id integer not null,
    latitude double precision,
    longitude double precision,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);




create sequence public.courts_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.courts_id_seq owned by public.courts.id;




create table public.designations (
    id integer not null,
    designation_name character varying(255) not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);



create sequence public.designations_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.designations_id_seq owned by public.designations.id;





create table public.diaries (
    id bigint not null,
    judicial_officer_id bigint not null,
    date_of_schedule date not null,
    description text not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);





create sequence public.diaries_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.diaries_id_seq owned by public.diaries.id;




create table public.districts (
    id integer not null,
    district_name character varying(255) not null,
    state_id integer not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);





create sequence public.districts_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.districts_id_seq owned by public.districts.id;




create table public.grade_details (
    id integer not null,
    grade_name character varying(255) not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);





create sequence public.grade_details_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.grade_details_id_seq owned by public.grade_details.id;





create table public.hc_case_types (
    id integer not null,
    type_name character varying(255) not null,
    full_form character varying(255) not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);





create sequence public.hc_case_types_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.hc_case_types_id_seq owned by public.hc_case_types.id;




create table public.jo_photos (
    id bigint not null,
    judicial_officer_id bigint not null,
    photo bytea not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);





create sequence public.jo_photos_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.jo_photos_id_seq owned by public.jo_photos.id;





create table public.jo_reporting_reviewings (
    id bigint not null,
    judicial_officer_id bigint not null,
    reporting_officer_id bigint,
    from_date date not null,
    to_date date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);




create sequence public.jo_reporting_reviewings_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.jo_reporting_reviewings_id_seq owned by public.jo_reporting_reviewings.id;




create table public.jo_zone_tenures (
    id bigint not null,
    judicial_officer_id bigint not null,
    zone_id integer not null,
    from_date date not null,
    to_date date,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);




create sequence public.jo_zone_tenures_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.jo_zone_tenures_id_seq owned by public.jo_zone_tenures.id;




create table public.judicial_officer_posting_preferences (
    id bigint not null,
    judicial_officer_id bigint not null,
    zone_id integer not null,
    remarks text not null,
    final_submission character varying(255) not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);



create sequence public.judicial_officer_posting_preferences_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.judicial_officer_posting_preferences_id_seq owned by public.judicial_officer_posting_preferences.id;




create table public.judicial_officer_postings (
    id bigint not null,
    judicial_officer_id bigint not null,
    designation_id integer not null,
    court_id integer,
    other_station_name character varying(255),
    mode_id integer not null,
    from_date date not null,
    to_date date,
    created_by integer not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);



create sequence public.judicial_officer_postings_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.judicial_officer_postings_id_seq owned by public.judicial_officer_postings.id;




create table public.judicial_officer_qualifications (
    id bigint not null,
    judicial_officer_id bigint not null,
    qualification_id integer not null,
    passing_year integer not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);




create sequence public.judicial_officer_qualifications_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.judicial_officer_qualifications_id_seq owned by public.judicial_officer_qualifications.id;





create table public.judicial_officers (
    id bigint not null,
    registration_no character varying(255) not null,
    jo_code character varying(255) not null,
    officer_name character varying(255) not null,
    gender character varying(255) not null,
    guardian_name character varying(255) not null,
    gurdian_relation character varying(255) not null,
    date_of_birth date not null,
    home_state_id integer not null,
    home_district_id integer not null,
    hometown character varying(255),
    present_address text not null,
    permanent_address text not null,
    religion_id integer,
    category_id integer,
    blood_group character varying(255),
    identification_mark character varying(255),
    aadhaar_no character(12),
    pan_no character(10),
    gpf_no character varying(255),
    mobile_no_1 character varying(255) not null,
    mobile_no_2 character varying(255),
    email_id_1 character varying(255) not null,
    email_id_2 character varying(255),
    recruitment_batch_id integer not null,
    date_of_joining date not null,
    date_of_confirmation date not null,
    date_of_retirement date not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);



create sequence public.judicial_officers_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.judicial_officers_id_seq owned by public.judicial_officers.id;




create table public.lcr_hc_ends (
    id bigint not null,
    district integer not null,
    subdivision integer not null,
    court integer not null,
    hc_case_record character varying(255) not null,
    hc_case_no integer not null,
    hc_case_year integer not null,
    deadline date not null,
    memo_no character varying(255) not null,
    status_flag character varying(255) not null,
    memo_date date not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);





create sequence public.lcr_hc_ends_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.lcr_hc_ends_id_seq owned by public.lcr_hc_ends.id;





create table public.lcr_lc_details (
    id bigint not null,
    hc_id bigint not null,
    lower_case_record character varying(255) not null,
    lower_case_no integer not null,
    lower_case_year integer not null,
    compliance_flag character varying(255),
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);




create sequence public.lcr_lc_details_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.lcr_lc_details_id_seq owned by public.lcr_lc_details.id;




create table public.lcr_status_checks (
    id bigint not null,
    hc_id bigint not null,
    remarks character varying(255) not null,
    memo_no character varying(255) not null,
    memo_date date not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);



create sequence public.lcr_status_checks_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.lcr_status_checks_id_seq owned by public.lcr_status_checks.id;




create table public.lower_case_types (
    id integer not null,
    type_name character varying(255) not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);





create sequence public.lower_case_types_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.lower_case_types_id_seq owned by public.lower_case_types.id;





create table public.migrations (
    id integer not null,
    migration character varying(255) not null,
    batch integer not null
);



create sequence public.migrations_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.migrations_id_seq owned by public.migrations.id;




create table public.modes (
    id integer not null,
    posting_mode character varying(255) not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);




create sequence public.modes_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.modes_id_seq owned by public.modes.id;




create table public.password_resets (
    email character varying(255) not null,
    token character varying(255) not null,
    created_at timestamp(0) without time zone
);




create table public.qualifications (
    id integer not null,
    qualification_name character varying(255) not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);



create sequence public.qualifications_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.qualifications_id_seq owned by public.qualifications.id;


create table public.recruitment_batches (
    id integer not null,
    recruitment_batch_desc character varying(255) not null,
    batch_year integer not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);





create sequence public.recruitment_batches_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.recruitment_batches_id_seq owned by public.recruitment_batches.id;





create table public.religions (
    id integer not null,
    religion_name character varying(255) not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);




create sequence public.religions_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.religions_id_seq owned by public.religions.id;



create table public.states (
    id integer not null,
    state_name character varying(255) not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);



create sequence public.states_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;





alter sequence public.states_id_seq owned by public.states.id;




create table public.subdivisions (
    id integer not null,
    subdivision_name character varying(255) not null,
    district_id integer not null,
    zone_id integer not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);




create sequence public.subdivisions_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.subdivisions_id_seq owned by public.subdivisions.id;



create table public.user_types (
    id integer not null,
    type_name character varying(255) not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);




create sequence public.user_types_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.user_types_id_seq owned by public.user_types.id;




create table public.users (
    id bigint not null,
    user_id character varying(255) not null,
    name character varying(255) not null,
    user_type_id integer not null,
    court_id integer,
    judicial_officer_id bigint,
    jo_code character varying(255),
    department_id integer,
    email character varying(255) not null,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) not null,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);



create sequence public.users_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.users_id_seq owned by public.users.id;




create table public.zone_subdivisions (
    id integer not null,
    zone_id integer not null,
    subdivision_id integer not null,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);



create sequence public.zone_subdivisions_id_seq
    as integer
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;



alter sequence public.zone_subdivisions_id_seq owned by public.zone_subdivisions.id;




create table public.zones (
    id bigint not null,
    zone_name character varying(255) not null,
    min_service_days integer,
    created_by bigint not null,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);





create sequence public.zones_id_seq
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1;




alter sequence public.zones_id_seq owned by public.zones.id;




alter table only public.acr_histories alter column id set default nextval('public.acr_histories_id_seq'::regclass);



alter table only public.categories alter column id set default nextval('public.categories_id_seq'::regclass);




alter table only public.courts alter column id set default nextval('public.courts_id_seq'::regclass);




alter table only public.designations alter column id set default nextval('public.designations_id_seq'::regclass);


alter table only public.diaries alter column id set default nextval('public.diaries_id_seq'::regclass);



alter table only public.districts alter column id set default nextval('public.districts_id_seq'::regclass);


alter table only public.grade_details alter column id set default nextval('public.grade_details_id_seq'::regclass);




alter table only public.hc_case_types alter column id set default nextval('public.hc_case_types_id_seq'::regclass);



alter table only public.jo_photos alter column id set default nextval('public.jo_photos_id_seq'::regclass);



alter table only public.jo_reporting_reviewings alter column id set default nextval('public.jo_reporting_reviewings_id_seq'::regclass);



alter table only public.jo_zone_tenures alter column id set default nextval('public.jo_zone_tenures_id_seq'::regclass);





alter table only public.judicial_officer_posting_preferences alter column id set default nextval('public.judicial_officer_posting_preferences_id_seq'::regclass);





alter table only public.judicial_officer_postings alter column id set default nextval('public.judicial_officer_postings_id_seq'::regclass);



alter table only public.judicial_officer_qualifications alter column id set default nextval('public.judicial_officer_qualifications_id_seq'::regclass);




alter table only public.judicial_officers alter column id set default nextval('public.judicial_officers_id_seq'::regclass);




alter table only public.lcr_hc_ends alter column id set default nextval('public.lcr_hc_ends_id_seq'::regclass);




alter table only public.lcr_lc_details alter column id set default nextval('public.lcr_lc_details_id_seq'::regclass);




alter table only public.lcr_status_checks alter column id set default nextval('public.lcr_status_checks_id_seq'::regclass);



alter table only public.lower_case_types alter column id set default nextval('public.lower_case_types_id_seq'::regclass);




alter table only public.migrations alter column id set default nextval('public.migrations_id_seq'::regclass);



alter table only public.modes alter column id set default nextval('public.modes_id_seq'::regclass);




alter table only public.qualifications alter column id set default nextval('public.qualifications_id_seq'::regclass);





alter table only public.recruitment_batches alter column id set default nextval('public.recruitment_batches_id_seq'::regclass);


alter table only public.religions alter column id set default nextval('public.religions_id_seq'::regclass);



alter table only public.states alter column id set default nextval('public.states_id_seq'::regclass);




alter table only public.subdivisions alter column id set default nextval('public.subdivisions_id_seq'::regclass);



alter table only public.user_types alter column id set default nextval('public.user_types_id_seq'::regclass);




alter table only public.users alter column id set default nextval('public.users_id_seq'::regclass);



alter table only public.zone_subdivisions alter column id set default nextval('public.zone_subdivisions_id_seq'::regclass);



alter table only public.zones alter column id set default nextval('public.zones_id_seq'::regclass);







insert into public.categories (id, category_name, created_by, created_at, updated_at) values (1, 'general', 11, null, null);
insert into public.categories (id, category_name, created_by, created_at, updated_at) values (2, 'scheduled caste', 11, '2019-07-02 06:58:28', '2019-07-02 06:58:28');
insert into public.categories (id, category_name, created_by, created_at, updated_at) values (3, 'scheduled tribe', 11, '2019-07-02 07:41:15', '2019-07-03 08:42:41');


insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (59, 'civil judge sr  div bishnupur', 76, null, null, 11, '2019-11-15 17:20:52', '2019-11-15 17:20:52');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (60, 'acjm bishnupur', 76, null, null, 11, '2019-11-15 17:21:23', '2019-11-15 17:21:23');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (8, 'bardhaman 1st court', 51, null, null, 11, '2019-06-17 06:27:05', '2019-08-03 09:27:25');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (61, 'civil judge jr  div court bishnupur', 76, null, null, 11, '2019-11-15 17:22:00', '2019-11-15 17:22:00');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (34, 'asc', 57, null, null, 11, '2019-11-15 16:34:18', '2019-11-15 16:48:00');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (62, 'jm 2nd court bishnupur', 76, null, null, 11, '2019-11-15 17:22:25', '2019-11-15 17:22:25');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (13, 'howrah 2nd court', 77, null, null, 11, '2019-06-17 06:27:05', '2019-08-03 09:30:49');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (14, 'howrah 1st court', 80, null, null, 11, '2019-06-17 06:27:05', '2019-08-03 09:29:36');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (24, 'north dinajpur 1st court', 56, null, null, 11, '2019-06-17 06:27:06', '2019-08-03 09:22:33');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (25, 'bankura 1 st court', 67, null, null, 11, '2019-06-17 06:27:06', '2019-08-03 09:25:14');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (27, 'south dinajpore', 81, null, null, 11, '2019-06-17 06:27:06', '2019-08-03 09:23:52');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (63, 'jm 3rd court bishnupur', 76, null, null, 11, '2019-11-15 17:22:53', '2019-11-15 17:22:53');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (30, 'district judge bankura', 75, null, null, 11, '2019-06-17 06:27:06', '2019-11-15 16:52:38');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (35, 'cjm  bankura', 75, null, null, 11, '2019-11-15 16:54:32', '2019-11-15 16:55:50');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (36, 'cjsd bankura', 75, null, null, 11, '2019-11-15 16:56:34', '2019-11-15 16:56:34');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (38, 'civil judge jr div i bankura', 75, null, null, 11, '2019-11-15 17:00:54', '2019-11-15 17:00:54');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (37, 'civil judge sr div  additional  court  bankura', 75, null, null, 11, '2019-11-15 16:58:42', '2019-11-15 17:02:20');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (39, 'civil judge jr div ii bankura', 75, null, null, 11, '2019-11-15 17:02:58', '2019-11-15 17:02:58');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (40, 'civil judge jr div additional court bankura', 75, null, null, 11, '2019-11-15 17:03:41', '2019-11-15 17:03:41');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (41, 'jm 3rd court bankura', 75, null, null, 11, '2019-11-15 17:04:13', '2019-11-15 17:04:13');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (42, 'jm 4th court bankura', 75, null, null, 11, '2019-11-15 17:04:33', '2019-11-15 17:04:33');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (43, 'jm 5th court bankura', 75, null, null, 11, '2019-11-15 17:04:47', '2019-11-15 17:04:47');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (44, 'jm 6th court bankura', 75, null, null, 11, '2019-11-15 17:05:13', '2019-11-15 17:05:13');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (45, 'jm 7th court bankura', 75, null, null, 11, '2019-11-15 17:05:44', '2019-11-15 17:05:44');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (48, 'adj 2nd court bankura', 75, null, null, 11, '2019-11-15 17:07:40', '2019-11-15 17:07:40');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (49, 'adj 3rd court bankura', 75, null, null, 11, '2019-11-15 17:08:14', '2019-11-15 17:08:14');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (50, 'adj re designated court bankura', 75, null, null, 11, '2019-11-15 17:08:55', '2019-11-15 17:08:55');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (51, 'adj fast track court  bankura', 75, null, null, 11, '2019-11-15 17:10:22', '2019-11-15 17:10:22');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (52, 'adj  khatra', 77, null, null, 11, '2019-11-15 17:12:57', '2019-11-15 17:12:57');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (53, 'civil judge sr  div khatra', 77, null, null, 11, '2019-11-15 17:13:49', '2019-11-15 17:15:41');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (54, 'civil judge jr  div 1st court khatra', 77, null, null, 11, '2019-11-15 17:16:33', '2019-11-15 17:16:33');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (46, 'adj 1st court bankura', 75, null, null, 11, '2019-11-15 17:06:11', '2019-11-15 17:17:38');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (55, 'civil judge jr  div 2nd court khatra', 77, null, null, 11, '2019-11-15 17:19:00', '2019-11-15 17:19:00');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (56, 'acjm khatra', 77, null, null, 11, '2019-11-15 17:19:35', '2019-11-15 17:19:35');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (57, 'jm khatra', 77, null, null, 11, '2019-11-15 17:19:54', '2019-11-15 17:19:54');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (58, 'adj bishnupur', 76, null, null, 11, '2019-11-15 17:20:23', '2019-11-15 17:20:23');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (64, 'district judge birbhum', 78, null, null, 11, '2019-11-15 17:23:43', '2019-11-15 17:25:11');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (65, 'adj 1st court birbhum', 78, null, null, 11, '2019-11-15 17:25:48', '2019-11-15 17:25:48');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (66, 'adj 2nd court birbhum', 78, null, null, 11, '2019-11-15 17:26:50', '2019-11-15 17:26:50');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (67, 'adj 3rd court birbhum', 78, null, null, 11, '2019-11-15 17:27:21', '2019-11-15 17:27:21');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (68, 'adj 4th court birbhum', 78, null, null, 11, '2019-11-15 17:27:42', '2019-11-15 17:27:42');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (69, 'adj ftc court birbhum', 78, null, null, 11, '2019-11-15 17:28:20', '2019-11-15 17:28:40');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (70, 'cjm birbhum', 78, null, null, 11, '2019-11-15 17:29:02', '2019-11-15 17:29:02');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (71, 'acjm birbhum', 78, null, null, 11, '2019-11-15 17:29:17', '2019-11-15 17:29:17');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (72, ' civil judge sr div birbhum', 78, null, null, 11, '2019-11-15 17:30:10', '2019-11-15 17:30:10');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (73, 'civil judge jr div sadar court birbhum', 78, null, null, 11, '2019-11-15 17:31:20', '2019-11-15 17:31:20');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (74, 'civil judge jr div additional court birbhum', 78, null, null, 11, '2019-11-15 17:32:52', '2019-11-15 17:32:52');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (75, 'jm 1st court birbhum', 78, null, null, 11, '2019-11-15 17:33:18', '2019-11-15 17:33:18');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (76, 'jm 2nd court birbhum', 78, null, null, 11, '2019-11-15 17:34:00', '2019-11-15 17:34:00');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (77, 'jm 3rd court birbhum', 78, null, null, 11, '2019-11-15 17:34:18', '2019-11-15 17:34:18');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (78, 'secretary dlsa birbhum', 78, null, null, 11, '2019-11-15 17:34:37', '2019-11-15 17:34:37');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (79, 'adj ftc dubrajpur birbhum', 81, null, null, 11, '2019-11-15 17:35:06', '2019-11-15 17:35:35');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (80, 'civil judge jr div court dubrajpur birbhum', 81, null, null, 11, '2019-11-15 17:37:19', '2019-11-15 17:37:19');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (81, 'jm dubrajpur birbhum', 81, null, null, 11, '2019-11-15 17:37:57', '2019-11-15 17:37:57');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (1, 'darjeeling 1st court', 118, null, null, 11, '2019-06-17 06:27:05', '2019-08-03 09:28:11');
insert into public.courts (id, court_name, subdivision_id, latitude, longitude, created_by, created_at, updated_at) values (3, 'calcutta city court', 51, null, null, 11, '2019-06-17 06:27:05', '2019-08-03 09:19:41');






insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (4, 'west alexys', 7, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (11, 'west elta', 17, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (12, 'trantowborough', 17, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (15, 'south nathanaelview', 24, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (17, 'zboncakfort', 30, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (18, 'west magnusview', 30, 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (20, 'west monteborough', 31, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (21, 'south westleyborough', 31, 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (36, 'kolkata', 51, 11, '2019-07-10 06:27:59', '2019-07-10 06:27:59');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (2, 'east midnapure', 2, 11, '2019-06-17 06:27:04', '2019-08-05 05:46:51');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (14, 'west burdwan', 24, 11, '2019-06-17 06:27:05', '2019-08-05 05:47:25');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (26, 'howrah', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:47:53');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (28, 'hoogly', 48, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:03');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (25, 'bankura', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:48:21');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (5, 'purulia', 7, 11, '2019-06-17 06:27:05', '2019-08-05 05:48:47');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (27, 'birbhum', 44, 11, '2019-06-17 06:27:06', '2019-08-05 05:49:09');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (8, 'south dinajpur', 11, 11, '2019-06-17 06:27:05', '2019-08-05 05:50:41');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (22, 'alipure duar', 38, 11, '2019-06-17 06:27:06', '2019-08-05 05:54:08');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (10, 'darjeeling', 17, 11, '2019-06-17 06:27:05', '2019-08-05 05:55:27');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (7, 'kalimpong', 11, 11, '2019-06-17 06:27:05', '2019-08-05 05:56:54');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (6, 'malda', 8, 11, '2019-06-17 06:27:05', '2019-08-05 05:51:22');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (38, 'north 24 parganas', 51, 11, '2019-11-11 12:26:13', '2019-11-11 12:26:13');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (13, 'south 24 parganas', 24, 11, '2019-06-17 06:27:05', '2019-11-11 12:28:19');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (40, 'purba bardhaman', 51, 11, '2019-11-11 13:19:11', '2019-11-11 13:19:11');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (41, 'paschim bardhaman', 51, 11, '2019-11-11 13:19:29', '2019-11-11 13:19:29');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (42, 'jhargram', 51, 11, '2019-11-11 13:19:58', '2019-11-11 13:19:58');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (43, 'paschim medinipur', 51, 11, '2019-11-11 13:20:14', '2019-11-11 13:20:14');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (44, 'murshidabad', 51, 11, '2019-11-11 13:20:46', '2019-11-11 13:20:46');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (45, 'purba medinipur', 51, 11, '2019-11-11 13:30:59', '2019-11-11 13:30:59');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (46, 'nadia', 51, 11, '2019-11-11 13:31:32', '2019-11-11 13:31:32');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (47, 'cooch behar', 51, 11, '2019-11-11 13:32:34', '2019-11-11 13:32:34');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (48, 'jalpaiguri', 51, 11, '2019-11-11 13:42:40', '2019-11-11 13:42:40');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (29, 'u dinajpur', 48, 11, '2019-06-17 06:27:06', '2019-11-11 13:54:30');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (49, 'd dinajpur', 51, 11, '2019-11-11 14:00:30', '2019-11-11 14:00:30');
insert into public.districts (id, district_name, state_id, created_by, created_at, updated_at) values (50, 'andaman and nicobar island', 75, 11, '2019-11-11 14:07:53', '2019-11-11 14:07:53');




insert into public.grade_details (id, grade_name, created_by, created_at, updated_at) values (1, 'good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
insert into public.grade_details (id, grade_name, created_by, created_at, updated_at) values (2, 'average', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
insert into public.grade_details (id, grade_name, created_by, created_at, updated_at) values (3, 'very good', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
insert into public.grade_details (id, grade_name, created_by, created_at, updated_at) values (4, 'outstanding', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');
insert into public.grade_details (id, grade_name, created_by, created_at, updated_at) values (5, 'poor', 11, '2019-09-25 00:00:00', '2019-09-25 00:00:00');


insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (1, 'aa', 'arbritation appl.', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (2, 'abwa', 'appl.und.bengal wakfs act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (3, 'ac', 'award cases', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (4, 'aca', 'appl.under chartered accountants act, 1949', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (5, 'aco', 'pet. in comp. appl.', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (6, 'acr', 'appl.und.charitable & religious trust act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (7, 'acrp', 'appl.und.sec.151 of the cr.p.c.', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (8, 'acwa', 'appl.und.sec 21 cost&works accountacts act, 1959', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (9, 'aed', 'appl. u/s. 64 of estate duty act, 1953', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (10, 'aet', 'appl. u/s 25 of expenditure tax act, 1957', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (11, 'afp', 'appl.for leave to sue as an indigent person', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (12, 'aga', 'appl.und.sec.25 of administrator generals'' act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (13, 'agl', 'appl.for appointment of guardian-ad-litem', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (14, 'agt', 'appl. u/s 26 gift tax act, 1958', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (15, 'agwa', 'appl.und.guardians & wards act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (16, 'ahc', 'habeas corpus', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (17, 'aid', 'appl. under patents & designs act, 1970', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (18, 'aidr', 'appl.und.industrial development regulation act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (19, 'aifc', 'appl.und.industrial finance corp. act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (20, 'airb', 'appn.recon.bank of i', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (21, 'alp', 'appl.und.clause 13 of letters patent', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (22, 'alp.itl', 'appl. under clause 17 of the letters patent', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (23, 'alpii', 'appl.und.clause 17 l', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (24, 'alpitl', 'appl.clause-17 lp', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (25, 'aor', 'calcutta official receiver''s act 1938', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (26, 'aorc', 'application omnibus residuary class', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (27, 'aot', 'appl.und.official trustees act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (28, 'ap', 'arbitration petition', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (29, 'apd', 'appeal from decree', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (30, 'apdt', 'app. fr. decr. tend.', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (31, 'apo', 'appeal from order', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (32, 'apot', 'temp apo', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (33, 'as', 'admirality  suits', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (34, 'asci', 'appl.for leave to appeal to the supreme court of india', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (35, 'asfc', 'appl.und.stae financial corp. act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (36, 'asm', 'appl.sanchaita matters', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (37, 'ata', 'appl.under trust act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (38, 'atm', 'appl.und.trade&merchandise marks, act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (39, 'auda', 'appl.und.unclaimed deposits act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (40, 'awt', 'appl. u/s 27 of wealth tax act, 1957', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (41, 'bba', 'appl.und.bankers books evidence act, 1891', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (42, 'bifr', 'bifr', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (43, 'ca', 'company application', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (44, 'caa', 'commissioner of patent appeal', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (45, 'cc', 'contempt of court cases', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (46, 'cexa', 'appl.und.central excise act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (47, 'chs', 'chamber summons', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (48, 'cp', 'company petitions', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (49, 'cpa', 'commissioner of pate', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (50, 'cra', 'copyright appeal', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (51, 'crcc', 'criminal contempt', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (52, 'cs', 'civil suits', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (53, 'cs(o)', 'civil suit(old)', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (54, 'csos', 'civil suit originating summons', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (55, 'custa', 'appl.und.customs act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (56, 'dm', 'und.chapter v of o.s. rules', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (57, 'ec', 'execution cases', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (58, 'eopla', 'extra ordinary probate proceedings', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (59, 'eos', 'extra ordinary suits', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (60, 'ep', 'elec.pet.(peoples representation act, 1951)', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (61, 'fea', 'foreign exchange appeal', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (62, 'fera', 'appl.und.foreign exchange regulation act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (63, 'gcal', 'appl.und.gold control act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (64, 'ic', 'insolvency cases', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (65, 'ica', 'appl.under indian companies act, 1913', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (66, 'ip', 'it.pet.256(2)it''61', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (67, 'ita', 'income tax appeal', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (68, 'itat', 'income tax appeal tendered', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (69, 'itp', 'income tax pet.(u/s. 256 (2) of i.t. act, 1961)', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (70, 'itr', 'incometax ref.sec.256 (1) of i.t. act, 1961', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (71, 'lm', 'lunatic matters', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (72, 'lpa', 'letters patent appeal', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (73, 'mm', 'misfeaouce matters', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (74, 'ms', 'matrimonial suits', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (75, 'nm', 'notice of motion', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (76, 'oco', 'original side cross objection', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (77, 'ocot', 'original side cross objection tender', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (78, 'ots', 'ordinance transfer suits', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (79, 'pla', 'appl.for probate & letters of administration', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (80, 'plr', 'und.chpt.xxxi-a of o.s. rules', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (81, 'pms', 'parsi matrimonial suits', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (82, 'ref', 'reference case', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (83, 'rvwo', 'memorandum of reviews', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (84, 'salt', 'appl.und.salt act', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (85, 'sana', 'sanchaita appeal', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (86, 'sco', 'special case for opinion of court', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (87, 'sess', 'sessions cases', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (88, 'ss', 'special suits(sec 20 of the arbitration act, 1940', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (89, 't', 'temp a(1)', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (90, 'tbcs', 'transferred banking companies suits', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (91, 'tcs', 'transferred company suits', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (92, 'tma', 'trade mark appeal', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (93, 'ts', 'testamentery suits', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (94, 'tua', 'trade union appeal', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (95, 'wpo', 'writ petition', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (96, 'wp.ct', 'wp(central admin tribunal)', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (97, 'wp.st', 'wp(state admin tribunal)', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (98, 'wp.tt', 'wp(wb tax tribunal)', 11, null, null);
insert into public.hc_case_types (id, type_name, full_form, created_by, created_at, updated_at) values (99, 'wpcr', 'writ petition(civil rule)', 11, null, null);













insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (7, 8, '52', 111, 2018, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (8, 8, '58', 222, 2017, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (9, 8, '9', 333, 2016, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (10, 9, '52', 111, 2018, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (11, 9, '58', 222, 2017, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (12, 10, '1', 111, 2019, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (13, 10, '5', 222, 2010, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (14, 10, '59', 333, 2016, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (15, 10, '5', 444, 2006, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (16, 13, '52', 222, 2019, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (17, 13, '55', 333, 2018, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (18, 16, '1', 2, 2018, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (19, 16, '6', 3, 2017, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (20, 17, '58', 258, 2018, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (21, 17, '52', 753, 2018, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (22, 17, '1', 741, 2017, null, 11, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (23, 19, '52', 153, 2002, null, 30, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (24, 19, '8', 852, 1976, null, 30, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (25, 20, '19', 789, 1999, null, 30, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (26, 21, '19', 789, 1999, null, 30, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (27, 22, '29', 741, 1986, null, 30, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (28, 22, '12', 456, 1996, null, 30, null, null);
insert into public.lcr_lc_details (id, hc_id, lower_case_record, lower_case_no, lower_case_year, compliance_flag, created_by, created_at, updated_at) values (29, 22, '43', 963, 1985, null, 30, null, null);






insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (52, 'act 39', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (1, 'act viii miscellaneous case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (51, 'act xiv', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (58, 'bail', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (59, 'cex - excise case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (3, 'civil appeal', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (4, 'civil execution', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (5, 'civil misc', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (6, 'civil revision', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (7, 'complaint case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (55, 'c r case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (8, 'criminal appeal', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (9, 'criminal case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (11, 'criminal misc case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (12, 'criminal revision', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (10, 'crl. execution - criminal execution', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (23, 'divorce on mutual consent - matri suit divorce mutual cons', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (13, 'electricity act', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (14, 'estate acquisition appeal', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (16, 'gr case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (17, 'hindu adapt. and maint act - hindu adapt. and maint case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (18, 'insolvancy petition', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (19, 'l a c - land acquisition cases', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (20, 'l a ex. - land acquisition execution', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (53, 'l a suit', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (21, 'm a c c - m.a.c.c', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (22, 'm a c c ex. - macc execution', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (36, 'maintenance case - mr case for maintenance', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (24, 'matrimonial suit', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (25, 'mc - misc case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (54, 'm c case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (29, 'misc. appeal', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (26, 'misc case (pre-emption)', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (30, 'misc. criminal revision', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (27, 'misc crl case - misc criminal case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (31, 'misc. execution case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (57, 'misc petition (156) - misc petition', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (28, 'mjc - misc judicial case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (32, 'money appeal', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (33, 'money execution', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (34, 'money suit', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (35, 'm v act - motor vehicle case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (37, 'n d p s case - ndps case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (38, 'ngr case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (39, 'other appeal', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (40, 'other suit', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (41, 'probate suit', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (15, 's c c ex. - execution', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (42, 's c c suit - scc suit', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (43, 'sessions case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (44, 'sessions trial', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (45, 'special court cases', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (46, 'succession case', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (47, 'title appeal', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (48, 'title execution', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (49, 'title suit', 11, null, null);
insert into public.lower_case_types (id, type_name, created_by, created_at, updated_at) values (50, 'trust suit', 11, null, null);



insert into public.migrations (id, migration, batch) values (1, '2014_10_10_000000_create_user_types_table', 1);
insert into public.migrations (id, migration, batch) values (2, '2014_10_12_100000_create_password_resets_table', 1);
insert into public.migrations (id, migration, batch) values (3, '2019_06_12_000005_create_states_table', 1);
insert into public.migrations (id, migration, batch) values (4, '2019_06_12_000010_create_zones_table', 1);
insert into public.migrations (id, migration, batch) values (5, '2019_06_12_000020_create_districts_table', 1);
insert into public.migrations (id, migration, batch) values (6, '2019_06_12_000025_create_subdivisions_table', 1);
insert into public.migrations (id, migration, batch) values (7, '2019_06_12_000040_create_courts_table', 1);
insert into public.migrations (id, migration, batch) values (8, '2019_06_12_000050_create_qualifications_table', 1);
insert into public.migrations (id, migration, batch) values (9, '2019_06_12_000060_create_categories_table', 1);
insert into public.migrations (id, migration, batch) values (10, '2019_06_12_000070_create_designations_table', 1);
insert into public.migrations (id, migration, batch) values (11, '2019_06_12_000080_create_religions_table', 1);
insert into public.migrations (id, migration, batch) values (12, '2019_06_12_000090_create_recruitment_batches_table', 1);
insert into public.migrations (id, migration, batch) values (13, '2019_06_12_000100_create_judicial_officers_table', 1);
insert into public.migrations (id, migration, batch) values (14, '2019_06_12_000110_create_jo_photos_table', 1);
insert into public.migrations (id, migration, batch) values (15, '2019_06_13_091801_create_judicial_officer_qualifications_table', 1);
insert into public.migrations (id, migration, batch) values (16, '2019_06_13_092954_create_jo_reporting_reviewings_table', 1);
insert into public.migrations (id, migration, batch) values (17, '2019_06_13_093750_create_modes_table', 1);
insert into public.migrations (id, migration, batch) values (18, '2019_06_13_093852_create_judicial_officer_postings_table', 1);
insert into public.migrations (id, migration, batch) values (19, '2019_06_13_101842_create_judicial_officer_posting_preferences_table', 1);
insert into public.migrations (id, migration, batch) values (20, '2019_07_22_064308_create_diaries_table', 1);
insert into public.migrations (id, migration, batch) values (22, '2019_08_13_091810_create_lcr_lc_details_table', 1);
insert into public.migrations (id, migration, batch) values (23, '2019_08_13_101720_create_hc_case_types_table', 1);
insert into public.migrations (id, migration, batch) values (24, '2019_08_13_102950_create_lower_case_types_table', 1);
insert into public.migrations (id, migration, batch) values (25, '2019_09_24_102032_create_grade_details_table', 1);
insert into public.migrations (id, migration, batch) values (26, '2019_09_24_102258_create_acr_histories_table', 1);
insert into public.migrations (id, migration, batch) values (27, '2019_11_11_170427_create_zone_subdivisions_table', 1);
insert into public.migrations (id, migration, batch) values (28, '2019_11_14_163154_create_jo_zone_tenures_table', 1);
insert into public.migrations (id, migration, batch) values (29, '2019_11_14_163155_create_users_table', 1);
insert into public.migrations (id, migration, batch) values (30, '2019_08_13_091522_create_lcr_hc_ends_table', 2);
insert into public.migrations (id, migration, batch) values (31, '2019_11_21_113129_create_lcr_status_checks_table', 2);









insert into public.qualifications (id, qualification_name, created_by, created_at, updated_at) values (5, 'bcom', 11, '2019-06-25 07:18:30', '2019-06-25 07:18:30');
insert into public.qualifications (id, qualification_name, created_by, created_at, updated_at) values (7, 'ma llb', 11, '2019-06-25 07:18:47', '2019-06-25 07:18:47');
insert into public.qualifications (id, qualification_name, created_by, created_at, updated_at) values (8, 'ba llb', 11, '2019-06-28 09:50:19', '2019-07-01 10:14:25');
insert into public.qualifications (id, qualification_name, created_by, created_at, updated_at) values (10, 'm.sc', 11, '2019-07-01 11:25:58', '2019-07-01 11:27:09');



insert into public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) values (5, 'psc 2011', 2011, 11, '2019-06-26 11:49:37', '2019-06-26 11:49:37');
insert into public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) values (8, 'clat 2011', 2003, 11, '2019-06-26 11:55:19', '2019-06-26 11:57:00');
insert into public.recruitment_batches (id, recruitment_batch_desc, batch_year, created_by, created_at, updated_at) values (1, 'psc 2000', 2000, 11, null, '2019-06-29 08:58:19');




insert into public.religions (id, religion_name, created_by, created_at, updated_at) values (1, 'hindu', 11, null, null);
insert into public.religions (id, religion_name, created_by, created_at, updated_at) values (2, 'muslim', 11, '2019-07-02 11:23:49', '2019-07-02 11:24:02');



insert into public.states (id, state_name, created_by, created_at, updated_at) values (2, 'illinois', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (3, 'montana', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (4, 'new york', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (5, 'north dakota', 11, '2019-06-17 06:27:04', '2019-06-17 06:27:04');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (6, 'maryland', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (8, 'wyoming', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (9, 'new jersey', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (10, 'nevada', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (12, 'oklahoma', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (13, 'north carolina', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (15, 'kansas', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (16, 'pennsylvania', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (18, 'nebraska', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (19, 'utah', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (20, 'texas', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (21, 'washington', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (22, 'missouri', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (23, 'wisconsin', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (24, 'west virginia', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (26, 'louisiana', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (27, 'south dakota', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (29, 'maine', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (30, 'hawaii', 11, '2019-06-17 06:27:05', '2019-06-17 06:27:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (32, 'virginia', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (34, 'tennessee', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (35, 'new mexico', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (36, 'indiana', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (37, 'oregon', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (38, 'kentucky', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (39, 'ohio', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (40, 'vermont', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (41, 'georgia', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (43, 'michigan', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (45, 'new hampshire', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (47, 'iowa', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (48, 'massachusetts', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (49, 'mississippi', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (50, 'minnesota', 11, '2019-06-17 06:27:06', '2019-06-17 06:27:06');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (51, 'west bengal', 11, '2019-06-18 10:06:22', '2019-06-18 10:06:22');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (52, 'bihar', 11, '2019-06-18 10:10:49', '2019-06-18 10:10:49');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (7, 'odisha', 11, '2019-06-17 06:27:05', '2019-08-05 05:57:55');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (31, 'andhra pradesh', 11, '2019-06-17 06:27:06', '2019-08-05 05:59:14');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (68, 'himachal pradesh', 11, '2019-08-05 06:03:19', '2019-08-05 06:03:19');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (69, 'madhya pradesh', 11, '2019-08-05 06:03:30', '2019-08-05 06:03:30');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (11, 'maharastra', 11, '2019-06-17 06:27:05', '2019-08-05 06:03:46');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (28, 'kerala', 11, '2019-06-17 06:27:05', '2019-08-05 06:04:55');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (1, 'rajasthan', 11, '2019-06-17 06:27:04', '2019-08-05 06:05:07');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (17, 'gujrat', 11, '2019-06-17 06:27:05', '2019-08-05 06:07:42');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (46, 'tamilnadu', 11, '2019-06-17 06:27:06', '2019-08-05 06:07:52');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (25, 'karntaka', 11, '2019-06-17 06:27:05', '2019-08-05 06:16:44');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (44, 'hyderabad', 11, '2019-06-17 06:27:06', '2019-08-05 06:17:30');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (42, 'jammu and kahmir', 11, '2019-06-17 06:27:06', '2019-08-05 06:17:59');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (70, 'punjab', 11, '2019-08-05 06:18:05', '2019-08-05 06:18:05');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (71, 'hariyana', 11, '2019-08-05 06:18:12', '2019-08-05 06:18:12');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (72, 'jharkhand', 11, '2019-08-05 06:18:28', '2019-08-05 06:18:28');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (73, 'chattishgarh', 11, '2019-08-05 06:18:43', '2019-08-05 06:18:43');
insert into public.states (id, state_name, created_by, created_at, updated_at) values (75, 'andaman and nicobar island', 11, '2019-11-11 14:04:17', '2019-11-11 14:04:17');




insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (152, 'campvell bay', 50, 8, 11, '2019-11-15 13:28:21', '2019-11-15 13:28:21');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (133, 'mayabunder', 50, 8, 11, '2019-11-11 14:08:37', '2019-11-11 14:08:37');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (132, 'car nicobar', 50, 8, 11, '2019-11-11 14:08:27', '2019-11-11 14:08:27');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (131, 'port blair', 50, 8, 11, '2019-11-11 14:08:16', '2019-11-11 14:08:16');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (130, 'mal', 48, 8, 11, '2019-11-11 14:02:42', '2019-11-11 14:02:42');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (129, 'alipurduar', 48, 8, 11, '2019-11-11 14:02:34', '2019-11-11 14:02:34');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (128, 'jalpaiguri sadar', 48, 8, 11, '2019-11-11 14:02:08', '2019-11-11 14:02:08');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (127, 'buniadpur', 49, 8, 11, '2019-11-11 14:01:48', '2019-11-11 14:01:48');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (125, 'balurghat', 49, 8, 11, '2019-11-11 14:01:02', '2019-11-11 14:01:02');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (124, 'gorubathan', 7, 8, 11, '2019-11-11 13:59:52', '2019-11-11 13:59:52');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (123, 'kalimpong sadar', 7, 8, 11, '2019-11-11 13:59:32', '2019-11-11 13:59:32');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (122, 'mungpoo', 10, 8, 11, '2019-11-11 13:59:14', '2019-11-11 13:59:14');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (121, 'mirik', 10, 8, 11, '2019-11-11 13:59:04', '2019-11-11 13:59:04');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (120, 'kurseong', 10, 8, 11, '2019-11-11 13:58:55', '2019-11-11 13:58:55');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (119, 'siliguri', 10, 8, 11, '2019-11-11 13:58:43', '2019-11-11 13:58:43');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (118, 'darjeeling sadar', 10, 8, 11, '2019-11-11 13:58:19', '2019-11-11 13:58:19');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (117, 'mekhligunj', 47, 8, 11, '2019-11-11 13:57:57', '2019-11-11 13:57:57');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (116, 'mathabhanga', 47, 8, 11, '2019-11-11 13:57:43', '2019-11-11 13:57:43');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (115, 'tufangunj', 47, 8, 11, '2019-11-11 13:57:27', '2019-11-11 13:57:27');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (113, 'dinhata', 47, 8, 11, '2019-11-11 13:56:39', '2019-11-11 13:56:39');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (112, 'cooch behar sadar', 47, 8, 11, '2019-11-11 13:56:24', '2019-11-11 13:56:24');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (111, 'islampur', 29, 8, 11, '2019-11-11 13:56:03', '2019-11-11 13:56:03');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (110, 'raiganj', 29, 8, 11, '2019-11-11 13:55:49', '2019-11-11 13:55:49');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (109, 'lalbagh', 44, 7, 11, '2019-11-11 13:53:14', '2019-11-11 13:53:14');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (108, 'kandi', 44, 7, 11, '2019-11-11 13:52:34', '2019-11-11 13:52:34');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (106, 'berhampore', 44, 7, 11, '2019-11-11 13:52:11', '2019-11-11 13:52:11');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (107, 'jangipur', 44, 7, 11, '2019-11-11 13:52:25', '2019-11-11 13:52:25');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (105, 'haldia', 43, 6, 11, '2019-11-11 13:51:34', '2019-11-11 13:51:34');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (104, 'contai', 43, 6, 11, '2019-11-11 13:48:53', '2019-11-11 13:48:53');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (103, 'tamluk', 45, 6, 11, '2019-11-11 13:48:14', '2019-11-11 13:48:33');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (102, 'nabadwip', 46, 6, 11, '2019-11-11 13:47:28', '2019-11-11 13:47:28');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (101, 'tehatta', 46, 6, 11, '2019-11-11 13:47:06', '2019-11-11 13:47:06');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (100, 'ranaghat', 46, 6, 11, '2019-11-11 13:46:53', '2019-11-11 13:46:53');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (99, 'kalyani', 46, 4, 11, '2019-11-11 13:46:33', '2019-11-11 13:46:33');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (98, 'krishnanagar', 46, 6, 11, '2019-11-11 13:46:17', '2019-11-11 13:46:17');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (97, 'kharagpur', 43, 6, 11, '2019-11-11 13:28:42', '2019-11-11 13:28:42');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (96, 'garbeta', 43, 6, 11, '2019-11-11 13:28:13', '2019-11-11 13:28:13');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (95, 'dantan', 43, 6, 11, '2019-11-11 13:27:47', '2019-11-11 13:27:47');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (94, 'ghatal', 43, 6, 11, '2019-11-11 13:27:28', '2019-11-11 13:27:28');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (93, 'paschim medinipur sadar', 43, 6, 11, '2019-11-11 13:27:14', '2019-11-11 13:27:14');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (92, 'durgapur', 41, 6, 11, '2019-11-11 13:24:04', '2019-11-11 13:24:04');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (91, 'asansol', 41, 6, 11, '2019-11-11 13:23:34', '2019-11-11 13:23:34');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (90, 'jhargram', 42, 6, 11, '2019-11-11 13:23:05', '2019-11-11 13:23:05');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (89, 'katwa', 40, 6, 11, '2019-11-11 13:22:40', '2019-11-11 13:22:40');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (88, 'kalna', 40, 6, 11, '2019-11-11 13:22:20', '2019-11-11 13:22:20');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (87, 'purba bardhaman sadar', 40, 6, 11, '2019-11-11 13:22:06', '2019-11-11 13:22:06');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (86, 'raghunathpur', 5, 7, 11, '2019-11-11 13:07:24', '2019-11-11 13:07:24');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (85, 'purulia sadar', 5, 7, 11, '2019-11-11 13:07:06', '2019-11-11 13:07:06');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (83, 'chanchal', 6, 7, 11, '2019-11-11 13:04:39', '2019-11-11 13:04:39');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (82, 'malda sadar', 6, 7, 11, '2019-11-11 13:04:24', '2019-11-11 13:04:24');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (81, 'dubrajpur', 27, 7, 11, '2019-11-11 13:04:02', '2019-11-11 13:04:02');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (80, 'rampurhat', 27, 7, 11, '2019-11-11 13:03:39', '2019-11-11 13:03:39');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (79, 'bolpur', 27, 7, 11, '2019-11-11 13:03:21', '2019-11-11 13:03:21');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (78, 'birbhum sadar', 27, 7, 11, '2019-11-11 13:03:09', '2019-11-11 13:03:09');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (77, 'khatra', 25, 7, 11, '2019-11-11 13:02:41', '2019-11-11 13:02:41');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (76, 'bishnupur', 25, 7, 11, '2019-11-11 13:02:30', '2019-11-11 13:02:30');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (75, 'bankura sadar', 25, 7, 11, '2019-11-11 13:02:17', '2019-11-11 13:02:17');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (74, 'sealdah', 13, 4, 11, '2019-11-11 12:56:33', '2019-11-11 12:56:33');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (71, 'kakdwip', 13, 4, 11, '2019-11-11 12:39:24', '2019-11-11 12:39:24');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (70, 'diamond harbour', 13, 4, 11, '2019-11-11 12:38:53', '2019-11-11 12:38:53');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (69, 'baruipore', 13, 4, 11, '2019-11-11 12:38:32', '2019-11-11 12:38:32');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (68, 'alipore', 13, 4, 11, '2019-11-11 12:38:18', '2019-11-15 14:35:01');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (67, 'basirhat', 38, 6, 11, '2019-11-11 12:37:43', '2019-11-11 12:37:43');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (66, 'bongaon', 38, 6, 11, '2019-11-11 12:37:28', '2019-11-11 12:37:28');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (65, 'sealdah', 38, 4, 11, '2019-11-11 12:37:00', '2019-11-11 12:37:00');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (64, 'bidhannagar', 38, 4, 11, '2019-11-11 12:36:40', '2019-11-11 12:36:40');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (63, 'barrackpore', 38, 4, 11, '2019-11-11 12:36:18', '2019-11-11 12:36:18');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (62, 'barasat', 38, 4, 11, '2019-11-11 12:35:41', '2019-11-11 12:35:41');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (61, 'amta', 26, 4, 11, '2019-11-11 12:25:28', '2019-11-11 12:25:28');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (60, 'uluberia', 26, 4, 11, '2019-11-11 12:25:19', '2019-11-11 12:25:19');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (58, 'howrah sadar', 26, 4, 11, '2019-11-11 12:24:01', '2019-11-11 12:24:01');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (57, 'arambagh', 28, 6, 11, '2019-11-11 12:18:01', '2019-11-11 12:18:01');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (56, 'chandannagar', 28, 4, 11, '2019-11-11 12:17:46', '2019-11-11 12:17:46');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (55, 'serampore', 28, 4, 11, '2019-11-11 12:17:18', '2019-11-11 12:17:18');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (54, 'hoogly sadar', 28, 4, 11, '2019-11-11 12:16:48', '2019-11-11 12:24:53');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (53, 'provincial  small causes court (pscc)', 36, 4, 11, '2019-11-11 12:14:15', '2019-11-11 12:15:22');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (52, 'city civil court', 36, 4, 11, '2019-11-11 12:14:01', '2019-11-11 12:14:01');
insert into public.subdivisions (id, subdivision_name, district_id, zone_id, created_by, created_at, updated_at) values (51, 'city sessions court', 36, 4, 11, '2019-11-11 12:13:44', '2019-11-11 12:13:44');




insert into public.user_types (id, type_name, created_at, updated_at) values (1, 'administrator', null, null);
insert into public.user_types (id, type_name, created_at, updated_at) values (2, 'judicial officer', null, null);
insert into public.user_types (id, type_name, created_at, updated_at) values (3, 'departmental officer', null, null);
insert into public.user_types (id, type_name, created_at, updated_at) values (6, 'court', '2019-08-30 06:31:42', '2019-08-30 06:31:42');
insert into public.user_types (id, type_name, created_at, updated_at) values (5, 'inspection', '2019-08-28 08:33:30', '2019-08-28 08:34:39');




insert into public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) values (11, 'admin', 'administrator 1', 1, 1, null, null, null, 'admin@admin.admin', null, '$2y$10$or1dbroi3fxqdddrmtwdeo9moo5muhrx8eplnprd6q94vu76l2ruy', 'vax5uqemi51s3j7l6t4akzykzfn70dghq2ngqkyzcyqelpibgsymlf7hqqlm', '2019-06-19 06:00:07', '2019-06-19 06:00:07');
insert into public.users (id, user_id, name, user_type_id, court_id, judicial_officer_id, jo_code, department_id, email, email_verified_at, password, remember_token, created_at, updated_at) values (30, 'court1', 'abc', 6, 3, null, null, null, 'court1@court1.court1', null, '$2y$10$y58w8jf73hgnjmo4ktjlv.xrk76uu7lknqzahymu8bcqo86hq06/a', null, '2019-09-16 10:59:20', '2019-09-16 10:59:20');









insert into public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) values (4, 'a', 1095, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
insert into public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) values (6, 'b', 1095, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
insert into public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) values (8, 'd', 730, 11, '2019-11-13 00:00:00', '2019-11-13 00:00:00');
insert into public.zones (id, zone_name, min_service_days, created_by, created_at, updated_at) values (7, 'c', 1095, 11, '2019-11-13 00:00:00', '2019-11-15 11:31:20');




select pg_catalog.setval('public.acr_histories_id_seq', 1, false);



select pg_catalog.setval('public.categories_id_seq', 1, false);



select pg_catalog.setval('public.courts_id_seq', 1, false);




select pg_catalog.setval('public.designations_id_seq', 1, false);




select pg_catalog.setval('public.diaries_id_seq', 1, false);



select pg_catalog.setval('public.districts_id_seq', 1, false);




select pg_catalog.setval('public.grade_details_id_seq', 1, false);




select pg_catalog.setval('public.hc_case_types_id_seq', 1, false);




select pg_catalog.setval('public.jo_photos_id_seq', 1, false);




select pg_catalog.setval('public.jo_reporting_reviewings_id_seq', 1, false);




select pg_catalog.setval('public.jo_zone_tenures_id_seq', 1, false);



select pg_catalog.setval('public.judicial_officer_posting_preferences_id_seq', 1, false);




select pg_catalog.setval('public.judicial_officer_postings_id_seq', 1, false);


select pg_catalog.setval('public.judicial_officer_qualifications_id_seq', 1, false);




select pg_catalog.setval('public.judicial_officers_id_seq', 1, false);




select pg_catalog.setval('public.lcr_hc_ends_id_seq', 1, false);




select pg_catalog.setval('public.lcr_lc_details_id_seq', 1, false);



select pg_catalog.setval('public.lcr_status_checks_id_seq', 1, false);




select pg_catalog.setval('public.lower_case_types_id_seq', 1, false);



select pg_catalog.setval('public.migrations_id_seq', 31, true);




select pg_catalog.setval('public.modes_id_seq', 1, false);




select pg_catalog.setval('public.qualifications_id_seq', 1, false);



select pg_catalog.setval('public.recruitment_batches_id_seq', 1, false);



select pg_catalog.setval('public.religions_id_seq', 1, false);



select pg_catalog.setval('public.states_id_seq', 1, false);




select pg_catalog.setval('public.subdivisions_id_seq', 1, false);




select pg_catalog.setval('public.user_types_id_seq', 1, false);



select pg_catalog.setval('public.users_id_seq', 1, false);


select pg_catalog.setval('public.zone_subdivisions_id_seq', 1, false);




select pg_catalog.setval('public.zones_id_seq', 1, false);



alter table only public.acr_histories
    add constraint acr_histories_judicial_officer_id_year_unique unique (judicial_officer_id, year);



alter table only public.acr_histories
    add constraint acr_histories_pkey primary key (id);



alter table only public.categories
    add constraint categories_category_name_unique unique (category_name);




alter table only public.categories
    add constraint categories_pkey primary key (id);




alter table only public.courts
    add constraint courts_court_name_unique unique (court_name);




alter table only public.courts
    add constraint courts_pkey primary key (id);



alter table only public.designations
    add constraint designations_designation_name_unique unique (designation_name);




alter table only public.designations
    add constraint designations_pkey primary key (id);




alter table only public.diaries
    add constraint diaries_pkey primary key (id);




alter table only public.districts
    add constraint districts_district_name_unique unique (district_name);




alter table only public.districts
    add constraint districts_pkey primary key (id);



alter table only public.grade_details
    add constraint grade_details_grade_name_unique unique (grade_name);



alter table only public.grade_details
    add constraint grade_details_pkey primary key (id);




alter table only public.hc_case_types
    add constraint hc_case_types_full_form_unique unique (full_form);





alter table only public.hc_case_types
    add constraint hc_case_types_pkey primary key (id);




alter table only public.hc_case_types
    add constraint hc_case_types_type_name_unique unique (type_name);





alter table only public.jo_photos
    add constraint jo_photos_pkey primary key (id);




alter table only public.jo_reporting_reviewings
    add constraint jo_reporting_reviewings_judicial_officer_id_reporting_officer_i unique (judicial_officer_id, reporting_officer_id);




alter table only public.jo_reporting_reviewings
    add constraint jo_reporting_reviewings_pkey primary key (id);




alter table only public.jo_zone_tenures
    add constraint jo_zone_tenures_judicial_officer_id_zone_id_from_date_unique unique (judicial_officer_id, zone_id, from_date);



alter table only public.jo_zone_tenures
    add constraint jo_zone_tenures_pkey primary key (id);



alter table only public.judicial_officer_posting_preferences
    add constraint judicial_officer_posting_preferences_pkey primary key (id);




alter table only public.judicial_officer_postings
    add constraint judicial_officer_postings_judicial_officer_id_designation_id_co unique (judicial_officer_id, designation_id, court_id, mode_id, from_date);




alter table only public.judicial_officer_postings
    add constraint judicial_officer_postings_pkey primary key (id);




alter table only public.judicial_officer_qualifications
    add constraint judicial_officer_qualifications_judicial_officer_id_qualificati unique (judicial_officer_id, qualification_id);




alter table only public.judicial_officer_qualifications
    add constraint judicial_officer_qualifications_pkey primary key (id);



alter table only public.judicial_officers
    add constraint judicial_officers_aadhaar_no_unique unique (aadhaar_no);




alter table only public.judicial_officers
    add constraint judicial_officers_email_id_1_unique unique (email_id_1);




alter table only public.judicial_officers
    add constraint judicial_officers_email_id_2_unique unique (email_id_2);




alter table only public.judicial_officers
    add constraint judicial_officers_gpf_no_unique unique (gpf_no);




alter table only public.judicial_officers
    add constraint judicial_officers_jo_code_unique unique (jo_code);



alter table only public.judicial_officers
    add constraint judicial_officers_mobile_no_1_unique unique (mobile_no_1);





alter table only public.judicial_officers
    add constraint judicial_officers_mobile_no_2_unique unique (mobile_no_2);





alter table only public.judicial_officers
    add constraint judicial_officers_pan_no_unique unique (pan_no);





alter table only public.judicial_officers
    add constraint judicial_officers_pkey primary key (id);





alter table only public.judicial_officers
    add constraint judicial_officers_registration_no_unique unique (registration_no);





alter table only public.lcr_hc_ends
    add constraint lcr_hc_ends_memo_no_memo_date_unique unique (memo_no, memo_date);




alter table only public.lcr_hc_ends
    add constraint lcr_hc_ends_pkey primary key (id);





alter table only public.lcr_lc_details
    add constraint lcr_lc_details_pkey primary key (id);




alter table only public.lcr_status_checks
    add constraint lcr_status_checks_pkey primary key (id);




alter table only public.lower_case_types
    add constraint lower_case_types_pkey primary key (id);




alter table only public.lower_case_types
    add constraint lower_case_types_type_name_unique unique (type_name);




alter table only public.migrations
    add constraint migrations_pkey primary key (id);





alter table only public.modes
    add constraint modes_pkey primary key (id);




alter table only public.modes
    add constraint modes_posting_mode_unique unique (posting_mode);




alter table only public.qualifications
    add constraint qualifications_pkey primary key (id);




alter table only public.qualifications
    add constraint qualifications_qualification_name_unique unique (qualification_name);




alter table only public.recruitment_batches
    add constraint recruitment_batches_pkey primary key (id);




alter table only public.recruitment_batches
    add constraint recruitment_batches_recruitment_batch_desc_unique unique (recruitment_batch_desc);




alter table only public.religions
    add constraint religions_pkey primary key (id);



alter table only public.religions
    add constraint religions_religion_name_unique unique (religion_name);



alter table only public.states
    add constraint states_pkey primary key (id);





alter table only public.states
    add constraint states_state_name_unique unique (state_name);





alter table only public.subdivisions
    add constraint subdivisions_pkey primary key (id);





alter table only public.subdivisions
    add constraint subdivisions_subdivision_name_district_id_unique unique (subdivision_name, district_id);





alter table only public.user_types
    add constraint user_types_pkey primary key (id);





alter table only public.users
    add constraint users_court_id_unique unique (court_id);





alter table only public.users
    add constraint users_department_id_unique unique (department_id);



alter table only public.users
    add constraint users_email_unique unique (email);




alter table only public.users
    add constraint users_jo_code_unique unique (jo_code);



alter table only public.users
    add constraint users_judicial_officer_id_unique unique (judicial_officer_id);




alter table only public.users
    add constraint users_pkey primary key (id);



alter table only public.zone_subdivisions
    add constraint zone_subdivisions_pkey primary key (id);




alter table only public.zone_subdivisions
    add constraint zone_subdivisions_zone_id_subdivision_id_unique unique (zone_id, subdivision_id);



alter table only public.zones
    add constraint zones_pkey primary key (id);



alter table only public.zones
    add constraint zones_zone_name_unique unique (zone_name);




create index password_resets_email_index on public.password_resets using btree (email);




alter table only public.acr_histories
    add constraint acr_histories_grade_id_foreign foreign key (grade_id) references public.grade_details(id);




alter table only public.acr_histories
    add constraint acr_histories_judicial_officer_id_foreign foreign key (judicial_officer_id) references public.judicial_officers(id);



alter table only public.courts
    add constraint courts_subdivision_id_foreign foreign key (subdivision_id) references public.subdivisions(id);



alter table only public.diaries
    add constraint diaries_judicial_officer_id_foreign foreign key (judicial_officer_id) references public.judicial_officers(id);




alter table only public.districts
    add constraint districts_state_id_foreign foreign key (state_id) references public.states(id);





alter table only public.jo_photos
    add constraint jo_photos_judicial_officer_id_foreign foreign key (judicial_officer_id) references public.judicial_officers(id);


alter table only public.jo_reporting_reviewings
    add constraint jo_reporting_reviewings_judicial_officer_id_foreign foreign key (judicial_officer_id) references public.judicial_officers(id);


alter table only public.jo_reporting_reviewings
    add constraint jo_reporting_reviewings_reporting_officer_id_foreign foreign key (reporting_officer_id) references public.judicial_officers(id);





alter table only public.jo_zone_tenures
    add constraint jo_zone_tenures_judicial_officer_id_foreign foreign key (judicial_officer_id) references public.judicial_officers(id);



alter table only public.jo_zone_tenures
    add constraint jo_zone_tenures_zone_id_foreign foreign key (zone_id) references public.zones(id);



alter table only public.judicial_officer_posting_preferences
    add constraint judicial_officer_posting_preferences_judicial_officer_id_foreig foreign key (judicial_officer_id) references public.judicial_officers(id);




alter table only public.judicial_officer_posting_preferences
    add constraint judicial_officer_posting_preferences_zone_id_foreign foreign key (zone_id) references public.zones(id);



alter table only public.judicial_officer_postings
    add constraint judicial_officer_postings_court_id_foreign foreign key (court_id) references public.courts(id);




alter table only public.judicial_officer_postings
    add constraint judicial_officer_postings_designation_id_foreign foreign key (designation_id) references public.designations(id);



alter table only public.judicial_officer_postings
    add constraint judicial_officer_postings_judicial_officer_id_foreign foreign key (judicial_officer_id) references public.judicial_officers(id);



alter table only public.judicial_officer_postings
    add constraint judicial_officer_postings_mode_id_foreign foreign key (mode_id) references public.modes(id);




alter table only public.judicial_officer_qualifications
    add constraint judicial_officer_qualifications_judicial_officer_id_foreign foreign key (judicial_officer_id) references public.judicial_officers(id);




alter table only public.judicial_officer_qualifications
    add constraint judicial_officer_qualifications_qualification_id_foreign foreign key (qualification_id) references public.qualifications(id);




alter table only public.judicial_officers
    add constraint judicial_officers_category_id_foreign foreign key (category_id) references public.categories(id);




alter table only public.judicial_officers
    add constraint judicial_officers_home_district_id_foreign foreign key (home_district_id) references public.districts(id);



alter table only public.judicial_officers
    add constraint judicial_officers_home_state_id_foreign foreign key (home_state_id) references public.states(id);


alter table only public.judicial_officers
    add constraint judicial_officers_recruitment_batch_id_foreign foreign key (recruitment_batch_id) references public.recruitment_batches(id);




alter table only public.judicial_officers
    add constraint judicial_officers_religion_id_foreign foreign key (religion_id) references public.religions(id);



alter table only public.lcr_hc_ends
    add constraint lcr_hc_ends_court_foreign foreign key (court) references public.courts(id);




alter table only public.lcr_hc_ends
    add constraint lcr_hc_ends_district_foreign foreign key (district) references public.districts(id);




alter table only public.lcr_hc_ends
    add constraint lcr_hc_ends_subdivision_foreign foreign key (subdivision) references public.subdivisions(id);


alter table only public.lcr_status_checks
    add constraint lcr_status_checks_hc_id_foreign foreign key (hc_id) references public.lcr_hc_ends(id);



alter table only public.subdivisions
    add constraint subdivisions_district_id_foreign foreign key (district_id) references public.districts(id);



alter table only public.subdivisions
    add constraint subdivisions_zone_id_foreign foreign key (zone_id) references public.zones(id);



alter table only public.users
    add constraint users_court_id_foreign foreign key (court_id) references public.
(id);



alter table only public.users
    add constraint users_judicial_officer_id_foreign foreign key (judicial_officer_id) references public.judicial_officers(id);



alter table only public.users
    add constraint users_user_type_id_foreign foreign key (user_type_id) references public.user_types(id);



alter table only public.zone_subdivisions
    add constraint zone_subdivisions_subdivision_id_foreign foreign key (subdivision_id) references public.subdivisions(id);


alter table only public.zone_subdivisions
    add constraint zone_subdivisions_zone_id_foreign foreign key (zone_id) references public.zones(id);




