# 
# Example file for parsing and processing HTML
# (For Python 3.x, be sure to use the ExampleSnippets3.txt file)

# import the HTMLParser module
from HTMLParser import HTMLParser

metacount = 0;

# create a subclass and override the handler methods
class MyHTMLParser(HTMLParser):
  # function to handle an opening tag in the doc
  # this will be called when the closing ">" of the tag is reached
  def handle_starttag(self, tag, attrs):
    global metacount
    print "Encountered a start tag:", tag
    if tag == "meta":
      metacount += 1
      
    pos = self.getpos() # returns a tuple indication line and character
    print "At line: ", pos[0], " position ", pos[1]
    if attrs.__len__ > 0:
      print "\tAttributes:"
      for a in attrs:
        print "\t", a[0],"=",a[1]
      
  # function to handle the ending tag
  def handle_endtag(self, tag):
    print "Encountered an end tag:", tag
    pos = self.getpos()
    print "At line: ", pos[0], " position ", pos[1]
    
  # function to handle character and text data (tag contents)
  def handle_data(self, data):
    print "Encountered some data:", data
    pos = self.getpos()
    print "At line: ", pos[0], " position ", pos[1]
  
  # function to handle the processing of HTML comments
  def handle_comment(self, data):
    print "Encountered comment:", data
    pos = self.getpos()
    print "At line: ", pos[0], " position ", pos[1]

def main():
  # instantiate the parser and feed it some HTML
  parser = MyHTMLParser()
    
  # open the sample HTML file and read it
  f = open("samplehtml.html")
  if f.mode == "r":
    contents = f.read() # read the entire file
    parser.feed(contents)
  
  print "%d meta tags encountered" % metacount

if __name__ == "__main__":
  main();
  