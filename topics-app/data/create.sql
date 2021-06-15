DROP SCHEMA IF EXISTS forum CASCADE;

BEGIN;
CREATE SCHEMA forum;
ALTER SCHEMA forum OWNER TO "postgres";
COMMENT ON SCHEMA forum IS 'La base du forum des quillers';


CREATE TABLE forum.users (
    id SERIAL PRIMARY KEY,
    pseudo character varying(50) NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255),
    status character varying(50)
);
COMMENT ON TABLE forum.users IS 'Contient les infos utilisateurs du forum.';


CREATE TABLE forum.category (
    id SERIAL PRIMARY KEY,
    name character varying(128) NOT NULL
);


CREATE TABLE forum.message (
    id SERIAL PRIMARY KEY,
    users_id integer,
    message_content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_at timestamp without time zone,
    topic_id integer
);

CREATE TABLE forum.topic (
    id SERIAL PRIMARY KEY,
    title character varying(255) NOT NULL,
    topic_description text NOT NULL,
    users_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    modified_at timestamp without time zone,
    category_id integer
);


ALTER TABLE ONLY forum.message
    ADD CONSTRAINT message_users_id_fkey FOREIGN KEY (users_id) REFERENCES forum.users(id);

ALTER TABLE ONLY forum.message
    ADD CONSTRAINT message_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES forum.topic(id);

ALTER TABLE ONLY forum.topic
    ADD CONSTRAINT topic_category_id_fkey FOREIGN KEY (category_id) REFERENCES forum.category(id);

ALTER TABLE ONLY forum.topic
    ADD CONSTRAINT topic_users_id_fkey FOREIGN KEY (users_id) REFERENCES forum.users(id);
COMMIT;
