# 
# Example file for retrieving data from the internet
# (For Python 3.x, be sure to use the ExampleSnippets3.txt file)

import urllib2

def main():
  # open a connection to a URL using urllib2
  webUrl = urllib2.urlopen("http://joemarini.com")
  
  # get the result code and print it
  print ("result code: " + str(webUrl.getcode()))
  
  # read the data from the URL and print it
  data = webUrl.read()
  print data

if __name__ == "__main__":
  main()
