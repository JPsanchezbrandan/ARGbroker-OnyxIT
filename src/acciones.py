from inversor import Inversor

acciones = [
    {"simbolo": "ALUA", "nombre": "Aluminio Argentino S.A", "precio_compra": 250, "precio_venta": 270},
    {"simbolo": "GGAL", "nombre": "Grupo Galicia S.A", "precio_compra": 100, "precio_venta": 105},
    {"simbolo": "YPFD", "nombre": "YPF S.A", "precio_compra": 350, "precio_venta": 360},
    {"simbolo": "PAM", "nombre": "Pampa Energía S.A", "precio_compra": 150, "precio_venta": 155},
    {"simbolo": "CRES", "nombre": "Cresud S.A", "precio_compra": 120, "precio_venta": 125},
    {"simbolo": "TGS", "nombre": "Transportadora de Gas del Sur S.A", "precio_compra": 400, "precio_venta": 410},
    {"simbolo": "BBAR", "nombre": "BBVA Banco Francés S.A", "precio_compra": 500, "precio_venta": 520},
    {"simbolo": "TS", "nombre": "Tenaris S.A", "precio_compra": 450, "precio_venta": 460},
    {"simbolo": "EDN", "nombre": "Edenor S.A", "precio_compra": 300, "precio_venta": 310},
    {"simbolo": "HARG", "nombre": "Hidrovías do Brasil", "precio_compra": 200, "precio_venta": 210},
]

def mostrar_menu(inversor):
    while True:
        print("Menú de opciones:")
        print("1. Ver datos de la cuenta")
        print("2. Listar activos del portafolio")
        print("3. Comprar acciones")
        print("4. Vender acciones")
        print("5. Cerrar sesión")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            inversor.mostrar_datos()
        elif opcion == "2":
            listar_activos()
        elif opcion == "3":
            comprar_acciones(inversor)
        elif opcion == "4":
            vender_acciones(inversor)
        elif opcion == "5":
            print("Sesión cerrada.\n")
            break
        else:
            print("Opción no válida. Intente nuevamente.")

def listar_activos():
    print("Activos del portafolio: ")
    for accion in acciones:
        rendimiento = accion['precio_venta'] - accion['precio_compra']
        print(f"Acción: {accion['simbolo']} - {accion['nombre']}, "
              f"Precio de compra: ${accion['precio_compra']}, "
              f"Precio de venta: ${accion['precio_venta']}, "
              f"Rendimiento: ${rendimiento:.2f}")

def comprar_acciones(inversor):
    listar_activos()
    simbolo = input("Ingrese el símbolo de la acción que desea comprar: ")
    cantidad = int(input("Ingrese la cantidad de acciones a comprar: "))

    accion_encontrada = next((accion for accion in acciones if accion['simbolo'] == simbolo), None)

    if accion_encontrada:
        precio_compra = accion_encontrada['precio_compra']
        total_compra = precio_compra * cantidad
        comision = total_compra * 0.01
        total_con_comision = total_compra + comision

        if total_con_comision <= inversor._Inversor__saldo:
            inversor._Inversor__saldo -= total_con_comision
            print(f"Compra exitosa: {cantidad} acciones de {simbolo} a ${precio_compra} cada una.")
            print(f"Comisión aplicada: ${comision:.2f}.")
            print(f"Saldo restante después de la compra: ${inversor._Inversor__saldo:,.2f}")
        else:
            print("Saldo insuficiente para realizar la compra.")
    else:
        print("Acción no encontrada.")

def vender_acciones(inversor):
    listar_activos()
    simbolo = input("Ingrese el símbolo de la acción que desea vender: ")
    cantidad = int(input("Ingrese la cantidad de acciones a vender: "))

    accion_encontrada = next((accion for accion in acciones if accion['simbolo'] == simbolo), None)

    if accion_encontrada:
        precio_venta = accion_encontrada['precio_venta']
        total_venta = precio_venta * cantidad
        comision = total_venta * 0.01
        total_con_comision = total_venta - comision

        inversor._Inversor__saldo += total_con_comision
        print(f"Venta exitosa: {cantidad} acciones de {simbolo} a ${precio_venta} cada una.")
        print(f"Comisión aplicada: ${comision:.2f}.")
        print(f"Saldo total después de la venta: ${inversor._Inversor__saldo:,.2f}")
    else:
        print("Acción no encontrada.")
