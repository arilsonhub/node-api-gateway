--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

-- Started on 2019-10-24 11:09:37 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "judice-api-gateway";
--
-- TOC entry 2181 (class 1262 OID 16440)
-- Name: judice-api-gateway; Type: DATABASE; Schema: -; Owner: judice-v2
--

CREATE DATABASE "judice-api-gateway" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE "judice-api-gateway" OWNER TO "judice-v2";

\connect -reuse-previous=on "dbname='judice-api-gateway'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12361)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 181 (class 1259 OID 16441)
-- Name: seq_atividade; Type: SEQUENCE; Schema: public; Owner: judice-v2
--

CREATE SEQUENCE public.seq_atividade
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_atividade OWNER TO "judice-v2";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 189 (class 1259 OID 18694)
-- Name: atividade; Type: TABLE; Schema: public; Owner: judice-v2
--

CREATE TABLE public.atividade (
    id bigint DEFAULT nextval('public.seq_atividade'::regclass) NOT NULL,
    serviceurl character varying(100) NOT NULL,
    metodo character varying(10) NOT NULL,
    rota character varying(100) NOT NULL
);


ALTER TABLE public.atividade OWNER TO "judice-v2";

--
-- TOC entry 182 (class 1259 OID 16443)
-- Name: seq_perfil; Type: SEQUENCE; Schema: public; Owner: judice-v2
--

CREATE SEQUENCE public.seq_perfil
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_perfil OWNER TO "judice-v2";

--
-- TOC entry 188 (class 1259 OID 18688)
-- Name: perfil; Type: TABLE; Schema: public; Owner: judice-v2
--

