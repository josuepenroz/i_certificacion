from flask_app import app
from flask import render_template,session,redirect,request
from flask_app.models.usuario import usuarios

@app.route("/")
def inicio():
    return render_template("index.html")