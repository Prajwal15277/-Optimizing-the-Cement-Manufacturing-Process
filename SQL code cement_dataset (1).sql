
CREATE TABLE Cement_dataset(S_No INT NOT NULL PRIMARY KEY,DateTime TIMESTAMP ,Residue DECIMAL(10, 2),
    Blaine DECIMAL(10, 2),cem_type VARCHAR(255),C3A DECIMAL(10, 2),C4AF DECIMAL(10, 2),G_SO3 DECIMAL(10, 2),
    G_Moisture DECIMAL(10, 2),FA_Blaine DECIMAL(10, 2),Gypsum_Weigh_Feeder_TPH DECIMAL(10, 2),Fly_Ash_SFF_TPH DECIMAL(10, 2),
	Drive_Power_MILL_KW DECIMAL(10, 2),Separator_speed_RPM INT,Position_Master_Roller1_mm DECIMAL(10, 2),
	Counter_Pressure_HLSM_mm DECIMAL(10, 2),Hydraulic_pressure DECIMAL(10, 2),Fan_Power_KW DECIMAL(10, 2));

----- Cement Manufacturing data -------
-------- float , int , DATE TIME , text - four data type we have  
select * from Cement_dataset ;                            ------ To view the dataset
select distinct * from Cement_dataset ;                   ----- to view distinct record
select * from Cement_dataset limit 10 ;                    ----- To view above 10 rows
select count(*) from Cement_dataset ;                       ------ 2767 rows & 18 columns we have 
select count (distinct S_No ) from Cement_dataset ;         -------- NO duplicates in the dataset (by Serial number)
select * from Cement_dataset where S_No is null ;                ---------no null values in the sr_no 
select S_No from Cement_dataset order by S_No asc limit 1;          -------- s.no start from the - 2819

---Date Time ---
select * from Cement_dataset where datetime is null ;              --------- no null values in date & time.
select count (distinct datetime ) from Cement_dataset ;
select extract(year from datetime) as year , count (*) as year_count from
Cement_dataset group by year order by year_count desc  ;              ---- data between 2021 to 2022
------- find wich year most manifacturing did -----
select extract(year from datetime) as year_manufacturing ,count(*) as manufacturing_count from cement_dataset group by year_manufacturing
order by manufacturing_count desc;

------ Residue (resedue is the measurement of particle size distribution)-----
select residue from cement_dataset ;
select * from Cement_dataset where  residue is null ;                  --no null values in residue,the 
select count(distinct Residue) from Cement_dataset 	                 ------ 179 distinct residue we have 
select Residue ,count(*) as R_count from Cement_dataset group by Residue order by R_count DESC ;
select max(Residue) from Cement_dataset ;         ----- 28  max 
select min(Residue) from Cement_dataset ;         ------ 8.20   min 
select avg(Residue)from Cement_dataset ;       ----18.14   mean
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY residue) AS median_value FROM Cement_dataset;    ------ 18.6 meadian 
WITH Z_Scores AS ( SELECT residue, (residue - AVG(residue) OVER ()) / NULLIF(STDDEV(residue) OVER (), 0) AS z_score FROM Cement_dataset)
SELECT residue, z_score FROM Z_Scores WHERE ABS(z_score) > 3;                 -------- no outliers in residue 

----- Blaine (measurement of fitness of cement)   ------
select Blaine from cement_dataset ;
select count(distinct Blaine ) from Cement_dataset ;    ------95 distinct values we have 
select * from Cement_dataset where Blaine is null ;     -------no null values 
select avg(blaine) from Cement_dataset ;        --------- mean of the blaine - 339.22
select max(blaine ) from Cement_dataset ;     -------max - of blane 409.00
select min(blaine) from Cement_dataset ;     ------ min - 150.
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY blaine) AS median_value FROM Cement_dataset;      -----339.00 meadian
WITH Z_Scores AS (SELECT Blaine,(Blaine - AVG(Blaine) OVER ()) / NULLIF(STDDEV(Blaine) OVER (), 0) AS z_score FROM Cement_dataset)
SELECT Blaine, z_score FROM Z_Scores WHERE ABS(z_score) > 3;                  -------- 32 outliers in Blaine .

----- cem_type (types pf cement)----
select count(*) from Cement_dataset where cem_type is null ;     ----- we have 4 null values in cement type
update  Cement_dataset  set cem_type = 0 where cem_type is null ;  ----- fill 0 there (the null values)
select * from Cement_dataset where cem_type is null ;   ----- now no  null values
select count(distinct cem_type) from Cement_dataset ;      ------  2 types we have in cement
select cem_type ,count(*) as Q_count from Cement_dataset group by cem_type order by Q_count desc ;-- 1098 /non premium , 1665/premium ,0 /4

