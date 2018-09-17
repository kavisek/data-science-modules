#!flask/bin/python
from flask import Flask, jsonify
from flask import abort
from flask import make_response
from flask import request

# Create the Flask App
app= Flask(__name__)

# Create Some Template Data
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

#@app.route('/todo/api/v1.0/tasks', methods=['GET'])
def get_tasks():
    return jsonify( {'tasks':tasks})


# Retrieve all Taks
@app.route('/todo/api/v1.0/tasks', methods=['GET'])
def get_tasks():
    return jsonify( {'tasks':tasks})
    

# Get a Task
@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods =['GET'])
def get_task(task_id):
    task = list(filter (lambda t:t['id']==task_id,tasks))
    if len(task) == 0:
        abort(404)
    return jsonify ( {'task':task[0]})

 
# Error Message
@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error':'not_found'}), 404)


# Post to the API
@app.route('/todo/api/v1.0/tasks', methods = ['POST'])
def create_task():
    if not request.json or not 'title' in request.json:
        abort(404)
    task ={'id':tasks[-1]['id']+1,
          'title':request.json['title'],
          'description':request.json.get('description',""),
          'done':False
    }
    tasks.append(task)
    return jsonify({'task': task}, 201)

if __name__ == '__main__':
    app.run(debug= True)
    
    
# Run Instructions
# cd Documents/DataScience/Tutorials/Tutorial\ -\ Flask/
# python app5b.py

# curl -i http://localhost:5000/todo/api/v1.0/tasks/2
# curl -i http://localhost:5000/todo/api/v1.0/task/2
# curl -i http://localhost:5000/todo/api/v1.0/task/3
 
# curl -i -H "Content-Type: application/json" -X POST -d '{"title":"Readabook"}' http://localhost:5000/todo/api/v1.0/tasks

# curl -i http://localhost:5000/todo/api/v1.0/tasks



 