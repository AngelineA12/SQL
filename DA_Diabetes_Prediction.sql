use diabetes_prediction;
select * from diabetes_prediction_da;
select Patient_id, age from diabetes_prediction_da;

select * from diabetes_prediction_da where gender = "Female" and age >= 40;

select AVG(bmi) from diabetes_prediction_da;

select * from diabetes_prediction_da order by blood_glucose_level desc;

select * from diabetes_prediction_da where hypertension = 1 and diabetes = 1;

select count(heart_disease) from diabetes_prediction_da where heart_disease = 1;

SELECT smoking_history, COUNT(*) AS patient_count
FROM diabetes_prediction_da
GROUP BY smoking_history;

select Patient_id from diabetes_prediction_da 
where bmi > (select AVG(bmi) from diabetes_prediction_da);

select Patient_id, EmployeeName, HbA1c_level 
from diabetes_prediction_da 
order by HbA1c_level 
desc
limit 1;
select Patient_id, EmployeeName, HbA1c_level 
from diabetes_prediction_da 
order by HbA1c_level 
asc
limit 1;

SELECT Patient_id, gender, blood_glucose_level,
RANK() OVER (PARTITION BY gender ORDER BY blood_glucose_level) AS glucose_rank_within_gender
FROM diabetes_prediction_da;

UPDATE diabetes_prediction_da
SET smoking_history = "Ex-smoker"
WHERE age > 50;

INSERT INTO diabetes_prediction_da (EmployeeName, Patient_id, gender,age,hypertension,
heart_disease,smoking_history,bmi,HbA1c_level,blood_glucose_level,diabetes)
VALUES ("Arun", "AN1206", "Female",21,1,0,"Never",21.43,5.2,160,0);
select * from diabetes_prediction_da;

DELETE from diabetes_prediction_da
where heart_disease = 1;
select * from diabetes_prediction_da;

SELECT p1.*
FROM diabetes_prediction_da p1
LEFT JOIN diabetes_prediction_da p2 ON p1.patient_id = p2.patient_id AND p2.condition = 'diabetes'
WHERE p1.condition = 'hypertension' AND p2.patient_id IS NULL;

ALTER TABLE diabetes_prediction_da
ADD CONSTRAINT uc_patient_id UNIQUE (Patient_id);

CREATE VIEW patient_info_view AS
SELECT patient_id, age, bmi
FROM diabetes_prediction_da;
select * from patient_info_view;
