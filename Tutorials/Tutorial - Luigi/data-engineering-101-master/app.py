from flask import render_template, Flask, request, Response
import ipdb
import json
import pickle
import numpy as np

app = Flask(__name__)
app.model = None
app.vectorizer = None

@app.route('/')
@app.route('/index')
def index():
    return "Hello, world!"

@app.route("/refresh", methods=['POST'])
def refresh():
    #ipdb.set_trace()
    app.model = pickle.load(request.files['filedata'])
    print "Model successfully uploaded"
    return "Success"

@app.route("/vectorizer", methods=['POST'])
def vector():
    app.vectorizer = pickle.load(request.files['filedata'])
    print "Vectorizer successfully uploaded"
    return "Success"

@app.route('/predict', methods=['POST'])
def predict():
    ipdb.set_trace()
    input_data = [request.form['data']]
    X = app.vectorizer.transform(input_data)
    return np.array_str(app.model.predict(X))

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8081)
