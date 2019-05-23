-- set search_path per database login role
ALTER ROLE zeppelin_admin IN DATABASE zeppelin
SET search_path = zeppelin;

ALTER ROLE zeppelin_user IN DATABASE zeppelin
SET search_path = zeppelin;
