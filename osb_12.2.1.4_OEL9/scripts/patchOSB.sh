# Load the new profile settings
source ~/.bash_profile

sudo dnf install unzip

cd ./tmp/patches

unzip '*.zip'

java -Djava.io.tmpdir=/tmp -jar 6880880/opatch_generic.jar -silent oracle_home=/apps/prashanto/osb/Oracle/Middleware