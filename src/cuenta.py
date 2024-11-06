class Inversor:
    def __init__(self, cuit, nombre, apellido, correo, password):
        self.__cuit = cuit
        self.__nombre = nombre
        self.__apellido = apellido
        self.__correo = correo
        self.__password = password
        self.__saldo = 1000000
        self.__portafolio = {}

    def mostrar_datos(self):
        total_invertido = sum(accion["cantidad"] * accion["precio_compra"] for accion in self.__portafolio.values())
        rendimiento = sum((accion["precio_actual"] - accion["precio_compra"]) * accion["cantidad"] for accion in self.__portafolio.values())
        return {
            "CUIT": self.__cuit,
            "Nombre": self.__nombre,
            "Apellido": self.__apellido,
            "Correo": self.__correo,
            "Saldo": self.__saldo,
            "Total Invertido": total_invertido,
            "Rendimiento": rendimiento
        }

    def actualizar_saldo(self, monto):
        self.__saldo += monto

    def obtener_saldo(self):
        return self.__saldo

    def verificar_password(self, password):
        return self.__password == password

    def agregar_accion(self, simbolo, cantidad, precio_compra, precio_actual):
        if simbolo in self.__portafolio:
            self.__portafolio[simbolo]["cantidad"] += cantidad
        else:
            self.__portafolio[simbolo] = {
                "cantidad": cantidad,
                "precio_compra": precio_compra,
                "precio_actual": precio_actual
            }

    def vender_accion(self, simbolo, cantidad):
        if simbolo in self.__portafolio and self.__portafolio[simbolo]["cantidad"] >= cantidad:
            self.__portafolio[simbolo]["cantidad"] -= cantidad
            if self.__portafolio[simbolo]["cantidad"] == 0:
                del self.__portafolio[simbolo]

    def actualizar_precio_accion(self, simbolo, nuevo_precio):
        if simbolo in self.__portafolio:
            self.__portafolio[simbolo]["precio_actual"] = nuevo_precio

    def obtener_portafolio(self):
        portafolio_info = []
        for simbolo, datos in self.__portafolio.items():
            rendimiento = (datos["precio_actual"] - datos["precio_compra"]) * datos["cantidad"]
            portafolio_info.append({
                "Simbolo": simbolo,
                "Cantidad": datos["cantidad"],
                "Precio Compra": datos["precio_compra"],
                "Precio Actual": datos["precio_actual"],
                "Rendimiento": rendimiento
            })
        return portafolio_info
