# Test_petstore
This project will setup a test framwork to test the petstore UI and APIs.
# Test framework
The test framework is based on python (requests), selenium, and robotframework.  
- Selenium: UI testing
- Python/requests: API calls
- Robotframework: assertion, test run and reporting

There are a lot options and high level libraries can be used. For this task these are enough.
# Data structure
## Project: test_petstore
- vars: define variables for POM selectores, URLs, user data and pets
- src: define API calls, UI nevigations
- settings: define included packages and libraries
- kws: define keywords for robotframework
- tests: define test suite

# Test run
- Setup environment: python + robotframework with newest versions. Refer to the python requirements.txt file in the root
- Run the tests from terminal:
- [Syntax], satrt from root, the argumemts are following robot cmd rules. e.g. you can replace new baseurl from cmd line, and chnage mode to [default] to launch the browser:
>- robot -L DEBUG -v baseurl:https://petstore.swagger.io -v mode:headless ./tests/tests.robot
# Test report
- Test report is a normal robot report, say report.html in the root, with DEBUG log level.
