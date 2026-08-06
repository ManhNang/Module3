CREATE DATABASE IF NOT EXISTS smartfactory_db;
USE smartfactory_db;

CREATE TABLE SensorLogs (
    log_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sensor_id INT NOT NULL,
    recorded_at DATETIME NOT NULL,
    temperature DECIMAL(5,2),
    humidity DECIMAL(5,2),
    status VARCHAR(20) -- 'NORMAL', 'WARNING', 'CRITICAL'
);

CREATE INDEX idx_fat_covering ON SensorLogs(sensor_id, recorded_at, temperature, humidity, status);

SHOW TABLE STATUS LIKE 'SensorLogs';
alter table SensorLogs drop index idx_fat_covering;
create index idx_lean_search on SensorLogs(sensor_id, recorded_at);
EXPLAIN SELECT temperature, humidity, status FROM SensorLogs WHERE sensor_id = 105 AND recorded_at >= '2026-06-20';