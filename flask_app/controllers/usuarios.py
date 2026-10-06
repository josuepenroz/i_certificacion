from flask_app import app
from flask import render_template,session,redirect,request
from flask_app.models.usuario import Usuario

@app.route("/")
def inicio():
    return render_template("index.html")

@app.route("/crear_usuarios", methods=['POST'])
def crear_usuarios():
    data = {
        'nombre': request.form['nombre'],
        'apellido': request.form['apellido'],
        'email': request.form['email'],
        'password': request.form['password']
    }
    Usuario.save(data)
    return redirect("/cine")
@app.route("/cine", methods=["GET"])
def cine():
    usuarios = Usuario.get_all()
    return render_template("cine.html", usuarios=usuarios)
@app.route("cine/editar/<int:id>")
def editar_p():
    if request.method =="GET":
        pelicula = pelicula.get_one(Usuario)
        return render_template("e_pelicula",pelicula=pelicula)
    if request.method =="POST":
        datos = {
            "id" : pelicula,
            "nombre":request.form["nombre"],
            "director":request.form["director"],
            "fecha":request.form["fecha"]
        }
        Usuario.updated(datos)
        def url_for(Usuarios):
            ...

        return redirect(url_for(Usuarios))