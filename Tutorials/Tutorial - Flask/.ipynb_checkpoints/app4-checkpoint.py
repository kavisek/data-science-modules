#!flask/bin/python
from flask import Flask, jsonify
from flask import abort
from flask import make_response

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
#@app.route('/todo/api/v1.0/tasks', methods=['GET'])
def get_tasks():
    return jsonify( {'tasks':tasks})

@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods =['GET'])
def get_task(task_id):
    task = list(filter(lambda t:t['id'] == task_id, tasks))
    if len(task) == 0:
        abort(404)
    return jsonify({'task',task[0]})

    
@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error':'not_found'}), 404)
    

if __name__ == '__main__':
    app.run(debug= True)
    
    
# Run Instructions
# cd Documents/DataScience/Tutorials/Tutorial\ -\ Flask/
# python app4.py

# curl -i http://localhost:5000/todo/api/v1.0/tasks/2
# curl -i http://localhost:5000/todo/api/v1.0/task/2
# curl -i http://localhost:5000/todo/api/v1.0/task/3












 