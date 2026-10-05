from flask_app.config.mysqlconnection import connectToMySQL

class Usuario:
    def __init__(self, date):
        self.id  = date.get("id")
        self.nombre  = date.get("nombre")
        self.apellido  = date.get("apellido")
        self.email  = date.get("email ")
        self.password  = date.get("password")