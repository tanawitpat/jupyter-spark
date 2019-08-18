# Jupyter Spark

## Start Docker
1. Run ```make start```
2. Visit ```localhost:10000```
3. If the notebook request a token, do the following steps
    - Run ```make log```
    - Find a token in the log
    - Copy a token and paste it to the Jupyter Notebook

## Install Libraries
1. Add library names to pyspark-requirement.txt or sparkr-requirements.txt
2. Run ```make start```