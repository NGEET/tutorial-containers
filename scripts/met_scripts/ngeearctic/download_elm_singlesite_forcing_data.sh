#!/bin/bash

# =======================================================================================
#  Download ELM singe-site driver files
#  Source: GitHub
#  Source URL: https://github.com/fmyuan/pt-e3sm-inputdata
#  Source Data URL - Master: https://github.com/fmyuan/pt-e3sm-inputdata/archive/refs/heads/master.zip
#  Source Data URL - Workshop: https://github.com/fmyuan/pt-e3sm-inputdata/archive/83686519abb9a60eb48eaf12d97a0763957262ef.zip
# =======================================================================================

# =======================================================================================
# How to use this with the Docker container, run:
# docker run -t -i --hostname=docker --user $(id -u):$(id -g) -v /Users/sserbin/Data/testing:/inputdata \
# -v /Users/sserbin/Data/GitHub/ngeearctic_elm_containers/scripts/met_scripts/ngeearctic/scripts \
# test_ngee_elm /scripts/download_elm_singlesite_forcing_data.sh
#
# =======================================================================================

# =======================================================================================
# USER OPTIONS
# path to "single_site" directory within main CESM data directory located on the host
# machine
cesm_data_dir=/inputdata
mkdir -p ${cesm_data_dir}
# =======================================================================================

# =======================================================================================
echo "*** Downloading and extracting forcing data ***"

cd ${cesm_data_dir}
# remove any old files before downloading updated met data
rm -rf *
# download the met data - grab the version of the met data used in the October 2022 
# NGEE Arctic Modeling Workshop
#wget https://github.com/fmyuan/pt-e3sm-inputdata/archive/refs/heads/master.zip
wget https://github.com/fmyuan/pt-e3sm-inputdata/archive/83686519abb9a60eb48eaf12d97a0763957262ef.zip
mv 83686519abb9a60eb48eaf12d97a0763957262ef.zip master.zip 
unzip master.zip
mv pt-e3sm-inputdata-83686519abb9a60eb48eaf12d97a0763957262ef pt-e3sm-inputdata-master
cd pt-e3sm-inputdata-master
mv * ../
cd ..

echo "*** Removing zip file ***"
rm -rf pt-e3sm-inputdata-master
rm -f master.zip

# go in and extract remaining tar files
cd ${cesm_data_dir}/lnd/clm2/firedata
tar -zxvf clmforc.Li_2012_hdm_0.5x0.5_AVHRR_simyr1850-2010_c130401.nc.tar.gz
cd ${cesm_data_dir}/atm/datm7/NASA_LIS
tar -zxvf clmforc.Li_2012_climo1995-2011.T62.lnfm_c130327.nc.tar.gz
tar -zxvf clmforc.Li_2012_climo1995-2011.T62.lnfm_Total_c140423.nc.tar.gz
# =======================================================================================

# =======================================================================================
# done
echo "*** DONE ***"
# =======================================================================================