class GestorDeSesion:
    def __init__(self, inversores):
        self.inversores = inversores
        self.inversor_actual = None

    def iniciar_sesion(self, correo, password):
        inversor = self.inversores.get(correo)
        if inversor and inversor.verificar_password(password):
            self.inversor_actual = inversor
            print(f"Inicio de sesión exitoso. Bienvenido, {inversor.mostrar_datos()['Nombre']}")
        else:
            print("Correo o contraseña incorrectos.")

    def cerrar_sesion(self):
        if self.inversor_actual:
            print(f"Sesión cerrada. Hasta luego, {self.inversor_actual.mostrar_datos()['Nombre']}")
            self.inversor_actual = None
        else:
            print("No hay ninguna sesión iniciada.")

    def esta_activa(self):
        return self.inversor_actual is not None
