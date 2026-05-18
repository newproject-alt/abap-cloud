CLASS zcl_tabla_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TABLA_ATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """""""Tablas: introducción""""""""""""""""

       types:Begin of ty_empleado,                              "Se crea un tipo personalizado para la estructura
          nombre    type string,
          edad      type i,
          telefono  type string,
          correo    type string,

    end of ty_empleado.

    data ls_empleado type ty_empleado.                          "se crea una estructura para nuestra tabla

    data lt_empleado type standard table of ty_empleado.        "Tablita standard creada, primera forma para escribirlo
*    data lt_empleado2 type table of ty_empleado.                "Segunda forma

*    data lt_empleado_sorted type sorted table of ty_empleado with non-unique key correo.       "tabla sorted, con un campo que no va a repetirse: correo
                                                                                                "se pueden crear mezclas de campos clave ¿con distintos?
                                                                                                "segun el tipo de tabla que se cree y para que, podrías crear diferentes keys para limitar el uso de mismos valores para X campos
                                                                                                "estas hacen muchas cosas, parten la tabla x la mitad etce tc

*    data lt_empleado_hash type hashed table of ty_empleado with unique key correo.              "tabla más rápida, simplemente va a mil a x el dato


*out->write( ls_empleado ).
*out->write( lt_empleado ).

"vamos a trabajar con lt_empleado"

    ls_empleado = value ty_empleado(
                                    nombre      = 'Daniel'
                                    edad        = 33
                                    telefono    = '+34600600600'
                                    correo      = 'alo@gmail.com'
                                    ).

    insert ls_empleado into lt_empleado index 1.

    ls_empleado = value ty_empleado(
                                    nombre      = 'Fernando'
                                    edad        = 3
                                    telefono    = '+34600600600'
                                    correo      = 'alo@gmail.com'
                                    ).

    insert ls_empleado into lt_empleado index 2.

    ls_empleado = value ty_empleado(
                                    nombre      = 'Laura'
                                    edad        = 3
                                    telefono    = '+34600600600'
                                    correo      = 'alo@gmail.com'
                                    ).

    insert ls_empleado into lt_empleado index 3.


    ls_empleado = value ty_empleado(
                                    nombre      = 'Raul'
                                    edad        = 3
                                    telefono    = '+34600600600'
                                    correo      = 'alo@gmail.com'
                                    ).

    insert ls_empleado into lt_empleado index 4.

    ls_empleado = value ty_empleado(
                                    nombre      = 'Juan'
                                    edad        = 3
                                    telefono    = '+34600600600'
                                    correo      = 'alo@gmail.com'
                                    ).

    insert ls_empleado into lt_empleado index 2.

*    insert ls_empleado into table lt_empleado.              "De esta manera se introduce en la próxima fila vacía los datos

*    out->write( lt_empleado ).


    """""""""""""Cómo realizar consultas a una tabla: loop at""""""""""""""""

    loop at lt_empleado into ls_empleado.

*        if ls_empleado-nombre = 'Fernando'.

        if ls_empleado-edad = 3.

*            out->write( |Nombre-> { ls_empleado-nombre }, edad-> { ls_empleado-edad }. | ).
             out->write( |Nombre: { ls_empleado-nombre }, edad-> { ls_empleado-edad } y telefono { ls_empleado-telefono }. | ).

        endif.

    endloop.

    """"""""""""""""""""Ejercicio""""""""""""""
            "Rellena la tabla con 4 filas, y no se que mas"
            "Filtración de ciudades que empiecen por la letra M"

    "Creamos la estructura y la tabla con nuestros tipos heredados

    data ls_aeropuerto type          /dmo/airport.      "Estructura"
    data lt_aeropuerto type table of /dmo/airport.      "Tabla"

    "Introducimos los datos con la forma más moderna"
    "Separados para su mejor lectura"

    ls_aeropuerto = value #(
                            airport_id  = 'FRA'
                            name        = 'Frankfurt Airport'
                            city        = 'Frankfurt/Main'
                            country     = 'DE'
                            ).

        insert ls_aeropuerto into table lt_aeropuerto.

    ls_aeropuerto = value #(
                            airport_id  = 'HAM'
                            name        = 'Hamburg Airport'
                            city        = 'Hamburg'
                            country     = 'DE'
                            ).

        insert ls_aeropuerto into table lt_aeropuerto.

    ls_aeropuerto = value #(
                            airport_id  = 'ORY'
                            name        = 'Orly Airport'
                            city        = 'Paris'
                            country     = 'FR'
                            ).

        insert ls_aeropuerto into table lt_aeropuerto.

    ls_aeropuerto = value #(
                            airport_id  = 'MUC'
                            name        = 'Munich Airport'
                            city        = 'Munich'
                            country     = 'DE'
                            ).

        insert ls_aeropuerto into table lt_aeropuerto.

