import flask
from flask import request
import joblib
import pandas as pd
from collections import OrderedDict
import sklearn
import numpy as np

app = flask.Flask(__name__)

@app.route("/log_model")
def log_model():
    word_embeddings = pd.read_csv('glove.6B.50d.txt.zip',
                               header=None, sep=' ', index_col=0,
                               nrows=100000, compression='zip', encoding='utf-8', quoting=3)
    word_list = word_embeddings.index.values.tolist()
    word2vec = OrderedDict(zip(word_list, word_embeddings.values))

    clf = joblib.load('log.pkl')

    inputText = request.args.get('inputText')
    vector=np.zeros(50)
    inputText = inputText.split()
    for word in inputText:
        vector+=word2vec.get(word,np.zeros(50))
    vector=vector/len(inputText)

    result = clf.predict([vector])
    return str(result[0]),200
