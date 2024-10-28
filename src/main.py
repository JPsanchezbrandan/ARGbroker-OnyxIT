from registro import registrar_inversor, iniciar_sesion
from acciones import mostrar_menu

def main():
    MAX_INTENTOS_FALLIDOS = 3
    intentos_fallidos = 0
    
    while True:
        print("Bienvenido al Portal de Compra de Acciones")
        print("1. Registrar nuevo inversor")
        print("2. Iniciar sesión")
        print("3. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            registrar_inversor()
        elif opcion == "2":
            while intentos_fallidos < MAX_INTENTOS_FALLIDOS:
                inversor = iniciar_sesion()
                if inversor:
                    mostrar_menu(inversor)
                    break
                else:
                    intentos_fallidos += 1
                    print(f"Credenciales incorrectas. Intentos fallidos: {intentos_fallidos}/{MAX_INTENTOS_FALLIDOS}")
                    if intentos_fallidos >= MAX_INTENTOS_FALLIDOS:
                        print("Ha alcanzado el número máximo de intentos fallidos. Su cuenta está bloqueada.")
                        break

        elif opcion == "3":
            print("Gracias por utilizar el portal. ¡Hasta luego!")
            break
        else:
            print("Opción no válida. Intente nuevamente.")

if __name__ == "__main__":
    main()

