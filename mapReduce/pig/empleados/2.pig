emplead = LOAD '/user/jcaladh/datasets/empleados.csv' using PigStorage(',') AS (SE:int, Id_empleado:int, salario:float, anho:chararray);
group_emplead = GROUP emplead by Id_empleado;
avgempl =  foreach group_emplead generate AVG(emplead.salario);
DUMP avgempl;
STORE avgempl INTO '/user/jcaladh/datasets/pig/output/empl2' USING PigStorage(',');