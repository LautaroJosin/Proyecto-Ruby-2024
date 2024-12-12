# Proyecto final TTPS Ruby 2024

Este proyecto es un el trabajo final desarrollado para la materia Taller de Tecnologías de Producción de Software opción Ruby. Se trata de un sistema de gestión de inventario de indumentaria para una cadena de ropa deportiva.

## Requisitos

- **Ruby**: 3.3.5
- **Rails**: 8.0.0
- **Sqlite3**

## Instalación

1. **Clona el repositorio**:

    ```sh
    git clone git@github.com:LautaroJosin/Proyecto-Ruby-2024.git 
    ```

2. **Instala las dependencias**:

    ```sh
    cd Proyecto-Ruby-2024
    bundle install
    ```

4. **Configura la base de datos**

   Para configurar la base de datos del proyecto, sigue estos pasos:

   **Crear la base de datos**  
    Si estás utilizando SQLite3 como base de datos, puedes crearla ejecutando el siguiente comando:

    ```
    rails db:create
    ```

   **Ejecutar las migraciones**  
    ```
    rails db:migrate
    ```

    **Ejecutar los seeders**

    ```
    rails db:seed
    ```


## Comandos utiles para usar con la Base de datos
      
- **Revertir la última migración**:
```
rails db:rollback
```

- **Reiniciar la base de datos** (elimina y recrea desde cero):
```
rails db:reset
```
Esto incluye los pasos `rails db:drop`, `rails db:create` y `rails db:migrate`.


## Cómo ejecutar el proyecto

Para iniciar el servidor de desarrollo:

```sh
rails server