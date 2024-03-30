
-- SEQUENCE: pfb.grant_applications_audit_id_seq

-- DROP SEQUENCE IF EXISTS pfb.grant_applications_audit_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.grant_applications_audit_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.grant_applications_audit_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.grant_applications_audit_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.grant_applications_audit_id_seq TO postgres;

-- SEQUENCE: pfb.grant_applications_case_id_seq

-- DROP SEQUENCE IF EXISTS pfb.grant_applications_case_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.grant_applications_case_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.grant_applications_case_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.grant_applications_case_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.grant_applications_case_id_seq TO postgres;

-- SEQUENCE: pfb.grant_files_audit_id_seq

-- DROP SEQUENCE IF EXISTS pfb.grant_files_audit_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.grant_files_audit_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.grant_files_audit_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.grant_files_audit_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.grant_files_audit_id_seq TO postgres;

-- SEQUENCE: pfb.grant_files_file_id_seq

-- DROP SEQUENCE IF EXISTS pfb.grant_files_file_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.grant_files_file_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.grant_files_file_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.grant_files_file_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.grant_files_file_id_seq TO postgres;

-- SEQUENCE: pfb.graph_reports_audit_id_seq

-- DROP SEQUENCE IF EXISTS pfb.graph_reports_audit_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.graph_reports_audit_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.graph_reports_audit_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.graph_reports_audit_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.graph_reports_audit_id_seq TO postgres;


-- SEQUENCE: pfb.graph_reports_report_id_seq

-- DROP SEQUENCE IF EXISTS pfb.graph_reports_report_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.graph_reports_report_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.graph_reports_report_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.graph_reports_report_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.graph_reports_report_id_seq TO postgres;

-- SEQUENCE: pfb.items_item_id_seq

-- DROP SEQUENCE IF EXISTS pfb.items_item_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.items_item_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.items_item_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.items_item_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.items_item_id_seq TO postgres;


-- SEQUENCE: pfb.ref_codes_ref_id_seq

-- DROP SEQUENCE IF EXISTS pfb.ref_codes_ref_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.ref_codes_ref_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.ref_codes_ref_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.ref_codes_ref_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.ref_codes_ref_id_seq TO postgres;

-- SEQUENCE: pfb.user_role_role_id_seq

-- DROP SEQUENCE IF EXISTS pfb.user_role_role_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.user_role_role_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.user_role_role_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.user_role_role_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.user_role_role_id_seq TO postgres;

-- SEQUENCE: pfb.users_audit_id_seq

-- DROP SEQUENCE IF EXISTS pfb.users_audit_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.users_audit_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.users_audit_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.users_audit_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.users_audit_id_seq TO postgres;


-- SEQUENCE: pfb.users_user_id_seq

-- DROP SEQUENCE IF EXISTS pfb.users_user_id_seq;

CREATE SEQUENCE IF NOT EXISTS pfb.users_user_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE pfb.users_user_id_seq
    OWNER TO postgres;

GRANT ALL ON SEQUENCE pfb.users_user_id_seq TO pfb;

GRANT ALL ON SEQUENCE pfb.users_user_id_seq TO postgres;
-- Table: pfb.grant_applications

-- DROP TABLE IF EXISTS pfb.grant_applications;

