SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'hospital';

DROP
DATABASE IF EXISTS "hospital";

CREATE DATABASE hospital
    WITH ENCODING 'UTF8'
    LC_COLLATE='es_MX.utf8'
    LC_CTYPE='es_MX.utf8'
    TEMPLATE=template0;

BEGIN;
\c hospital
\i create.sql
\i data.sql
COMMIT;
