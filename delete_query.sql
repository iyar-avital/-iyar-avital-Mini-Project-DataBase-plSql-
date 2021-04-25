/*-------------------- Query 1 --------------------*/
DELETE FROM MEETING
WHERE EXTRACT(YEAR FROM meetdate) = 2021
      AND EXTRACT(MONTH FROM meetdate) = 3
      AND EXTRACT(DAY FROM meetdate) = 23
      AND (PERSONID IN (SELECT PERSONID
                        FROM PERSON NATURAL JOIN ADDRESS 
                        WHERE COUNTRY='Israel')
      or counselorid in(SELECT PERSONID 
                        FROM PERSON NATURAL JOIN ADDRESS 
                        WHERE COUNTRY='Israel'));
                        
                                                                    
/*-------------------- Query 2 --------------------*/
DELETE MEETING
WHERE COUNSELORID IN (SELECT PERSONID 
                      FROM PERSON NATURAL JOIN COUNSELOR
                      WHERE BIRTHDATE <= SYSDATE - INTERVAL '60' YEAR);

DELETE COUNSELOR
WHERE PERSONID IN (SELECT PERSONID 
                   FROM PERSON 
                   WHERE BIRTHDATE <= SYSDATE - INTERVAL '60' YEAR);
      
     
      
DELETE PERSON
WHERE BIRTHDATE <= SYSDATE - INTERVAL '60' YEAR 
      AND PERSONID NOT IN (SELECT PERSONID_
                           FROM INTERESTED)
      
      
      
      
      
