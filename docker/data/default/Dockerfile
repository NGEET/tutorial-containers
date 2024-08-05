# NGEE tutorial data-only image
#
# Default data
# E3SM tag: elm_v3.0.0-fates_sci.1.76.4_api.35.1.0

# Start multistage build from a minimal build with curl/wget available
FROM alpine AS wgetinput

# Set cesm input data address for convienence
ENV CESM_ADDRESS=ftp.cgd.ucar.edu/cesm/inputdata

# Create temporay directories for the data
RUN mkdir atmdata && \
    mkdir lnddata

COPY atm_list.txt atmdata/

# Download the data
RUN cd atmdata && \
    wget $CESM_ADDRESS/atm/datm7/NASA_LIS/clmforc.Li_2012_climo1995-2011.T62.lnfm_Total_c140423.nc

# Build next stage from scratch for data-only container
FROM scratch

COPY --from=wgetinput /atmdata/ /inputdata/atm/datm7/NASA_LIS/

LABEL maintainer.name="Gregory Lemieux" \
      maintainer.email="glemieux@lbl.gov" \
      author.name="Gregory Lemieux" \
      author.email="glemieux@lbl.gov" \
      description="E3SM tutorial base default data" \
      version.hlmimage="elm_v3.0.0-fates_sci.1.76.4_api.35.1.0"A
