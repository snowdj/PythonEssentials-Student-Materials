#!/bin/bash
# Download the data files for this repo and put them in the right folders.

GIT="https://git-scm.com"
GITLFS="https://git-lfs.github.com"
TEMPDIR="__TEMP_DATA_DOWNLOAD__"
PYTHONESSENTIALS="$TEMPDIR/PythonEssentials"

set +e

# Check that git and git-lfs are installed.
command -v git ||
{ echo -e "\nERROR: git is required. Download it at $GIT.\n"; exit 1; }
command -v git-lfs ||
{ echo -e "\nERROR: git-lfs is required. Download it at $GITLFS.\n"; exit 1; }

# Make a temporary repository for the data download.
mkdir $TEMPDIR
cd $TEMPDIR

# Download the data using git sparse checkout and git lfs.
git init
git-lfs install
git remote add -f origin https://github.com/Foundations-of-Applied-Mathematics/Data.git
git config core.sparseCheckout true
echo "PythonEssentials" >> .git/info/sparse-checkout
git pull origin master
cd ../

# Migrate the files from the temporary folder.
mv $PYTHONESSENTIALS/grid.npy NumpyIntro/
mv $PYTHONESSENTIALS/FARS.npy MatplotlibIntro/
mv $PYTHONESSENTIALS/MLB.npy DataVisualization/
mv $PYTHONESSENTIALS/anscombe.npy DataVisualization/
mv $PYTHONESSENTIALS/countries.npy DataVisualization/
mv $PYTHONESSENTIALS/earthquakes.npy DataVisualization/


# Delete the temporary folder.
rm -rf $TEMPDIR

