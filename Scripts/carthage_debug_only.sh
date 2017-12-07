# make copy-frameworks run only on debug to run tests
# when running on release won't have th '/Fremeworks' dir
if [ "${CONFIGURATION}" == "Debug" ]
then
/usr/local/bin/carthage copy-frameworks
fi
