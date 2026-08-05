USE DATABASE INSURANCE_DB;

INSERT INTO INSURANCE_STAGING.CUSTOMER_STAGING (
    CUSTOMER_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    EMAIL, 
    PHONE_NUMBER, 
    DATE_OF_BIRTH, 
    ADDRESS, 
    CREATED_AT
)
  SELECT 
  CUSTOMER_ID, 
  UPPER(TRIM(FIRST_NAME)),
  UPPER(TRIM(LAST_NAME)), 
  LOWER(TRIM(EMAIL), 
  TRIM(PHONE_NUMBER), 
  DATE_OF_BIRTH, 
  UPPER(TRIM(ADDRESS)), 
  CREATED_AT
  FROM INSURANCE_RAW.CUSTOMER_RAW;

  ------------------------------------------------------------------------------------------------------------------------------------------------------------

  INSERT INTO INSURANCE_STAGING.POLICY_STAGING
  SELECT
  POLICY_ID,
  CUSTOMER_ID,
  UPPER(TRIM(POLICY_TYPE)),
  POLICY_START_DATE,
  POLICY_END_DATE,
  PREMIUM_AMOUNT,
  UPPER(TRIM(POLICY_STATUS))
  FROM INSURANCE_RAW.POLICY_RAW;

 ------------------------------------------------------------------------------------------------------------------------------------------------------------    

  INSERT INTO INSURANCE_STAGING.CLAIM_STAGING
  SELECT 
  CLAIM_ID,
  POLICY_ID,
  CLAIM_DATE,
  CLAIM_AMOUNT,
  UPPER(TRIM(CLAIM_STATUS)),
  TRIM(CLAIM_DESCRIPTION)
  FROM INSURANCE_RAW.CLAIM_RAW;