
WITH
condition as (
  SELECT
  person_id,
  condition_start_date as start,
  condition_start_date as end_date
  FROM MOA_CDM_2109.dbo.CONDITION_OCCURRENCE

),

drug as (
  SELECT
  person_id,
  drug_exposure_start_date  as start,
  drug_exposure_start_date as end_date
  FROM MOA_CDM_2109.dbo.DRUG_EXPOSURE
),

pro as(
    SELECT
    person_id,
    PROCEDURE_DATE as start,
    PROCEDURE_DATE as end_date
  FROM MOA_CDM_2109.dbo.PROCEDURE_OCCURRENCE  --surgery + image
),

--measurement 수정 후 추가
measurement as(
   SELECT
   person_id,
   measurement_date as start,
   measurement_date as end_date
   FROM MOA_CDM_2109.dbo.MEASUREMENT
),

  visit as(
    SELECT
    person_id,
    visit_start_date as start,
    visit_end_date as end_date
    FROM MOA_CDM_2109.dbo.VISIT_OCCURRENCE
  ),


uni as(
SELECT * FROM condition
union all
SELECT * FROM drug
union all
SELECT * FROM pro
union all
SELECT * FROM measurement
union all
SELECT * FROM visit
),


db as(
SELECT
-- 14385 - 1 + row_number() over (ORDER BY person_id DESC) as observation_period_id,  --nextval
row_number() over (ORDER BY person_id DESC) as observation_period_id,
person_id,
min(start) as observation_period_start_date,
max(end_date) as observation_period_end_date,
44814724 as period_type_concept_id

FROM uni
GROUP by person_id
)

insert into MOA_CDM_2109.dbo.OBSERVATION_PERIOD
select distinct
observation_period_id,
db.person_id,
observation_period_start_date,
case
    when death.person_id is not null
        then death_date
    else observation_period_end_date
end as observation_period_end_date,
period_type_concept_id
--INTO OHDSI.dbo.OBSERVATION_PERIOD
FROM db
left join MOA_CDM_2109.dbo.death
on db.person_id = death.person_id
-- WHERE person_id NOT IN(SELECT person_id FROM MOA_CDM_2109.dbo.observation_period)

select *
FROM MOA_CDM_2109.dbo.observation_period
left join MOA_CDM_2109.dbo.death
on observation_period.person_id = death.person_id
where observation_period_end_date > death_date
