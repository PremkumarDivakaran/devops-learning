#!/bin/bash

# Function to check if given command exist !!
is_Command_Exist(){
    local arg="$1"
    type "$arg" &> /dev/null
    return $?
}

# Install Function
install_package(){
    local arg="$1"
    sudo apt install "$arg"
}

# Clone Git Repo
clone_git_repo(){
    local arg="$1"
    git clone "$arg"
}

# Run Tests in Repo
run_tests_in_repo(){
    local arg="$1"
    cd "$arg"
    mvn clean test
}

# Publish the test reports in S3
publish_report_s3(){
    local arg="$1"
    aws s3 sync reports/ s3://"$arg"
}

# Check Java exist or not?
if is_Command_Exist "java"; then
    echo "Java is installed in this ubuntu"
else
    echo "Java is not installed"
    echo "Java is installing..."
    install_package "openjdk-8-jdk";
fi

# Check Maven exist or not?
if is_Command_Exist "mvn"; then
    echo "Maven is installed in this ubuntu"
else
    echo "Maven is not installed"
    echo "Maven is installing..."
    install_package "maven";
fi

# Check Xvfb exist or not?
if is_Command_Exist "Xvfb"; then
    echo "Xfvb is installed in this ubuntu"
else
    echo "Xvfb is not installed"
    echo "Xvfb is installing..."
    install_package "xvfb";
    Xvfb :99 &
    export DISPLAY=:99
fi

# Check Chrome exist or not?
if is_Command_Exist "google-chrome-stable"; then
    echo "Chrome is installed in this ubuntu"
else
    echo "Chrome is not installed"
    echo "Chrome is installing..."
    wget http://mirror.cs.uchicago.edu/google-chrome/pool/main/g/google-chrome-stable/google-chrome-stable_114.0.5735.198-1_amd64.deb
    sudo dpkg -i google-chrome-stable_114.0.5735.198-1_amd64.deb
    sudo apt --fix-broken install
fi

# Clone Repo and Run Tests
clone_git_repo "https://github.com/TestLeafInc/webdriver-tests"
run_tests_in_repo "webdriver-tests"
publish_report_s3 "ubuntu-reports"
