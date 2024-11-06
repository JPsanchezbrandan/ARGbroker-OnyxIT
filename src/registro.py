from cuenta import Inversor

class Registro:
    def __init__(self):
        self.inversores = {}

    def registrar_inversor(self, cuit, nombre, apellido, correo, password):
        if correo not in self.inversores:
            nuevo_inversor = Inversor(cuit, nombre, apellido, correo, password)
            self.inversores[correo] = nuevo_inversor
            return nuevo_inversor
        return None
