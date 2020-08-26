select TEXT
from ALL_SOURCE
where OWNER = 'MDSYS' and  NAME = 'SDO_GEOMETRY';

create table ZOGI (
    zoga_ID number(4) constraint PK_zoga_ID primary key,
    zogs mdsys.sdo_geometry,
    zoga_Nosaukums varchar2(50)
);

create table UDENSTILPNES (
    udens_ID number(4) constraint PK_udens_ID primary key,
    udens mdsys.sdo_geometry,
    udens_Nosaukums varchar2(50)
);

create table CELS (
    cels_ID number(4) constraint PK_cels_ID primary key,
    cels mdsys.sdo_geometry,
    cels_Nosaukums varchar2(50)
);

create table SPORTA_LAUKUMI (
    laukuma_ID number(4) constraint PK_laukuma_ID primary key,
    laukums mdsys.sdo_geometry,
    laukuma_Nosaukums varchar2(50)
);

create table MAJINAS (
    majinas_ID number(4) constraint PK_majinas_ID primary key,
    majina mdsys.sdo_geometry,
    majinas_Nosaukums varchar2(50)
);

create table PUKU_DOBES (
    dobes_ID number(4) constraint PK_dobes_ID primary key,
    dobe mdsys.sdo_geometry,
    dobes_Nosaukums varchar2(50)
);


-- Atributivo tabulu izveide
create table ZOGA_STAVOKLIS(
    ieraksta_ID number(4) constraint PK_ZOGA_S_ID primary key,
    garums number(4),
    stavoklis varchar2(50),
    zoga_ID number(4),
    constraint fk_zoga_ID foreign key (zoga_ID) references ZOGI(zoga_ID)
);

create table UDENSTILPNES_STAVOKLIS(
    ieraksta_ID number(4) constraint PK_UDENS_S_ID primary key,
    platiba number(4),
    stavoklis varchar2(50),
    udens_ID number(4),
    constraint fk_udens_ID foreign key (udens_ID) references UDENSTILPNES(UDENS_ID)
);

create table CELA_STAVOKLIS(
    ieraksta_ID number(4) constraint PK_CELA_S_ID primary key,
    remonta_datums date,
    stavoklis varchar2(50),
    cela_ID number(4),
    constraint fk_cela_ID foreign key (cela_ID) references CELI(cela_ID)
);

create table LAUKUMA_STAVOKLIS(
    ieraksta_ID number(4) constraint PK_LAUKUMA_S_ID primary key,
    sedvietu_sk number(4),
    stavoklis varchar2(50),
    a_laukumu_sk number(4),
    laukuma_ID number(4),
    constraint fk_laukuma_ID foreign key (laukuma_ID) references SPORTA_LAUKUMI(LAUKUMA_ID)
);

create table MAJINAS_STAVOKLIS(
    ieraksta_ID number(4) constraint PK_MAJINAS_S_ID primary key,
    stavi number(4),
    gultas_vietas number(4),
    platiba number(4),
    majinas_ID number(4),
    constraint fk_majinas_ID foreign key (majinas_ID) references MAJINAS(majinas_ID)
);

create table DOBES_STAVOKLIS(
    ieraksta_ID number(4) constraint PK_DOBES_S_ID primary key,
    puku_skaits number(4),
    puku_skirne varchar2(50),
    dobes_ID number(4),
    constraint fk_dobes_ID foreign key (dobes_ID) references PUKU_DOBES(dobes_ID)
);

--META-datu norâdîðana
insert into USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)
    values(
        'ZOGI',
        'zogs',
        mdsys.sdo_dim_array(mdsys.sdo_dim_element('X', 0, 190, 1),mdsys.sdo_dim_element('Y', 0, 210, 1)),
        NULL);
        
insert into USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)
    values(
        'UDENSTILPNES',
        'udens',
        mdsys.sdo_dim_array(mdsys.sdo_dim_element('X', 0, 190, 1),mdsys.sdo_dim_element('Y', 0, 210, 1)),
        NULL);

insert into USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)
    values(
        'CELI',
        'cels',
        mdsys.sdo_dim_array(mdsys.sdo_dim_element('X', 0, 190, 1),mdsys.sdo_dim_element('Y', 0, 210, 1)),
        NULL);

insert into USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)
    values(
        'SPORTA_LAUKUMI',
        'laukums',
        mdsys.sdo_dim_array(mdsys.sdo_dim_element('X', 0, 190, 1),mdsys.sdo_dim_element('Y', 0, 210, 1)),
        NULL);

