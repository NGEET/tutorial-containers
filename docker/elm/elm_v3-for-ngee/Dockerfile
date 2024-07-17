# ----------------------------------------------------------------------
# Debian container - gcc8.5
# E3SM/ELM land model docker container
# AMD64 version
# ----------------------------------------------------------------------

FROM fasstsimulation/baseos:gcc850ompi316-latest
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
ENV HLM_REPOSITORY_URL=https://github.com/NGEET/E3SM/
ENV FATES_REPOSITORY_URL=https://github.com/NGEET/fates/
ENV FATES_LOCATION=/E3SM/components/elm/src/external_models/fates/
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

## Checkout ELM model
RUN wget $HLM_REPOSITORY_URL/archive/refs/tags/$HLM_TAG.tar.gz \
    && tar -zxvf $HLM_TAG.tar.gz \
    && rm $HLM_TAG.tar.gz \
    && mv E3SM-$HLM_TAG E3SM \
    && rm -rf $FATES_LOCATION \
    && cd /E3SM \
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
    && wget $FATES_REPOSITORY_URL/archive/refs/tags/$FATES_TAG.tar.gz \
    && tar -zxvf $FATES_TAG.tar.gz \
    && rm $FATES_TAG.tar.gz \
    && mv fates-$FATES_TAG $FATES_LOCATION \
    && cd / \
    && ln -s /usr/bin/ncap2 /usr/bin/ncap \
    && chown $USER:dockerusers /E3SM \
    && chmod -R 777 /E3SM \
    && export USER=${USER}

# Set user
USER ${USER}
RUN export USER=${USER}
## END
