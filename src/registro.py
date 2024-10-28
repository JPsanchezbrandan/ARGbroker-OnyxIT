from inversor import Inversor

inversores = []

def registrar_inversor():
    print("Registro de nuevo inversor")
    cuit = input("Ingrese su CUIT: ")
    nombre = input("Ingrese su nombre: ")
    apellido = input("Ingrese su apellido: ")
    correo = input("Ingrese su correo electrónico: ")
    password = input("Ingrese su contraseña: ")
    
    nuevo_inversor = Inversor(cuit, nombre, apellido, correo, password)
    inversores.append(nuevo_inversor)
    print("¡Registro exitoso!\n")

def iniciar_sesion():
    print("Inicio de sesión")
    correo = input("Ingrese su correo electrónico: ")
    password = input("Ingrese su contraseña: ")

    for inversor in inversores:
        if inversor.correo == correo and inversor.password == password:
            print("Inicio de sesión exitoso!")
            inversor.mostrar_datos()
            return inversor

    print("Correo o contraseña incorrectos.\n")
    return None

