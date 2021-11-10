drop Table  MOA_CDM_1.dbo.observation_period
Create table MOA_CDM_1.dbo.observation_period
(
      observation_period_id  INTEGER  NOT NULL
      person_id   INTEGER  NOT NULL
      observation_period_start_date  DATE  NOT NULL
      observation_period_end_date   DATE  NOT NULL
      period_type_concept_id  INTEGER  NOT NULL
 )
  ;

WITH condition as(
SELECT
person_id,
condition_start_date as start_date,
condition_start_date as end_date
From MOA_CDM_1.dbo.condition_occurrence
),

death as (
SELECT
person_id,
death_date as start,
death_date
From MOA_CDM_1.dbo.death
),

drug as (
SELECT
person_id,
drug_exposure_start_date,
drug_exposure_end_date
From MOA_CDM_1.dbo.drug_exposure
),

pro as (
SELECT
person_id,
procedure_date as start,
procedure_date as end_date
From MOA_CDM_1.dbo.procedure_occurrence
),

measurement as (
SELECT
person_id,
measurement_date as start,
procedure_date as end_date
From MOA_CDM_1.dbo.measurement]
),

Visit as (
SELECT
person_id,
visit_start_date as start,
visit_end_date as end_date
From MOA_CDM_1.dbo.visit_occurrence
),

uni as (
SELECT * FROM condition
UNION all
SELECT * FROM death
UNION all
SELECT * FROM drug
UNION all
SELECT * FROM pro
UNION all
SELECT * FROM measurement
UNION all
SELECT * FROM Visit 
),

db as (
SELECT
row_number () over (ORDER BY person_id DESC) as observation_period_id,
person_id,
min(start_date) as observation_period_start_date,
max(end_date) as observation_period_end_date,
44814724 as period_type_concept_id

FROM uni
GROUP BY person_id
)

INSERT INTO MOA_CDM_1.dbo.observation_period
select
observation_period_id,
      person_id,   
      observation_period_start_date,  
      observation_period_end_date,  
      period_type_concept_id  

	  FROM db