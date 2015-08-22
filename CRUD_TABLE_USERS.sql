CREATE OR REPLACE PACKAGE CRUD_TABLE_USERS
IS
type USERS_tapi_rec
IS
  record
  (
    CREATED_BY USERS.CREATED_BY%type ,
    DATE_MODIFIED USERS.DATE_MODIFIED%type ,
    DATE_CREATED USERS.DATE_CREATED%type ,
    PASSWORD USERS.PASSWORD%type ,
    MODIFIED_BY USERS.MODIFIED_BY%type ,
    DESCRIPTION USERS.DESCRIPTION%type ,
    USER_ID USERS.USER_ID%type ,
    DELETED USERS.DELETED%type ,
  TYPE USERS.TYPE%type ,
  NAME USERS.NAME%type ,
  GROUP_ID USERS.GROUP_ID%type );
type USERS_tapi_tab
IS
  TABLE OF USERS_tapi_rec;
  -- insert
  PROCEDURE ins(
      p_CREATED_BY    IN USERS.CREATED_BY%type DEFAULT NULL ,
      p_DATE_MODIFIED IN USERS.DATE_MODIFIED%type DEFAULT NULL ,
      p_DATE_CREATED  IN USERS.DATE_CREATED%type DEFAULT NULL ,
      p_PASSWORD      IN USERS.PASSWORD%type DEFAULT NULL ,
      p_MODIFIED_BY   IN USERS.MODIFIED_BY%type DEFAULT NULL ,
      p_DESCRIPTION   IN USERS.DESCRIPTION%type DEFAULT NULL ,
      p_USER_ID       IN USERS.USER_ID%type ,
      p_DELETED       IN USERS.DELETED%type DEFAULT NULL ,
      p_TYPE          IN USERS.TYPE%type DEFAULT NULL ,
      p_NAME          IN USERS.NAME%type DEFAULT NULL ,
      p_GROUP_ID      IN USERS.GROUP_ID%type DEFAULT NULL );
  -- update
  PROCEDURE upd(
      p_CREATED_BY    IN USERS.CREATED_BY%type DEFAULT NULL ,
      p_DATE_MODIFIED IN USERS.DATE_MODIFIED%type DEFAULT NULL ,
      p_DATE_CREATED  IN USERS.DATE_CREATED%type DEFAULT NULL ,
      p_PASSWORD      IN USERS.PASSWORD%type DEFAULT NULL ,
      p_MODIFIED_BY   IN USERS.MODIFIED_BY%type DEFAULT NULL ,
      p_DESCRIPTION   IN USERS.DESCRIPTION%type DEFAULT NULL ,
      p_USER_ID       IN USERS.USER_ID%type ,
      p_DELETED       IN USERS.DELETED%type DEFAULT NULL ,
      p_TYPE          IN USERS.TYPE%type DEFAULT NULL ,
      p_NAME          IN USERS.NAME%type DEFAULT NULL ,
      p_GROUP_ID      IN USERS.GROUP_ID%type DEFAULT NULL );
  -- delete
  PROCEDURE del(
      p_USER_ID IN USERS.USER_ID%type );
END CRUD_TABLE_USERS;
/
CREATE OR REPLACE PACKAGE body CRUD_TABLE_USERS
IS
  -- insert
  PROCEDURE ins(
      p_CREATED_BY    IN USERS.CREATED_BY%type DEFAULT NULL ,
      p_DATE_MODIFIED IN USERS.DATE_MODIFIED%type DEFAULT NULL ,
      p_DATE_CREATED  IN USERS.DATE_CREATED%type DEFAULT NULL ,
      p_PASSWORD      IN USERS.PASSWORD%type DEFAULT NULL ,
      p_MODIFIED_BY   IN USERS.MODIFIED_BY%type DEFAULT NULL ,
      p_DESCRIPTION   IN USERS.DESCRIPTION%type DEFAULT NULL ,
      p_USER_ID       IN USERS.USER_ID%type ,
      p_DELETED       IN USERS.DELETED%type DEFAULT NULL ,
      p_TYPE          IN USERS.TYPE%type DEFAULT NULL ,
      p_NAME          IN USERS.NAME%type DEFAULT NULL ,
      p_GROUP_ID      IN USERS.GROUP_ID%type DEFAULT NULL )
  IS
  BEGIN
    INSERT
    INTO
      USERS
      (
        CREATED_BY ,
        DATE_MODIFIED ,
        DATE_CREATED ,
        PASSWORD ,
        MODIFIED_BY ,
        DESCRIPTION ,
        USER_ID ,
        DELETED ,
        TYPE ,
        NAME ,
        GROUP_ID
      )
      VALUES
      (
        p_CREATED_BY ,
        p_DATE_MODIFIED ,
        p_DATE_CREATED ,
        p_PASSWORD ,
        p_MODIFIED_BY ,
        p_DESCRIPTION ,
        p_USER_ID ,
        p_DELETED ,
        p_TYPE ,
        p_NAME ,
        p_GROUP_ID
      );
  END;
-- update
  PROCEDURE upd
    (
      p_CREATED_BY    IN USERS.CREATED_BY%type DEFAULT NULL ,
      p_DATE_MODIFIED IN USERS.DATE_MODIFIED%type DEFAULT NULL ,
      p_DATE_CREATED  IN USERS.DATE_CREATED%type DEFAULT NULL ,
      p_PASSWORD      IN USERS.PASSWORD%type DEFAULT NULL ,
      p_MODIFIED_BY   IN USERS.MODIFIED_BY%type DEFAULT NULL ,
      p_DESCRIPTION   IN USERS.DESCRIPTION%type DEFAULT NULL ,
      p_USER_ID       IN USERS.USER_ID%type ,
      p_DELETED       IN USERS.DELETED%type DEFAULT NULL ,
      p_TYPE          IN USERS.TYPE%type DEFAULT NULL ,
      p_NAME          IN USERS.NAME%type DEFAULT NULL ,
      p_GROUP_ID      IN USERS.GROUP_ID%type DEFAULT NULL
    )
  IS
  BEGIN
    UPDATE
      USERS
    SET
      CREATED_BY    = p_CREATED_BY ,
      DATE_MODIFIED = p_DATE_MODIFIED ,
      DATE_CREATED  = p_DATE_CREATED ,
      PASSWORD      = p_PASSWORD ,
      MODIFIED_BY   = p_MODIFIED_BY ,
      DESCRIPTION   = p_DESCRIPTION ,
      DELETED       = p_DELETED ,
      TYPE          = p_TYPE ,
      NAME          = p_NAME ,
      GROUP_ID      = p_GROUP_ID
    WHERE
      USER_ID = p_USER_ID;
  END;
-- del
  PROCEDURE del(
      p_USER_ID IN USERS.USER_ID%type )
  IS
  BEGIN
    DELETE
    FROM
      USERS
    WHERE
      USER_ID = p_USER_ID;
  END;
END CRUD_TABLE_USERS;