#!/bin/bash

# =======================================================================================
#  Download ELM singe-site driver files
#  Source: GitHub
#  Source URL: https://github.com/fmyuan/pt-e3sm-inputdata
#  Source Data URL: https://github.com/fmyuan/pt-e3sm-inputdata/archive/refs/heads/master.zip
# =======================================================================================

# =======================================================================================
# USER OPTIONS
# path to "single_site" directory within main CESM data directory located on the host
# machine
cesm_data_dir=~/Data/single_point_cesm_input_datasets
#mkdir -p ${cesm_data_dir}
# =======================================================================================

# =======================================================================================
echo "*** Downloading and extracting forcing data ***"

cd ${cesm_data_dir}
wget https://github.com/fmyuan/pt-e3sm-inputdata/archive/refs/heads/master.zip
unzip master.zip 
rm master.zip
mv pt-e3sm-inputdata-master ${cesm_data_dir}

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