CREATE TABLE public.perfil (
    id bigint DEFAULT nextval('public.seq_perfil'::regclass) NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE public.perfil OWNER TO "judice-v2";

--
-- TOC entry 183 (class 1259 OID 16445)
-- Name: seq_perfil_permissao; Type: SEQUENCE; Schema: public; Owner: judice-v2
--

CREATE SEQUENCE public.seq_perfil_permissao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_perfil_permissao OWNER TO "judice-v2";

--
-- TOC entry 194 (class 1259 OID 18843)
-- Name: perfilpermissao; Type: TABLE; Schema: public; Owner: judice-v2
--

CREATE TABLE public.perfilpermissao (
    id bigint DEFAULT nextval('public.seq_perfil_permissao'::regclass) NOT NULL,
    perfil_id bigint NOT NULL,
    permissao_id bigint NOT NULL
);


ALTER TABLE public.perfilpermissao OWNER TO "judice-v2";

--
-- TOC entry 184 (class 1259 OID 16447)
-- Name: seq_permissao; Type: SEQUENCE; Schema: public; Owner: judice-v2
--

CREATE SEQUENCE public.seq_permissao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_permissao OWNER TO "judice-v2";

--
-- TOC entry 192 (class 1259 OID 18821)
-- Name: permissao; Type: TABLE; Schema: public; Owner: judice-v2
--

CREATE TABLE public.permissao (
    id bigint DEFAULT nextval('public.seq_permissao'::regclass) NOT NULL,
    descricao character varying(100) NOT NULL,
    tag character varying(50) NOT NULL
);


ALTER TABLE public.permissao OWNER TO "judice-v2";

--
-- TOC entry 185 (class 1259 OID 16449)
-- Name: seq_permissao_atividade; Type: SEQUENCE; Schema: public; Owner: judice-v2
--

CREATE SEQUENCE public.seq_permissao_atividade
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_permissao_atividade OWNER TO "judice-v2";

--
-- TOC entry 193 (class 1259 OID 18827)
-- Name: permissaoatividade; Type: TABLE; Schema: public; Owner: judice-v2
--

CREATE TABLE public.permissaoatividade (
    id bigint DEFAULT nextval('public.seq_permissao_atividade'::regclass) NOT NULL,
    atividade_id bigint NOT NULL,
    permissao_id bigint NOT NULL
);


ALTER TABLE public.permissaoatividade OWNER TO "judice-v2";

--
-- TOC entry 186 (class 1259 OID 16451)
-- Name: seq_usuario; Type: SEQUENCE; Schema: public; Owner: judice-v2
--

CREATE SEQUENCE public.seq_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_usuario OWNER TO "judice-v2";

--
-- TOC entry 187 (class 1259 OID 16453)
-- Name: seq_usuario_perfil; Type: SEQUENCE; Schema: public; Owner: judice-v2
--

CREATE SEQUENCE public.seq_usuario_perfil
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_usuario_perfil OWNER TO "judice-v2";

--
-- TOC entry 190 (class 1259 OID 18705)
-- Name: usuario; Type: TABLE; Schema: public; Owner: judice-v2
--

CREATE TABLE public.usuario (
    id bigint DEFAULT nextval('public.seq_usuario'::regclass) NOT NULL,
    nome character varying(50) NOT NULL,
    username character varying(10) NOT NULL,
    senha character varying(100) NOT NULL,
    ativo boolean NOT NULL
);


ALTER TABLE public.usuario OWNER TO "judice-v2";

--
-- TOC entry 191 (class 1259 OID 18743)
-- Name: usuarioperfil; Type: TABLE; Schema: public; Owner: judice-v2
--

CREATE TABLE public.usuarioperfil (
    id bigint DEFAULT nextval('public.seq_usuario_perfil'::regclass) NOT NULL,
    usuario_id bigint NOT NULL,
    perfil_id bigint NOT NULL
);


ALTER TABLE public.usuarioperfil OWNER TO "judice-v2";

--
-- TOC entry 2170 (class 0 OID 18694)
-- Dependencies: 189
-- Data for Name: atividade; Type: TABLE DATA; Schema: public; Owner: judice-v2
--

INSERT INTO public.atividade (id, serviceurl, metodo, rota) VALUES (1, 'localhost:8080', 'GET', '/listar-escritorio');
INSERT INTO public.atividade (id, serviceurl, metodo, rota) VALUES (2, 'localhost:8080', 'POST', '/cadastrar-escritorio');
INSERT INTO public.atividade (id, serviceurl, metodo, rota) VALUES (3, 'localhost:8080', 'POST', '/editar-escritorio');
INSERT INTO public.atividade (id, serviceurl, metodo, rota) VALUES (4, 'localhost:8080', 'GET', '/carregar-escritorio/:id');


--
-- TOC entry 2169 (class 0 OID 18688)
-- Dependencies: 188
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: judice-v2
--

INSERT INTO public.perfil (id, descricao) VALUES (1, 'administrador de escritório');


--
-- TOC entry 2175 (class 0 OID 18843)
-- Dependencies: 194
-- Data for Name: perfilpermissao; Type: TABLE DATA; Schema: public; Owner: judice-v2
--

INSERT INTO public.perfilpermissao (id, perfil_id, permissao_id) VALUES (1, 1, 1);
INSERT INTO public.perfilpermissao (id, perfil_id, permissao_id) VALUES (2, 1, 3);
INSERT INTO public.perfilpermissao (id, perfil_id, permissao_id) VALUES (3, 1, 4);


--
-- TOC entry 2173 (class 0 OID 18821)
-- Dependencies: 192
-- Data for Name: permissao; Type: TABLE DATA; Schema: public; Owner: judice-v2
--

INSERT INTO public.permissao (id, descricao, tag) VALUES (1, 'Cadastrar escritório', 'cadastrar-escritorio');
INSERT INTO public.permissao (id, descricao, tag) VALUES (3, 'Listar escritório', 'listar-escritorio');
INSERT INTO public.permissao (id, descricao, tag) VALUES (4, 'Editar escritório', 'editar-escritorio');


--
-- TOC entry 2174 (class 0 OID 18827)
-- Dependencies: 193
-- Data for Name: permissaoatividade; Type: TABLE DATA; Schema: public; Owner: judice-v2
--

INSERT INTO public.permissaoatividade (id, atividade_id, permissao_id) VALUES (1, 1, 3);
INSERT INTO public.permissaoatividade (id, atividade_id, permissao_id) VALUES (2, 2, 1);
INSERT INTO public.permissaoatividade (id, atividade_id, permissao_id) VALUES (3, 3, 4);
INSERT INTO public.permissaoatividade (id, atividade_id, permissao_id) VALUES (4, 4, 4);


--
-- TOC entry 2171 (class 0 OID 18705)
-- Dependencies: 190
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: judice-v2
--

INSERT INTO public.usuario (id, nome, username, senha, ativo) VALUES (2, 'Arilson Rosa', 'arilson', '81dc9bdb52d04dc20036dbd8313ed055', true);


--
-- TOC entry 2172 (class 0 OID 18743)
-- Dependencies: 191
-- Data for Name: usuarioperfil; Type: TABLE DATA; Schema: public; Owner: judice-v2
--

INSERT INTO public.usuarioperfil (id, usuario_id, perfil_id) VALUES (1, 2, 1);


--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 181
-- Name: seq_atividade; Type: SEQUENCE SET; Schema: public; Owner: judice-v2
--

SELECT pg_catalog.setval('public.seq_atividade', 4, true);


--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 182
-- Name: seq_perfil; Type: SEQUENCE SET; Schema: public; Owner: judice-v2
--

SELECT pg_catalog.setval('public.seq_perfil', 1, true);


--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 183
-- Name: seq_perfil_permissao; Type: SEQUENCE SET; Schema: public; Owner: judice-v2
--

SELECT pg_catalog.setval('public.seq_perfil_permissao', 3, true);


--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 184
-- Name: seq_permissao; Type: SEQUENCE SET; Schema: public; Owner: judice-v2
--

SELECT pg_catalog.setval('public.seq_permissao', 4, true);


--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 185
-- Name: seq_permissao_atividade; Type: SEQUENCE SET; Schema: public; Owner: judice-v2
--

SELECT pg_catalog.setval('public.seq_permissao_atividade', 4, true);


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 186
-- Name: seq_usuario; Type: SEQUENCE SET; Schema: public; Owner: judice-v2
--

SELECT pg_catalog.setval('public.seq_usuario', 2, true);


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 187
-- Name: seq_usuario_perfil; Type: SEQUENCE SET; Schema: public; Owner: judice-v2
--

SELECT pg_catalog.setval('public.seq_usuario_perfil', 1, true);


--
-- TOC entry 2031 (class 2606 OID 18699)
-- Name: atividade pk_atividade; Type: CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.atividade
    ADD CONSTRAINT pk_atividade PRIMARY KEY (id);


--
-- TOC entry 2029 (class 2606 OID 18693)
-- Name: perfil pk_perfil; Type: CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT pk_perfil PRIMARY KEY (id);


--
-- TOC entry 2041 (class 2606 OID 18848)
-- Name: perfilpermissao pk_perfilpermissao; Type: CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.perfilpermissao
    ADD CONSTRAINT pk_perfilpermissao PRIMARY KEY (id);


--
-- TOC entry 2037 (class 2606 OID 18826)
-- Name: permissao pk_permissao; Type: CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.permissao
    ADD CONSTRAINT pk_permissao PRIMARY KEY (id);


--
-- TOC entry 2039 (class 2606 OID 18832)
-- Name: permissaoatividade pk_permissaoatividade; Type: CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.permissaoatividade
    ADD CONSTRAINT pk_permissaoatividade PRIMARY KEY (id);


--
-- TOC entry 2033 (class 2606 OID 18710)
-- Name: usuario pk_usuario; Type: CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id);


