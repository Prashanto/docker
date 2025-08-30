# Load the bash profile
source ~/.bash_profile

cd ./tmp/packages/fmw
CURRENT_PATH=`pwd`

#install fmw infrastructure
java -jar fmw_12.2.1.4.0_infrastructure.jar -silent -responseFile $CURRENT_PATH/wls12c-silentInstall.response -invPtrLoc $CURRENT_PATH/oraInst.loc

#install osb
java -jar fmw_12.2.1.4.0_osb.jar -silent -responseFile $CURRENT_PATH/osb.response -invPtrLoc $CURRENT_PATH/oraInst.loc
