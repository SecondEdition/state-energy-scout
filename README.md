# state-energy-scout
Final Project Assignment for Design and Analysis of Data Systems class at CU

## Data Source
Data is sourced from the U.S. Energy Information Adminstration website:<br>
https://www.eia.gov/state/seds/seds-data-complete.php?sid=US

## Project Writeup
[Energy Scout Final Project Report](./Energy%20Scout%20Writeup.pdf)

## Project Video
[Youtube link](https://youtu.be/YZBkOcKBYEg)

## Metabase App Link
[Energy Scout App](https://energy-scout.herokuapp.com/)

## Info
The final E/R diagram is shown in the top level folder. <br>
<br>
Original data downloaded from EIA.gov site is in the '/data/sources' folder. There too are the reference tables created manually for filtering raw data with. Codes that will be retained were determined by EIA.gov reference documentation. The most relevant documents have copies in the reference folder.<br>
<br>
The python code used to convert the original data files into a format matching the relations and columns of the designed database is in the build_relations.pynb Jupyter notebook in the '/data' folder. This should be converted to a regular python file and a requirements.txt file created to better support future development. 
<br>
The final data after being converted into relation format is in the '/data/relations' folder.<br>
<br>
Some example queries that can be run in the Metabase app are included in the '/example_queries.sql' file.<br>
<br>
A preview of the Metabase app's main dashboard is provided in the '/preview.pdf' file. <br>
<br>
## Improvements that should be made
 - Convert Jupyter notebook into pure python with virtualenv defined in a requirements.txt file to ease future development. 
 - Integrate with eia.gov data source API to automate the data prep and update. 
 - Add primary indexes to Production and Consumption tables (largest and most queried, not updated very often) to improve query time.
 - Add additional constraints such as cascade deletion to the year table. 
 - Create inherited tables for production and consumption tables that are in commonly queried year blocks, such as per decade. 
