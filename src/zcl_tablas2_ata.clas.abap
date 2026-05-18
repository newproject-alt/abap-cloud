CLASS zcl_tablas2_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas2_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  """""""""""""""Filtraciones en bases de datos"""""""""""""""""""""

  select from /dmo/airport                  "selección desde una tabla estándar de SAP
  fields *                                  "el asterisco es para pillar todos los campos
*  where country = 'DE'                      "(ó EQ)"
  into table @data(lt_flights).             "Vuelca toda la info en una tabla que se genera automáticamente

                                            "Muchas maneras; curiosamente se parece a SQL

  "Más adelante, diremos al crear bases de datos, qué campos serán key"

""""""""""""""""""""READ TABLE""""""""""""""""""""
*PARA LEER UNA LINEA ESPECIFICA EN UNA TABLA INTERNA, EN TIEMPO DE EJECUCION, Y TRAER DATOS DE MANERA MAS EFICIENTE

*    if sy-subrc = 0.    "sy-___ muchas variables de sistema; seguro para comprobar que nos está devolviendo algo que queremos - buena práctica
*                        "
*        out->write( lt_flights ).
*        out->write( | | ).
*
*        read table lt_flights into data(ls_flight) index 1.    "trae una línea concreta con los registros de la tabla de la base de datos
*                                                               "guarda en una estructura nueva el primer registro de la anterior filtración
*        out->write( ls_flight ).
*        out->write( | | ).
*
*        read table lt_flights into data(ls_flight2) index 2 transporting airport_id city.       "Trae del registro 2, los campos seleccionados a
*                                                                                                "otra estructura nueva
*                                                                                                "out write de la 2 aquí eh
*
*    endif.

    if sy-subrc = 0.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""Forma antigua""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        "read table lt_flights into data(ls_flight) with key city = 'Berlin'.       "Trae la primera que encuentre con el valor seleccionado
                                                                                    "dentro del campo key

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""Forma moderna""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    data(ls_flight) = lt_flights[ city = 'Berlin' ]-airport_id.
*    data(ls_flight) = lt_flights[ city = 'Berlin' ]-city.      "si quieres otro campo
*    data(ls_flight) = lt_flights[ city = 'Berlin' ].           "O dejarlo así, sin especificar campo
                                                                "Puedes meter un campo lt_airport-id = lt_flights en una estructura

                                                                "con un guión en el campo, indicándolo, la declaración se convierte en una variable, un valor
                                                                "tipo individual = variable - tipo complejo = estructura

    out->write( ls_flight ).

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


    endif.

    """"""""""""""""""""READ TABLE""""""""""""""""""""

    data lt_flight_sort type sorted table of /dmo/airport with non-unique key airport_id.       "Las tablas sorted necesitan al declararse el campo clave

                                                                                                "Si conoces campo clave e identificador, select?
                                                                                                "Ver qué usar y qué te sirve, qué te saca

                                                                                                "el read te saca una estructura de una tabla, no un valor


    select from /dmo/airport
    fields *
    into table @lt_flight_sort.

    "Forma antigua

    if sy-subrc = 0.

    read table lt_flight_sort into data(ls_flight2) with table key airport_id = 'LAS'.
        out->write( ls_flight ).


    "Forma moderna

    data(ls_flight3) = lt_flight_sort[ key primary_key airport_id = 'LAS' ].

    endif.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                      "Ejercicios de filtraciones de bases de datos"

    "Para la tabla de datos /dmo/airport:

    """"""""""""Apartado 1
    "Extraer todos los registros del campo country 'UK'

    select from /dmo/airport            "Selección de tabla estándar de SAP de los datos con condición
    fields *
    where country = 'UK'
    into table @data(lt_ejercicio).     "Creación de una tabla donde volcar los datos

    out->write( | | ).
    out->write( 'Apartado 1' ).
    out->write( lt_ejercicio ).

    """"""""""""Apartado 2
    "Extraer únicamente el nombre (campo nombre) asociado a LGW del campo airport_id

    data(ls_ejercicio) = lt_ejercicio[ airport_id = 'LGW' ]-name.       "Se crea una estructura donde volcará la filtración

*    read table lt_ejercicio into data(ls_ejercicio)

    out->write( | | ).
    out->write( 'Apartado 2' ).
    out->write( ls_ejercicio ).

    """"""""""""Apartado 3
    "Extraer con la tabla sorted todos los registros donde country sea igual a IT

    data lt_ejercicio_sorted type sorted table of /dmo/airport with unique key airport_id.        "Se crea la tabla sorted

    select from /dmo/airport            "Realizamos una selección para volcarla en la nueva tabla
    fields *
    where country = 'IT'
    into table @lt_ejercicio_sorted.

    out->write( | | ).
    out->write( 'Apartado 3' ).
    out->write( 'Visualización de tabla sorted' ).
    out->write( lt_ejercicio_sorted ).

*    read table lt_ejercicio_sort into data(ls_ejercicio2) with table key country = 'IT'.
*        out->write( ls_flight ).

    data(ls_ejercicio2) = lt_ejercicio_sorted[ country = 'IT' ].

*    DATA(ls_fin) = FILTER #( lt_ejercicio_sort WHERE country = 'IT' ).

    out->write( | | ).






    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

                                                    "Chequeo de datos"

    "data lt_Flight_standar type table of /dmo/flight

*    select from /dmo/flight
*    fields *
*    where carrier_id = 'LH'
*    into table @data(lt_flight_Standar).        "falta comentar



*    read table lt_flight_standar with key connection_id = '0403' transporting no fields.    "transporting no field es
*                                                                                            "para que no te lleve
*                                                                                            "ningún dato a la tabla
*
*    if sy-subrc = 0.                                    "Seguro para que, si no encuentra el valor dado,
*                                                        "no reviente el programa
*        out->write( 'El vuelo existe en la BD' ).
*
*    else.
*
*        out->write( 'El vuelo no existe en la BD' ).
*
*    endif.



""""""""Cómo obtener el índice de un campo"""""""""""""""

*    if sy-subrc = 0.
*
*    "Se crea una variable, para luego visualizarla, donde
*        data(lv_index) = line_index( lt_flight_standar[ connection_id = '0322' ] ).
*        out->write( lv_index ).
*
*    endif.

"diferente seleción con loop at
    select from /dmo/flight
    fields *
    into table @data(lt_flight_standar).

*    loop at lt_flight_standar into data(ls_vuelo) where connection_id = '0015'.     "Recorre la tabla y almacena
                                                                                    "la información sólo cuando
                                                                                    "salte el valor indicado
                                                                                    "Como con el select

*    out->write( ls_vuelo ).

*    endloop.


"Otra forma para hacer una selección de datos

    select from /dmo/flight
    fields *
    where carrier_id eq 'LH'
    into table @data(lt_vuelos).

    select carrier_id, connection_id, flight_date "as aaaaa"    "inserta en una tabla sólo los campos seleccionados
                                                                "puedes poner los campos como alias
    from @lt_vuelos as lt                                       "lt es un alias, como poner un mote a las cosas

    into table @data(lt_copia).


"Nos vamos a casa a las 14, quien se quiera quedar para repasar lo visto hoy perfecto"
"Repaso de hoy es para ejercicio viernes y hoy el de extraer registros"



  ENDMETHOD.
ENDCLASS.
