# Predicting Atrial Fibrillation Ablation Outcomes: A Machine Learning Approach Leveraging a Large Administrative Claims Database

## Dataset
The research leveraged de-identified claims data sourced from the IBM® MarketScan® Research Database (MarketScan) to investigate AFA (CPT code '93656') in the Merative MarketScan Medicare Database (Medicare) claims spanning January 1, 2013, to December 31, 2020. This database comprises claims made for individuals with Medicare Supplemental and Medicare Advantage plans.

Inclusion criteria comprised patients across inpatient admission (I), inpatient services (S), and outpatient services (O) tables in the database. Medical history and postoperative outcomes were scrutinized using claims data from January 1, 2011, to December 31, 2021, with a focus on patients possessing valid patient IDs for traceability. The final cohort involved 14,611 patients after excluding those without valid patient IDs.

While the dataset cannot be disclosed, the I, S, O tables are consititued by the following columns:

### I Table (Inpatient)

| Column Name | Description | Type |
|-------------|-------------|------|
| SEQNUM (PK) | Sequence Number, Primary Key | Integer |
| EFAMID | Family ID | Integer |
| ENROLID (FK) | Patient ID, Foreign Key | Integer |
| DOBYR | Date of Birth Year | Integer |
| YEAR | Year of Admission | Integer |
| ADMDATE | Admission Date | Date |
| AGE | Age | Integer |
| DISDATE | Discharge Date | Date |
| PDX | Primary Diagnosis | String |
| REGION | Region | String |
| DX1 - DX15 | Diagnosis Codes | String |
| PROC1 - PROC15 | Procedure Codes | String |
| SEX | Sex | String |
| INDSTRY | Industry | String |

### O Table (Outpatient)

| Column Name | Description | Type |
|-------------|-------------|------|
| SEQNUM (PK) | Sequence Number, Primary Key | Integer |
| EFAMID | Family ID | Integer |
| ENROLID (FK) | Patient ID, Foreign Key | Integer |
| SVCDATE | Service Date | Date |
| YEAR | Year of Service | Integer |
| AGE | Age | Integer |
| REGION | Region | String |
| SEX | Sex | String |
| INDSTRY | Industry | String |
| DX1 - DX4 | Diagnosis Codes | String |
| PROC1 | Procedure Code | String |

### S Table (Special or Supplementary)

| Column Name | Description | Type |
|-------------|-------------|------|
| SEQNUM (PK) | Sequence Number, Primary Key | Integer |
| EFAMID | Family ID | Integer |
| ENROLID (FK) | Patient ID, Foreign Key | Integer |
| YEAR | Year | Integer |
| ADMDATE | Admission Date | Date |
| AGE | Age | Integer |
| DISDATE | Discharge Date | Date |
| SVCDATE | Service Date | Date |
| REGION | Region | String |
| SEX | Sex | String |
| INDSTRY | Industry | String |
| DX1 - DX4 | Diagnosis Codes | String |
| PROC1 | Procedure Code | String |
| PROCTYP | Procedure Type | String |
| PDX | Primary Diagnosis | String |
| PPROC | Primary Procedure | String |

## Data Preprocessing

The [covert-to-long.ipynb](./preprocessing/convert-to-long.ipynb) notebook converts the wide format of the I, S, O tables to a long format as well as convert any ICD-10 codes to ICD-9 codes. The conversion tables can be found at [conversion_tables](./utils/conversion_tables/).

The risk scores were calculated in [chads.ipynb] (./preprocessing/chads.ipynb), and the comorbidities were calculated in [CCI_ECI.r](./utils/CCI_ECI.r).

The [find-success-failure.ipynb](./preprocessing/find-success-failure.ipynb) notebook was used to find the success and failure groups of AF ablation as defined in the paper.

## Modeling and Analysis

The [modeling.ipynb](./modeling/modeling.ipynb) notebook contains the code for the machine learning models and codes used in the paper.

The [stats-analysis.ipynb](./modeling/stats-analysis.ipynb) notebook contains the code for the statistical analysis used in the paper.


