

ALTER TABLE [MOA_CDM20].[dbo].concept ADD CONSTRAINT fpk_concept_domain FOREIGN KEY (DOMAIN_ID)  REFERENCES [MOA_CDM20].[dbo].domain (DOMAIN_ID);

--ALTER TABLE [MOA_CDM20].[dbo].concept ADD CONSTRAINT fpk_concept_class FOREIGN KEY (CONCEPT_CLASS_ID)  REFERENCES [MOA_CDM20].[dbo].concept_class (CONCEPT_CLASS_ID);

--ALTER TABLE [MOA_CDM20].[dbo].concept ADD CONSTRAINT fpk_concept_vocabulary FOREIGN KEY (VOCABULARY_ID)  REFERENCES [MOA_CDM20].[dbo].vocabulary (VOCABULARY_ID);

ALTER TABLE [MOA_CDM20].[dbo].vocabulary ADD CONSTRAINT fpk_vocabulary_concept FOREIGN KEY (VOCABULARY_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].domain ADD CONSTRAINT fpk_domain_concept FOREIGN KEY (DOMAIN_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].concept_class ADD CONSTRAINT fpk_concept_class_concept FOREIGN KEY (CONCEPT_CLASS_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].concept_relationship ADD CONSTRAINT fpk_concept_relationship_c_1 FOREIGN KEY (CONCEPT_ID_1)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].concept_relationship ADD CONSTRAINT fpk_concept_relationship_c_2 FOREIGN KEY (CONCEPT_ID_2)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].concept_relationship ADD CONSTRAINT fpk_concept_relationship_id FOREIGN KEY (RELATIONSHIP_ID)  REFERENCES [MOA_CDM20].[dbo].relationship (RELATIONSHIP_ID);

ALTER TABLE [MOA_CDM20].[dbo].relationship ADD CONSTRAINT fpk_relationship_concept FOREIGN KEY (RELATIONSHIP_CONCEPT_ID)  REFERENCES  [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].relationship ADD CONSTRAINT fpk_relationship_reverse FOREIGN KEY (REVERSE_RELATIONSHIP_ID)  REFERENCES [MOA_CDM20].[dbo].relationship (RELATIONSHIP_ID);

--ALTER TABLE [MOA_CDM20].[dbo].concept_synonym ADD CONSTRAINT fpk_concept_synonym_concept FOREIGN KEY (CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].concept_synonym ADD CONSTRAINT fpk_concept_synonym_language FOREIGN KEY (LANGUAGE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].concept_ancestor ADD CONSTRAINT fpk_concept_ancestor_concept_1 FOREIGN KEY (ANCESTOR_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].concept_ancestor ADD CONSTRAINT fpk_concept_ancestor_concept_2 FOREIGN KEY (DESCENDANT_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].source_to_concept_map ADD CONSTRAINT fpk_source_to_concept_map_v_1 FOREIGN KEY (source_vocabulary_id)  REFERENCES [MOA_CDM20].[dbo].vocabulary (VOCABULARY_ID);

ALTER TABLE [MOA_CDM20].[dbo].source_to_concept_map ADD CONSTRAINT fpk_source_concept_id FOREIGN KEY (source_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].source_to_concept_map ADD CONSTRAINT fpk_source_to_concept_map_v_2 FOREIGN KEY (target_vocabulary_id)  REFERENCES [MOA_CDM20].[dbo].vocabulary (VOCABULARY_ID);

