#!flask/bin/python

"""Alternative version of the ToDo RESTful server implemented using the
Flask-RESTful extension."""
import numpy as np
from flask import Flask, jsonify, abort, make_response
from flask_restful import Api, Resource, reqparse, fields, marshal
from flask_httpauth import HTTPBasicAuth
from sklearn.datasets import load_iris
from sklearn.externals import joblib

app = Flask(__name__, static_url_path="")
api = Api(app)
auth = HTTPBasicAuth()

# Adding Username and Password Authentication


@auth.get_password
def get_password(username):
    if username == 'miguel':
        return 'python'
    return None

# 403 to 401 Error Handling


@auth.error_handler
def unauthorized():
    # return 403 instead of 401 to prevent browsers from displaying the default
    # auth dialog
    return make_response(jsonify({'message': 'Unauthorized access'}), 403)


# Models Import
loaded_model = joblib.load('Models/lr_model.sav')

# Select Random Training Point
iris = load_iris()
X, y = iris.data, iris.target

# Select a real datapoint
random_datapoint = [X[np.random.randint(X.shape[0])]]
print(random_datapoint)


# Default JSON data
tasks = [
    {
        'id': 1,
        'sepal length (cm)': 6,
        'sepal width (cm)': 2.2,
        'petal length (cm)': 4,
        'petal width (cm)': 1,
        'target': 1,
    },
    {
        'id': 2,
        'sepal length (cm)': 6,
        'sepal width (cm)': 2.7,
        'petal length (cm)': 5.1,
        'petal width (cm)': 1.6,
        'target': 1,
    }
]

# Default for marshal function
task_fields = {
    'sepal length (cm)': fields.String,
    'sepal width (cm)': fields.String,
    'petal length (cm)': fields.String,
    'petal width (cm)': fields.String,
    'target': fields.String,
}

# Task List API: /todo/api/v1.0/tasks


class PredictionListAPI(Resource):
    decorators = [auth.login_required]

    def __init__(self):
        #
        self.reqparse = reqparse.RequestParser()
        self.reqparse.add_argument('sepal length (cm)', type=str,
                                   required=True,
                                   help='sepal length (cm) not provided',
                                   location='json')
        self.reqparse.add_argument('sepal width (cm)', type=str, required=True,
                                   help='sepal width (cm) not provided',
                                   location='json')
        self.reqparse.add_argument('petal length (cm)', type=str,
                                   required=True,
                                   help='petal length (cm) not provided',
                                   location='json')
        self.reqparse.add_argument('petal width (cm)', type=str, required=True,
                                   help='petal width (cm) not provided',
                                   location='json')
        # Inherite class from another class
        super(PredictionListAPI, self).__init__()

    def get(self):
        return {'tasks': [marshal(task, task_fields) for task in tasks]}

    def post(self):
        args = self.reqparse.parse_args()
        task = {
            'id': tasks[-1]['id'] + 1,
            'sepal length (cm)': args['sepal length (cm)'],
            'sepal width (cm)': args['sepal width (cm)'],
            'petal length (cm)': args['petal length (cm)'],
            'petal width (cm)': args['petal width (cm)']
        }
        datapoint_x = np.array(list(task.values()), dtype='float64')[1:]
        datapoint_x = datapoint_x.reshape(1, -1)
        task['target'] = loaded_model.predict(datapoint_x)[0]
        tasks.append(task)
        return {'task': marshal(task, task_fields)}, 201


# Task API todo/api/v1.0/tasks/<int:id>
class PredictionAPI(Resource):
    decorators = [auth.login_required]

    def __init__(self):
        self.reqparse = reqparse.RequestParser()
        self.reqparse.add_argument('sepal length (cm)', type=str,
                                   required=True,
                                   help='sepal length (cm) not provided',
                                   location='json')
        self.reqparse.add_argument('sepal width (cm)', type=str, required=True,
                                   help='sepal length (cm) not provided',
                                   location='json')
        self.reqparse.add_argument('petal length (cm)', type=str,
                                   required=True,
                                   help='petal length (cm) not provided',
                                   location='json')
        self.reqparse.add_argument('petal width (cm)', type=str, required=True,
                                   help='petal width (cm) not provided',
                                   location='json')
        super(PredictionAPI, self).__init__()

    def get(self, id):
        task = [task for task in tasks if task['id'] == id]
        if len(task) == 0:
            abort(404)
        return {'task': marshal(task[0], task_fields)}

    def put(self, id):
        task = [task for task in tasks if task['id'] == id]
        if len(task) == 0:
            abort(404)
        task = task[0]
        args = self.reqparse.parse_args()
        for k, v in args.items():
            if v is not None:
                task[k] = v
        return {'task': marshal(task, task_fields)}

    def delete(self, id):
        task = [task for task in tasks if task['id'] == id]
        if len(task) == 0:
            abort(404)
        tasks.remove(task[0])
        return {'result': True}


# Adding the resources for the todo/api/v1.0/tasks/<int:id>
# and /todo/api/v1.0/tasks
api.add_resource(PredictionListAPI, '/todo/api/v1.0/tasks', endpoint='tasks')
api.add_resource(PredictionAPI, '/todo/api/v1.0/tasks/<int:id>',
                 endpoint='task')


if __name__ == '__main__':
    app.run(debug=True)
