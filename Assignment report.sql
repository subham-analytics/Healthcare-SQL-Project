DROP TABLE hospital;

CREATE TABLE hospital(
		Hospital_Name VARCHAR(100),
		Location VARCHAR(50),
		Department VARCHAR(50),
		Doctors_Count INT,
		Patients_Count INT,
		Admission_Date DATE,
		Discharge_Date DATE,
		MedicaL_Expenses NUMERIC(10,2)
);

SELECT * FROM hospital;

-- Import data into hopital table :
COPY hospital(Hospital_Name, Location, Department, Doctors_Count, Patients_Count, 
Admission_Date, Discharge_Date, Medical_Expenses)
FROM 'D:\30 days cerficate assignment\Hospital_Data.csv'
CSV HEADER;

-- 1. The total number of patients across all hospitals :
SELECT SUM(patients_count) AS Total_patients 
FROM hospital;

-- 2. The average count of doctors available in each hospital:
SELECT hospital_name, AVG(doctors_count) AS Average_doctors
FROM hospital
GROUP BY hospital_name;

-- 3. The top 3 hospital departments that have the highest number of patients :
SELECT department, SUM(patients_count) AS Total_patients 
FROM hospital
GROUP BY department
ORDER BY total_patients DESC LIMIT 3;

-- 4. The hospital that recorded the highest medical expenses :
SELECT hospital_name, SUM(medical_expenses) AS total_medical_expenses
FROM hospital
GROUP BY hospital_name
ORDER BY total_expenses DESC LIMIT 1;

-- 5. The average medical expenses per day for each hospita :
SELECT hospital_name, AVG(medical_expenses / (discharge_date-admission_date)) AS avg_expens_per_day
FROM hospital
GROUP BY hospital_name;

-- 6. The patient with the longest stay by calculating the difference between 
--    discharge Date and Admission Date :
SELECT *, (discharge_date - admission_date) AS stay_days
FROM hospital
ORDER BY stay_days DESC
LIMIT 1;

-- 7. Count the total number of patients treated in each city :
SELECT location, SUM(patients_count) AS total_patients
FROM hospital
GROUP BY location;

-- 8. the average number of days patients spend in each department :
SELECT department, AVG(discharge_date - admission_date) AS avg_stay_days
FROM hospital
GROUP BY department;

-- 9. the department with the least number of patients :
SELECT department, SUM(patients_count) AS total_patients
FROM hospital
GROUP BY department
ORDER BY total_patients ASC
LIMIT 1;

-- 10. the data by month and calculate the total medical expenses for each month :
SELECT EXTRACT(MONTH FROM admission_date) AS month, SUM(medical_expenses) AS total_medical_expenses
FROM hospital
GROUP BY month
ORDER BY month;