ALTER TABLE [MOA_CDM20].[dbo].source_to_concept_map ADD CONSTRAINT fpk_source_to_concept_map_c_1 FOREIGN KEY (target_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_strength ADD CONSTRAINT fpk_drug_strength_concept_1 FOREIGN KEY (drug_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_strength ADD CONSTRAINT fpk_drug_strength_concept_2 FOREIGN KEY (ingredient_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_strength ADD CONSTRAINT fpk_drug_strength_unit_1 FOREIGN KEY (amount_unit_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_strength ADD CONSTRAINT fpk_drug_strength_unit_2 FOREIGN KEY (numerator_unit_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_strength ADD CONSTRAINT fpk_drug_strength_unit_3 FOREIGN KEY (denominator_unit_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].cohort_definition ADD CONSTRAINT fpk_cohort_definition_concept FOREIGN KEY (definition_type_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].cohort_definition ADD CONSTRAINT fpk_cohort_subject_concept FOREIGN KEY (subject_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].attribute_definition ADD CONSTRAINT fpk_attribute_type_concept FOREIGN KEY (ATTRIBUTE_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


/**************************

Standardized meta-data

***************************/





/************************

Standardized clinical data

************************/

ALTER TABLE [MOA_CDM20].[dbo].person ADD CONSTRAINT fpk_person_gender_concept FOREIGN KEY (GENDER_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].person ADD CONSTRAINT fpk_person_race_concept FOREIGN KEY (RACE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].person ADD CONSTRAINT fpk_person_ethnicity_concept FOREIGN KEY (ETHNICITY_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].person ADD CONSTRAINT fpk_person_gender_concept_s FOREIGN KEY (GENDER_SOURCE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].person ADD CONSTRAINT fpk_person_race_concept_s FOREIGN KEY (RACE_SOURCE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].person ADD CONSTRAINT fpk_person_ethnicity_concept_s FOREIGN KEY (ETHNICITY_SOURCE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].person ADD CONSTRAINT fpk_person_location FOREIGN KEY (LOCATION_ID)  REFERENCES [MOA_CDM20].[dbo].location (LOCATION_ID);

--ALTER TABLE [MOA_CDM20].[dbo].person ADD CONSTRAINT fpk_person_provider FOREIGN KEY (PROVIDER_ID)  REFERENCES [MOA_CDM20].[dbo].provider (PROVIDER_ID);

ALTER TABLE [MOA_CDM20].[dbo].person ADD CONSTRAINT fpk_person_care_site FOREIGN KEY (CARE_SITE_ID)  REFERENCES [MOA_CDM20].[dbo].care_site (CARE_SITE_ID);


--ALTER TABLE [MOA_CDM20].[dbo].observation_period ADD CONSTRAINT fpk_observation_period_person FOREIGN KEY (person_id)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].observation_period ADD CONSTRAINT fpk_observation_period_concept FOREIGN KEY (period_type_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


--ALTER TABLE [MOA_CDM20].[dbo].specimen ADD CONSTRAINT fpk_specimen_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

--ALTER TABLE [MOA_CDM20].[dbo].specimen ADD CONSTRAINT fpk_specimen_concept FOREIGN KEY (SPECIMEN_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].specimen ADD CONSTRAINT fpk_specimen_type_concept FOREIGN KEY (SPECIMEN_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].specimen ADD CONSTRAINT fpk_specimen_unit_concept FOREIGN KEY (UNIT_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].specimen ADD CONSTRAINT fpk_specimen_site_concept FOREIGN KEY (ANATOMIC_SITE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].specimen ADD CONSTRAINT fpk_specimen_status_concept FOREIGN KEY (DISEASE_STATUS_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE [MOA_CDM20].[dbo].death ADD CONSTRAINT fpk_death_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].death ADD CONSTRAINT fpk_death_type_concept FOREIGN KEY (DEATH_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].death ADD CONSTRAINT fpk_death_cause_concept FOREIGN KEY (CAUSE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].death ADD CONSTRAINT fpk_death_cause_concept_s FOREIGN KEY (CAUSE_SOURCE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE [MOA_CDM20].[dbo].visit_occurrence ADD CONSTRAINT fpk_visit_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].visit_occurrence ADD CONSTRAINT fpk_visit_type_concept FOREIGN KEY (VISIT_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].visit_occurrence ADD CONSTRAINT fpk_visit_provider FOREIGN KEY (PROVIDER_ID)  REFERENCES [MOA_CDM20].[dbo].provider (PROVIDER_ID);

--ALTER TABLE [MOA_CDM20].[dbo].visit_occurrence ADD CONSTRAINT fpk_visit_care_site FOREIGN KEY (CARE_SITE_ID)  REFERENCES [MOA_CDM20].[dbo].care_site (CARE_SITE_ID);

--ALTER TABLE [MOA_CDM20].[dbo].visit_occurrence ADD CONSTRAINT fpk_ visit_concept_s FOREIGN KEY (VISIT_SOURCE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].visit_occurrence ADD CONSTRAINT fpk_visit_admitting_s FOREIGN KEY (ADMITTING_SOURCE_CONCEPT_ID) REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].visit_occurrence ADD CONSTRAINT fpk_visit_discharge FOREIGN KEY (DISCHARGE_TO_CONCEPT_ID) REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].visit_occurrence ADD CONSTRAINT fpk_visit_preceding FOREIGN KEY (preceding_VISIT_OCCURRENCE_ID) REFERENCES [MOA_CDM20].[dbo].visit_occurrence (VISIT_OCCURRENCE_ID);


ALTER TABLE [MOA_CDM20].[dbo].visit_detail ADD CONSTRAINT fpk_v_detail_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].visit_detail ADD CONSTRAINT fpk_v_detail_type_concept FOREIGN KEY (VISIT_DETAIL_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].visit_detail ADD CONSTRAINT fpk_v_detail_provider FOREIGN KEY (PROVIDER_ID)  REFERENCES [MOA_CDM20].[dbo].provider (PROVIDER_ID);

ALTER TABLE [MOA_CDM20].[dbo].visit_detail ADD CONSTRAINT fpk_v_detail_care_site FOREIGN KEY (CARE_SITE_ID)  REFERENCES [MOA_CDM20].[dbo].care_site (CARE_SITE_ID);

ALTER TABLE [MOA_CDM20].[dbo].visit_detail ADD CONSTRAINT fpk_v_detail_concept_s FOREIGN KEY (VISIT_DETAIL_SOURCE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].visit_detail ADD CONSTRAINT fpk_v_detail_admitting_s FOREIGN KEY (ADMITTING_SOURCE_CONCEPT_ID) REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].visit_detail ADD CONSTRAINT fpk_v_detail_discharge FOREIGN KEY (DISCHARGE_TO_CONCEPT_ID) REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].visit_detail ADD CONSTRAINT fpk_v_detail_preceding FOREIGN KEY (PRECEDING_VISIT_DETAIL_ID) REFERENCES [MOA_CDM20].[dbo].visit_detail (VISIT_DETAIL_ID);

--ALTER TABLE [MOA_CDM20].[dbo].visit_detail ADD CONSTRAINT fpk_v_detail_parent FOREIGN KEY (VISIT_DETAIL_PARENT_ID) REFERENCES [MOA_CDM20].[dbo].visit_detail (VISIT_DETAIL_ID);

--ALTER TABLE visit_detail ADD CONSTRAINT fpd_v_detail_visit FOREIGN KEY (VISIT_OCCURRENCE_ID) REFERENCES visit_occurrence (VISIT_OCCURRENCE_ID);


ALTER TABLE [MOA_CDM20].[dbo].procedure_occurrence ADD CONSTRAINT fpk_procedure_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].procedure_occurrence ADD CONSTRAINT fpk_procedure_concept FOREIGN KEY (PROCEDURE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].procedure_occurrence ADD CONSTRAINT fpk_procedure_type_concept FOREIGN KEY (PROCEDURE_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].procedure_occurrence ADD CONSTRAINT fpk_procedure_modifier FOREIGN KEY (MODIFIER_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].procedure_occurrence ADD CONSTRAINT fpk_procedure_provider FOREIGN KEY (PROVIDER_ID)  REFERENCES [MOA_CDM20].[dbo].provider (PROVIDER_ID);

