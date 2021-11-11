insert into observation_period
select row_number() over (order by person_id) as observation_period_id, person_id, min(mndt) as observation_period_start_date, max(mndt) as observation_period_end_date, 44814724 as period_type_concept_id
  from (
  select person_id, min(condition_start_date) as mndt, max(condition_end_date) as mxdt from CDM_colon.dbo.condition_occurrence group by person_id
  union
   select person_id, min(death_date) as mndt, max(death_date) as mxdt from CDM_colon.dbo.death group by person_id
  union
   select person_id, min(drug_exposure_start_date) as mndt, max(drug_exposure_end_date) as mxdt from CDM_colon.dbo.drug_exposure group by person_id
  union
   select person_id, min(measurement_date) as mndt, max(measurement_date) as mxdt from CDM_colon.dbo.measurement group by person_id
  union
   select person_id, min(note_date) as mndt, max(note_date) as mxdt from CDM_colon.dbo.note_1 group by person_id
  union
   select person_id, min(observation_date) as mndt, max(observation_date) as mxdt from CDM_colon.dbo.observation group by person_id
  union
   select person_id, min(procedure_date) as mndt, max(procedure_date) as mxdt from CDM_colon.dbo.procedure_occurrence group by person_id
  union
   select person_id, min(specimen_date) as mndt, max(specimen_date) as mxdt from CDM_colon.dbo.specimen group by person_id
  union
   select person_id, min(visit_start_date) as mndt, max(visit_end_date) as mxdt from CDM_colon.dbo.visit_occurrence group by person_id
  ) a
  group by person_id
   