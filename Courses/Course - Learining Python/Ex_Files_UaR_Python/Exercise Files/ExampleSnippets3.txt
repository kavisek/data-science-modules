# ExampleSnippets.txt
#
# Example code snippets for Up and Running with Python
# NOTE: THESE SNIPPETS ARE FOR PYTHON 3.X. IF YOU ARE USING PYTHON 2.7, USE THE ExampleSnippets.txt FILE
----------------------------------------------------------

*********************
CHAPTER 2:
*********************

--- HelloWorld ---

def main():
  print ("hello world!")
    
if __name__ == "__main__":
  main()


--- Variables ---

# Declare a variable and initialize it
f = 0;
print (f)

# re-declaring the variable works
f = "abc"
print (f)

# ERROR: variables of different types cannot be combined
#print "string type " + 123
print ("string type " + str(123))

# Global vs. local variables in functions
def someFunction():
  #global f
  f = "def"
  print (f)

someFunction()
print (f) 

del f
print (f)


--- Functions ---

# define a function
def func1():
  print ("I am a function")

# function that takes arguments
def func2(arg1, arg2):
  print (arg1, " ", arg2)

# function that returns a value
def cube(x):
  return x*x*x

# function with default value for an argument
def power(num, x=1):
  result = 1;
  for i in range(x):
    result = result * num  
  return result

#function with variable number of arguments
def multi_add(*args):
  result = 0;
  for x in args:
    result = result + x
  return result

func1()
print (func1())
print (func1)
func2(10,20)
print (func2(10,20))
print (cube(3))
print (power(2))
print (power(2,3))
print (power(x=3, num=2))
print (multi_add(4,5,10,4))


--- Conditionals ---

  # conditional flow uses if, elif, else  
  if(x < y):
    st= "x is less than y"
  elif (x == y):
    st= "x is same as y"
  else:
    st= "x is greater than y"
  print (st)
  
  # conditional statements let you use "a if C else b"
  st = "x is less than y" if (x < y) else "x is greater than or equal to y"
  print (st)
  

--- Loops ---

  # define a while loop
  while (x < 5):
     print (x)
     x = x + 1

  # define a for loop
  for x in range(5,10):
    print (x)
    
  # use a for loop over a collection
  days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
  for d in days:
    print (d)
  
  # use the break and continue statements
  for x in range(5,10):
    #if (x == 7): break
    #if (x % 2 == 0): continue
    print (x)
  
  #using the enumerate() function to get index 
  days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
  for i, d in enumerate(days):
    print (i, d)


--- Classes ---

class myClass():
  def method1(self):
    print ("myClass method1")
    
  def method2(self, someString):
    print ("myClass method2: " + someString)
    
class anotherClass(myClass):
  def method2(self):
    print ("anotherClass method2")
    
  def method1(self):
    myClass.method1(self);
    print ("anotherClass method1")
      
	# exercise the class methods
  c = myClass()
  c.method1()
  c.method2("This is a string")
  c2 = anotherClass()
  c2.method1()


*********************
Chapter 3:
*********************

--- Dates ---

from datetime import date
from datetime import time
from datetime import datetime

  ## DATE OBJECTS
  # Get today's date from the simple today() method from the date class
  today = date.today()
  print ("Today's date is ", today)
  
  # print out the date's individual components
  print ("Date Components: ", today.day, today.month, today.year)
  
  # retrieve today's weekday (0=Monday, 6=Sunday)
  print ("Today's Weekday #: ", today.weekday())
  
  ## DATETIME OBJECTS
  # Get today's date from the datetime class
  today = datetime.now()
  print  ("The current date and time is ", today)
  
  # Get the current time
  t = datetime.time(datetime.now())
  print ("The current time is ", t)
  
  # weekday returns 0 (monday) through 6 (sunday)
  wd = date.weekday(today)  
  # Days start at 0 for Monday 
  days = ["monday","tuesday","wednesday","thursday","friday","saturday","sunday"]
  print ("Today is day number %d" % wd)
  print ("Which is a " + days[wd])


--- Formatting ---

  # Times and dates can be formatted using a set of predefined string
  # control codes 
  now = datetime.now() # get the current date and time
  
  #### Date Formatting ####
  
  # %y/%Y - Year, %a/%A - weekday, %b/%B - month, %d - day of month
  print (now.strftime("%Y")) # full year with century
  print (now.strftime("%a, %d %B, %y")) # abbreviated day, num, full month, abbreviated year
  
  # %c - locale's date and time, %x - locale's date, %X - locale's time
  print (now.strftime("%c"))
  print (now.strftime("%x"))
  print (now.strftime("%X"))
  
  #### Time Formatting ####
  
  # %I/%H - 12/24 Hour, %M - minute, %S - second, %p - locale's AM/PM
  print (now.strftime("%I:%M:%S %p")) # 12-Hour:Minute:Second:AM
  print (now.strftime("%H:%M")) # 24-Hour:Minute