ALTER TABLE [MOA_CDM20].[dbo].procedure_occurrence ADD CONSTRAINT fpk_procedure_visit FOREIGN KEY (VISIT_OCCURRENCE_ID)  REFERENCES [MOA_CDM20].[dbo].visit_occurrence (VISIT_OCCURRENCE_ID);

--ALTER TABLE [MOA_CDM20].[dbo].procedure_occurrence ADD CONSTRAINT fpk_procedure_concept_s FOREIGN KEY (procedure_source_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE [MOA_CDM20].[dbo].drug_exposure ADD CONSTRAINT fpk_drug_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_exposure ADD CONSTRAINT fpk_drug_concept FOREIGN KEY (DRUG_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_exposure ADD CONSTRAINT fpk_drug_type_concept FOREIGN KEY (DRUG_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_exposure ADD CONSTRAINT fpk_drug_route_concept FOREIGN KEY (ROUTE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].drug_exposure ADD CONSTRAINT fpk_drug_provider FOREIGN KEY (PROVIDER_ID)  REFERENCES [MOA_CDM20].[dbo].provider (PROVIDER_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_exposure ADD CONSTRAINT fpk_drug_visit FOREIGN KEY (VISIT_OCCURRENCE_ID)  REFERENCES [MOA_CDM20].[dbo].visit_occurrence (VISIT_OCCURRENCE_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_exposure ADD CONSTRAINT fpk_drug_concept_s FOREIGN KEY (DRUG_SOURCE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE [MOA_CDM20].[dbo].device_exposure ADD CONSTRAINT fpk_device_person FOREIGN KEY (person_id)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].device_exposure ADD CONSTRAINT fpk_device_concept FOREIGN KEY (device_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].device_exposure ADD CONSTRAINT fpk_device_type_concept FOREIGN KEY (device_type_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].device_exposure ADD CONSTRAINT fpk_device_provider FOREIGN KEY (provider_id)  REFERENCES [MOA_CDM20].[dbo].provider (PROVIDER_ID);

ALTER TABLE [MOA_CDM20].[dbo].device_exposure ADD CONSTRAINT fpk_device_visit FOREIGN KEY (visit_occurrence_id)  REFERENCES [MOA_CDM20].[dbo].visit_occurrence (VISIT_OCCURRENCE_ID);

ALTER TABLE [MOA_CDM20].[dbo].device_exposure ADD CONSTRAINT fpk_device_concept_s FOREIGN KEY (device_source_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE [MOA_CDM20].[dbo].condition_occurrence ADD CONSTRAINT fpk_condition_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].condition_occurrence ADD CONSTRAINT fpk_condition_concept FOREIGN KEY (CONDITION_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].condition_occurrence ADD CONSTRAINT fpk_condition_type_concept FOREIGN KEY (CONDITION_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].condition_occurrence ADD CONSTRAINT fpk_condition_provider FOREIGN KEY (PROVIDER_ID)  REFERENCES [MOA_CDM20].[dbo].provider (PROVIDER_ID);

--ALTER TABLE [MOA_CDM20].[dbo].condition_occurrence ADD CONSTRAINT fpk_condition_visit FOREIGN KEY (VISIT_OCCURRENCE_ID)  REFERENCES [MOA_CDM20].[dbo].visit_occurrence (VISIT_OCCURRENCE_ID);

ALTER TABLE [MOA_CDM20].[dbo].condition_occurrence ADD CONSTRAINT fpk_condition_concept_s FOREIGN KEY (CONDITION_SOURCE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].condition_occurrence ADD CONSTRAINT fpk_condition_status_concept FOREIGN KEY (CONDITION_STATUS_SOURCE_CONCEPT_ID) REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE [MOA_CDM20].[dbo].measurement ADD CONSTRAINT fpk_measurement_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].measurement ADD CONSTRAINT fpk_measurement_concept FOREIGN KEY (MEASUREMENT_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].measurement ADD CONSTRAINT fpk_measurement_type_concept FOREIGN KEY (MEASUREMENT_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].measurement ADD CONSTRAINT fpk_measurement_operator FOREIGN KEY (OPERATOR_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].measurement ADD CONSTRAINT fpk_measurement_value FOREIGN KEY (VALUE_AS_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].measurement ADD CONSTRAINT fpk_measurement_unit FOREIGN KEY (UNIT_SOURCE_VALUE)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].measurement ADD CONSTRAINT fpk_measurement_provider FOREIGN KEY (PROVIDER_ID)  REFERENCES [MOA_CDM20].[dbo].provider (PROVIDER_ID);

ALTER TABLE [MOA_CDM20].[dbo].measurement ADD CONSTRAINT fpk_measurement_visit FOREIGN KEY (VISIT_OCCURRENCE_ID)  REFERENCES [MOA_CDM20].[dbo].visit_occurrence (VISIT_OCCURRENCE_ID);

ALTER TABLE [MOA_CDM20].[dbo].measurement ADD CONSTRAINT fpk_measurement_concept_s FOREIGN KEY (MEASUREMENT_SOURCE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE [MOA_CDM20].[dbo].note ADD CONSTRAINT fpk_note_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].note ADD CONSTRAINT fpk_note_type_concept FOREIGN KEY (NOTE_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].note ADD CONSTRAINT fpk_note_class_concept FOREIGN KEY (NOTE_CLASS_CONCEPT_ID) REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].note ADD CONSTRAINT fpk_note_encoding_concept FOREIGN KEY (ENCODING_CONCEPT_ID) REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].note ADD CONSTRAINT fpk_language_concept FOREIGN KEY (LANGUAGE_CONCEPT_ID) REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].note ADD CONSTRAINT fpk_note_provider FOREIGN KEY (PROVIDER_ID)  REFERENCES [MOA_CDM20].[dbo].provider (PROVIDER_ID);

