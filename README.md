# Spanish Electricity System Analysis
Spanish Electricity System data analytics project repository

### [Here you can interact with the dashboard](https://app.powerbi.com/view?r=eyJrIjoiMWYwOWRiMmItZTNhOS00ZTViLTkzYzEtYWExYTVjYmE0MWM2IiwidCI6Ijk5YTVhNjM1LTY1OGEtNGFhMS04MGIxLTdiM2IwNzcxZTkxYiIsImMiOjl9)

The goal of this project is to create an end-to-end data analytics platform for the Spanish Electricity System, encompassing everything from data collection at the source to the construction of a Data Warehouse (DW) and the development of dashboards for comprehensive analysis.
 
The development of this project has been based on the following premises: automatic data updating, employment of Microsoft Fabrics platform, creation of a Data Warehouse, extraction of data from API and development of a multilingual dashboard using PowerBI. 

The implementation of this project has involved the following steps:

## Collecting data from source:

The data source has been Red Eléctrica Española (REE), more precisely its information platform called [REData](https://www.ree.es/es/datos/generacion), which offers a [public API](https://www.ree.es/es/apidatos) for data consultation.

From the REE data catalog, the following series have been selected: 

  + **Balance:** Daily energy generation / consumption by source
  + **CCAA:** Energy generation / consumption by region
  + **Inter:** Daily international electricity exchange (import / export)
  + **Power:** Annual installed power by energy source


API request schema:
`GET /{lang}/datos/{category}/{widget}?[query]`

API request example:
`https://apidatos.ree.es/es/datos/balance/balance-electrico?time_trunc=day&end_date=2023-12-31T23:59&start_date=2022-01-01T00:00`

By developing the queries with Postman, it has been possible to define them prior to the extraction phase.

## Data Warehouse Building: 

This step has been developed on Microsoft Fabrics Platform, using Data Factory, Synapse data Engineering and Synapse data warehouse tools.

The **ETL** process:
    • **Extracting** data from API in *json* format and loading into a Data Lake for temporary storage
    • **Transforming** the *json* file into a data table with the desired structure using dataflow and loading it into an intermediate database (staging area)
    • **Loading** data in the final DW using an incremental SQL procedure

This process has been implemented in two stages; the first one involves loading the historical data (from 01/01/2018 until the implementation date), while the second stage schedules the incremental loading of monthly data.

Both stages have been orchestrated and automated in *data pipelines* for each data series: Balance, CCAA and Inter.



## Report development:

PowerBI has been used to develop the report, allowing to carry out the following tasks:

  + Connecting to the DW in Fabrics and data import
  + Building a complete Data Modeling
  + Developing the necessary measures in DAX
  + Implementing a _multilingual model_[^1] (English, Spanish and Portuguese)
  + Creating a visual template
  + Building the data visualizations
  + Developing the dashboard

_[^1]:  the multilingual model has been created following @TedPattison instructions and his [repository](https://github.com/PowerBiDevCamp/TranslationsBuilder/blob/main/Docs/Building%20Multi-language%20Reports%20in%20Power%20BI.md#extending-the-datasource-schema-to-support-data-translations)._

