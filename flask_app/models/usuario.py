from flask_app.config.mysqlconnection import connectToMySQL

class Usuario:
    def __init__(self, date):
        self.id  = date.get("id")
        self.nombre  = date.get("nombre")
        self.apellido  = date.get("apellido")
        self.email  = date.get("email")
        self.password  = date.get("password")   
        self.updated_at  = date.get("updated_at")   
        self.created_at  = date.get("created_at")   
    @classmethod
    def save(cls,date):
        query = "INSERT INTO usuarios(nombre,apellido,email, password) VALUES (%(nombre)s,%(apellido)s,%(email)s, %(password)s);"
        result = connectToMySQL('cine_pedia').query_db(query,date)
        return result
 
