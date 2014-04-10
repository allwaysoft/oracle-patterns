alter session set plsql_ccflags='FLAG:true';

create package tq84_package as
  
  procedure do;

end tq84_package;
/

create package body tq84_package as

  procedure do is begin

    dbms_output.put_line( $IF $$FLAG $THEN 'Yes!' $ELSE 'No!' $END);

  end do;

end tq84_package;
/


connect c##user_01/pw

exec tq84_package.do

alter package tq84_package compile reuse settings;

exec tq84_package.do

alter package tq84_package compile;

exec tq84_package.do

drop package tq84_package;