insert into USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)
    values(
        'MAJINAS',
        'majina',
        mdsys.sdo_dim_array(mdsys.sdo_dim_element('X', 0, 190, 1),mdsys.sdo_dim_element('Y', 0, 210, 1)),
        NULL);

insert into USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)
    values(
        'PUKU_DOBES',
        'dobe',
        mdsys.sdo_dim_array(mdsys.sdo_dim_element('X', 0, 190, 1),mdsys.sdo_dim_element('Y', 0, 210, 1)),
        NULL);

SELECT * FROM USER_SDO_GEOM_METADATA;

--Datu ievade
--Slâòa þogi datu ievade
insert into ZOGI values
    (1,
    MDSYS.SDO_GEOMETRY(2002, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,2,1), -- lînija
    mdsys.SDO_ORDINATE_ARRAY(91,201, 4,201)),
    'Ziemeïu kreisais');
    
insert into ZOGI values
    (2,
    MDSYS.SDO_GEOMETRY(2002, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,2,1), -- lînija
    mdsys.SDO_ORDINATE_ARRAY(4,201, 4,4)),
    'Rietumu');

insert into ZOGI values
    (3,
    MDSYS.SDO_GEOMETRY(2002, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,2,1), -- lînija
    mdsys.SDO_ORDINATE_ARRAY(4,4, 180,4)),
    'Dienvidu');        

insert into ZOGI values
    (4,
    MDSYS.SDO_GEOMETRY(2002, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,2,1), -- lînija
    mdsys.SDO_ORDINATE_ARRAY(180,4, 180,201)),
    'Austrumu');
    
insert into ZOGI values
    (5,
    MDSYS.SDO_GEOMETRY(2002, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,2,1), -- lînija
    mdsys.SDO_ORDINATE_ARRAY(180,201, 99,201)),
    'Ziemeïu labais');        

--Ievadîto ìeometrisko datu validâcija slânî þogi        
select a.Zoga_ID, a.ZOGA_NOSAUKUMS, sdo_GEOM.VALIDATE_GEOMETRY(ZOGS, 1) from ZOGI a;

--Slâòa ûdenstilpnes datu ievade
insert into UDENSTILPNES values(1,
    MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,1), -- polinoms bez caurumiem
    mdsys.SDO_ORDINATE_ARRAY(16,41, 16,30, 24,30, 24,36, 31,36, 31,27, 15,27, 15,12, 24,12, 24,8, 30,8, 30,12, 37,12,
    37,16, 31,16, 31,19, 37,19, 37,24, 49,24, 49,8, 65,8, 65,31, 46,31, 46,41, 16,41)),
    'Varþu dîíis'); 
    
--Ievadîto ìeometrisko datu validâcija slânî ûdenstilpnes     
select a.udens_ID, a.udens_NOSAUKUMS, sdo_GEOM.VALIDATE_GEOMETRY(udens, 1) from UDENSTILPNES a;

--Slâòa CEÏI datu ievade
insert into CELI values(1,
    MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,3), -- taisnstûris
    mdsys.SDO_ORDINATE_ARRAY(91,53, 99,201)),
    'Galvenais ceïð');     
insert into CELI values(2,
    MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,3), -- taisnstûris
    mdsys.SDO_ORDINATE_ARRAY(94,42, 95,53)),
    'Asfalta ceïð');    
insert into CELI values(3,
    MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,3), -- taisnstûris
    mdsys.SDO_ORDINATE_ARRAY(99,70, 132,71)),
    'Grants ceïð');    
insert into CELI values(4,
    MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,3), -- taisnstûris
    mdsys.SDO_ORDINATE_ARRAY(99,167, 132,168)),
    'Ðíembu ceïð');    
insert into CELI values(5,
    MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,1), -- polinoms bez caurumiem
    mdsys.SDO_ORDINATE_ARRAY(99,54, 99,53, 118,53, 118,46, 136,46, 136,43, 137,43, 137,46, 169,46, 169,43, 170,43, 170,47,
    119,47, 119,54, 99,54)),
    'Bruìçtais ceïð');  
insert into CELI values(6,
    MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,1), -- polinoms bez caurumiem
    mdsys.SDO_ORDINATE_ARRAY(46,94, 46,85, 47,85, 47,93, 91,93, 91,94, 46,94)),
    'Zemes ceïð');    
insert into CELI values(7,
    MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,1), -- polinoms bez caurumiem
    mdsys.SDO_ORDINATE_ARRAY(41,141, 41,131, 42,131, 42,140, 91,140, 91,141, 41,141)),
    'Skaidas ceïð');
