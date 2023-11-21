-- Create database for eestec
CREATE DATABASE {{ eestec_db_name }};

-- Create a user for eestec
CREATE USER {{ eestec_db_user }};
GRANT ALL PRIVILEGES ON {{ eestec_db_name }}.* TO '{{ eestec_db_user }}'@'%';
ALTER USER '{{ eestec_db_user }}'@'%' IDENTIFIED WITH mysql_native_password BY '{{ eestec_db_password }}';