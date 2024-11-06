ARGBroker

Descripción
ARGBroker es una aplicación de consola diseñada para gestionar inversiones en el mercado de valores. Permite a los usuarios registrarse, iniciar sesión, revisar su portafolio de inversiones y realizar operaciones de compra y venta de manera intuitiva y eficiente. La aplicación busca ofrecer una experiencia clara y funcional, con un diseño modular, bajo acoplamiento y alta cohesión para facilitar su mantenimiento y expansión.

Contexto
Este proyecto fue desarrollado como parte de un programa de formación en programación, integrando conocimientos de diseño de sistemas, bases de datos, programación orientada a objetos y principios de diseño simple. La aplicación fue realizada por un equipo de desarrolladores en respuesta a requisitos funcionales específicos para actuar como intermediario entre inversores y el mercado bursátil.

Alcance
La primera versión del proyecto es una demo que simula operaciones de compra y venta de acciones. Las funcionalidades clave incluyen:

Registro e inicio de sesión de usuarios.
Consulta de cotizaciones de acciones de empresas.
Compra y venta de acciones al precio actual del mercado.
Visualización del portafolio del usuario, con detalles de saldo, total invertido, acciones y rendimiento.
Cálculo automático de comisiones en cada operación (1%).
Usos

Regístrate proporcionando nombre, apellido, ID, correo electrónico y contraseña.
Inicia sesión en la aplicación.
Accede al panel de cotizaciones para ver las acciones disponibles y sus precios.
Realiza operaciones de compra y venta desde el panel de operaciones.
Consulta tu portafolio personal para visualizar tu saldo y el rendimiento de tus inversiones.
Nomenclatura

Archivos y Directorios

Archivos Python: snake_case en minúsculas. Ejemplo: main.py, inversor.py.
Directorios: Nombres en minúsculas sin espacios ni caracteres especiales. Ejemplo: docs, src.
Clases

Nombres de clases, ejemplo: Inversor
Métodos y Funciones

Nombres de métodos y funciones en snake_case, comenzando con un verbo en infinitivo. Ejemplo: mostrar_menu
Variables

Nombres de variables en snake_case. Ejemplo: simbolo, cantidad
Constantes

Nombres de constantes en MAYÚSCULAS_CON_GUIONES. Ejemplo: 'COMPRA', 'VENTA', 'PENDIENTE'
Base de Datos
La base de datos está diseñada para registrar todas las transacciones de compra y venta, así como mantener un registro histórico de las cotizaciones.

Entidades Principales

Usuarios
Acciones
Transacciones
Portafolio

Autores

Juan Gioda
Juan Pablo Sánchez Brandán
Brenda Torres
Daniel Paez
Federico Vélez