insert into CELI values(8,
    MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,1), -- polinoms bez caurumiem
    mdsys.SDO_ORDINATE_ARRAY(41,185, 41,179, 42,179, 42,184, 91,184, 91,185, 41,185)),
    'Èiekuru ceïð');
insert into CELI values(9,
    MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,1), -- polinoms bez caurumiem
    mdsys.SDO_ORDINATE_ARRAY(99,134, 99,133, 143,133, 143,128, 144,128, 144,134, 99,134)),
    'Sûnu ceïð');

--Ievadîto ìeometrisko datu validâcija slânî ceïi      
select a.cela_ID, a.cela_NOSAUKUMS, sdo_GEOM.VALIDATE_GEOMETRY(cels, 1) from CELI a;

--Atributîvo datu ievade tabula ZOGA_STAVOKLIS
INSERT INTO ZOGA_STAVOKLIS values(1,87,'Ïoti labs',1);

INSERT INTO ZOGA_STAVOKLIS values(2,197,'Labs',2);

INSERT INTO ZOGA_STAVOKLIS values(3,176,'Apmierinoðs',3);

INSERT INTO ZOGA_STAVOKLIS values(4,197,'Labs',4);

INSERT INTO ZOGA_STAVOKLIS values(5,81,'Ïoti labs',5);

--Ievadîto datu izgûðana no tabulas ZOGA_STAVOKLIS
Select * FROM ZOGA_STAVOKLIS;  

--Atributîvo datu ievade tabula UDENSTILPNES_STAVOKLIS  
INSERT INTO UDENSTILPNES_STAVOKLIS values(1,2100,'Tîrs',1);

--Ievadîto datu izgûðana no tabulas UDENSTILPNES_STAVOKLIS
Select * FROM UDENSTILPNES_STAVOKLIS;  

--Atributîvo datu ievade tabula CELA_STAVOKLIS  
INSERT INTO CELA_STAVOKLIS values(1,'2017-10-25','Labs',8);
INSERT INTO CELA_STAVOKLIS values(2,'2016-05-15','Apmierinoðs',6);
INSERT INTO CELA_STAVOKLIS values(3,'2015-04-25','Labs',7);
INSERT INTO CELA_STAVOKLIS values(4,'2018-05-25','Teicams',9);
INSERT INTO CELA_STAVOKLIS values(5,'2010-06-10','Labs',1);
INSERT INTO CELA_STAVOKLIS values(6,'2010-07-06','Labs',2);
INSERT INTO CELA_STAVOKLIS values(7,'2012-09-13','Ïoti labs',3);
INSERT INTO CELA_STAVOKLIS values(8,'2014-04-30','Apmierinoðs',4);
INSERT INTO CELA_STAVOKLIS values(9,'2010-08-01','Labs',5);

--Ievadîto datu izgûðana no tabulas UDEENSTILPNES_STAVOKLIS
Select * FROM CELA_STAVOKLIS;  

--Ievadîto datu izgûðana no tabulas MAJINAS
SELECT * FROM MAJINAS;

--Ievadîto ìeometrisko datu validâcija slânî mâjiòas     
select a.majinas_ID, a.majinas_NOSAUKUMS, sdo_GEOM.VALIDATE_GEOMETRY(majina, 1) from MAJINAS a;

--Ievadîto datu izgûðana no tabulas SPORTA_LAUKUMI
SELECT * FROM SPORTA_LAUKUMI;

--Ievadîto ìeometrisko datu validâcija slânî sporta laukumi    
select a.laukuma_ID, a.laukuma_NOSAUKUMS, sdo_GEOM.VALIDATE_GEOMETRY(laukums, 1) from SPORTA_LAUKUMI a;

--Ievadîto datu izgûðana no tabulas PUKU_DOBES
SELECT * FROM PUKU_DOBES;

--Ievadîto ìeometrisko datu validâcija slânî puíu dobes  
select a.dobes_ID, a.dobes_NOSAUKUMS, sdo_GEOM.VALIDATE_GEOMETRY(dobe, 1) from PUKU_DOBES a;

--Ievadîto datu izgûðana no tabulas MAJINAS_STAVOKLIS
SELECT * FROM MAJINAS_STAVOKLIS;

--Ievadîto datu izgûðana no tabulas LAUKUMA_STAVOKLIS
SELECT * FROM LAUKUMA_STAVOKLIS;