*    loop at lt_aeropuerto into ls_aeropuerto.
*
**        if ls_aeropuerto-city = match( val = ls_aeropuerto-city pcre = '^M' ).
*
*        if ls_aeropuerto-name+0(1) = 'M'.       "El número te indica la posicion en la que debe estar el valor
*                                                "Curiosamente, esta versión es más antigua"
*
**            out->write( |Las ciudades que empiezan por M son: { ls_aeropuerto }. | ).
*             out->write( ls_aeropuerto ).
*
*        endif.
*
*    endloop.





*    out->write( ls_aeropuerto ).
*    out->write( lt_aeropuerto ).


    """"""""""""""""""""Continuación del ejercicio, más difícil"""""""""""""""


    "otra tabla nueva, con propio tipo, uno de los 2 campos
*    otra columna que es id

"un campo rellenao con valores tabla empleado y campo id


    types: begin of ty_empleadoaero,                "Nuevo tipo
          nombre    type string,                    "donde irá el campo id
          edad      type i,                         "generado automáticamente
          telefono  type string,

    end of ty_empleadoaero.

    data ls_empleadoaero type ty_empleadoaero.

    data lt_empleadoaero type ty_empleadoaero.      "Creamos tabla nueva donde volcar
                                                    "vete tú a saber que info

*    out->write( lt_aeropuerto ).

*    loop at lt_aeropuerto into ls_aeropuerto.
*
*        if ls_aeropuerto-name(1) = 'M'.
*

*            ls_empleadoaero-id = ls_empleadoaero-id + 1.
*
*
*        endif.
*
*    endloop.

*           out->write( ls )



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Cómo heredar la estructura y tipos de lt_empleado asignándolos a la nueva"
*    data lt_Empleado2 like lt_empleado.

    "Forma moderna de insertar valores en una tabla, directamente
    insert value #(
                    nombre = 'Dani'
                    edad = 5
                    telefono = '4000394'
                    correo = 'idjicd@gmai.com' ) into table lt_empleado.

     insert value #(
                    nombre = 'Laura'
                    edad = 25
                    telefono = '4120394'
                    correo = 'tres@gmai.com' ) into table lt_empleado.

    "Insertar una línea en blanco en una tabla
    insert INITIAL LINE INTO table lt_empleado.

    LOOP AT lt_empleado into ls_empleado.

        if ls_empleado-edad = 5.
        out->write( |Nombre: { ls_empleado-nombre }, edad: { ls_empleado-edad }.| ).

        endif.

    endloop.

    "Copiar toda la información de una tabla a otra"

    data lt_empleado2 type table of ty_empleado.
*    insert lines of lt_empleado INTO table lt_empleado2.

    "Selecciona las líneas a copiar desde la primera a lo indicado en una tabla"
*    insert lines of lt_empleado to 1 INTO table lt_empleado2.

    "Selecciona las líneas a copiar desde X a Y en una tabla"
    insert lines of lt_empleado from 2 to 4 into table lt_empleado2.

*    También tienes esta forma
*    append lines of lt_empleado from 2 to lt_empleado2.


    "Instancia/comando Append, sirve como el insert pero con diferencias"
    "Por ejemplo, no puedes indicarle (como con index) la posición"
    "Y otros fallos también"
*    append ls_empleado to lt_empleado.

    "Forma lineal
*    append value #( nombre = 'Pablo' edad = 5 telefono = '4353' correo = 'dicsdjcn@fifdn.co' ) to lt_Empleado.

    "De golpe meter datos
    data lt_empleado3 type table of ty_empleado. "Tabla nueva

    lt_Empleado3 = value #(

    ( nombre = 'Ana'    edad = 2 telefono = '3294050943' correo = 'jdndner' )
    ( nombre = 'Mary'   edad = 2 telefono = '3294050943' correo = 'jdndner' )
    ( nombre = 'Esther' edad = 2 telefono = '3294050943' correo = 'jdndner' )
     ).

    "Directamente crear una tabla y declarar el tipo
    "Tenemos un tipo ya creado ty_empleado y ahora una estructura vacía


         data ls_prueba type          ty_empleado.
         data lt_prueba type table of ty_empleado.                  "Por si, otra tabla

    types ty_tabla type table of ty_empleado with empty key.        "como darle otra etiqueta al tipo,
                                                                    "with empty key = ese tipo no necesita campo clave
                                                                    "los campos clave pueden ser únicos o no únicos en las tablas sort

*    data lt_prueba type ty_tabla                                   "cambia el tipo de esta tabla

*    data(lt_empleado4) value ty_tabla(
*    ( nombre = 'Paco'  edad = 20 telefono = '+34600601602' correo = 'jdndner@gmail.com' )
*    ( nombre = 'Paca'  edad = 28 telefono = '+34294050943' correo = 'pp@goutmail.com'   )
*    ( nombre = 'Pecas' edad = 90 telefono = '+33676766667' correo = 'pqs@outlook.es'    )
*    ( nombre = 'Peque' edad = 33 telefono = '+34900600693' correo = 'jdndner@gmail.de'  )
*     ).
*
*    data(lt_empleado4) value ty_tabla(
*
*    ( nombre = 'Paco'  edad = 20 telefono = '+34600601602' correo = 'jdndner@gmail.com' )
*    ( nombre = 'Paca'  edad = 28 telefono = '+34294050943' correo = 'pp@goutmail.com'   )
*    ( nombre = 'Pecas' edad = 90 telefono = '+33676766667' correo = 'pqs@outlook.es'    )
*    ( nombre = 'Peque' edad = 33 telefono = '+34900600693' correo = 'jdndner@gmail.de'  )
*     ).

""""""Standard table"""""""
"Es la que se crea por defecto si no se especifica el tipo al crearla. El tipo de acceso que se usa en las tablas internas es lineal,
"es decir, irá registro a registro hasta encontrar el deseado.
"Ocupa poca memoria y se le pueden añadir registros muy rápidamente pero es poco eficiente si necesitamos buscar registros con frecuencia
"sobre todo si la base de datos tiene muchas entradas.

"Cuándo usarla - Cuando las tablas son pequeñas/pocas entradas
"                Cuando las entradas pueden procesarse en el orden exacto al de su inserción
"Las que vamos a usar por ahora

""""""Sorted table"""""""
"Las filas de este tipo de tabla tienen asignado un índice interno y aparecerán ordenadas respecto a su clave que puede ser única o no única.
"El acceso se realiza con la clave

"Cuándo usarla - Cuando se espera un gran número de accesos afines

""""""Hashed table"""""""
"Se accede con un algoritmo numérico llamado "hash function" el cual determina la posición de un registro partiendo de una determinada clave
"(la clave tiene que ser única), la más rápida de todas las tablas

"Cuándo usar - Si la acción más frecuente es acceder a una línea, por la clave, eso será así cuando por ejemplo queramos crear una tabla interna que
"              se parezca a una tabla de datos.
"              Adecuada también cuando queremos procesar grandes cantidades de datos, no merece la pena con tablas pequeñas

""""""Clave"""""""
"Identifica cada entrada de una tabla. Hay dos tipos:
"                                                    - Estándar
"                                                    - Clave definida por usuario

"El programador puede decidir si la clave es única (UNIQUE) o no única (NON-UNIQUE)
"Importante - la clave de las tablas estándar NO puede ser única
"             la clave de las tablas hashed SIEMPRE es única

"Ojo - El append no se puede usar en las tablas sort y hashed, crack


out->write( lt_empleado ).
out->write( | | ).              "Esto es para crear una línea en blanco"
out->write( lt_empleado2 ).
out->write( | | ).
out->write( lt_empleado3 ).



  ENDMETHOD.
ENDCLASS.
