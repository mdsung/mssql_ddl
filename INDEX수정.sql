
ALTER TABLE [MOA_CDM20].[dbo].concept ADD CONSTRAINT xpk_concept PRIMARY KEY NONCLUSTERED (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].vocabulary ADD CONSTRAINT xpk_vocabulary PRIMARY KEY NONCLUSTERED (VOCABULARY_ID);

ALTER TABLE [MOA_CDM20].[dbo].domain ADD CONSTRAINT xpk_domain PRIMARY KEY NONCLUSTERED (DOMAIN_ID);

ALTER TABLE [MOA_CDM20].[dbo].concept_class ADD CONSTRAINT xpk_concept_class PRIMARY KEY NONCLUSTERED (CONCEPT_CLASS_ID);

ALTER TABLE [MOA_CDM20].[dbo].concept_relationship ADD CONSTRAINT xpk_concept_relationship PRIMARY KEY NONCLUSTERED (CONCEPT_ID_1,CONCEPT_ID_2,RELATIONSHIP_ID);

ALTER TABLE [MOA_CDM20].[dbo].relationship ADD CONSTRAINT xpk_relationship PRIMARY KEY NONCLUSTERED (RELATIONSHIP_ID);

ALTER TABLE [MOA_CDM20].[dbo].concept_ancestor ADD CONSTRAINT xpk_concept_ancestor PRIMARY KEY NONCLUSTERED (ANCESTOR_CONCEPT_ID,DESCENDANT_CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].source_to_concept_map ADD CONSTRAINT xpk_source_to_concept_map PRIMARY KEY NONCLUSTERED (source_vocabulary_id,target_concept_id,source_code,valid_end_date);

ALTER TABLE [MOA_CDM20].[dbo].drug_strength ADD CONSTRAINT xpk_drug_strength PRIMARY KEY NONCLUSTERED (drug_concept_id, ingredient_concept_id);

ALTER TABLE [MOA_CDM20].[dbo].cohort_definition ADD CONSTRAINT xpk_cohort_definition PRIMARY KEY NONCLUSTERED (cohort_definition_id);

ALTER TABLE [MOA_CDM20].[dbo].attribute_definition ADD CONSTRAINT xpk_attribute_definition PRIMARY KEY NONCLUSTERED (ATTRIBUTE_DEFINITION_ID);


/**************************

Standardized meta-data

***************************/



/************************

Standardized clinical data

************************/


/**PRIMARY KEY NONCLUSTERED constraints**/

ALTER TABLE [MOA_CDM20].[dbo].person ADD CONSTRAINT xpk_person PRIMARY KEY NONCLUSTERED ( PERSON_ID ) ;

ALTER TABLE [MOA_CDM20].[dbo].observation_period ADD CONSTRAINT xpk_observation_period PRIMARY KEY NONCLUSTERED ( observation_period_id ) ;

ALTER TABLE [MOA_CDM20].[dbo].specimen ADD CONSTRAINT xpk_specimen PRIMARY KEY NONCLUSTERED ( SPECIMEN_ID ) ;

ALTER TABLE [MOA_CDM20].[dbo].death ADD CONSTRAINT xpk_death PRIMARY KEY NONCLUSTERED ( PERSON_ID ) ;

ALTER TABLE [MOA_CDM20].[dbo].visit_occurrence ADD CONSTRAINT xpk_visit_occurrence PRIMARY KEY NONCLUSTERED ( VISIT_OCCURRENCE_ID ) ;

ALTER TABLE [MOA_CDM20].[dbo].visit_detail ADD CONSTRAINT xpk_visit_detail PRIMARY KEY NONCLUSTERED ( VISIT_DETAIL_ID ) ;

ALTER TABLE [MOA_CDM20].[dbo].procedure_occurrence ADD CONSTRAINT xpk_procedure_occurrence PRIMARY KEY NONCLUSTERED ( PROCEDURE_OCCURRENCE_ID ) ;

