 CREATE TABLE users
    (user_id                        NUMBER NOT NULL,
    name                           VARCHAR2(30 BYTE),
    password                       VARCHAR2(30 BYTE),
    group_id                       NUMBER,
    type                           NUMBER(1,0),
    deleted                        NUMBER(1,0),
    created_by                     VARCHAR2(30 BYTE),
    modified_by                    VARCHAR2(30 BYTE),
    date_created                   DATE,
    date_modified                  DATE,
    description                    VARCHAR2(50 BYTE))
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  users
  STORAGE   (
    INITIAL     131072
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
/
 
-- Constraints for USERS

ALTER TABLE users
ADD CONSTRAINT users_pk PRIMARY KEY (user_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  users
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

ALTER TABLE users
ADD CONSTRAINT users_uk UNIQUE (name)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  users
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/
 

