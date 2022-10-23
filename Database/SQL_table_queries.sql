SELECT * FROM markers;

/* Queries to create new tables */
SELECT sex, round(avg("plasma_CA19_9"),2) as plasma_avg, round(avg("creatinine"),2) as creat_avg, 
	round(avg("LYVE1"),2) as LYVE1_avg, round(avg("REG1B"),2) as REG1B_avg, 
	round(avg("TFF1"),2) as TFF1_avg, round(avg("REG1A"),2) as REG1A_avg
INTO gender_avg	
FROM markers
GROUP BY sex;

SELECT diagnosis, sex, round(avg("plasma_CA19_9"),2) as plasma_avg, round(avg("creatinine"),2) as creat_avg, 
	round(avg("LYVE1"),2) as LYVE1_avg, round(avg("REG1B"),2) as REG1B_avg, 
	round(avg("TFF1"),2) as TFF1_avg, round(avg("REG1A"),2) as REG1A_avg	
INTO diagnosis_gender_avg
FROM markers
GROUP BY diagnosis, sex
ORDER BY diagnosis, sex;

SELECT stage, round(avg("plasma_CA19_9"),2) as plasma_avg, round(avg("creatinine"),2) as creat_avg, 
	round(avg("LYVE1"),2) as LYVE1_avg, round(avg("REG1B"),2) as REG1B_avg, 
	round(avg("TFF1"),2) as TFF1_avg, round(avg("REG1A"),2) as REG1A_avg	
INTO stage_avg
FROM markers
WHERE stage IS NOT null
GROUP BY stage
ORDER BY stage;

SELECT benign_sample_diagnosis, round(avg("plasma_CA19_9"),2) as plasma_avg, round(avg("creatinine"),2) as creat_avg, 
	round(avg("LYVE1"),2) as LYVE1_avg, round(avg("REG1B"),2) as REG1B_avg, 
	round(avg("TFF1"),2) as TFF1_avg, round(avg("REG1A"),2) as REG1A_avg	
INTO benign_avg
FROM markers
WHERE benign_sample_diagnosis IS NOT null
GROUP BY benign_sample_diagnosis
ORDER BY benign_sample_diagnosis;

SELECT benign_sample_diagnosis as control_group, round(avg("plasma_CA19_9"),2) as plasma_avg, round(avg("creatinine"),2) as creat_avg, 
	round(avg("LYVE1"),2) as LYVE1_avg, round(avg("REG1B"),2) as REG1B_avg, 
	round(avg("TFF1"),2) as TFF1_avg, round(avg("REG1A"),2) as REG1A_avg	
INTO control_avg
FROM markers
WHERE stage IS null AND benign_sample_diagnosis IS null
GROUP BY benign_sample_diagnosis
ORDER BY benign_sample_diagnosis;

select sex, count(sex) as sex_count
into gender_count
from markers
group by sex;

select diagnosis, sex, count(diagnosis) as diagnosis_count
into diagnosis_gender_count
from markers
group by diagnosis, sex
order by diagnosis, sex;

/* Creating gender stats table by joining two existing tables */ 
select gender_count.sex, gender_count.sex_count, gender_avg.plasma_avg, gender_avg.creat_avg, 
	gender_avg.LYVE1_avg, gender_avg.REG1B_avg, gender_avg.TFF1_avg, gender_avg.REG1A_avg 
into gender_statistics
from gender_avg
join gender_count on gender_count.sex = gender_avg.sex;

/* Creating diagnosis/gender stats table by joining two existing tables */
select diagnosis_gender_count.diagnosis, diagnosis_gender_count.sex, diagnosis_gender_count.diagnosis_count, 
	diagnosis_gender_avg.plasma_avg, diagnosis_gender_avg.creat_avg, diagnosis_gender_avg.LYVE1_avg, 
	diagnosis_gender_avg.REG1B_avg, diagnosis_gender_avg.TFF1_avg, diagnosis_gender_avg.REG1A_avg 
into diagnosis_gender_statistics
from diagnosis_gender_avg
join diagnosis_gender_count 
on diagnosis_gender_count.diagnosis = diagnosis_gender_avg.diagnosis 
and diagnosis_gender_count.sex = diagnosis_gender_avg.sex;