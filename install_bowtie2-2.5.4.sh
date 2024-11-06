#!/bin/bash
#SBATCH -N 1
#SBATCH -n 32
#SBATCH -p rc
#SBATCH -w d0038

# Setting up the environment
source env_bowtie2-2.5.4.sh

# Creating the src directory for the installed application
mkdir -p $SOFTWARE_DIRECTORY/src

# Installing $SOFTWARE_NAME/$SOFTWARE_VERSION

# Installing software
cd $SOFTWARE_DIRECTORY/src
wget https://github.com/BenLangmead/bowtie2/releases/download/v2.5.4/bowtie2-2.5.4-linux-x86_64.zip
unzip bowtie2-2.5.4-linux-x86_64.zip
cd bowtie2-2.5.4-linux-x86_64
#./configure --prefix=$SOFTWARE_DIRECTORY
#make
#make install

# Creating modulefile
touch $SOFTWARE_VERSION
echo "#%Module" >> $SOFTWARE_VERSION
echo "module-whatis	 \"Loads $SOFTWARE_NAME/$SOFTWARE_VERSION module." >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "This module was built on $(date)" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "bowtie2" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "The script used to build this module can be found here: $GITHUB_URL" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "To load the module, type:" >> $SOFTWARE_VERSION
echo "module load $SOFTWARE_NAME/$SOFTWARE_VERSION" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "\"" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "conflict	 $SOFTWARE_NAME" >> $SOFTWARE_VERSION
echo "prepend-path	 PATH $SOFTWARE_DIRECTORY/" >> $SOFTWARE_VERSION
echo "prepend-path	 PATH $SOFTWARE_DIRECTORY/scripts" >> $SOFTWARE_VERSION

# Moving modulefile
mkdir -p $CLUSTER_DIRECTORY/modulefiles/$SOFTWARE_NAME
cp $SOFTWARE_VERSION $CLUSTER_DIRECTORY/modulefiles/$SOFTWARE_NAME/$SOFTWARE_VERSION
