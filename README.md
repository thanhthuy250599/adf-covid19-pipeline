# COVID-19 Data Pipeline with Azure & Databricks

## 📌 Objective
Automate the ingestion, processing, and storage of COVID-19 data from a .csv file on Azure Blob Storage. The data is cleaned using Azure Databricks and saved into an Azure PostgreSQL database.

---

## 🏗️ System Architecture

- **Azure Blob Storage**: Stores the raw file `covid-data.csv`
- **Azure Data Factory (ADF)**: Orchestrates the pipeline (ingests data, triggers Databricks job)
- **Azure Databricks**: Cleans and processes the data
- **Azure PostgreSQL**: Stores the clean data
- **GitHub Actions**: CI/CD to sync and deploy pipelines and notebooks

---

## 🧪 Databricks Processing

Main script: `clean_simple_covid.py`

- Reads data from Azure Blob Storage
- Cleans and processes:
  - Filters rows with non-null `total_cases`, `total_deaths`, `population`
  - Selects the most recent record for each country
- Writes the result to the Azure PostgreSQL database table: `cleaned_covid_data`
- Final output table `cleaned_covid_data` includes:

| location     | total_cases | total_deaths | population   |
|--------------|-------------|--------------|--------------|
| China        | 99,373,219  | 122,304      | 1,425,887,360|
| United States| 103,436,829 | 1,193,165    | 338,289,856  |
| World        | 775,8667,836| 7,057,132    | 7,975,105,024|
...

---

## ⚙️ Project Structure

adf-covid19-pipeline/
│
├── databricks_notebooks/
│ └── clean_simple_covid # Data processing notebook/script
│
├── .github/
│ └── workflows/
│ └── ci-cd.yml # GitHub Actions CI/CD workflow
│
├── datasets/
│ └── [covid-data.csv](https://github.com/thanhthuy250599/demo_pipeline_covid19/blob/main/covid-data.csv) # Sample file for local testing (optional)
│
├── README.md # Project documentation

