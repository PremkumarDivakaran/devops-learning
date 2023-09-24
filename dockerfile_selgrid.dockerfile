# Maven and Java 11
FROM maven:3.8.1-jdk-11

# Set the working directory
WORKDIR /selenium

# Setup the git repo
RUN git clone https://github.com/PremkumarDivakaran/webdriver-docker-grid-tests.git /selenium

# Run the test
CMD mvn clean test -DsuiteXmlFile=${suite_xml} -Dserver.ip=${server_ip}