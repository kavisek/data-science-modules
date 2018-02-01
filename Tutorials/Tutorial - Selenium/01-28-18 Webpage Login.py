# Install geckodriver driver in the following folder:
# Macintosh HD/usr/bin/geckodriver

import webbrowser
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
 
driver = webdriver.Firefox()
driver.get('https://home.quickmobile.center/login')

username = driver.find_element_by_name('username')
password = driver.find_element_by_name('pwd')

import time
time.sleep(10)

username.send_keys("YourUsername")
password.send_keys("Pa55worD")

time.sleep(10)

driver.find_element_by_name("login-form-submit").click()