ALTER TABLE [MOA_CDM20].[dbo].drug_exposure ADD CONSTRAINT xpk_drug_exposure PRIMARY KEY NONCLUSTERED ( DRUG_EXPOSURE_ID ) ;

--ALTER TABLE [MOA_CDM20].[dbo].device_exposure ADD CONSTRAINT xpk_device_exposure PRIMARY KEY NONCLUSTERED ( device_exposure_id ) ;

ALTER TABLE [MOA_CDM20].[dbo].condition_occurrence ADD CONSTRAINT xpk_condition_occurrence PRIMARY KEY NONCLUSTERED ( CONDITION_OCCURRENCE_ID ) ;

ALTER TABLE [MOA_CDM20].[dbo].measurement ADD CONSTRAINT xpk_measurement PRIMARY KEY NONCLUSTERED ( MEASUREMENT_ID ) ;

ALTER TABLE [MOA_CDM20].[dbo].note ADD CONSTRAINT xpk_note PRIMARY KEY NONCLUSTERED ( NOTE_ID ) ;

--ALTER TABLE [MOA_CDM20].[dbo].note_nlp ADD CONSTRAINT xpk_note_nlp PRIMARY KEY NONCLUSTERED ( note_nlp_id ) ;

ALTER TABLE [MOA_CDM20].[dbo].observation  ADD CONSTRAINT xpk_observation PRIMARY KEY NONCLUSTERED ( OBSERVATION_ID ) ;




/************************

Standardized health system data

************************/


ALTER TABLE [MOA_CDM20].[dbo].location  ADD CONSTRAINT xpk_location PRIMARY KEY NONCLUSTERED ( LOCATION_ID ) ;

ALTER TABLE [MOA_CDM20].[dbo].care_site ADD CONSTRAINT xpk_care_site PRIMARY KEY NONCLUSTERED ( CARE_SITE_ID ) ;

ALTER TABLE [MOA_CDM20].[dbo].provider ADD CONSTRAINT xpk_provider PRIMARY KEY NONCLUSTERED ( PROVIDER_ID ) ;



/************************

Standardized health economics

************************/


ALTER TABLE [MOA_CDM20].[dbo].payer_plan_period ADD CONSTRAINT xpk_payer_plan_period PRIMARY KEY NONCLUSTERED ( payer_plan_period_id ) ;

ALTER TABLE [MOA_CDM20].[dbo].cost ADD CONSTRAINT xpk_visit_cost PRIMARY KEY NONCLUSTERED ( cost_id ) ;


/************************

Standardized derived elements

************************/

ALTER TABLE [MOA_CDM20].[dbo].cohort ADD CONSTRAINT xpk_cohort PRIMARY KEY NONCLUSTERED ( cohort_definition_id, subject_id, cohort_start_date, cohort_end_date  ) ;

ALTER TABLE [MOA_CDM20].[dbo].cohort_attribute ADD CONSTRAINT xpk_cohort_attribute PRIMARY KEY NONCLUSTERED ( cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id ) ;

ALTER TABLE [MOA_CDM20].[dbo].drug_era ADD CONSTRAINT xpk_drug_era PRIMARY KEY NONCLUSTERED (DRUG_ERA_ID) ;

ALTER TABLE [MOA_CDM20].[dbo].dose_era  ADD CONSTRAINT xpk_dose_era PRIMARY KEY NONCLUSTERED (DOSE_ERA_ID) ;

ALTER TABLE [MOA_CDM20].[dbo].condition_era ADD CONSTRAINT xpk_condition_era PRIMARY KEY NONCLUSTERED (CONDITION_ERA_ID) ;


/************************
*************************
*************************
*************************

Indices

*************************
*************************
*************************
************************/

/************************

Standardized vocabulary

************************/

