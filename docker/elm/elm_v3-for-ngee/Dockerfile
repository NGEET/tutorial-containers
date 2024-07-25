# ----------------------------------------------------------------------
# Debian container - gcc8.5
# E3SM/ELM land model docker container
# AMD64 version
# ----------------------------------------------------------------------

#FROM ngeetropics/baseos:gcc850ompi316-latest
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
ENV MPP_HASH=c0c903e675e31e6b9ab447b0cc51ccd8a36fa7a7
ENV SBETR_HASH=66260f4991d61439d4cba92eb633590b09f97920
ENV HLM_REPOSITORY_URL=https://github.com/NGEET/E3SM/
ENV FATES_REPOSITORY_URL=https://github.com/NGEET/FATES/
ENV MPP_REPOSITORY_URL=https://github.com/MPP-LSM/MPP/
ENV SBETR_REPOSITORY_URL=https://github.com/BeTR-biogeochemistry-modeling/sbetr/
ENV EXTERNALS_LOCATION=/E3SM/components/elm/src/external_models/
ENV CIME_REPOSITORY_URL=https://github.com/ESMCI/cime/
ENV CIME_LOCATION=/E3SM/cime/
ENV REPO_BRANCH=ngeet-2024
ENV REPOSITORY_RAW_URL=https://raw.githubusercontent.com/NGEET/tutorial-containers
ENV TOOLS_REPOSITORY_RAW_URL=https://raw.githubusercontent.com/NGEET/tutorial-containers
ENV USER=modeluser

# Add new group, user, and user directory with user permissions
RUN groupadd -r dockerusers \
    && useradd -ms /bin/bash $USER -u 1001 -g dockerusers \
    && chown $USER:dockerusers /home/$USER

## create data mount point in container
## could change this to /mnt or something more generic in machines files
RUN cd / \
    && mkdir -p inputdata \
    && mkdir -p example_inputs \
    && mkdir -p output \
    && mkdir -p scripts \
    && mkdir -p tools \
    && mkdir -p tools/cprnc \
    && mkdir -p baselines \
    && mkdir -p .cime \
    && mkdir -p home/$USER/.cime \
    && chown $USER inputdata \
    && chown $USER example_inputs \
    && chown $USER output \
    && chown $USER scripts \
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
    && rm -rf $EXTERNALS_LOCATION/fates \
    && rm -rf $EXTERNALS_LOCATION/mpp \
    && rm -rf $EXTERNALS_LOCATION/sbetr \
    && cd / \
    && wget $FATES_REPOSITORY_URL/archive/refs/tags/$FATES_TAG.tar.gz \
    && tar -zxvf $FATES_TAG.tar.gz \
    && rm $FATES_TAG.tar.gz \
    && mv fates-$FATES_TAG $EXTERNALS_LOCATION/fates \
    && cd / \
    && wget $MPP_REPOSITORY_URL/archive/$MPP_HASH.tar.gz \
    && tar -zxvf $MPP_HASH.tar.gz \
    && rm $MPP_HASH.tar.gz \
    && mv MPP-$MPP_HASH $EXTERNALS_LOCATION/mpp \
    && cd / \
    && wget $SBETR_REPOSITORY_URL/archive/$SBETR_HASH.tar.gz \
    && tar -zxvf $SBETR_HASH.tar.gz \
    && rm $SBETR_HASH.tar.gz \
    && mv sbetr-$SBETR_HASH $EXTERNALS_LOCATION/sbetr \
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

# Set user
USER ${USER}
RUN export USER=${USER}
## END
