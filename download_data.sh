#!/bin/bash
# Download the data files for this volume and put them in the right folders.

SOURCE="https://github.com/Foundations-of-Applied-Mathematics/Data.git"
GIT="https://git-scm.com"
TEMPDIR="_DATA_"`date +%s`"_"
PYTHONESSENTIALS="$TEMPDIR/PythonEssentials"


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
mv $PYTHONESSENTIALS/grid.npy NumpyIntro/
mv $PYTHONESSENTIALS/FARS.npy MatplotlibIntro/
mv $PYTHONESSENTIALS/hello_world.txt Exceptions_FileIO/
mv $PYTHONESSENTIALS/cf_example1.txt Exceptions_FileIO/
mv $PYTHONESSENTIALS/cf_example2.txt Exceptions_FileIO/
mv $PYTHONESSENTIALS/MLB.npy DataVisualization/
mv $PYTHONESSENTIALS/anscombe.npy DataVisualization/
mv $PYTHONESSENTIALS/countries.npy DataVisualization/
mv $PYTHONESSENTIALS/earthquakes.npy DataVisualization/

# Delete the temporary folder.
rm -rf $TEMPDIR
echo -e "\nDone.\n"
