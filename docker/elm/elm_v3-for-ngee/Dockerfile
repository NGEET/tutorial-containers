# ----------------------------------------------------------------------
# Debian container - gcc8.5
# E3SM/ELM land model docker container
# AMD64 version
# ----------------------------------------------------------------------

FROM ngeetropics/baseos:gcc1120ompi414-latest

LABEL maintainer.name="Gregory Lemieux" \
      maintainer.email="glemieux@lbl.gov" \
      author.name="Shawn P. Serbin" \
      author.email="sserbin@bnl.gov" \
      description="ELM host land model" \
      version.hlm="elm_v3-for-ngee" \
      version.baseos="gcc8.5"

# where to get the ELM source code
ENV FATES_TAG=sci.1.76.4_api.35.1.0
ENV HLM_TAG=elm_v3.0.0-fates_$FATES_TAG
ENV CIME_TAG=cime6.0.248
ENV MCT_TAG=MCT_2.11.0
ENV SCORPIO_TAG=scorpio-v1.6.4
ENV MPP_HASH=c0c903e675e31e6b9ab447b0cc51ccd8a36fa7a7
ENV SBETR_HASH=66260f4991d61439d4cba92eb633590b09f97920
ENV HLM_REPOSITORY_URL=https://github.com/NGEET/E3SM/
ENV FATES_REPOSITORY_URL=https://github.com/NGEET/FATES/
ENV MPP_REPOSITORY_URL=https://github.com/MPP-LSM/MPP/
ENV SBETR_REPOSITORY_URL=https://github.com/BeTR-biogeochemistry-modeling/sbetr/
ENV ELM_EXT_LOCATION=/E3SM/components/elm/src/external_models/
ENV EXT_LOCATION=/E3SM/externals/
ENV MCT_REPOSITORY_URL=https://github.com/MCSclimate/MCT/
ENV SCORPIO_REPOSITORY_URL=https://github.com/E3SM-Project/scorpio/
ENV CIME_REPOSITORY_URL=https://github.com/ESMCI/cime/
ENV CIME_LOCATION=/E3SM/cime/
ENV REPO_BRANCH=ngeet-2024
ENV REPOSITORY_RAW_URL=https://raw.githubusercontent.com/NGEET/tutorial-containers
ENV TOOLS_REPOSITORY_RAW_URL=https://raw.githubusercontent.com/NGEET/tutorial-containers
ENV USER=modeluser

# Add new group, user, and user directory with user permissions
RUN groupadd -r dockerusers \
    && useradd -ms /bin/bash $USER -u 1000 -g dockerusers \
    && chown $USER:dockerusers /home/$USER

## create data mount point in container
## could change this to /mnt or something more generic in machines files
RUN cd / \
    && mkdir -p inputdata \
    && mkdir -p inventorydata \
    && mkdir -p sitedata \
    && mkdir -p example_inputs \
    && mkdir -p output \
    && mkdir -p scripts \
    && mkdir -p paramfiles \
    && mkdir -p tools \
    && mkdir -p tools/cprnc \
    && mkdir -p baselines \
    && mkdir -p .cime \
    && mkdir -p home/$USER/.cime \
    && chown $USER inputdata \
    && chown $USER inventorydata \
    && chown $USER sitedata \
    && chown $USER example_inputs \
    && chown $USER output \
    && chown $USER scripts \
    && chown $USER paramfiles \
    && chown $USER tools \
    && chown $USER tools/cprnc \
    && chown $USER baselines \
    && chown $USER .cime \
    && chown $USER /home/$USER/.cime \
    && cd /