CREATE TABLE IF NOT EXISTS pfb.grant_applications
(
    case_id integer NOT NULL DEFAULT nextval('pfb.grant_applications_case_id_seq'::regclass),
    org_name character varying(150) COLLATE pg_catalog."default",
    org_address character varying(150) COLLATE pg_catalog."default",
    org_city character varying(150) COLLATE pg_catalog."default",
    org_state character varying(2) COLLATE pg_catalog."default",
    org_zipcode character varying(10) COLLATE pg_catalog."default",
    org_type character varying(150) COLLATE pg_catalog."default",
    contact_name character varying(150) COLLATE pg_catalog."default",
    contact_phone character varying(150) COLLATE pg_catalog."default",
    contact_email character varying(150) COLLATE pg_catalog."default",
    purpose text COLLATE pg_catalog."default",
    request_amount double precision,
    app_creation_date timestamp without time zone,
    decision_date timestamp without time zone,
    decision character varying(50) COLLATE pg_catalog."default",
    approver character varying(150) COLLATE pg_catalog."default",
    status character varying(50) COLLATE pg_catalog."default",
    modified_by character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT grant_applications_pkey PRIMARY KEY (case_id),
    CONSTRAINT unique_grant_applications UNIQUE (org_name, request_amount)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.grant_applications
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.grant_applications FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.grant_applications TO pfb;

GRANT ALL ON TABLE pfb.grant_applications TO postgres;

-- FUNCTION: pfb.grant_applications_trg_audit_proc()

-- DROP FUNCTION IF EXISTS pfb.grant_applications_trg_audit_proc();

CREATE OR REPLACE FUNCTION pfb.grant_applications_trg_audit_proc()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
	cr RECORD; --current_row
	actionType CHARACTER VARYING(150);
BEGIN
	IF TG_OP = 'INSERT' THEN
		cr := new;
	ELSEIF TG_OP = 'UPDATE' THEN
		cr := new;
	ELSEIF TG_OP = 'DELETE' THEN
		cr := old;
	END IF;
	actionType := TG_OP;
	
	INSERT INTO pfb.grant_applications_audit (
		aduit_type,
		aduit_timestamp,
		case_id,
		org_name,
		org_address,
		org_city,
		org_state,
		org_zipcode,
		org_type,
		contact_name,
		contact_phone,
		contact_email,
		purpose,
		request_amount,
		app_creation_date,
		decision_date,
		decision,
		approver,
		status,
		modified_by)
	VALUES(
		actionType,
		now(),
		cr.case_id,
		cr.org_name,
		cr.org_address,
		cr.org_city,
		cr.org_state,
		cr.org_zipcode,
		cr.org_type,
		cr.contact_name,
		cr.contact_phone,
		cr.contact_email,
		cr.purpose,
		cr.request_amount,
		cr.app_creation_date,
		cr.decision_date,
		cr.decision,
		cr.approver,
		cr.status,
		cr.modified_by
	);
	
	RETURN NULL;
END;
$BODY$;

ALTER FUNCTION pfb.grant_applications_trg_audit_proc()
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.grant_applications_trg_audit_proc() TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.grant_applications_trg_audit_proc() TO pfb;

GRANT EXECUTE ON FUNCTION pfb.grant_applications_trg_audit_proc() TO postgres;


-- Trigger: grant_applications_trg_audit

-- DROP TRIGGER IF EXISTS grant_applications_trg_audit ON pfb.grant_applications;

CREATE OR REPLACE TRIGGER grant_applications_trg_audit
    AFTER INSERT OR DELETE OR UPDATE 
    ON pfb.grant_applications
    FOR EACH ROW
    EXECUTE FUNCTION pfb.grant_applications_trg_audit_proc();


-- Table: pfb.grant_applications_audit

-- DROP TABLE IF EXISTS pfb.grant_applications_audit;

CREATE TABLE IF NOT EXISTS pfb.grant_applications_audit
(
    audit_id integer NOT NULL DEFAULT nextval('pfb.grant_applications_audit_id_seq'::regclass),
    aduit_type character varying(150) COLLATE pg_catalog."default",
    aduit_timestamp timestamp without time zone,
    case_id integer NOT NULL,
    org_name character varying(150) COLLATE pg_catalog."default",
    org_address character varying(150) COLLATE pg_catalog."default",
    org_city character varying(150) COLLATE pg_catalog."default",
    org_state character varying(2) COLLATE pg_catalog."default",
    org_zipcode character varying(10) COLLATE pg_catalog."default",
    org_type character varying(150) COLLATE pg_catalog."default",
    contact_name character varying(150) COLLATE pg_catalog."default",
    contact_phone character varying(150) COLLATE pg_catalog."default",
    contact_email character varying(150) COLLATE pg_catalog."default",
    purpose text COLLATE pg_catalog."default",
    request_amount double precision,
    app_creation_date timestamp without time zone,
    decision_date timestamp without time zone,
    decision character varying(50) COLLATE pg_catalog."default",
    approver character varying(150) COLLATE pg_catalog."default",
    status character varying(50) COLLATE pg_catalog."default",
    modified_by character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT grant_applications_audit_pkey PRIMARY KEY (audit_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.grant_applications_audit
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.grant_applications_audit FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.grant_applications_audit TO pfb;

GRANT ALL ON TABLE pfb.grant_applications_audit TO postgres;

-- Table: pfb.grant_files

-- DROP TABLE IF EXISTS pfb.grant_files;

CREATE TABLE IF NOT EXISTS pfb.grant_files
(
    file_id integer NOT NULL DEFAULT nextval('pfb.grant_files_file_id_seq'::regclass),
    case_id integer NOT NULL,
    file_name character varying(500) COLLATE pg_catalog."default",
    file_creation_date timestamp without time zone,
    file_path character varying(500) COLLATE pg_catalog."default",
    created_by character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT grant_file_pkey PRIMARY KEY (file_id),
    CONSTRAINT unique_grant_files UNIQUE (case_id, file_path)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.grant_files
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.grant_files FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.grant_files TO pfb;

GRANT ALL ON TABLE pfb.grant_files TO postgres;

-- FUNCTION: pfb.grant_files_trg_audit_proc()

-- DROP FUNCTION IF EXISTS pfb.grant_files_trg_audit_proc();

CREATE OR REPLACE FUNCTION pfb.grant_files_trg_audit_proc()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
	cr RECORD; --current_row
	actionType CHARACTER VARYING(150);
BEGIN
	IF TG_OP = 'INSERT' THEN
		cr := new;
	ELSEIF TG_OP = 'UPDATE' THEN
		cr := new;
	ELSEIF TG_OP = 'DELETE' THEN
		cr := old;
	END IF;
	actionType := TG_OP;
	
	INSERT INTO pfb.grant_files_audit (
		aduit_type,
		aduit_timestamp,
		file_id,
		case_id,
		file_name,
		file_content,
		file_creation_date,
		file_path,
		created_by
	)
	VALUES(
		actionType,
		now(),
		cr.file_id,
		cr.case_id,
		cr.file_name,
		cr.file_content,
		cr.file_creation_date,
		cr.file_path,
		cr.created_by
	);
	
	RETURN NULL;
END;
$BODY$;

ALTER FUNCTION pfb.grant_files_trg_audit_proc()
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.grant_files_trg_audit_proc() TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.grant_files_trg_audit_proc() TO pfb;

GRANT EXECUTE ON FUNCTION pfb.grant_files_trg_audit_proc() TO postgres;



-- Trigger: grant_files_trg_audit

-- DROP TRIGGER IF EXISTS grant_files_trg_audit ON pfb.grant_files;

CREATE OR REPLACE TRIGGER grant_files_trg_audit
    AFTER INSERT OR DELETE OR UPDATE 
    ON pfb.grant_files
    FOR EACH ROW
    EXECUTE FUNCTION pfb.grant_files_trg_audit_proc();

-- Table: pfb.grant_files_audit

-- DROP TABLE IF EXISTS pfb.grant_files_audit;

CREATE TABLE IF NOT EXISTS pfb.grant_files_audit
(
    audit_id integer NOT NULL DEFAULT nextval('pfb.grant_files_audit_id_seq'::regclass),
    aduit_type character varying(150) COLLATE pg_catalog."default",
    aduit_timestamp timestamp without time zone,
    file_id integer NOT NULL,
    case_id integer NOT NULL,
    file_name character varying(500) COLLATE pg_catalog."default",
    file_creation_date timestamp without time zone,
    file_path character varying(500) COLLATE pg_catalog."default",
    created_by character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT grant_file_audit_pkey PRIMARY KEY (audit_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.grant_files_audit
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.grant_files_audit FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.grant_files_audit TO pfb;

GRANT ALL ON TABLE pfb.grant_files_audit TO postgres;

-- Table: pfb.graph_reports

-- DROP TABLE IF EXISTS pfb.graph_reports;

CREATE TABLE IF NOT EXISTS pfb.graph_reports
(
    report_id integer NOT NULL DEFAULT nextval('pfb.graph_reports_report_id_seq'::regclass),
    graph_name character varying(150) COLLATE pg_catalog."default",
    graph_x_field character varying(150) COLLATE pg_catalog."default",
    graph_y_field character varying(150) COLLATE pg_catalog."default",
    graph_query text COLLATE pg_catalog."default",
    is_active boolean,
    CONSTRAINT graph_report_pkey PRIMARY KEY (report_id),
    CONSTRAINT unique_graph_reports UNIQUE (graph_name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.graph_reports
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.graph_reports FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.graph_reports TO pfb;

GRANT ALL ON TABLE pfb.graph_reports TO postgres;


-- FUNCTION: pfb.graph_reports_trg_audit_proc()

-- DROP FUNCTION IF EXISTS pfb.graph_reports_trg_audit_proc();

CREATE OR REPLACE FUNCTION pfb.graph_reports_trg_audit_proc()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
	cr RECORD; --current_row
	actionType CHARACTER VARYING(150);
BEGIN
	IF TG_OP = 'INSERT' THEN
		cr := new;
	ELSEIF TG_OP = 'UPDATE' THEN
		cr := new;
	ELSEIF TG_OP = 'DELETE' THEN
		cr := old;
	END IF;
	actionType := TG_OP;
	
	INSERT INTO pfb.graph_reports_audit (
		aduit_type,
		aduit_timestamp,
		report_id,
		graph_name,
		graph_x_field,
		graph_y_field,
		graph_query,
		is_active
	)
	VALUES(
		actionType,
		now(),
		cr.report_id,
		cr.graph_name,
		cr.graph_x_field,
		cr.graph_y_field,
		cr.graph_query,
		cr.is_active
	);
	
	RETURN NULL;
END;
$BODY$;

ALTER FUNCTION pfb.graph_reports_trg_audit_proc()
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.graph_reports_trg_audit_proc() TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.graph_reports_trg_audit_proc() TO pfb;

GRANT EXECUTE ON FUNCTION pfb.graph_reports_trg_audit_proc() TO postgres;



-- Trigger: graph_reports_trg_audit

-- DROP TRIGGER IF EXISTS graph_reports_trg_audit ON pfb.graph_reports;

CREATE OR REPLACE TRIGGER graph_reports_trg_audit
    AFTER INSERT OR DELETE OR UPDATE 
    ON pfb.graph_reports
    FOR EACH ROW
    EXECUTE FUNCTION pfb.graph_reports_trg_audit_proc();

-- Table: pfb.graph_reports_audit

-- DROP TABLE IF EXISTS pfb.graph_reports_audit;

CREATE TABLE IF NOT EXISTS pfb.graph_reports_audit
(
    audit_id integer NOT NULL DEFAULT nextval('pfb.graph_reports_audit_id_seq'::regclass),
    aduit_type character varying(150) COLLATE pg_catalog."default",
    aduit_timestamp timestamp without time zone,
    report_id integer NOT NULL,
    graph_name character varying(150) COLLATE pg_catalog."default",
    graph_x_field character varying(150) COLLATE pg_catalog."default",
    graph_y_field character varying(150) COLLATE pg_catalog."default",
    graph_query text COLLATE pg_catalog."default",
    is_active boolean,
    CONSTRAINT graph_report_audit_pkey PRIMARY KEY (audit_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.graph_reports_audit
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.graph_reports_audit FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.graph_reports_audit TO pfb;

GRANT ALL ON TABLE pfb.graph_reports_audit TO postgres;

-- Table: pfb.items

-- DROP TABLE IF EXISTS pfb.items;

CREATE TABLE IF NOT EXISTS pfb.items
(
    item_id integer NOT NULL DEFAULT nextval('pfb.items_item_id_seq'::regclass),
    item_name character varying(150) COLLATE pg_catalog."default",
    description character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT items_pkey PRIMARY KEY (item_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.items
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.items FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.items TO pfb;

GRANT ALL ON TABLE pfb.items TO postgres;

-- Table: pfb.ref_codes

-- DROP TABLE IF EXISTS pfb.ref_codes;

CREATE TABLE IF NOT EXISTS pfb.ref_codes
(
    ref_id integer NOT NULL DEFAULT nextval('pfb.ref_codes_ref_id_seq'::regclass),
    ref_code character varying(50) COLLATE pg_catalog."default",
    short_desc character varying(150) COLLATE pg_catalog."default",
    long_desc character varying(150) COLLATE pg_catalog."default",
    is_active boolean,
    domain_name character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT ref_codes_pkey PRIMARY KEY (ref_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.ref_codes
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.ref_codes FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.ref_codes TO pfb;

GRANT ALL ON TABLE pfb.ref_codes TO postgres;


-- Table: pfb.user_roles

-- DROP TABLE IF EXISTS pfb.user_roles;

CREATE TABLE IF NOT EXISTS pfb.user_roles
(
    role_id integer NOT NULL DEFAULT nextval('pfb.user_role_role_id_seq'::regclass),
    role_name character varying(150) COLLATE pg_catalog."default",
    is_active boolean,
    creation_date timestamp without time zone,
    modification_date timestamp without time zone,
    CONSTRAINT user_role_pkey PRIMARY KEY (role_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.user_roles
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.user_roles FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.user_roles TO pfb;

GRANT ALL ON TABLE pfb.user_roles TO postgres;

-- Table: pfb.users

-- DROP TABLE IF EXISTS pfb.users;

CREATE TABLE IF NOT EXISTS pfb.users
(
    user_id integer NOT NULL DEFAULT nextval('pfb.users_user_id_seq'::regclass),
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(150) COLLATE pg_catalog."default",
    email character varying(150) COLLATE pg_catalog."default",
    user_role_id integer,
    is_active boolean,
    creation_date timestamp without time zone,
    modification_date timestamp without time zone,
    CONSTRAINT users_pkey PRIMARY KEY (user_id),
    CONSTRAINT unique_users_email UNIQUE (email)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.users
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.users FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.users TO pfb;

GRANT ALL ON TABLE pfb.users TO postgres;


-- FUNCTION: pfb.users_trg_audit_proc()

-- DROP FUNCTION IF EXISTS pfb.users_trg_audit_proc();

CREATE OR REPLACE FUNCTION pfb.users_trg_audit_proc()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
	cr RECORD; --current_row
	actionType CHARACTER VARYING(150);
BEGIN
	IF TG_OP = 'INSERT' THEN
		cr := new;
	ELSEIF TG_OP = 'UPDATE' THEN
		cr := new;
	ELSEIF TG_OP = 'DELETE' THEN
		cr := old;
	END IF;
	actionType := TG_OP;
	
	INSERT INTO pfb.users_audit (
		aduit_type,
		aduit_timestamp,
		user_id,
		first_name,
		last_name,
		email,
		user_role_id,
		is_active,
		creation_date,
		modification_date
	)
	VALUES(
		actionType,
		now(),
		cr.user_id,
		cr.first_name,
		cr.last_name,
		cr.email,
		cr.user_role_id,
		cr.is_active,
		cr.creation_date,
		cr.modification_date
	);
	
	RETURN NULL;
END;
$BODY$;

ALTER FUNCTION pfb.users_trg_audit_proc()
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.users_trg_audit_proc() TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.users_trg_audit_proc() TO pfb;

GRANT EXECUTE ON FUNCTION pfb.users_trg_audit_proc() TO postgres;



-- Trigger: users_trg_audit

-- DROP TRIGGER IF EXISTS users_trg_audit ON pfb.users;

CREATE OR REPLACE TRIGGER users_trg_audit
    AFTER INSERT OR DELETE OR UPDATE 
    ON pfb.users
    FOR EACH ROW
    EXECUTE FUNCTION pfb.users_trg_audit_proc();


-- Table: pfb.users_audit

-- DROP TABLE IF EXISTS pfb.users_audit;

CREATE TABLE IF NOT EXISTS pfb.users_audit
(
    audit_id integer NOT NULL DEFAULT nextval('pfb.users_audit_id_seq'::regclass),
    aduit_type character varying(150) COLLATE pg_catalog."default",
    aduit_timestamp timestamp without time zone,
    user_id integer NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(150) COLLATE pg_catalog."default",
    email character varying(150) COLLATE pg_catalog."default",
    user_role_id integer,
    is_active boolean,
    creation_date timestamp without time zone,
    modification_date timestamp without time zone,
    CONSTRAINT users_audit_pkey PRIMARY KEY (audit_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pfb.users_audit
    OWNER to postgres;

REVOKE ALL ON TABLE pfb.users_audit FROM pfb;

GRANT DELETE, INSERT, SELECT, UPDATE ON TABLE pfb.users_audit TO pfb;

GRANT ALL ON TABLE pfb.users_audit TO postgres;

-- FUNCTION: pfb.create_item(character varying, character varying)

-- DROP FUNCTION IF EXISTS pfb.create_item(character varying, character varying);

CREATE OR REPLACE FUNCTION pfb.create_item(
	item_name character varying,
	item_description character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
BEGIN
    INSERT INTO pfb.items (item_name, description) VALUES (item_name, item_description);
END;
$BODY$;

ALTER FUNCTION pfb.create_item(character varying, character varying)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.create_item(character varying, character varying) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.create_item(character varying, character varying) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.create_item(character varying, character varying) TO postgres;


-- FUNCTION: pfb.get_grant_application_by_id(integer)

-- DROP FUNCTION IF EXISTS pfb.get_grant_application_by_id(integer);

CREATE OR REPLACE FUNCTION pfb.get_grant_application_by_id(
	p_case_id integer)
    RETURNS pfb.grant_applications
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    grant_record pfb.grant_applications%ROWTYPE;
BEGIN
    SELECT * INTO grant_record FROM pfb.grant_applications WHERE case_id = p_case_id LIMIT 1;
    RETURN grant_record;
END;
$BODY$;

ALTER FUNCTION pfb.get_grant_application_by_id(integer)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.get_grant_application_by_id(integer) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.get_grant_application_by_id(integer) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.get_grant_application_by_id(integer) TO postgres;


-- FUNCTION: pfb.get_grant_applications()

-- DROP FUNCTION IF EXISTS pfb.get_grant_applications();

CREATE OR REPLACE FUNCTION pfb.get_grant_applications(
	)
    RETURNS SETOF pfb.grant_applications 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY SELECT * FROM pfb.grant_applications;
END;
$BODY$;

ALTER FUNCTION pfb.get_grant_applications()
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.get_grant_applications() TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.get_grant_applications() TO pfb;

GRANT EXECUTE ON FUNCTION pfb.get_grant_applications() TO postgres;

-- FUNCTION: pfb.get_grant_applications_by_id(integer)

-- DROP FUNCTION IF EXISTS pfb.get_grant_applications_by_id(integer);

CREATE OR REPLACE FUNCTION pfb.get_grant_applications_by_id(
	p_case_id integer)
    RETURNS SETOF pfb.grant_applications 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY SELECT * FROM pfb.grant_applications Where case_id = p_case_id ;
END;
$BODY$;

ALTER FUNCTION pfb.get_grant_applications_by_id(integer)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.get_grant_applications_by_id(integer) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.get_grant_applications_by_id(integer) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.get_grant_applications_by_id(integer) TO postgres;

-- FUNCTION: pfb.get_grant_files()

-- DROP FUNCTION IF EXISTS pfb.get_grant_files();

CREATE OR REPLACE FUNCTION pfb.get_grant_files(
	)
    RETURNS SETOF pfb.grant_files 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY SELECT * FROM pfb.grant_files;
END;
$BODY$;

ALTER FUNCTION pfb.get_grant_files()
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.get_grant_files() TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.get_grant_files() TO pfb;

GRANT EXECUTE ON FUNCTION pfb.get_grant_files() TO postgres;

-- FUNCTION: pfb.get_grant_files_by_case_id(integer)

-- DROP FUNCTION IF EXISTS pfb.get_grant_files_by_case_id(integer);

CREATE OR REPLACE FUNCTION pfb.get_grant_files_by_case_id(
	p_case_id integer)
    RETURNS SETOF pfb.grant_files 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY SELECT * FROM pfb.grant_files where case_id = p_case_id;
END;
$BODY$;

ALTER FUNCTION pfb.get_grant_files_by_case_id(integer)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.get_grant_files_by_case_id(integer) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.get_grant_files_by_case_id(integer) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.get_grant_files_by_case_id(integer) TO postgres;

-- FUNCTION: pfb.get_graph_data(integer)

-- DROP FUNCTION IF EXISTS pfb.get_graph_data(integer);

CREATE OR REPLACE FUNCTION pfb.get_graph_data(
	p_report_id integer)
    RETURNS TABLE(x_data character varying, y_data character varying) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE
    dynamic_query text;
    query_result RECORD;
BEGIN
    SELECT graph_query INTO dynamic_query FROM pfb.graph_reports WHERE report_id = p_report_id;
    RETURN QUERY EXECUTE dynamic_query;
END;
$BODY$;

ALTER FUNCTION pfb.get_graph_data(integer)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.get_graph_data(integer) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.get_graph_data(integer) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.get_graph_data(integer) TO postgres;

-- FUNCTION: pfb.get_graph_report_by_id(integer)

-- DROP FUNCTION IF EXISTS pfb.get_graph_report_by_id(integer);

CREATE OR REPLACE FUNCTION pfb.get_graph_report_by_id(
	p_report_id integer)
    RETURNS pfb.graph_reports
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    report_record pfb.graph_reports%ROWTYPE;
BEGIN
    SELECT * INTO report_record FROM pfb.graph_reports WHERE report_id = p_report_id LIMIT 1;
    RETURN report_record;
END;
$BODY$;

ALTER FUNCTION pfb.get_graph_report_by_id(integer)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.get_graph_report_by_id(integer) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.get_graph_report_by_id(integer) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.get_graph_report_by_id(integer) TO postgres;

-- FUNCTION: pfb.get_graph_reports()

-- DROP FUNCTION IF EXISTS pfb.get_graph_reports();

CREATE OR REPLACE FUNCTION pfb.get_graph_reports(
	)
    RETURNS SETOF pfb.graph_reports 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY SELECT * FROM pfb.graph_reports where is_active = true;
END;
$BODY$;

ALTER FUNCTION pfb.get_graph_reports()
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.get_graph_reports() TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.get_graph_reports() TO pfb;

GRANT EXECUTE ON FUNCTION pfb.get_graph_reports() TO postgres;

-- FUNCTION: pfb.get_item_by_id(integer)

-- DROP FUNCTION IF EXISTS pfb.get_item_by_id(integer);

CREATE OR REPLACE FUNCTION pfb.get_item_by_id(
	p_item_id integer)
    RETURNS pfb.items
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    item_record pfb.items%ROWTYPE;
BEGIN
    SELECT * INTO item_record FROM pfb.items WHERE item_id = p_item_id LIMIT 1;
    RETURN item_record;
END;
$BODY$;

ALTER FUNCTION pfb.get_item_by_id(integer)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.get_item_by_id(integer) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.get_item_by_id(integer) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.get_item_by_id(integer) TO postgres;

-- FUNCTION: pfb.get_items()

-- DROP FUNCTION IF EXISTS pfb.get_items();

CREATE OR REPLACE FUNCTION pfb.get_items(
	)
    RETURNS SETOF pfb.items 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY SELECT * FROM pfb.items;
END;
$BODY$;

ALTER FUNCTION pfb.get_items()
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.get_items() TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.get_items() TO pfb;

GRANT EXECUTE ON FUNCTION pfb.get_items() TO postgres;

-- FUNCTION: pfb.insert_grant_application(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision)

-- DROP FUNCTION IF EXISTS pfb.insert_grant_application(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision);

CREATE OR REPLACE FUNCTION pfb.insert_grant_application(
	p_org_name character varying,
	p_org_address character varying,
	p_org_city character varying,
	p_org_state character varying,
	p_org_zipcode character varying,
	p_org_type character varying,
	p_contact_name character varying,
	p_contact_phone character varying,
	p_contact_email character varying,
	p_purpose text,
	p_request_amount double precision)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    inserted_id INTEGER;
BEGIN
    INSERT INTO pfb.grant_applications (
        org_name,
        org_address,
        org_city,
        org_state,
        org_zipcode,
        org_type,
        contact_name,
        contact_phone,
        contact_email,
        purpose,
        request_amount,
		app_creation_date,
		decision,
		status
    ) VALUES (
        p_org_name,
        p_org_address,
        p_org_city,
        p_org_state,
        p_org_zipcode,
        p_org_type,
        p_contact_name,
        p_contact_phone,
        p_contact_email,
        p_purpose,
        p_request_amount,
		now(),
		'Pending',
		'Active'
    )
	RETURNING case_id INTO inserted_id;

    RETURN inserted_id;
	
	
END;
$BODY$;

ALTER FUNCTION pfb.insert_grant_application(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.insert_grant_application(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.insert_grant_application(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.insert_grant_application(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision) TO postgres;

-- FUNCTION: pfb.insert_grant_files(integer, character varying, character varying, character varying)

-- DROP FUNCTION IF EXISTS pfb.insert_grant_files(integer, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION pfb.insert_grant_files(
	p_case_id integer,
	p_file_name character varying,
	p_file_path character varying,
	p_created_by character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
BEGIN
    INSERT INTO pfb.grant_files (case_id, file_name, file_path, file_creation_date, created_by) 
	VALUES (p_case_id, p_file_name, p_file_path, now(), p_created_by);
END;
$BODY$;

ALTER FUNCTION pfb.insert_grant_files(integer, character varying, character varying, character varying)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.insert_grant_files(integer, character varying, character varying, character varying) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.insert_grant_files(integer, character varying, character varying, character varying) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.insert_grant_files(integer, character varying, character varying, character varying) TO postgres;

-- FUNCTION: pfb.process_grant_application(integer, character varying, character varying, character varying)

-- DROP FUNCTION IF EXISTS pfb.process_grant_application(integer, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION pfb.process_grant_application(
	p_case_id integer,
	p_approver character varying,
	p_decision character varying,
	p_status character varying)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    status INTEGER;
BEGIN
    status := -1;
	
    Update pfb.grant_applications 
    Set    
		approver = p_approver,
		decision = p_decision,
		status = p_status
	WHERE case_id = p_case_id;
    status := 1;
	
	Return status;
END;
$BODY$;

ALTER FUNCTION pfb.process_grant_application(integer, character varying, character varying, character varying)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.process_grant_application(integer, character varying, character varying, character varying) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.process_grant_application(integer, character varying, character varying, character varying) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.process_grant_application(integer, character varying, character varying, character varying) TO postgres;

-- FUNCTION: pfb.search_grant_applications(text, text, text, text, text)

-- DROP FUNCTION IF EXISTS pfb.search_grant_applications(text, text, text, text, text);

CREATE OR REPLACE FUNCTION pfb.search_grant_applications(
	p_status text DEFAULT NULL::text,
	p_decision text DEFAULT NULL::text,
	p_state text DEFAULT NULL::text,
	p_city text DEFAULT NULL::text,
	p_org_type text DEFAULT NULL::text)
    RETURNS SETOF pfb.grant_applications 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY SELECT * FROM pfb.grant_applications 
	WHERE
        (p_status IS NULL OR status = p_status) AND
        (p_decision IS NULL OR decision = p_decision) AND
        (p_state IS NULL OR org_state = p_state) AND
        (p_city IS NULL OR org_city = p_city) AND
        (p_org_type IS NULL OR org_type = p_org_type);
END;
$BODY$;

ALTER FUNCTION pfb.search_grant_applications(text, text, text, text, text)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.search_grant_applications(text, text, text, text, text) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.search_grant_applications(text, text, text, text, text) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.search_grant_applications(text, text, text, text, text) TO postgres;

-- FUNCTION: pfb.update_grant_application(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision, character varying, character varying, character varying)

-- DROP FUNCTION IF EXISTS pfb.update_grant_application(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION pfb.update_grant_application(
	p_case_id integer,
	p_org_name character varying,
	p_org_address character varying,
	p_org_city character varying,
	p_org_state character varying,
	p_org_zipcode character varying,
	p_org_type character varying,
	p_contact_name character varying,
	p_contact_phone character varying,
	p_contact_email character varying,
	p_purpose text,
	p_request_amount double precision,
	p_approver character varying,
	p_decision character varying,
	p_status character varying)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    status INTEGER;
BEGIN
    Update pfb.grant_applications 
    Set    
		org_name = p_org_name,
        org_address = p_org_address,
        org_city = p_org_city,
        org_state = p_org_state,
        org_zipcode = p_org_zipcode,
        org_type = p_org_type,
        contact_name = p_contact_name,
        contact_phone = p_contact_phone,
        contact_email = p_contact_email,
        purpose = p_purpose,
        request_amount = p_request_amount,
		approver = p_approver,
		decision = p_decision,
		status = p_status
	WHERE case_id = p_case_id;
    status := 1;
	Return status;
END;
$BODY$;

ALTER FUNCTION pfb.update_grant_application(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision, character varying, character varying, character varying)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION pfb.update_grant_application(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision, character varying, character varying, character varying) TO PUBLIC;

GRANT EXECUTE ON FUNCTION pfb.update_grant_application(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision, character varying, character varying, character varying) TO pfb;

GRANT EXECUTE ON FUNCTION pfb.update_grant_application(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, double precision, character varying, character varying, character varying) TO postgres;