--- Timedeltas ---

from datetime import timedelta

# construct a basic timedelta and print it
print (timedelta(days=365, hours=5, minutes=1))

# print today's date
print ("today is: " + str(datetime.now()))

# print today's date one year from now
print ("one year from now it will be: " + str(datetime.now() + timedelta(days=365)))

# create a timedelta that uses more than one argument
print ("in two weeks and 3 days it will be: " + str(datetime.now() + timedelta(weeks=2, days=3)))

# calculate the date 1 week ago, formatted as a string
t = datetime.now() - timedelta(weeks=1)
s = t.strftime("%A %B %d, %Y")
print ("one week ago it was " + s)

### How many days until April Fools' Day?

today = date.today()  # get today's date
afd = date(today.year, 4, 1)  # get April Fool's for the same year
# use date comparison to see if April Fool's has already gone for this year
# if it has, use the replace() function to get the date for next year
if afd < today:
  print ("April Fool's day already went by %d days ago" % ((today-afd).days))
  afd = afd.replace(year=today.year + 1)  # if so, get the date for next year

# Now calculate the amount of time until April Fool's Day  
time_to_afd = abs(afd - today)
print (time_to_afd.days, "days until next April Fools' Day!")



--- Calendars ---

import calendar

# create a plain text calendar
c = calendar.TextCalendar(calendar.SUNDAY)
str = c.formatmonth(2013, 1, 0, 0)
print (str)

# create an HTML formatted calendar
hc = calendar.HTMLCalendar(calendar.SUNDAY)
str = hc.formatmonth(2013, 1)
print (str)

# loop over the days of a month
# zeroes mean that the day of the week is in an overlapping month
for i in c.itermonthdays(2013, 8):
  print (i)
  
# The Calendar module provides useful utilities for the given locale,
# such as the names of days and months in both full and abbreviated forms
for name in calendar.month_name:
  print (name)

for day in calendar.day_name:
  print (day)

# Calculate days based on a rule: For example, consider
# a team meeting on the first Friday of every month.
# To figure out what days that would be for each month,
# we can use this script:
for m in range(1,13):
  # returns an array of weeks that represent the month
  cal = calendar.monthcalendar(2013, m)
  # The first Friday has to be within the first two weeks
  weekone = cal[0]
  weektwo = cal[1]
   
  if weekone[calendar.FRIDAY] != 0:
    meetday = weekone[calendar.FRIDAY]
  else:
    # if the first friday isn't in the first week, it must be in the second
    meetday = weektwo[calendar.FRIDAY]
      
  print ("%10s %2d" % (calendar.month_name[m], meetday))


*********************
Chapter 4:
*********************

--- Files ---
  # Open a file for writing and create it if it doesn't exist
  f = open("textfile.txt","w+")
  
  # Open the file for appending text to the end
#  f = open("textfile.txt","a+")

  # write some lines of data to the file
  for i in range(10):
    f.write("This is line %d\r\n" % (i+1))
  
  # close the file when done
  f.close()
  
  # Open the file back up and read the contents
  f = open("textfile.txt","r")
  if f.mode == 'r': # check to make sure that the file was opened
    # use the read() function to read the entire file
    # contents = f.read()
    # print (contents)
    
    fl = f.readlines() # readlines reads the individual lines into a list
    for x in fl:
      print (x)


--- Path utilities ---
import os
from os import path
import datetime
from datetime import date, time, timedelta
import time


  # Print the name of the OS
  print (os.name)
  
  # Check for item existence and type
  print ("Item exists: " + str(path.exists("textfile.txt")))
  print ("Item is a file: " + str(path.isfile("textfile.txt")))
  print ("Item is a directory: " + str(path.isdir("textfile.txt")))
  
  # Work with file paths
  print ("Item's path: " + str(path.realpath("textfile.txt")))
  print ("Item's path and name: " + str(path.split(path.realpath("textfile.txt"))))
  
  # Get the modification time
  t = time.ctime(path.getmtime("textfile.txt"))
  print (t)
  print (datetime.datetime.fromtimestamp(path.getmtime("textfile.txt")))
  
  # Calculate how long ago the item was modified
  td= datetime.datetime.now() - datetime.datetime.fromtimestamp(path.getmtime("textfile.txt"))
  print ("It has been " + str(td) + "The file was modified")
  print ("Or, " + str(td.total_seconds()) + " seconds")


--- shell ---
import os
import shutil
from zipfile import ZipFile
from os import path
from shutil import make_archive


  # make a duplicate of an existing file
  if path.exists("textfile.txt"):
    # get the path to the file in the current directory
    src = path.realpath("textfile.txt");
    
    # separate the path part from the filename
    (head, tail) = path.split(src)
    print ("path: %s", str(head))
    print ("file: %s", str(tail))
    
    # let's make a backup copy by appending "bak" to the name
    dst = src + ".bak"
    # now use the shell to make a copy of the file
    shutil.copy(src,dst)
    
    # copy over the permissions, modification times, and other info
    shutil.copystat(src, dst)
    
    # rename the original file
    os.rename("textfile.txt", "newfile.txt")
    
    # now put things into a ZIP archive
    root_dir,tail = path.split(src)
    shutil.make_archive("archive", "zip", root_dir)

    # more fine-grained control over ZIP files
    with ZipFile("testzip.zip","w") as newzip:
      newzip.write("newfile.txt")
      newzip.write("textfile.txt.bak")



