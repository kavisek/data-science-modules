#!flask/bin/python
from flask import Flask, jsonify
app= Flask(__name__)
tasks= [
    {
        'id':1,
        'title':u'Buygroceries',
        'description':u'Milk,Cheese,Pizza,Fruit,Tylenol',
        'done': False
    },
    {
        'id':2,
        'title':u'LearnPython',
        'description':u'Needto findagoodPythontutorial ontheweb',
        'done': False
    }
    ]
@app.route('/todo/api/v1.0/tasks', methods=['GET'])
def get_tasks():
    return jsonify( {'tasks':tasks})
    
if __name__ == '__main__':
    app.run(debug= True)
    
    
# Run Instructions
# cd Documents/DataScience/Tutorials/Tutorial\ -\ Flask/ && python app.py


# curl -i http://localhost:5000/todo/api/v1.0/tasks
