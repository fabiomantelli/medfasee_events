SHOW DATABASES;

USE db_smf;

SHOW TABLES;

CREATE t_reg_fasor_20201119_bkp 
  LIKE t_reg_fasor_20201119;

SHOW TABLES;

INSERT t_reg_fasor_20201119_bkp
  SELECT * FROM t_reg_fasor_20201119;

/* 20/11/2020 */
CREATE TABLE t_reg_fasor_20201120
  LIKE t_reg_fasor_20201119;

INSERT INTO t_reg_fasor_20201120
  SELECT * FROM t_reg_fasor_20201119
  WHERE tempo >= 1605830400 AND tempo < 1605916800;

SELECT * from t_reg_fasor_20201120
  WHERE tempo = 1605916800;

/* 21/11/2020 */
CREATE TABLE t_reg_fasor_20201121
  LIKE t_reg_fasor_20201119;

INSERT INTO t_reg_fasor_20201121
  SELECT * FROM t_reg_fasor_20201119_bkp
  WHERE tempo >= 1605916800 AND tempo < 1606003200;

SELECT * from t_reg_fasor_20201121
  WHERE tempo = 1605916800;

SELECT * from t_reg_fasor_20201121
  WHERE tempo = 1606003200;

DELETE 
  FROM t_reg_fasor_20201121 
  WHERE tempo > 1606003200;

/* delete extra rows in t_reg_fasor_20201119 */
SELECT * from t_reg_fasor_20201119
  WHERE tempo >= 1605830400
  LIMIT 10;


DROP TABLE t_reg_fasor_20201119;

CREATE TABLE t_reg_fasor_20201119
  LIKE t_reg_fasor_20201119_bkp;

INSERT INTO t_reg_fasor_20201119
  SELECT * FROM t_reg_fasor_20201119_bkp
  WHERE tempo < 1605830400;


/* backup 22/11/2020_bkp */

CREATE TABLE t_reg_fasor_20201122_bkp 
  LIKE t_reg_fasor_20201122;

SHOW TABLES;

INSERT t_reg_fasor_20201122_bkp
  SELECT * FROM t_reg_fasor_20201122;

23/11/2020 
CREATE TABLE t_reg_fasor_20201123
  LIKE t_reg_fasor_20201122_bkp;


INSERT INTO t_reg_fasor_20201123
  SELECT * FROM t_reg_fasor_20201122_bkp;
  WHERE tempo >= 1606089600;

SELECT * from t_reg_fasor_20201123
  WHERE tempo = 1606089600;

DELETE 
  FROM t_reg_fasor_20201122
  WHERE tempo < 1606003200;

SELECT * from t_reg_fasor_20201122
  WHERE tempo = 1606003200;

CREATE TABLE t_reg_fasor_20201122
  LIKE t_reg_fasor_20201122_bkp;


INSERT INTO t_reg_fasor_20201122
  SELECT * FROM t_reg_fasor_20201122_bkp
  WHERE tempo >= 1606003200;

SELECT * from t_reg_fasor_20201122
  WHERE tempo > 1606089600
  LIMIT 10;

DELETE from t_reg_fasor_20201122
  WHERE tempo >= 1606089600;

SELECT * from t_reg_fasor_20201122
  WHERE tempo > 1606003200;

  /* 24/11/2020 */

CREATE TABLE t_reg_fasor_20201124_bkp 
  LIKE t_reg_fasor_20201124;

INSERT INTO t_reg_fasor_20201124_bkp
  SELECT * FROM t_reg_fasor_20201124;

CREATE TABLE t_reg_fasor_20201124
  LIKE t_reg_fasor_20201124_bkp;

INSERT INTO t_reg_fasor_20201124
  SELECT * FROM t_reg_fasor_20201124_bkp;


/* Model to update UNIFAP id code 123 to 23 */

/* Verify UNIFAP ID Code */
SELECT * from t_reg_fasor_20210124
  WHERE idcodepmu = 123
  ORDER BY tempo DESC
  LIMIT 100;

/* Update Table 24/01/2020 UNIFAP */
UPDATE t_reg_fasor_20210124
  SET idcodepmu = 23
  WHERE idcodepmu = 123;

 /* Test after Update: 20200124 */
SELECT * from t_reg_fasor_20210124
  WHERE idcodepmu = 23
  ORDER BY tempo DESC
  LIMIT 100;
