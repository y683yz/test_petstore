# Test_petstore
This project will set up a test framework to test the pet store UI and APIs.
# Test framework
For the simplicity, the test framework is just based on python/requests, selenium, and robot-framework.  
- Selenium: UI testing
- Python/requests: API calls
- Robot-framework: assertion, test run, trace/debug and reporting

There are many options and high level libraries can be used definitely. For this task, this setup is enough.

# Data structure
## Project: test_petstore
- vars: define variables for POM selectors, URLs, user data and pets
- src: define API calls, UI navigation
- settings: define included packages and libraries
- kws: define keywords for robot-framework
- tests: define test suite

# Test run
- Setup environment: python, selenium, robot-framework with the newest versions. Refer to the python requirements.txt file in the root, also chrome and chromedriver should be installed.
- Run the tests from terminal:
## Syntax 
Start from the root, the arguments are following robot cmd rules. e.g. you can replace new baseurl from cmd line, and change mode from [headless] to [default] to launch the browser:
>- robot -L TRACE -v baseurl:https://petstore.swagger.io -v mode:headless ./tests/tests.robot

# Test report
- Test report is a normal robot report, say report.html in the root, with TRACE/DEBUG/INFO log level.
