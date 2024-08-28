# NGEE tutorial data-only image
#
# Barro Colorao Island (BCI) data
# E3SM tag: elm_v3.0.0-fates_sci.1.76.4_api.35.1.0

# Start multistage build from a minimal build with curl/wget available
FROM alpine

LABEL maintainer.name="Gregory Lemieux" \
      maintainer.email="glemieux@lbl.gov" \
      author.name="Gregory Lemieux" \
      author.email="glemieux@lbl.gov" \
      description="E3SM tutorial inventory ctrl files and met forcing data" \
      version.hlmimage="elm_v3.0.0-fates_sci.1.76.4_api.35.1.0"

ADD bci_inventory_data/ /bci_inventory/
ADD inventory_ctrl/ /inventory_ctrl/
ADD met_data/ /site_data/
