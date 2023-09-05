if which java > /dev/null 2>&1; then
    java -version
else
    echo "Java not installed"
    sudo apt install openjdk-8-jdk
fi
if which mvn > /dev/null 2>&1; then
    mvn -v
else
    echo "mvn not installed"
    sudo apt install maven
fi