CREATE UNIQUE CLUSTERED INDEX idx_concept_concept_id ON concept (CONCEPT_ID ASC);
CREATE INDEX idx_concept_code ON concept (CONCEPT_CODE ASC);
CREATE INDEX idx_concept_vocabluary_id ON concept (VOCABULARY_ID ASC);
CREATE INDEX idx_concept_domain_id ON concept (DOMAIN_ID ASC);
CREATE INDEX idx_concept_class_id ON concept (CONCEPT_CLASS_ID ASC);

CREATE UNIQUE CLUSTERED INDEX idx_vocabulary_vocabulary_id ON vocabulary (VOCABULARY_ID ASC);

CREATE UNIQUE CLUSTERED INDEX idx_domain_domain_id ON domain (DOMAIN_ID ASC);

CREATE UNIQUE CLUSTERED INDEX idx_concept_class_class_id ON concept_class (CONCEPT_CLASS_ID ASC);

CREATE INDEX idx_concept_relationship_id_1 ON concept_relationship (CONCEPT_ID_1 ASC);
CREATE INDEX idx_concept_relationship_id_2 ON concept_relationship (CONCEPT_ID_2 ASC);
CREATE INDEX idx_concept_relationship_id_3 ON concept_relationship (RELATIONSHIP_ID ASC);

CREATE UNIQUE CLUSTERED INDEX idx_relationship_rel_id ON relationship (RELATIONSHIP_ID ASC);

CREATE CLUSTERED INDEX idx_concept_synonym_id ON concept_synonym (CONCEPT_ID ASC);

CREATE CLUSTERED INDEX idx_concept_ancestor_id_1 ON concept_ancestor (ANCESTOR_CONCEPT_ID ASC);
CREATE INDEX idx_concept_ancestor_id_2 ON concept_ancestor (DESCENDANT_CONCEPT_ID ASC);

CREATE CLUSTERED INDEX idx_source_to_concept_map_id_3 ON source_to_concept_map (target_concept_id ASC);
CREATE INDEX idx_source_to_concept_map_id_1 ON source_to_concept_map (source_vocabulary_id ASC);
CREATE INDEX idx_source_to_concept_map_id_2 ON source_to_concept_map (target_vocabulary_id ASC);
CREATE INDEX idx_source_to_concept_map_code ON source_to_concept_map (source_code ASC);

CREATE CLUSTERED INDEX idx_drug_strength_id_1 ON drug_strength (drug_concept_id ASC);
CREATE INDEX idx_drug_strength_id_2 ON drug_strength (ingredient_concept_id ASC);

CREATE CLUSTERED INDEX idx_cohort_definition_id ON cohort_definition (cohort_definition_id ASC);

CREATE CLUSTERED INDEX idx_attribute_definition_id ON attribute_definition (ATTRIBUTE_DEFINITION_ID ASC);


/**************************

Standardized meta-data

***************************/





/************************

Standardized clinical data

************************/

CREATE UNIQUE CLUSTERED INDEX idx_person_id ON person (PERSON_ID ASC);

CREATE CLUSTERED INDEX idx_observation_period_id ON observation_period (person_id ASC);

CREATE CLUSTERED INDEX idx_specimen_person_id ON specimen (PERSON_ID ASC);
CREATE INDEX idx_specimen_concept_id ON specimen (SPECIMEN_CONCEPT_ID ASC);

CREATE CLUSTERED INDEX idx_death_person_id ON death (PERSON_ID ASC);

CREATE CLUSTERED INDEX idx_visit_person_id ON visit_occurrence (PERSON_ID ASC);
CREATE INDEX idx_visit_concept_id ON visit_occurrence (VISIT_CONCEPT_ID ASC);

CREATE CLUSTERED INDEX idx_visit_detail_person_id ON visit_detail (PERSON_ID ASC);
CREATE INDEX idx_visit_detail_concept_id ON visit_detail (VISIT_DETAIL_CONCEPT_ID ASC);

CREATE CLUSTERED INDEX idx_procedure_person_id ON procedure_occurrence (PERSON_ID ASC);
CREATE INDEX idx_procedure_concept_id ON procedure_occurrence (PROCEDURE_CONCEPT_ID ASC);
CREATE INDEX idx_procedure_visit_id ON procedure_occurrence (VISIT_OCCURRENCE_ID ASC);

