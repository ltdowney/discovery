#!/bin/bash
#
# Basic packaging script that rolls the app and its deps
# into a standalone pex


# Clean any stale state
rm -rf build

# Create and push the build dir
mkdir build build/egg build/pex
pushd build

# Create and activate a virtualenv for chroot-ish packaging
virtualenv venv
source venv/bin/activate

# Install pex and its dependencies then package up the app
pip install pex
pex .. -v \
  --output-file=discovery.pex \
  --requirement=$(realpath ../requirements.txt) \
  --disable-cache \
  --pex-root=pex \
  -e app:app.run

# Deactivate the virtualenv
deactivate

# Pop back to the top-level dir
popd