------- C3A (Amount of Tricalcium Aluminate present in cement) ----
select * from Cement_dataset where C3A is null ;        ----- only 1 null value in C3A 
update Cement_dataset set C3A = 0 where C3A is null ;   --- fill 0 in the null value
select * from Cement_dataset where C3a is null ;         ---- only for cheked(no null values)
select count (distinct C3A) from Cement_dataset ;                ------- we have 102 distinct values in C3A.
select max(C3A) from Cement_dataset ;                             ----- 7.75 max
select avg(C3A) from Cement_dataset ;                          ----- 7.09 mean
select min(C3A) from Cement_dataset ;                         -----  0 min
select sum(c3a) from Cement_dataset ;  
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY C3A) AS median_value FROM Cement_dataset;   ---- meadian 7.17
select C3A , count(*) as C_count from Cement_dataset group by C3A order by C_count desc;
WITH Z_Scores AS (SELECT C3A, (C3A - AVG(C3A) OVER ()) / NULLIF(STDDEV(C3A) OVER (), 0) AS z_score FROM Cement_dataset)
SELECT C3A, z_score FROM Z_Scores WHERE ABS(z_score) > 3;                         -------- no outliers  .

----- C4AF  (Amount of Tetracalcium Aluminoferrite present in cement) ----
select count(*) as null_count from Cement_dataset where C4AF is null ;      ---- no null values
select count (distinct C4AF) from Cement_dataset ;                ------ 55 distinct values 
select * from Cement_dataset where C4AF is null ;             ----- no null values 
select C4AF , count(*) as c4_count from Cement_dataset group by C4AF order by c4_count desc ;      
select  max (C4AF) from Cement_dataset ;                             -------- 13.80 max 
select  min (C4AF) from Cement_dataset ;                             ------- 12.56 min 
select  avg (C4AF) from Cement_dataset ;                             ------- 13.02 mean
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY C4AF) AS median_value FROM Cement_dataset;   ----- median 12.98
WITH Z_Scores AS (SELECT C4AF, (C4AF - AVG(C4AF) OVER ()) / NULLIF(STDDEV(C4AF) OVER (), 0) AS z_score FROM Cement_dataset)
SELECT C4AF, z_score FROM Z_Scores WHERE ABS(z_score) > 3;                 ----- 3 outlires found 

-----  G_SO3  (Amount of Sulfur Trioxide (SO3) present in cement)
select count(*) as null_count from Cement_dataset where g_so3 is null ;   ---- 2 null values got
update Cement_dataset set g_so3 = 0 where g_so3 is null ;        ------put 0 inj the null space
select count (distinct G_SO3)  from Cement_dataset ;            ---- distinct 8 . 
select max (G_so3) from Cement_dataset ;                      ------ 43.31 max .
select min (G_so3) from Cement_dataset ;                       ------ 42.01 min .
select AVG (G_so3) from Cement_dataset ;                       ---- 42.41 mean
select percentile_cont(0.5) within group (order by G_so3) as median_value from Cement_dataset ;    ------ 42.34 median 
WITH Z_Scores AS (SELECT G_so3, (G_so3 - AVG(G_so3) OVER ()) / NULLIF(STDDEV(G_so3) OVER (), 0) AS z_score FROM Cement_dataset)
SELECT G_so3, z_score FROM Z_Scores WHERE ABS(z_score) > 3;            ---------- no outliers    

----- G_Moisture (Moisture content of the cement) --- 
select count(*) as gm_count from Cement_dataset where G_moisture is null ;          ---   no null values 
select count (distinct G_moisture) from Cement_dataset ;                      ------- distinct 8 
select max (G_moisture) from Cement_dataset ;                                 ------1.70 max
select min (G_moisture) from Cement_dataset ;                            ------------0.11
select AVG (G_moisture) from Cement_dataset ;                            ------ 0.73  mean
select percentile_cont(0.5) within group  (order by g_moisture) as median_value from Cement_dataset ;     ----0.67 median 
WITH Z_Scores AS (SELECT G_moisture, (G_moisture - AVG(G_moisture) OVER ()) / NULLIF(STDDEV(G_moisture) OVER (), 0) AS z_score FROM Cement_dataset)
SELECT G_moisture, z_score FROM Z_Scores WHERE ABS(z_score) > 3;        ------   no outliers

------FA-Blaine (Blaine value of Fly Ash) - 
select count(*) as fa_count from Cement_dataset where fa_blaine is null ;          ------ 5 null values
update Cement_dataset set fa_blaine = 0 where fa_blaine is null ;              --------- put 0 (null values)
select count(distinct fa_blaine) from Cement_dataset ;                        ------ 77 distinct values 

