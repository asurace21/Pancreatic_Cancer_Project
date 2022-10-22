SELECT * FROM markers;

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