--Ievadîto datu izgûðana no tabulas DOBES_STAVOKLIS
SELECT * FROM DOBES_STAVOKLIS;

--Fiksçta indeksa izveidoðana slânim ûdenstilpnes
create index IND_FIX_UDENSTILPNES on UDENSTILPNES(UDENS)
indextype is mdsys.spatial_index
parameters ('SDO_LEVEL = 4');

--Fiksçta indeksa izveidoðana slânim mâjiòas
create index IND_FIX_MAJINAS on MAJINAS(MAJINA)
indextype is mdsys.spatial_index
parameters ('SDO_LEVEL = 4');

--Hibrîda indeksa izveidoðana slânim þogi
create index IND_HIB_ZOGI on ZOGI(ZOGS)
indextype is mdsys.spatial_index
parameters ('SDO_LEVEL = 4, SDO_NUMTILES = 4');

--Hibrîda indeksa izveidoðana slânim sporta laukumi
create index IND_HIB_SPORTA_LAUKUMI on SPORTA_LAUKUMI(LAUKUMS)
indextype is mdsys.spatial_index
parameters ('SDO_LEVEL = 4, SDO_NUMTILES = 4');

--R - koka indeksa izveidoðana slânim ceïa
create index IND_RK_CELI on CELI(CELS)
indextype is mdsys.spatial_index;

--R - koka indeksa izveidoðana slânim puíu dobes
create index IND_RK_PUKU_DOBES on PUKU_DOBES(DOBE)
indextype is mdsys.spatial_index
parameters ('sdo_indx_dims =2');

drop index IND_FIX_UDENSTILPNES;
drop index IND_FIX_MAJINAS;
drop index IND_HIB_ZOGI;
drop index IND_HIB_SPORTA_LAUKUMI;
drop index IND_RK_CELI;
drop index IND_RK_PUKU_DOBES;

--INDEKSU âtrdarbîbas pârbaude
--Fiksçtais indekss
drop index IND_RK_CELI;
create index IND_FIX_CELI on CELI(CELS)
indextype is mdsys.spatial_index
parameters ('SDO_LEVEL = 4');
select cels from CELI;
--Hibrîd indekss
drop index IND_FIX_CELI;
create index IND_HIB_CELI on CELI(CELS)
indextype is mdsys.spatial_index
parameters ('SDO_LEVEL = 4, SDO_NUMTILES = 4');
select cels from CELI;
--R-koka indekss
drop index IND_HIB_CELI;
create index IND_RK_CELI on CELI(CELS)
indextype is mdsys.spatial_index;
select cels from CELI;

--Primârâ filtra vaicâjumi
--1. vaicâjums
select count(a.dobes_ID) as "Dobju skaits"
from PUKU_DOBES a
where mdsys.sdo_filter(a.dobe,MDSYS.SDO_GEOMETRY(2003,NULL,NULL, 
    MDSYS.SDO_ELEM_INFO_ARRAY(1,3,3),
    mdsys.SDO_ORDINATE_ARRAY(77,47,107,202)),
    'querytype=window') = 'TRUE';
    
--2. vaicâjums
select a.majinas_nosaukums as "Nosaukums"
from MAJINAS a
where mdsys.sdo_filter(a.majina,MDSYS.SDO_GEOMETRY(2003,NULL,NULL, 
    MDSYS.SDO_ELEM_INFO_ARRAY(1,3,3),
    mdsys.SDO_ORDINATE_ARRAY(0,0,95,201)),
    'querytype=window') = 'TRUE';  

drop index IND_FIX_UDENSTILPNES;
drop index IND_FIX_MAJINAS;
drop index IND_HIB_ZOGI;
drop index IND_HIB_SPORTA_LAUKUMI;
drop index IND_RK_CELI;
drop index IND_RK_PUKU_DOBES;


create index IND_UDENSTILPNES on UDENSTILPNES(UDENS)
indextype is mdsys.spatial_index;

create index IND_MAJINAS on MAJINAS(MAJINA)
indextype is mdsys.spatial_index;

create index IND_ZOGI on ZOGI(ZOGS)
indextype is mdsys.spatial_index;

create index IND_SPORTA_LAUKUMI on SPORTA_LAUKUMI(LAUKUMS)
indextype is mdsys.spatial_index;

create index IND_CELI on CELI(CELS)
indextype is mdsys.spatial_index;

create index IND_PUKU_DOBES on PUKU_DOBES(DOBE)
indextype is mdsys.spatial_index;
    
