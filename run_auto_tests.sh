cd webdriver-tests
mvn clean test
aws s3 sync reports/ s3://ubuntu-reports