--
-- TOC entry 2035 (class 2606 OID 18748)
-- Name: usuarioperfil pk_usuarioperfil; Type: CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.usuarioperfil
    ADD CONSTRAINT pk_usuarioperfil PRIMARY KEY (id);


--
-- TOC entry 2046 (class 2606 OID 18849)
-- Name: perfilpermissao fk_perfilpermissao_perfil_id; Type: FK CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.perfilpermissao
    ADD CONSTRAINT fk_perfilpermissao_perfil_id FOREIGN KEY (perfil_id) REFERENCES public.perfil(id);


--
-- TOC entry 2047 (class 2606 OID 18854)
-- Name: perfilpermissao fk_perfilpermissao_permissao_id; Type: FK CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.perfilpermissao
    ADD CONSTRAINT fk_perfilpermissao_permissao_id FOREIGN KEY (permissao_id) REFERENCES public.permissao(id);


--
-- TOC entry 2044 (class 2606 OID 18833)
-- Name: permissaoatividade fk_permissaoatividade_atividade_id; Type: FK CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.permissaoatividade
    ADD CONSTRAINT fk_permissaoatividade_atividade_id FOREIGN KEY (atividade_id) REFERENCES public.atividade(id);


--
-- TOC entry 2045 (class 2606 OID 18838)
-- Name: permissaoatividade fk_permissaoatividade_permissao_id; Type: FK CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.permissaoatividade
    ADD CONSTRAINT fk_permissaoatividade_permissao_id FOREIGN KEY (permissao_id) REFERENCES public.permissao(id);


--
-- TOC entry 2042 (class 2606 OID 18749)
-- Name: usuarioperfil fk_usuarioperfil_perfil_id; Type: FK CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.usuarioperfil
    ADD CONSTRAINT fk_usuarioperfil_perfil_id FOREIGN KEY (perfil_id) REFERENCES public.perfil(id);


--
-- TOC entry 2043 (class 2606 OID 18754)
-- Name: usuarioperfil fk_usuarioperfil_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: judice-v2
--

ALTER TABLE ONLY public.usuarioperfil
    ADD CONSTRAINT fk_usuarioperfil_usuario_id FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: judice-v2
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "judice-v2";
GRANT ALL ON SCHEMA public TO "judice-v2";
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-10-24 11:09:38 -03

--
-- PostgreSQL database dump complete
--

