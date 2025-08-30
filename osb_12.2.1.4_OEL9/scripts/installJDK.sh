working_dir="/apps/prashanto/osb"

JAVA_HOME="$working_dir/java"

TAR_FILE="$working_dir/tmp/packages/jdk-8u451-linux-x64.tar.gz"

mkdir -p $JAVA_HOME

# Create the 'java' directory if it doesn't exist
if [ ! -d "$JAVA_HOME" ]; then
    echo "Creating directory $JAVA_HOME..."
    mkdir -p "$JAVA_HOME"
else
    echo "Directory $JAVA_HOME already exists."
fi

echo "Unzipping $TAR_FILE into $JAVA_HOME..."
tar -xzvf "$TAR_FILE" -C "$JAVA_HOME"

jdk_home="$JAVA_HOME/jdk1.8.0_451"

export JAVA_HOME="$jdk_home"
export PATH="$JAVA_HOME/bin:$PATH" 

# Append to ~/.bash_profile or ~/.bashrc for persistence (optional)
echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bash_profile
echo "export PATH=$PATH" >> ~/.bash_profile
echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bashrc
echo "export PATH=$PATH" >> ~/.bashrc

#Copy JCE files
cp -f $working_dir/tmp/packages/local_policy.jar $working_dir/tmp/packages/US_export_policy.jar $jdk_home/jre/lib/security/

# Load the new profile settings
source ~/.bash_profile

java -version
