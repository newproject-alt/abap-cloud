CLASS zcl_tabla_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tabla_ata IMPLEMENTATION.
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

    out->write( lt_aeropuerto ).

*    loop at lt_aeropuerto into ls_aeropuerto.
*
*        if ls_aeropuerto-name(1) = 'M'.
*
*
*            ls_empleadoaero-id = ls_empleadoaero-id + 1.
*
*
*        endif.
*
*    endloop.

*           out->write( ls )










  ENDMETHOD.

ENDCLASS.
