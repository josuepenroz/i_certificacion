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
    @classmethod
    def get_all(cls):
        query="SELECT * FROM usuarios;"
        
        resultados_query=connectToMySQL('cine_pedia').query_db(query)

        lista_usuarios=[]

        for elemento in resultados_query:
            lista_usuarios.append(cls(elemento))

        return lista_usuarios
    @classmethod
    def get_by_id(cls,id):
        query ="SELECT * FROM usuarios WHERE id  = %(id)s;"
        data = {"id":id}
        resultado = connectToMySQL('cine_pedia').query_db(query,data)
        if resultado:
            return cls(resultado[0])
        return None
    @classmethod
    def updated(cls,datos):
        query=""" 
        UPDATE pelicula
        set nombre = %(nombre)s,
            director = %(director)s,
            
            
            WHERE id = %(id)s;    
        """
        return connectToMySQL("usuarios_crud").query_db(query, datos)