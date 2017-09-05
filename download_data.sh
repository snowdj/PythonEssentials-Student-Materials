#!/bin/bash
# Download the data files for this volume and put them in the right folders.

SOURCE="https://github.com/Foundations-of-Applied-Mathematics/Data.git"
GIT="https://git-scm.com"
TEMPDIR="_DATA_"`date +%s`"_"
PYTHONESSENTIALS="$TEMPDIR/PythonEssentials"
VOLUME1="$TEMPDIR/Volume1"
VOLUME2="$TEMPDIR/Volume2"
VOLUME3="$TEMPDIR/Volume3"
VOLUME4="$TEMPDIR/Volume4"

# Check that git is installed.
command -v git > /dev/null ||
{ echo -e "\nERROR: git is required. Download it at $GIT.\n"; exit 1; }

# Download the data using git sparse checkout and git lfs.
mkdir $TEMPDIR
cd $TEMPDIR
git init --quiet
echo -e "\nInitializing Download ...\n"
git remote add -f origin $SOURCE
git config core.sparseCheckout true
echo "PythonEssentials" >> .git/info/sparse-checkout
git pull origin master
cd ../

# Migrate the files from the temporary folder.
set +e
echo -e "\nMigrating files ..."

cp $PYTHONESSENTIALS/grid.npy NumpyIntro/
cp $PYTHONESSENTIALS/FARS.npy MatplotlibIntro/
cp $PYTHONESSENTIALS/hello_world.txt Exceptions_FileIO/
cp $PYTHONESSENTIALS/cf_example1.txt Exceptions_FileIO/
cp $PYTHONESSENTIALS/cf_example2.txt Exceptions_FileIO/
cp $PYTHONESSENTIALS/anscombe.npy DataVisualization/
cp $PYTHONESSENTIALS/MLB.npy DataVisualization/
cp $PYTHONESSENTIALS/earthquakes.npy DataVisualization/
cp $PYTHONESSENTIALS/countries.npy DataVisualization/

# Delete the temporary folder.
rm -rf $TEMPDIR
echo -e "\nDone.\n"
