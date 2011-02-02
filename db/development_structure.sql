--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stores_id_seq
    START WITH 2000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stores (
    lmaa character varying(8) DEFAULT NULL::character varying NOT NULL,
    customer_code character varying(8) DEFAULT NULL::character varying NOT NULL,
    name character varying(80) DEFAULT NULL::character varying NOT NULL,
    address_1 character varying(80) DEFAULT NULL::character varying NOT NULL,
    address_2 character varying(80) DEFAULT NULL::character varying NOT NULL,
    suburb character varying(40) DEFAULT NULL::character varying NOT NULL,
    state character varying(4) DEFAULT NULL::character varying NOT NULL,
    postcode character varying(4) DEFAULT NULL::character varying NOT NULL,
    created_at timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    id integer DEFAULT nextval('stores_id_seq'::regclass) NOT NULL,
    lat numeric,
    lng numeric
);


--
-- Name: stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20110131021054');