ALTER TABLE [MOA_CDM20].[dbo].note ADD CONSTRAINT fpk_note_visit FOREIGN KEY (VISIT_OCCURRENCE_ID)  REFERENCES [MOA_CDM20].[dbo].visit_occurrence (VISIT_OCCURRENCE_ID);


ALTER TABLE note_nlp ADD CONSTRAINT fpk_note_nlp_note FOREIGN KEY (note_id) REFERENCES note (note_id);

ALTER TABLE note_nlp ADD CONSTRAINT fpk_note_nlp_section_concept FOREIGN KEY (section_concept_id) REFERENCES concept (CONCEPT_ID);

ALTER TABLE note_nlp ADD CONSTRAINT fpk_note_nlp_concept FOREIGN KEY (note_nlp_concept_id) REFERENCES concept (CONCEPT_ID);



ALTER TABLE [MOA_CDM20].[dbo].observation ADD CONSTRAINT fpk_observation_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].observation ADD CONSTRAINT fpk_observation_concept FOREIGN KEY (OBSERVATION_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].observation ADD CONSTRAINT fpk_observation_type_concept FOREIGN KEY (OBSERVATION_TYPE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].observation ADD CONSTRAINT fpk_observation_value FOREIGN KEY (VALUE_AS_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].observation ADD CONSTRAINT fpk_observation_qualifier FOREIGN KEY (QUALIFIER_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].observation ADD CONSTRAINT fpk_observation_unit FOREIGN KEY (UNIT_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

--ALTER TABLE [MOA_CDM20].[dbo].observation ADD CONSTRAINT fpk_observation_provider FOREIGN KEY (PROVIDER_ID)  REFERENCES [MOA_CDM20].[dbo].provider (PROVIDER_ID);

ALTER TABLE [MOA_CDM20].[dbo].observation ADD CONSTRAINT fpk_observation_visit FOREIGN KEY (VISIT_OCCURRENCE_ID)  REFERENCES [MOA_CDM20].[dbo].visit_occurrence (VISIT_OCCURRENCE_ID);

ALTER TABLE [MOA_CDM20].[dbo].observation ADD CONSTRAINT fpk_observation_concept_s FOREIGN KEY (OBSERVATION_SOURCE_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE  [MOA_CDM20].[dbo].fact_relationship ADD CONSTRAINT fpk_fact_domain_1 FOREIGN KEY (DOMAIN_CONCEPT_ID_1)  REFERENCES  [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE  [MOA_CDM20].[dbo].fact_relationship ADD CONSTRAINT fpk_fact_domain_2 FOREIGN KEY (DOMAIN_CONCEPT_ID_2)  REFERENCES  [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE  [MOA_CDM20].[dbo].fact_relationship ADD CONSTRAINT fpk_fact_relationship FOREIGN KEY (RELATIONSHIP_CONCEPT_ID)  REFERENCES  [MOA_CDM20].[dbo].concept (CONCEPT_ID);



/************************

Standardized health system data

************************/

ALTER TABLE care_site ADD CONSTRAINT fpk_care_site_location FOREIGN KEY (location_id)  REFERENCES location (location_id);

ALTER TABLE care_site ADD CONSTRAINT fpk_care_site_place FOREIGN KEY (place_of_service_concept_id)  REFERENCES concept (CONCEPT_ID);


ALTER TABLE provider ADD CONSTRAINT fpk_provider_specialty FOREIGN KEY (specialty_concept_id)  REFERENCES concept (CONCEPT_ID);

ALTER TABLE provider ADD CONSTRAINT fpk_provider_care_site FOREIGN KEY (CARE_SITE_ID)  REFERENCES care_site (CARE_SITE_ID);

ALTER TABLE provider ADD CONSTRAINT fpk_provider_gender FOREIGN KEY (gender_concept_id)  REFERENCES concept (CONCEPT_ID);

ALTER TABLE provider ADD CONSTRAINT fpk_provider_specialty_s FOREIGN KEY (specialty_source_concept_id)  REFERENCES concept (CONCEPT_ID);

ALTER TABLE provider ADD CONSTRAINT fpk_provider_gender_s FOREIGN KEY (gender_source_concept_id)  REFERENCES concept (CONCEPT_ID);




/************************

Standardized health economics

************************/

ALTER TABLE payer_plan_period ADD CONSTRAINT fpk_payer_plan_period FOREIGN KEY (PERSON_ID)  REFERENCES person (PERSON_ID);

ALTER TABLE cost ADD CONSTRAINT fpk_visit_cost_currency FOREIGN KEY (currency_concept_id)  REFERENCES concept (CONCEPT_ID);

ALTER TABLE cost ADD CONSTRAINT fpk_visit_cost_period FOREIGN KEY (payer_plan_period_id)  REFERENCES payer_plan_period (payer_plan_period_id);

ALTER TABLE cost ADD CONSTRAINT fpk_drg_concept FOREIGN KEY (drg_concept_id) REFERENCES concept (CONCEPT_ID);

/************************

Standardized derived elements

************************/


--ALTER TABLE cohort ADD CONSTRAINT fpk_cohort_definition FOREIGN KEY (cohort_definition_id)  REFERENCES cohort_definition (cohort_definition_id);


ALTER TABLE [MOA_CDM20].[dbo].cohort_attribute ADD CONSTRAINT fpk_ca_cohort_definition FOREIGN KEY (cohort_definition_id)  REFERENCES [MOA_CDM20].[dbo].cohort_definition (cohort_definition_id);

ALTER TABLE [MOA_CDM20].[dbo].cohort_attribute ADD CONSTRAINT fpk_ca_attribute_definition FOREIGN KEY (attribute_definition_id)  REFERENCES [MOA_CDM20].[dbo].attribute_definition (ATTRIBUTE_DEFINITION_ID);

ALTER TABLE [MOA_CDM20].[dbo].cohort_attribute ADD CONSTRAINT fpk_ca_value FOREIGN KEY (value_as_concept_id)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE [MOA_CDM20].[dbo].drug_era ADD CONSTRAINT fpk_drug_era_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].drug_era ADD CONSTRAINT fpk_drug_era_concept FOREIGN KEY (DRUG_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE [MOA_CDM20].[dbo].dose_era ADD CONSTRAINT fpk_dose_era_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].dose_era ADD CONSTRAINT fpk_dose_era_concept FOREIGN KEY (DRUG_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);

ALTER TABLE [MOA_CDM20].[dbo].dose_era ADD CONSTRAINT fpk_dose_era_unit_concept FOREIGN KEY (UNIT_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


ALTER TABLE [MOA_CDM20].[dbo].condition_era ADD CONSTRAINT fpk_condition_era_person FOREIGN KEY (PERSON_ID)  REFERENCES [MOA_CDM20].[dbo].person (PERSON_ID);

ALTER TABLE [MOA_CDM20].[dbo].condition_era ADD CONSTRAINT fpk_condition_era_concept FOREIGN KEY (CONDITION_CONCEPT_ID)  REFERENCES [MOA_CDM20].[dbo].concept (CONCEPT_ID);


/************************
*************************
*************************
*************************

Unique constraints

*************************
*************************
*************************
************************/

--ALTER TABLE [MOA_CDM20].[dbo].concept_synonym ADD CONSTRAINT uq_concept_synonym UNIQUE (CONCEPT_ID, CONCEPT_SYNONYM_NAME, LANGUAGE_CONCEPT_ID);