--- Gypsum Weigh Feeder_TPH(Tonnes per hour (TPH) of Gypsum fed into the production process) - 
select count (*) as gypsum_count from Cement_dataset where Gypsum_Weigh_Feeder_TPH is null ;    ---- 4 null values 
update Cement_dataset set Gypsum_Weigh_Feeder_TPH = 0 where Gypsum_Weigh_Feeder_TPH is null ;
select count(distinct Gypsum_Weigh_Feeder_TPH) from Cement_dataset ;          --------- 270 distinct values 
WITH Z_Scores AS (SELECT Gypsum_Weigh_Feeder_TPH, (Gypsum_Weigh_Feeder_TPH - AVG(Gypsum_Weigh_Feeder_TPH) OVER ()) / NULLIF(STDDEV(Gypsum_Weigh_Feeder_TPH) OVER (), 0) AS z_score FROM Cement_dataset)
SELECT Gypsum_Weigh_Feeder_TPH, z_score FROM Z_Scores WHERE ABS(z_score) > 3;       ----- 14 outliers found

---- Fly Ash SFF_TPH (Tonnes per hour (TPH) of Fly Ash used in the production process) -- 
select count(*) as flyash_count from  Cement_dataset where Fly_Ash_SFF_TPH is null ;       --------- 3 null values
update Cement_dataset set  Fly_Ash_SFF_TPH = 0 where  Fly_Ash_SFF_TPH is null ;         ----- fill 0 (null value)
select count(distinct  Fly_Ash_SFF_TPH) from Cement_dataset ;                 ------ 1572 distinct values

---- Drive Power_MILL_KW (Power consumption of the mill in kilowatts) --- 
select count(*) as Dive_count from Cement_dataset where Drive_Power_MILL_KW is null ;     ---- 4 null values 
update Cement_dataset set  Drive_Power_MILL_KW = 0 where  Drive_Power_MILL_KW is null;      -----fill 0 (in null values )
select count(distinct  Drive_Power_MILL_KW) from Cement_dataset ;                ----- 2664 distinct values 

----- Separator_speed_RPM (Rotations per minute (RPM) of the separator) - 
select count(*) from Cement_dataset where Separator_speed_RPM is null ;       ---- 3 null values found
update Cement_dataset set Separator_speed_RPM = 0 where Separator_speed_RPM is null ;       ---- fill 0 there (null values )
select count (distinct Separator_speed_RPM) from Cement_dataset ;                 ------- 154 distinct values 
select max (Separator_speed_RPM) from cement_dataset ;                   ---- 1144 max RPM 
select min (Separator_speed_RPM) as min_rpm from Cement_dataset where Separator_speed_RPM > 0 ;   ---- 765 min value 
select AVG (Separator_speed_RPM) from cement_dataset ;             ----------- mean 931.41
select percentile_cont (0.5) within group (order  by Separator_speed_RPM) as median_value from cement_dataset ;  --- 924 median 

------ Position_Master Roller1_mm (measur in mm) --- 
select count(*) as po_count from Cement_dataset where  Position_Master_Roller1_mm is null ;      -----  2 null values 
update cement_dataset set  Position_Master_Roller1_mm = 0 where  Position_Master_Roller1_mm is null ;    --- fill 0  (null values)
select count(distinct  Position_Master_Roller1_mm ) from cement_dataset ;                ----- 1939 distinct values 

----- Counter Pressure_HLSM_mm(Hydraulic load pressure (measurement in millimeters)) --- 
select count(*) from cement_dataset where  Counter_Pressure_HLSM_mm is null ;           -----  6 null values 
update cement_dataset set  Counter_Pressure_HLSM_mm = 0 where  Counter_Pressure_HLSM_mm is null ;    --- fill 0 (null values)
select count(distinct  Counter_Pressure_HLSM_mm) from cement_dataset ;          ----  733 distinct values 

----- Hydraulic_pressure(Pressure in the hydraulic system) ----- 
select count(*) from cement_dataset where  Hydraulic_pressure is null ;        ----- 1 null value
update cement_dataset set  Hydraulic_pressure = 0 where  Hydraulic_pressure is null ;   -- --- fill 0 (null value) 
select count (distinct  Hydraulic_pressure) from cement_dataset ;               -------- 1368 distinct values 

------ Fan Power_Kw(Power consumption of the fan in kilowatts) ----
select count (*) from cement_dataset where  Fan_Power_Kw is null ;         ------- 3 null values 
update cement_dataset set  Fan_Power_Kw = 0 where  Fan_Power_Kw is null ;     fil  0 (null value) 
select count(distinct  Fan_Power_Kw) from cement_dataset ;                    ---- 2551 distinct values 
select max ( Fan_Power_Kw) from cement_dataset ;                   ------ max 1448 

























