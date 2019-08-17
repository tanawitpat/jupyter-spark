ARG BASE_CONTAINER=jupyter/pyspark-notebook

FROM $BASE_CONTAINER

USER root

# PySpark
ADD pyspark-requirements.txt .

RUN conda install --quiet -y --file pyspark-requirements.txt && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# RSpark
ADD sparkr-requirements.txt .

ENV R_LIBS_USER $SPARK_HOME/R/lib
RUN fix-permissions $R_LIBS_USER

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    gfortran \
    gcc && \
    rm -rf /var/lib/apt/lists/*

RUN conda install --quiet --yes \
    'r-base=3.6.1' \
    'r-ggplot2=3.2*' \
    'r-irkernel=1.0*' \
    'r-rcurl=1.95*' \
    'r-sparklyr=1.0*' \
    && \
    conda install --quiet --yes --file sparkr-requirements.txt && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER