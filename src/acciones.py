class Accion:
    def __init__(self, simbolo, precio_compra, precio_venta, cantidad_disponible):
        self.simbolo = simbolo
        self.precio_compra = precio_compra
        self.precio_venta = precio_venta
        self.cantidad_disponible = cantidad_disponible

    def actualizar_precio_actual(self, nuevo_precio):
        self.precio_compra = nuevo_precio

class MercadoDeAcciones:
    def __init__(self):
        self.acciones = [
            Accion("YPF", 500, 510, 100),
            Accion("GGAL", 320, 325, 80),
            Accion("BMA", 280, 285, 60),
            Accion("PAMP", 200, 205, 70),
            Accion("CEPU", 150, 155, 50),
            Accion("TXAR", 180, 185, 100),
            Accion("MIRG", 700, 710, 30),
            Accion("TGSU2", 140, 145, 60),
            Accion("CRES", 110, 115, 40),
            Accion("ALUA", 95, 100, 80)
        ]

    def obtener_accion(self, simbolo):
        for accion in self.acciones:
            if accion.simbolo == simbolo:
                return accion
        return None

    def listar_acciones_disponibles(self):
        acciones_disponibles = []
        for accion in self.acciones:
            acciones_disponibles.append({
                "Simbolo": accion.simbolo,
                "Precio Compra": accion.precio_compra,
                "Precio Venta": accion.precio_venta,
                "Cantidad Disponible": accion.cantidad_disponible
            })
        return acciones_disponibles
