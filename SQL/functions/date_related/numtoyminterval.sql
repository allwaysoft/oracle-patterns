drop   table tq84_numtoyminterval purge;

create table tq84_numtoyminterval as
select
  level                       n,
  numtoyminterval(level, 'month') month_n,
  numtoyminterval(level, 'year' ) year__n
from
  dual connect by level < 20;
  
desc tq84_numtoyminterval;  
--  
-- Name                                      Null?    Type
-- ----------------------------------------- -------- -------------------------
-- N                                                  NUMBER
-- MONTH_N                                            INTERVAL YEAR(9) TO MONTH
-- YEAR__N                                            INTERVAL YEAR(9) TO MONTH  
--

column month_n format a20
column year__n format a20

alter session set nls_date_format = 'yyyy-mm-dd';

select
  n,
  month_n,
  year__n,
  date '2017-03-05' + month_n month_n_add,
  date '2017-03-05' + year__n year__n_add
from
  tq84_numtoyminterval
order by
  n;
  
--          N MONTH_N              YEAR__N              MONTH_N_AD YEAR__N_AD
-- ---------- -------------------- -------------------- ---------- ----------
--          1 +000000000-01        +000000001-00        2017-04-05 2018-03-05
--          2 +000000000-02        +000000002-00        2017-05-05 2019-03-05
--          3 +000000000-03        +000000003-00        2017-06-05 2020-03-05
--          4 +000000000-04        +000000004-00        2017-07-05 2021-03-05
--          5 +000000000-05        +000000005-00        2017-08-05 2022-03-05
--          6 +000000000-06        +000000006-00        2017-09-05 2023-03-05
--          7 +000000000-07        +000000007-00        2017-10-05 2024-03-05
--          8 +000000000-08        +000000008-00        2017-11-05 2025-03-05
--          9 +000000000-09        +000000009-00        2017-12-05 2026-03-05
--         10 +000000000-10        +000000010-00        2018-01-05 2027-03-05
--         11 +000000000-11        +000000011-00        2018-02-05 2028-03-05
--         12 +000000001-00        +000000012-00        2018-03-05 2029-03-05
--         13 +000000001-01        +000000013-00        2018-04-05 2030-03-05
--         14 +000000001-02        +000000014-00        2018-05-05 2031-03-05
--         15 +000000001-03        +000000015-00        2018-06-05 2032-03-05
--         16 +000000001-04        +000000016-00        2018-07-05 2033-03-05
--         17 +000000001-05        +000000017-00        2018-08-05 2034-03-05
--         18 +000000001-06        +000000018-00        2018-09-05 2035-03-05
--         19 +000000001-07        +000000019-00        2018-10-05 2036-03-05  
 
