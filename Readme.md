# Segundo Parcial Bases de datos avanzadas 👮🏻‍♂️🚗🏍️⛽

## Información personal
- Nombre: Pablo Alejandro Badani Zambrana
- Código: 55789

## Descripción de la entidad y los requisitos
La Policía Boliviana es la institución encargada de mantener el orden público y garantizar la seguridad ciudadana en Bolivia. Su misión es proteger la vida, la integridad física y los derechos de las personas, así como preservar la paz y el orden en la sociedad. A través de sus diferentes unidades especializadas, la Policía Boliviana realiza labores de prevención del delito, investigación criminal y respuesta a emergencias. 

Lo que nos pide es crear una adquisición de filtros de aceite y de diésel, para vehículos y motocicletas de las direcciones nacionales de la Policía boliviana. Donde crearemos formas sencillas que ayudaran a obtener informacion del caso.

Contraseñas .- qwert

## Diagrama propuesto de Base de datos

![Diagrama adquisicion2 drawio](https://github.com/Pabdro/bd_SegundoParcial_PabloBadani/assets/80706043/a8edb02f-5f3a-4414-b6d5-a311bcf739be)

## Requisitos técnicos
* Docker: Tener el docker desktop instalado (https://www.docker.com/products/docker-desktop/).

* Git: Tener git instalado para luego poder clonar correctamente el repositorio (https://git-scm.com/downloads).

## Cómo levantar localmente
1. Clonar el repositorio:

        git clone <URL_DEL_REPOSITORIO>

2. Dirigirse a la ruta donde clonamos el repositorio:

        cd /ruta/repositorio/clon

3. Levantar el archivo .yml de este repositorio:

        docker-compose -f docker-compose5.yml up

4. Para bajar el servicio se pone lo siguiente:

        docker-compose -f docker-compose5.yml down
