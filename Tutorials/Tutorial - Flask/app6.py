#!flask/bin/python
from flask import Flask, jsonify
from flask import abort
from flask import make_response
from flask import request
from flask import url_for
from flask_httpauth import HTTPBasicAuth

# Create the Flask App
app = Flask(__name__)

# Create Some Template Data
tasks= [
    {
        'id':1,
        'title':u'Buygroceries',
        'description':u'Milk, Cheese, Pizza, Fruit, Tylenol',
        'done': False
    },
    {
        'id':2,
        'title':u'Learn Python',
        'description':u'Need to find a good Python tutorial on the web',
        'done': False
    }
    ]



# Retrieve all Taks
#@app.route('/todo/api/v1.0/tasks', methods=['GET'])
#def get_tasks():
#    return jsonify( {'tasks':tasks})
    

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


# Post a task to API
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

# Update to a Task
@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods =['PUT'])
def update_task(task_id):
    task = list(filter(lambda t: t['id'] == task_id, tasks))
    if len(task) == 0:
        abort(404)
    if not request.json:
        abort(404)
    if 'title' in request.json and type(request.json['title']) != unicode:
        abort(404)
    if 'description' in request.json and type(request.json['description']) is not unicode:
        abort(404)
    if 'done' in request.json and type(request.json['done']) is not bool:
        abort(400)
    task[0]['title'] = request.json.get('title', task[0]['title'])
    task[0]['description'] = request.json.get('description',task[0]['description'])
    task[0]['done'] = request.json.get('done', tasks[0]['done'])
    return jsonify({'task':task[0]})

# Delete a task
@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods =['DELETE'])
def delete_task(task_id):
    task = list(filter(lambda t: t['id'] == task_id, tasks))
    if len(task) == 0:
        abort(404)
    tasks.remove(task[0])
    return jsonify({'result':True})


# Return URL that controls task 
def make_public_task(task):
    new_task = {}
    for field in task:
        if field in task:
            new_task['url'] = url_for('get_task', task_id = task['id'], _external=True)
        else:
            new_task['field'] = task[field]
    return new_task

#@app.route('/todo/api/v1.0/tasks', methods=['GET'])
#def get_task_links():
#    return jsonify({'tasks': list(map(make_public_task, tasks))}) # Bug: map / Python 2 vs 3

#Run Authentication on RESTFUL API
auth= HTTPBasicAuth()

@auth.get_password
def get_password(username):
    if username == 'miguel':
        return 'python'
    else:
        return None

@auth.error_handler
def unauthorized():
    return make_response(jsonify({'error':'Unauthorizedaccess'}),401)

# Run the Script
if __name__ == '__main__':
    app.run(debug= True)

# Lock Down certain functions, add decorator to function - Cannot get pass login yet
@app.route('/todo/api/v1.0/tasks', methods=['GET'])
@auth.login_required
def get_tasks():
    return jsonify( {'tasks':tasks})

# Replace Error Code - Unverified
@auth.error_handler
defunauthorized():
returnmake_response(jsonify({'error':'Unauthorizedaccess'}),403)

# Run Instructions
# cd Documents/DataScience/Tutorials/Tutorial\ -\ Flask/
# python app5b.py

# View All Tasks: curl -i http://localhost:5000/todo/api/v1.0/tasks

# View Task 2: curl -i http://localhost:5000/todo/api/v1.0/tasks/2
# View Task 3(Does not exist): curl -i http://localhost:5000/todo/api/v1.0/task/3
 
# Create Task 3: curl -i -H "Content-Type: application/json" -X POST -d '{"title":"Readabook"}' http://localhost:5000/todo/api/v1.0/tasks
# View All Tasks: curl -i http://localhost:5000/todo/api/v1.0/tasks

# Update a Task: curl -i -H "Content-Type: application/json" -X PUT -d '{"done":true}' http://localhost:5000/todo/api/v1.0/tasks/2


# Reture URL update: curl -i http://localhost:5000/todo/api/v1.0/tasks

# Locked Down Function Atempt (without username): curl -i http://localhost:5000/todo/api/v1.0/tasks

# Attempt with UserName: curl -u miguel:python -i http://localhost:5000/todo/api/v1.0/tasks

# Documenation: https://www.cs.utexas.edu/~cannata/networking/Class%20Notes/07%20Designing%20a%20RESTful%20API%20with%20Python%20and%20Flask%20-%20miguelgrinberg.pdf


