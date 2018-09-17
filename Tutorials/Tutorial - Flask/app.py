#!flask/bin/python

from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return "Helllo World!"

if __name__ == '__main__':
    app.run(debug=True)
    
    
# Run Instructions
# cd Documents/DataScience/Tutorials/Tutorial\ -\ Flask/ && python app.py