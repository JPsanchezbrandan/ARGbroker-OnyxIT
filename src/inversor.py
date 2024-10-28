class Inversor:
    def __init__(self, cuit, nombre, apellido, correo, password):
        self.__cuit = cuit
        self.__nombre = nombre
        self.__apellido = apellido
        self.__correo = correo
        self.__password = password
        self.__saldo = 1000000.0

    @property
    def correo(self):
        return self.__correo

    @property
    def password(self):
        return self.__password

    def mostrar_datos(self):
        print(f"CUIT: {self.__cuit}, Nombre: {self.__nombre}, "
              f"Apellido: {self.__apellido}, Correo: {self.__correo}")