-- DROP SCHEMA uuid_generator;

CREATE SCHEMA uuid_generator AUTHORIZATION prov;

-- DROP SEQUENCE uuid_generator.request_request_id_seq;

CREATE SEQUENCE uuid_generator.request_request_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE uuid_generator.service_serviceid_seq;

CREATE SEQUENCE uuid_generator.service_serviceid_seq
	NO MINVALUE
	NO MAXVALUE;-- uuid_generator.service definition

-- Drop table

-- DROP TABLE uuid_generator.service;

CREATE TABLE uuid_generator.service (
	serial_id serial4 NOT NULL,
	create_dtm timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	service_name varchar NOT NULL,
	CONSTRAINT service_pk PRIMARY KEY (serial_id)
);


-- uuid_generator.request definition

-- Drop table

-- DROP TABLE uuid_generator.request;

CREATE TABLE uuid_generator.request (
	request_id bigserial NOT NULL,
	created_dtm timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	uuid varchar NULL,
	serial_id int4 NOT NULL,
	CONSTRAINT request_pk PRIMARY KEY (request_id),
	CONSTRAINT request_fk FOREIGN KEY (serial_id) REFERENCES uuid_generator.service(serial_id)
);
