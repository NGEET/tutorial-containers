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

# Build next stage from scratch for data-only container
FROM scratch

COPY --from=wgetinput atm/ /inputdata/

LABEL maintainer.name="Gregory Lemieux" \
      maintainer.email="glemieux@lbl.gov" \
      author.name="Gregory Lemieux" \
      author.email="glemieux@lbl.gov" \
      description="E3SM tutorial base default data" \
      version.hlmimage="elm_v3.0.0-fates_sci.1.76.4_api.35.1.0"
