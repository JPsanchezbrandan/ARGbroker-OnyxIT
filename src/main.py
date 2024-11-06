from registro import Registro
from acciones import MercadoDeAcciones
from gestor_de_sesion import GestorDeSesion

def main():
    registro = Registro()
    mercado = MercadoDeAcciones()
    gestor_sesion = GestorDeSesion(registro.inversores)
    COMISION_BROKER = 0.01

    while True:
        print("\nMenú Principal:")
        print("1. Registrarse")
        print("2. Iniciar Sesión")
        print("3. Salir")
        
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            cuit = input("Ingrese su CUIT: ")
            nombre = input("Ingrese su nombre: ")
            apellido = input("Ingrese su apellido: ")
            correo = input("Ingrese su correo: ")
            password = input("Ingrese su contraseña: ")
            inversor = registro.registrar_inversor(cuit, nombre, apellido, correo, password)
            if inversor:
                print("Registro exitoso.")
            else:
                print("El correo ya está registrado.")
        
        elif opcion == "2":
            correo = input("Ingrese su correo: ")
            password = input("Ingrese su contraseña: ")
            gestor_sesion.iniciar_sesion(correo, password)

            while gestor_sesion.esta_activa():
                print("\nMenú de Operaciones:")
                print("1. Comprar Acciones")
                print("2. Vender Acciones")
                print("3. Ver Portafolio")
                print("4. Ver Datos de la Cuenta")
                print("5. Cerrar Sesión")
                print("6. Salir")
                
                opcion_secundaria = input("Seleccione una opción: ")
                
                if opcion_secundaria == "1":
                    if gestor_sesion.esta_activa():
                        print("Acciones disponibles para comprar:")
                        for accion in mercado.listar_acciones_disponibles():
                            print(f"Símbolo: {accion['Simbolo']}, Precio Compra: {accion['Precio Compra']}, Precio Venta: {accion['Precio Venta']}, Cantidad Disponible: {accion['Cantidad Disponible']}")
                        simbolo = input("Ingrese el símbolo de la acción a comprar: ")
                        accion = mercado.obtener_accion(simbolo)
                        if accion:
                            cantidad = int(input("Ingrese la cantidad a comprar: "))
                            costo_total = accion.precio_compra * cantidad * (1 + COMISION_BROKER)
                            saldo = gestor_sesion.inversor_actual.obtener_saldo()
                            if saldo >= costo_total:
                                if accion.cantidad_disponible >= cantidad:
                                    gestor_sesion.inversor_actual.actualizar_saldo(-costo_total)
                                    gestor_sesion.inversor_actual.agregar_accion(simbolo, cantidad, accion.precio_compra, accion.precio_venta)
                                    accion.cantidad_disponible -= cantidad
                                    print(f"Compra exitosa. Nuevo saldo: {gestor_sesion.inversor_actual.obtener_saldo()}")
                                else:
                                    print(f"No hay suficientes acciones de {simbolo}. Disponibles: {accion.cantidad_disponible}")
                            else:
                                print("Saldo insuficiente.")
                        else:
                            print("Acción no encontrada.")
                    else:
                        print("Debe iniciar sesión para comprar acciones.")

                elif opcion_secundaria == "2":
                    if gestor_sesion.esta_activa():
                        simbolo = input("Ingrese el símbolo de la acción a vender: ")
                        accion = mercado.obtener_accion(simbolo)
                        if accion:
                            cantidad = int(input("Ingrese la cantidad a vender: "))
                            inversor = gestor_sesion.inversor_actual
                            portafolio = inversor.obtener_portafolio()
                            accion_en_portafolio = next((a for a in portafolio if a["Simbolo"] == simbolo), None)
                            if accion_en_portafolio and accion_en_portafolio["Cantidad"] >= cantidad:
                                ingreso_total = accion.precio_venta * cantidad * (1 - COMISION_BROKER)
                                inversor.actualizar_saldo(ingreso_total)
                                inversor.vender_accion(simbolo, cantidad)
                                accion.cantidad_disponible += cantidad
                                print(f"Venta exitosa. Nuevo saldo: {inversor.obtener_saldo()}")
                            else:
                                print("No tiene suficientes acciones para vender.")
                        else:
                            print("Acción no encontrada.")
                    else:
                        print("Debe iniciar sesión para vender acciones.")

                elif opcion_secundaria == "3":
                    if gestor_sesion.esta_activa():
                        portafolio = gestor_sesion.inversor_actual.obtener_portafolio()
                        if portafolio:
                            print("Portafolio:")
                            for accion in portafolio:
                                print(f"{accion['Simbolo']}: Cantidad: {accion['Cantidad']}, Precio Compra: {accion['Precio Compra']}, Precio Actual: {accion['Precio Actual']}, Rendimiento: {accion['Rendimiento']}")
                        else:
                            print("No tiene acciones en el portafolio.")
                    else:
                        print("Debe iniciar sesión para ver el portafolio.")

                elif opcion_secundaria == "4":
                    if gestor_sesion.esta_activa():
                        datos = gestor_sesion.inversor_actual.mostrar_datos()
                        print("Datos de la cuenta:")
                        for key, value in datos.items():
                            print(f"{key}: {value}")
                    else:
                        print("Debe iniciar sesión para ver los datos de la cuenta.")

                elif opcion_secundaria == "5":
                    gestor_sesion.cerrar_sesion()

                elif opcion_secundaria == "6":
                    print("Gracias por usar el sistema de gestión de inversiones. ¡Hasta luego!")
                    break

                else:
                    print("Opción inválida. Intente de nuevo.")
                
        elif opcion == "3":
            print("Gracias por usar el sistema de gestión de inversiones. ¡Hasta luego!")
            break

        else:
            print("Opción inválida. Intente de nuevo.")

if __name__ == "__main__":
    main()
