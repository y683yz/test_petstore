import json
import time
import requests
from selenium import webdriver
from robot.api.deco import keyword
from selenium.webdriver.common.keys import Keys


class Common(object):
    """
    Test library
    """
    HEADERS = {'Content-Type':'application/json'}

    def __init__(self):
        self.name = "common actions"

    @keyword
    def open_default_chrome(self):
        """
        Define normal incognito Chrome browser with options
        :return: Chrome browser obj
        """
        chrome_options = webdriver.ChromeOptions()
        chrome_options.add_argument("--incognito")
        chrome_options.add_argument("--start-maximized")
        chrome_options.add_argument("--no-sandbox")
        chrome_options.add_argument("--disable-software-rasterizer")  # disable WebGL
        chrome_options.add_experimental_option('excludeSwitches', ['enable-logging'])   # stop USB errors
        chrome_options.add_argument("--lang=en-US")
        chrome_options.add_argument("--disable-gpu")
        driver = webdriver.Chrome(chrome_options=chrome_options)
        return driver

    @keyword
    def open_headless_chrome(self):
        """
        Define headless Chrome browser with options
        :return: Chrome browser obj
        """
        chrome_options = webdriver.ChromeOptions()
        chrome_options.add_argument("--headless")           # run headless chrome
        chrome_options.add_argument("--incognito")          # no cache
        chrome_options.add_argument("--start-maximized")
        chrome_options.add_argument("--no-sandbox")         # to avoid chrome cannot start in headless
        chrome_options.add_argument("--disable-gpu")        # disable Graphic HW acceleration
        chrome_options.add_argument("--disable-software-rasterizer")        #  disable WebGL
        chrome_options.add_experimental_option('excludeSwitches', ['enable-logging'])   # stop USB errors
        driver = webdriver.Chrome(chrome_options=chrome_options)
        driver.set_window_size(1920, 1080)
        return driver

    @keyword
    def close_driver(self, driver):
        """
            Closes all browser windows and ends the session safely: the default one in robot does not work in headless
        """
        driver.quit()

    @keyword
    def send_post_request(self, url, body):
        """
        send post request to the URL with the body data
        :param url: target url
        :param body: body data , a dict
        :return: response
        """
        return requests.post(url, data=json.dumps(body), headers=self.HEADERS)

    @keyword
    def send_get_request(self, url, body):
        """
        send get request to the URL with the body
        :param url: target url
        :param body: body data , a dict
        :param header: sent header , a dict
        :return: response
        """
        return requests.get(url, data=json.dumps(body), headers=self.HEADERS)

    @keyword
    def send_delete_request(self, url, body):
        """
        send get request to the URL with the body
        :param url: target url
        :param body: body data , a dict
        :param header: sent header , a dict
        :return: response
        """
        return requests.delete(url, data=json.dumps(body), headers=self.HEADERS)

    @keyword
    def to_this_page(self, driver, url):
        """
        Go to specific page
        :param driver: browser obj
        :param url: URL
        :return: browser obj
        """
        driver.get(url)
        time.sleep(1)
        return driver

    @keyword
    def click_this_button(self, driver, selector):
        """
         Click the btn: which is defined by a css_selector
        :param driver: broswer obj
        :param selector: css selector string
        :return: boolean
        """
        if selector.startswith('//'):
            ELEMENT = driver.find_element_by_xpath(selector)
        else:
            ELEMENT = driver.find_element_by_css_selector(selector)
        ELEMENT.click()
        return True

    @keyword
    def click_this_button_by_enter(self, driver, selector):
        """
         Click the btn: which is defined by a css_selector
         NOTE: this is special for an element which cannot be clicked efficiently.
        :param driver: broswer obj
        :param selector: css selector string
        :return: boolean
        """
        if selector.startswith('//'):
            ELEMENT = driver.find_element_by_xpath(selector)
        else:
            ELEMENT = driver.find_element_by_css_selector(selector)
        ELEMENT.send_keys(Keys.ENTER)
        return True

    @keyword
    def send_text_to_element(self, driver, selector, text):
        """
        input text to the element
        :param driver: browser obj
        :param selector: css selector
        :param text: input string
        :return: None
        """
        element = driver.find_element_by_css_selector(selector)
        element.clear()
        element.send_keys(text)
        time.sleep(1)

    @keyword
    def get_element_text(self, driver, selector):
        """
        Get the text selected by the CSS Selector
        :param driver: browser obj
        :param selector: css selector string
        :return: the string
        """
        if selector.startswith('//'):
            return driver.find_element_by_xpath(selector).text
        else:
            return driver.find_element_by_css_selector(selector).text
