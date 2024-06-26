CREATE OR REPLACE
FUNCTION FORMATA_PHONE (P_NUMERO VARCHAR2)

RETURN VARCHAR2

IS 
 
   V_TELEFONE VARCHAR2 (30);

BEGIN

    V_TELEFONE:= REPLACE(P_NUMERO, '.', '');

    IF LENGTH(V_TELEFONE) = 10 THEN
   
         V_TELEFONE:= '(' || SUBSTR(V_TELEFONE, 1, 2) || ')' || 
         SUBSTR(V_TELEFONE, 3, 4) || '-' 
         || SUBSTR(V_TELEFONE, 7, 4);




        ELSIF LENGTH(V_TELEFONE) = 15 THEN
        V_TELEFONE:= '+' || SUBSTR(V_TELEFONE, 1, 2) || ' ' ||
        '(' || SUBSTR(V_TELEFONE, 3, 2) || ')' ||
         SUBSTR(V_TELEFONE, 5, 5) || '-' || 
         SUBSTR(V_TELEFONE, 10, 6);

        ELSE V_TELEFONE:= P_NUMERO;
        
     END IF;

RETURN 
    V_TELEFONE;

END;

SELECT PHONE_NUMBER, FORMATA_PHONE(PHONE_NUMBER) FROM EMPLOYEES;

SELECT PHONE_NUMBER, LENGTH(PHONE_NUMBER), LENGTH(REPLACE (PHONE_NUMBER, '-', '')), 
FORMATA_PHONE(PHONE_NUMBER) FROM EMPLOYEES;