RUN wget $HLM_REPOSITORY_URL/archive/refs/tags/$HLM_TAG.tar.gz \
    && tar -zxvf $HLM_TAG.tar.gz \
    && rm $HLM_TAG.tar.gz \
    && mv E3SM-$HLM_TAG E3SM \
    && rm -rf $CIME_LOCATION \
    && rm -rf $EXT_LOCATION/mct \
    && rm -rf $EXT_LOCATION/scorpio \
    && rm -rf $ELM_EXT_LOCATION/fates \
    && rm -rf $ELM_EXT_LOCATION/mpp \
    && rm -rf $ELM_EXT_LOCATION/sbetr \
    && cd / \
    && wget $FATES_REPOSITORY_URL/archive/refs/tags/$FATES_TAG.tar.gz \
    && tar -zxvf $FATES_TAG.tar.gz \
    && rm $FATES_TAG.tar.gz \
    && mv fates-$FATES_TAG $ELM_EXT_LOCATION/fates \
    && cd / \
    && wget $MPP_REPOSITORY_URL/archive/$MPP_HASH.tar.gz \
    && tar -zxvf $MPP_HASH.tar.gz \
    && rm $MPP_HASH.tar.gz \
    && mv MPP-$MPP_HASH $ELM_EXT_LOCATION/mpp \
    && cd / \
    && wget $SBETR_REPOSITORY_URL/archive/$SBETR_HASH.tar.gz \
    && tar -zxvf $SBETR_HASH.tar.gz \
    && rm $SBETR_HASH.tar.gz \
    && mv sbetr-$SBETR_HASH $ELM_EXT_LOCATION/sbetr \
    && cd / \
    && wget $MCT_REPOSITORY_URL/archive/refs/tags/$MCT_TAG.tar.gz \
    && tar -zxvf $MCT_TAG.tar.gz \
    && rm $MCT_TAG.tar.gz \
    && mv MCT-$MCT_TAG $EXT_LOCATION/mct \
    && cd / \
    && wget $SCORPIO_REPOSITORY_URL/archive/refs/tags/$SCORPIO_TAG.tar.gz \
    && tar -zxvf $SCORPIO_TAG.tar.gz \
    && rm $SCORPIO_TAG.tar.gz \
    && mv scorpio-$SCORPIO_TAG $EXT_LOCATION/scorpio \
    && cd / \
    && wget $CIME_REPOSITORY_URL/archive/refs/tags/$CIME_TAG.tar.gz \
    && tar -zxvf $CIME_TAG.tar.gz \
    && rm $CIME_TAG.tar.gz \
    && mv cime-$CIME_TAG $CIME_LOCATION \
    && cd /.cime \
    && wget $REPOSITORY_RAW_URL/$REPO_BRANCH/docker/elm/cime_config/config \
    && wget $REPOSITORY_RAW_URL/$REPO_BRANCH/docker/elm/cime_config/config_compilers.xml \
    && wget $REPOSITORY_RAW_URL/$REPO_BRANCH/docker/elm/cime_config/config_machines.xml \
    && wget $REPOSITORY_RAW_URL/$REPO_BRANCH/docker/elm/cime_config/gnu_docker.cmake \
    && cd /home/$USER/.cime \
    && wget $REPOSITORY_RAW_URL/$REPO_BRANCH/docker/elm/cime_config/config \
    && wget $REPOSITORY_RAW_URL/$REPO_BRANCH/docker/elm/cime_config/config_compilers.xml \
    && wget $REPOSITORY_RAW_URL/$REPO_BRANCH/docker/elm/cime_config/config_machines.xml \
    && wget $REPOSITORY_RAW_URL/$REPO_BRANCH/docker/elm/cime_config/gnu_docker.cmake \
    && cd / \
    && ln -s /usr/bin/ncap2 /usr/bin/ncap \
    && chown $USER:dockerusers /E3SM \
    && chmod -R 777 /E3SM \
    && export USER=${USER}

# Modify the datm namelist definition for running GSWP3 datm with a single point
RUN cd /E3SM/components/data_comps/datm/cime_config/ && \
    sed -i '/strm_datvar/,/ELM_USRDAT/ s/\(ELM_USRDAT\).*/&\nQBOT shum/' namelist_definition_datm.xml && \
    sed -i '/strm_datvar/,$ {/ELM_USRDAT/,$ {/ZBOT/ {d; b;}; /RH/ {d; b;}; } }' namelist_definition_datm.xml

# Set user
USER ${USER}
RUN export USER=${USER}
## END