*********************
Chapter 5:
*********************

--- Internet Data ---
#in Python3.3, you need to import urllib.request
import urllib.request

def main():
  # open a connection to a URL using urllib2
  webUrl = urllib.request.urlopen("http://joemarini.com")
  
  # get the result code and print it
  print ("result code: " + str(webUrl.getcode()))
  
  # read the data from the URL and print it
  data = webUrl.read().decode("utf-8") # decode the data as UTF-8
  print (data)

--- JSON data ---

import urllib.request # instead of urllib2 like in Python 2.7
import json

def printResults(data):
  # Use the json module to load the string data into a dictionary
  theJSON = json.loads(data)
  
  # now we can access the contents of the JSON like any other Python object
  if "title" in theJSON["metadata"]:
    print (theJSON["metadata"]["title"])
  
  # output the number of events, plus the magnitude and each event name  
  count = theJSON["metadata"]["count"];
  print (str(count) + " events recorded")
  
  # for each event, print the place where it occurred
  for i in theJSON["features"]:
    print (i["properties"]["place"])

  # print the events that only have a magnitude greater than 4
  for i in theJSON["features"]:
    if i["properties"]["mag"] >= 4.0:
      print ("%2.1f" % i["properties"]["mag"], i["properties"]["place"])

  # print only the events where at least 1 person reported feeling something
  print ("Events that were felt:")
  for i in theJSON["features"]:
    feltReports = i["properties"]["felt"]
    if (feltReports != None):
      if (feltReports > 0):
        print ("%2.1f" % i["properties"]["mag"], i["properties"]["place"], " reported " + str(feltReports) + " times")


  # Open the URL and read the data
  webUrl = urllib.request.urlopen(urlData)
  print (webUrl.getcode())
  if (webUrl.getcode() == 200):
    data = webUrl.read()
    data = data.decode("utf-8") # in Python 3.x we need to explicitly decode the response to a string
    # print out our customized results
    printResults(data)
  else:
    print ("Received an error from server, cannot retrieve results " + str(webUrl.getcode()))


--- HTML ---

# in Python3.3 you need to import from html.parser
from html.parser import HTMLParser

metacount = 0;

# create a subclass and override the handler methods
class MyHTMLParser(HTMLParser):
  # function to handle an opening tag in the doc
  # this will be called when the closing ">" of the tag is reached
  def handle_starttag(self, tag, attrs):
    global metacount
    print ("Encountered a start tag:", tag)
    if tag == "meta":
      metacount += 1
      
    pos = self.getpos() # returns a tuple indication line and character
    print ("At line: ", pos[0], " position ", pos[1])
    if attrs.__len__() > 0:
      print ("\tAttributes:")
      for a in attrs:
        print ("\t", a[0],"=",a[1])
      
  # function to handle the ending tag
  def handle_endtag(self, tag):
    print ("Encountered an end tag:", tag)
    pos = self.getpos()
    print ("At line: ", pos[0], " position ", pos[1])
    
  # function to handle character and text data (tag contents)
  def handle_data(self, data):
    print ("Encountered some data:", data)
    pos = self.getpos()
    print ("At line: ", pos[0], " position ", pos[1])
  
  # function to handle the processing of HTML comments
  def handle_comment(self, data):
    print ("Encountered comment:", data)
    pos = self.getpos()
    print ("At line: ", pos[0], " position ", pos[1])



  # open the sample HTML file and read it
  f = open("samplehtml.html")
  if f.mode == "r":
    contents = f.read() # read the entire file
    parser.feed(contents)
  
  print ("%d meta tags encountered" % metacount)

--- XML ---

import xml.dom.minidom

def main():
  # use the parse() function to load and parse an XML file
  doc = xml.dom.minidom.parse("samplexml.xml");
  
  # print out the document node and the name of the first child tag
  print (doc.nodeName)
  print (doc.firstChild.tagName)
  
  # get a list of XML tags from the document and print each one
  skills = doc.getElementsByTagName("skill")
  print ("%d skills:" % skills.length)
  for skill in skills:
    print (skill.getAttribute("name"))
    
  # create a new XML tag and add it into the document
  newSkill = doc.createElement("skill")
  newSkill.setAttribute("name", "jQuery")
  doc.firstChild.appendChild(newSkill)

  skills = doc.getElementsByTagName("skill")
  print ("%d skills:" % skills.length)
  for skill in skills:
    print (skill.getAttribute("name"))

