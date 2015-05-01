LSCSOFT_SRCDIR=${HOME}/tiger_new/src/
#mkdir -p ${LSCSOFT_SRCDIR}   # uncomment while installing for first time
#git config --global user.name "Muhammed Saleem" # uncomment while installing for first time
#git config --global user.email muhammed.saleem@ligo.org # uncomment while installing for first time
cd ${LSCSOFT_SRCDIR}
#git clone muhammed.saleem@ligo-vcs.phys.uwm.edu:/usr/local/git/lalsuite.git # uncomment while installing for first time
cd lalsuite
git checkout -b tiger_lalinference_tagged origin/tiger_lalinference_tagged
git checkout -b tiger_review origin/tiger_review
git pull       # uncomment while updation


#---------------------------------------------------
export LAL_PREFIX=${HOME}/tiger_new/opt/
cd ${LSCSOFT_SRCDIR}
cd lalsuite
./00boot && ./configure --prefix=${LAL_PREFIX} --enable-condor --enable-swig-python
make
make install
#----------------------------------------------------
LSCSOFT_ROOTDIR=${LSCSOFT_ROOTDIR:-"${HOME}/tiger_new"}
PYLAL_PREFIX=${LSCSOFT_ROOTDIR}/opt/pylal
cd ${LSCSOFT_SRCDIR}/lalsuite/pylal
python setup.py install --prefix=${PYLAL_PREFIX}
#-----------------------------------------------------
GLUE_PREFIX=${LSCSOFT_ROOTDIR}/opt/glue # change as appropriate
cd ${LSCSOFT_SRCDIR}/lalsuite/glue
python setup.py install --prefix=${GLUE_PREFIX}

