
alter session set current_schema = NXP_SMNM_SETTINGS;

ALTER TABLE center drop column end_of_day_time;

ALTER TABLE institution drop column debit_endpoint;

ALTER TABLE institution add column check_endpoint;
