-- Nabungo PostgreSQL Production Initialization

-- Create extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Performance tuning for production
ALTER SYSTEM SET max_connections = 100;
ALTER SYSTEM SET shared_buffers = '256MB';
ALTER SYSTEM SET effective_cache_size = '768MB';
ALTER SYSTEM SET maintenance_work_mem = '64MB';
ALTER SYSTEM SET checkpoint_completion_target = 0.9;
ALTER SYSTEM SET wal_buffers = '16MB';
ALTER SYSTEM SET default_statistics_target = 100;
ALTER SYSTEM SET random_page_cost = 1.1;
ALTER SYSTEM SET effective_io_concurrency = 200;
ALTER SYSTEM SET work_mem = '26214kB';
ALTER SYSTEM SET min_wal_size = '1GB';
ALTER SYSTEM SET max_wal_size = '4GB';
ALTER SYSTEM SET max_worker_processes = 4;
ALTER SYSTEM SET max_parallel_workers_per_gather = 2;
ALTER SYSTEM SET max_parallel_workers = 4;

-- Create database user for app (non-superuser)
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'nabungo_app') THEN
        CREATE ROLE nabungo_app WITH LOGIN PASSWORD '${DB_PASSWORD}' CONNECTION LIMIT 50;
    END IF;
END
$$;

-- Grant privileges
GRANT CONNECT ON DATABASE nabungo TO nabungo_app;
GRANT USAGE ON SCHEMA public TO nabungo_app;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO nabungo_app;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO nabungo_app;

-- Create backup user
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'nabungo_backup') THEN
        CREATE ROLE nabungo_backup WITH LOGIN PASSWORD '${BACKUP_PASSWORD}' CONNECTION LIMIT 2;
    END IF;
END
$$;

GRANT CONNECT ON DATABASE nabungo TO nabungo_backup;
GRANT USAGE ON SCHEMA public TO nabungo_backup;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO nabungo_backup;
