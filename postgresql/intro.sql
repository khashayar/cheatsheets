-- CONNECT
psql -U USERNAME -h HOST -d DB_NAME

-- INDEX
CREATE INDEX idx_name ON table_name( (json #>> '{externalIds,pubmed}'::text[]) );
-- Examples
CREATE UNIQUE INDEX pub_row_idx ON publication(row);
CREATE INDEX pub_pubmed_idx ON publication((json #>> '{externalIds,pubmed}'::text[]));


-- GIN INDEX
CREATE INDEX gin_name ON table_name USING gin (field_name jsonb_path_ops);
-- Examples
CREATE INDEX pub_doc_gin ON publication(json jsonb_path_ops);


-- COPY TABLE
CREATE TABLE TAGET_SCHEMA.TARGET_TABLE AS SELECT * FROM SOURCE_SCHEMA.SOURCE_TABLE;
INSERT INTO TAGET_SCHEMA.TARGET_TABLE SELECT * FROM SOURCE_SCHEMA.SOURCE_TABLE;


-- OWNER
alter table SCHEMA_NAME.TABLE_NAME owner to USER;

-- GRANT & REVOKE
GRANT ALL ON TABLE_NAME TO ROLE_NAME;
GRANT SELECT ON TABLE_NAME TO ROLE_NAME;
REVOKE INSERT ON TABLE_NAME FROM ROLE_NAME;

-- BACKUP & WATCH
pg_dump -h HOST -U USER -d DATABASE -t TABLE | gzip > backup.pgsql.gz
watch -n 5 "ls -lh backup.pgsql.gz | awk '{print \$5}'"

-- RESTORE
gunzip -c backup.pgsql.gz | psql -h HOST -U USER -d DATABASE

-- BACKUP & RESTORE
pg_dump --dbname=postgresql://USER:PASS@example1.com:5432/SOURCE_DB -t SOURCE_TABLE | psql --dbname=postgresql://USER:PASS@example2.com:5432/TARGET_DB


-- SEQUENCE
ALTER TABLE TABLE_NAME ADD COLUMN "COL_NAME" bigint;
UPDATE TABLE_NAME SET COL_NAME = nextval('asso_row_seq'::regclass);

-- REMOVE JSON ATTRIBUTE
UPDATE TABLE_NAME SET COL_NAME = COL_NAME - 'JSON_KEY';
