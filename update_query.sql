/*-------------------- Query 1 --------------------*/
UPDATE PERSON  
SET ADDRESSID = (SELECT MIN(DISTINCT A.ADDRESSID)
                   FROM ADDRESS A)
WHERE EXTRACT(MONTH FROM BIRTHDATE) IN ('1','3','5','7','9','11')
      AND FIRSTNAME LIKE 'A%' AND
       LASTNAME LIKE 'A%';
       
       
/*-------------------- Query 2 --------------------*/
UPDATE ADDRESS
SET city = 'Nof HaGalil'
WHERE city = ' Nazareth Illit';