--Topoloìiju analîzes vaicâjumi
--1. Vaicâjums
SELECT a.MAJINAS_NOSAUKUMS as Objekts
FROM MAJINAS a, Celi c
where sdo_relate(a.majina,c.cels,'mask=anyinteract querytype=window') = 'TRUE';

CREATE MATERIALIZED VIEW TOP1 AS 
    SELECT a.MAJINAS_NOSAUKUMS as Objekts, a.majina
    FROM MAJINAS a, Celi c
    where sdo_relate(a.majina,c.cels,'mask=anyinteract querytype=window') = 'TRUE';
 
--2.Vaicâjums    
select a.majinas_Nosaukums as objekts
from MAJINAS a, UDENSTILPNES b
where b.udens_Nosaukums = 'Varþu dîíis' and not SDO_WITHIN_DISTANCE(A.Majina, b.Udens, 'Distance = 75') = 'TRUE';

CREATE MATERIALIZED VIEW TOP2 AS 
    select a.majinas_Nosaukums as objekts, a.majina
    from MAJINAS a, UDENSTILPNES b
    where b.udens_Nosaukums = 'Varþu dîíis' and not SDO_WITHIN_DISTANCE(A.Majina, b.Udens, 'Distance = 75') = 'TRUE';

--3. Vaicâjums
Select a.zoga_nosaukums as objekts
from ZOGI a, Celi b
where b.cela_Nosaukums = 'Galvenais ceïð' and SDO_TOUCH(b.cels, a.zogs) = 'TRUE' ;

CREATE MATERIALIZED VIEW TOP3 AS 
    Select a.zoga_nosaukums as objekts, a.zogs
    from ZOGI a, Celi b
    where b.cela_Nosaukums = 'Galvenais ceïð' and SDO_TOUCH(b.cels, a.zogs) = 'TRUE' ;

--4. Vaicâjums    
select 'Futbola laukums' as Objekts, round(sdo_nn_distance(1)) Attâlums
from MAJINAS a, SPORTA_LAUKUMI b
where a.majinas_ID = 3 and b.Laukuma_ID = 1 and
sdo_nn(a.majina, b.laukums, 'sdo_num_res=10',1) = 'TRUE'
    union
select 'Volejbola laukums' as Objekts, round(sdo_nn_distance(2)) Attâlums
from MAJINAS a, SPORTA_LAUKUMI b
where a.majinas_ID = 3 and b.Laukuma_ID = 2 and
sdo_nn(a.majina, b.laukums, 'sdo_num_res=10',2) = 'TRUE'
    union
select 'Basketbola laukums' as Objekts, round(sdo_nn_distance(3)) Attâlums
from MAJINAS a, SPORTA_LAUKUMI b
where a.majinas_ID = 3 and b.Laukuma_ID = 3 and
sdo_nn(a.majina, b.laukums, 'sdo_num_res=10',3) = 'TRUE';


CREATE MATERIALIZED VIEW TOP4_1 AS   
    select 'Futbola laukums' as Objekts, round(sdo_nn_distance(1)) Attâlums
    from MAJINAS a, SPORTA_LAUKUMI b
    where a.majinas_ID = 3 and b.Laukuma_ID = 1 and
    sdo_nn(a.majina, b.laukums, 'sdo_num_res=10',1) = 'TRUE'
        union
    select 'Volejbola laukums' as Objekts, round(sdo_nn_distance(2)) Attâlums
    from MAJINAS a, SPORTA_LAUKUMI b
    where a.majinas_ID = 3 and b.Laukuma_ID = 2 and
    sdo_nn(a.majina, b.laukums, 'sdo_num_res=10',2) = 'TRUE'
        union
    select 'Basketbola laukums' as Objekts, round(sdo_nn_distance(3)) Attâlums
    from MAJINAS a, SPORTA_LAUKUMI b
    where a.majinas_ID = 3 and b.Laukuma_ID = 3 and
    sdo_nn(a.majina, b.laukums, 'sdo_num_res=10',3) = 'TRUE';
 
CREATE MATERIALIZED VIEW TOP4 AS  
    Select a.objekts, a.attâlums , b.laukums
    from TOP4_1 a , SPORTA_LAUKUMI b
    where b.laukuma_nosaukums = a.objekts; 

--Ìeometriju skaitlisko raksturojumu izgûðanas vaicâjums
--1. Vaicâjums
select a.dobes_nosaukums, round(sdo_geom.SDO_area(a.dobe, 1)) as Platîba
from PUKU_DOBES a;

