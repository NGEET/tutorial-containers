# NGEE tutorial data-only image
#
# Default data
# E3SM tag: elm_v3.0.0-fates_sci.1.76.4_api.35.1.0

# Start multistage build from a minimal build with curl/wget available
FROM alpine AS wgetinput

# Set cesm input data address for convienence
ENV CESM_ADDRESS=ftp://ftp.cgd.ucar.edu/cesm/inputdata
ENV ATM_SUBDIR1=datm7/NASA_LIS
ENV ATM_SUBDIR2=datm7/topo_forcing
ENV ATM_SUBDIR3=cam/chem/trop_mozart_aero/aero

# Create temporay directories for the data and download
RUN mkdir atm && \
    mkdir lnd && \
    cd atm/ && \
    mkdir -p $ATM_SUBDIR1 && \
    mkdir -p $ATM_SUBDIR2 && \
    mkdir -p $ATM_SUBDIR3 && \
    cd $ATM_SUBDIR1 && \
    wget $CESM_ADDRESS/atm/$ATM_SUBDIR1/clmforc.Li_2012_climo1995-2011.T62.lnfm_Total_c140423.nc && \
    cd /atm/$ATM_SUBDIR2 && \
    wget $CESM_ADDRESS/atm/$ATM_SUBDIR2/topodata_0.9x1.25_USGS_070110_stream_c151201.nc && \
    cd /atm/$ATM_SUBDIR3 && \
    wget $CESM_ADDRESS/atm/$ATM_SUBDIR3/aerosoldep_monthly_2000_mean_1.9x2.5_c090421.nc

ENV URL_ADDRESS=https://web.lcrc.anl.gov/public/e3sm/inputdata/
ENV LND_SUBDIR_SNICAR=clm2/snicardata
ENV LND_SUBDIR_PARAM=clm2/paramdata
ENV LND_SUBDIR_FIRE=clm2/firedata
ENV LND_SUBDIR_PDEP=clm2/pdepdata
ENV LND_SUBDIR_NDEP=clm2/ndepdata

RUN cd /lnd/ && \
    mkdir -p $LND_SUBDIR_SNICAR && \
    mkdir -p $LND_SUBDIR_PARAM && \
    mkdir -p $LND_SUBDIR_FIRE && \
    mkdir -p $LND_SUBDIR_PDEP && \
    mkdir -p $LND_SUBDIR_NDEP && \
    cd $LND_SUBDIR_SNICAR && \
    wget $URL_ADDRESS/lnd/$LND_SUBDIR_SNICAR/snicar_optics_5bnd_mam_c160322.nc && \
    cd /lnd/$LND_SUBDIR_PARAM && \
    wget $URL_ADDRESS/lnd/$LND_SUBDIR_PARAM/CNP_parameters_c131108.nc && \
    wget $URL_ADDRESS/lnd/$LND_SUBDIR_PARAM/clm_params_c211124.nc && \
    cd /lnd/$LND_SUBDIR_PDEP && \
    wget $URL_ADDRESS/lnd/$LND_SUBDIR_PDEP/fpdep_clm_hist_simyr2000_1.9x2.5_c150929.nc && \
    cd /lnd/$LND_SUBDIR_NDEP && \
    wget $CESM_ADDRESS/lnd/$LND_SUBDIR_NDEP/fndep_clm_hist_simyr1849-2006_1.9x2.5_c100428.nc && \
    cd /lnd/$LND_SUBDIR_FIRE && \
    wget $URL_ADDRESS/lnd/$LND_SUBDIR_FIRE/elmforc.ssp5_hdm_0.5x0.5_simyr1850-2100_c190109.nc

# Build next stage from scratch for data-only container
FROM alpine

COPY --from=wgetinput atm/ /inputdata/
COPY --from=wgetinput lnd/ /inputdata/

LABEL maintainer.name="Gregory Lemieux" \
      maintainer.email="glemieux@lbl.gov" \
      author.name="Gregory Lemieux" \
      author.email="glemieux@lbl.gov" \
      description="E3SM tutorial base default data" \
      version.hlmimage="elm_v3.0.0-fates_sci.1.76.4_api.35.1.0"