CREATE CLUSTERED INDEX idx_drug_person_id ON drug_exposure (PERSON_ID ASC);
CREATE INDEX idx_drug_concept_id ON drug_exposure (DRUG_CONCEPT_ID ASC);
CREATE INDEX idx_drug_visit_id ON drug_exposure (VISIT_OCCURRENCE_ID ASC);

--CREATE CLUSTERED INDEX idx_device_person_id ON device_exposure (PERSON_ID ASC);
--CREATE INDEX idx_device_concept_id ON device_exposure (device_concept_id ASC);
--CREATE INDEX idx_device_visit_id ON device_exposure (VISIT_OCCURRENCE_ID ASC);

CREATE CLUSTERED INDEX idx_condition_person_id ON condition_occurrence (PERSON_ID ASC);
CREATE INDEX idx_condition_concept_id ON condition_occurrence (CONDITION_CONCEPT_ID ASC);
CREATE INDEX idx_condition_visit_id ON condition_occurrence (VISIT_OCCURRENCE_ID ASC);

CREATE CLUSTERED INDEX idx_measurement_person_id ON measurement (PERSON_ID ASC);
CREATE INDEX idx_measurement_concept_id ON measurement (MEASUREMENT_CONCEPT_ID ASC);
CREATE INDEX idx_measurement_visit_id ON measurement (VISIT_OCCURRENCE_ID ASC);

CREATE CLUSTERED INDEX idx_note_person_id ON note (PERSON_ID ASC);
CREATE INDEX idx_note_concept_id ON note (NOTE_TYPE_CONCEPT_ID ASC);
CREATE INDEX idx_note_visit_id ON note (VISIT_OCCURRENCE_ID ASC);

--CREATE CLUSTERED INDEX idx_note_nlp_note_id ON note_nlp (PERSON_ID ASC);
--CREATE INDEX idx_note_nlp_concept_id ON note_nlp (note_nlp_concept_id ASC);

CREATE CLUSTERED INDEX idx_observation_person_id ON observation (PERSON_ID ASC);
CREATE INDEX idx_observation_concept_id ON observation (OBSERVATION_CONCEPT_ID ASC);
CREATE INDEX idx_observation_visit_id ON observation (VISIT_OCCURRENCE_ID ASC);

CREATE INDEX idx_fact_relationship_id_1 ON fact_relationship (DOMAIN_CONCEPT_ID_1 ASC);
CREATE INDEX idx_fact_relationship_id_2 ON fact_relationship (DOMAIN_CONCEPT_ID_2 ASC);
CREATE INDEX idx_fact_relationship_id_3 ON fact_relationship (RELATIONSHIP_CONCEPT_ID ASC);




--CREATE CLUSTERED INDEX idx_period_person_id ON payer_plan_period (person_id ASC);




CREATE INDEX idx_cohort_subject_id ON cohort (subject_id ASC);
CREATE INDEX idx_cohort_c_definition_id ON cohort (cohort_definition_id ASC);

CREATE INDEX idx_ca_subject_id ON cohort_attribute (subject_id ASC);
CREATE INDEX idx_ca_definition_id ON cohort_attribute (cohort_definition_id ASC);

CREATE CLUSTERED INDEX idx_drug_era_person_id ON drug_era (PERSON_ID ASC);
CREATE INDEX idx_drug_era_concept_id ON drug_era (DRUG_CONCEPT_ID ASC);

CREATE CLUSTERED INDEX idx_dose_era_person_id ON dose_era (PERSON_ID ASC);
CREATE INDEX idx_dose_era_concept_id ON dose_era (DRUG_CONCEPT_ID ASC);

CREATE CLUSTERED INDEX idx_condition_era_person_id ON condition_era (PERSON_ID ASC);
CREATE INDEX idx_condition_era_concept_id ON condition_era (CONDITION_CONCEPT_ID ASC);