--2. Vaicâjums
select 'Atpûtas krçsls' as Objetks, round(sdo_geom.sdo_length(a.udens,1)/3) as Skaits
from UDENSTILPNES a
where a.UDENS_NOSAUKUMS = 'Varþu dîíis';

--3. Vaicâjums
select sum(sdo_geom.sdo_length(a.zogs,1)) as Þoga_garums
from Zogi a;

--4. Vaicâjums
select Round(sum(A.Majinu_laukums)/(190*210),2) Aizòemta_daïa
From
    (select sdo_geom.sdo_area(b.Majina, c.diminfo) Majinu_laukums
    from majinas b, user_sdo_geom_metadata c) a;

--Atributîvo datu izgûðanas vaicâjumi
--1. Vaicâjums
select a.Majinas_ID, b.Majinas_Nosaukums, a.Stavi, a.Gultas_vietas, a.platiba, b.majina
from MAJINAS_STAVOKLIS a, MAJINAS b
where a.majinas_id = b.majinas_ID and
mdsys.sdo_filter(b.majina,MDSYS.SDO_GEOMETRY(2003,NULL,NULL, 
    MDSYS.SDO_ELEM_INFO_ARRAY(1,3,3),
    mdsys.SDO_ORDINATE_ARRAY(0,0,95,201)),
    'querytype=window') = 'TRUE';
    
create materialized view ATR1 as
    select a.Majinas_ID, b.Majinas_Nosaukums, a.Stavi, a.Gultas_vietas, a.platiba, b.majina
    from MAJINAS_STAVOKLIS a, MAJINAS b
    where a.majinas_id = b.majinas_ID and
    mdsys.sdo_filter(b.majina,MDSYS.SDO_GEOMETRY(2003,NULL,NULL, 
        MDSYS.SDO_ELEM_INFO_ARRAY(1,3,3),
        mdsys.SDO_ORDINATE_ARRAY(0,0,95,201)),
        'querytype=window') = 'TRUE';

--2. Vaicâjums
select a.dobes_nosaukums, c.puku_skaits
    from PUKU_DOBES a, UDENSTILPNES b, DOBES_STAVOKLIS c
    where c.puku_skaits > 30 and
    a.dobes_id = c.dobes_ID and
    b.udens_Nosaukums = 'Varþu dîíis' and SDO_WITHIN_DISTANCE(A.dobe, b.Udens, 'Distance = 75') = 'TRUE';

create materialized view ATR2 as
    select a.dobes_nosaukums, c.puku_skaits, a.dobe
        from PUKU_DOBES a, UDENSTILPNES b, DOBES_STAVOKLIS c
        where c.puku_skaits > 30 and
        a.dobes_id = c.dobes_ID and
        b.udens_Nosaukums = 'Varþu dîíis' and SDO_WITHIN_DISTANCE(A.dobe, b.Udens, 'Distance = 75') = 'TRUE';

--3. Vaicâjums
Select DISTINCT a.cela_nosaukums, b.stavoklis
from Celi a, Cela_Stavoklis b, SPORTA_LAUKUMI c
where a.cela_ID = B.Cela_ID and SDO_TOUCH(a.cels, c.laukums) = 'TRUE' ;

create materialized view ATR3_1 as
    Select distinct a.cela_nosaukums, b.stavoklis
    from Celi a, Cela_Stavoklis b, SPORTA_LAUKUMI c
    where a.cela_ID = B.Cela_ID and SDO_TOUCH(a.cels, c.laukums) = 'TRUE' ;
    
CREATE MATERIALIZED VIEW ATR3 AS  
    Select a.cela_nosaukums, a.stavoklis , b.cels
    from ATR3_1 a , Celi b
    where b.cela_NOSAUKUMS = a.CELA_NOSAUKUMS; 

--Ìeometriju ìeometrisko datu iegûðanas vaicâjumi
--1. Vaicâjums
select a.laukuma_nosaukums, a.laukums.sdo_elem_info
from SPORTA_LAUKUMI a;

--2. Vaicâjums
Select koord.ID as "Punkta NR", koord.X, koord.Y
from UDENSTILPNES a,
    TABLE(SDO_UTIL.GETVERTICES(a.udens)) koord
where a.udens_nosaukums = 'Varþu dîíis';

--3. Vaicâjums
Select a.dobes_nosaukums Objekts, a.dobe.get_dims() Dimensijas
from PUKU_DOBES a;

--4. Vaicâjums
select a.majinas_nosaukums Mâjiòa, a.majina.get_gtype() Tips
from majinas a;