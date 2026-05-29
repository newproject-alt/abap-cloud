CLASS zcl_cargar_alumno_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cargar_alumno_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    """"""""""""""""""""""""""""""""""""""""Carga de datos"""""""""""""""""""""""""""""""

  delete from zbd_alumno_ata.                       "Borrada de datos que ya mejor que no, en base datos

  modify zbd_alumno_ata from table @( value #(       "Modificación para introducir valores (prueba) en base datos

           ( client = sy-mandt                       "sy-mandt = palabra reservada para insertar valor específico del mandante client
             registro = 1
             columna = 'Paco Rodríguez' )

           ( client = sy-mandt
             registro = 2
             columna = 'Juan Rodríguez' )

           ( client = sy-mandt
             registro = 3
             columna = 'Esther Rodríguez' )

           ( client = sy-mandt
             registro = 4
             columna = 'Lola Rodríguez' )

           ( client = sy-mandt
             registro = 5
             columna = 'Daniel Rodríguez' )

            ) ).



    select from zbd_alumno_ata          "Indicamos que coja, desde tal base de datos
    fields *                            "todos los campos
    into table @data(lt_alumno).        "y que los introduzca en una tabla creada directamente

    sort lt_alumno by registro ascending.

    out->write( |Tabla generada con volcación de datos (prueba) desde la base:| ).
    out->write( | | ).
    out->write( | | ).
    out->write( lt_alumno ).
    out->write( | | ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """"""""""""""""""""""Introducción de lista de alumnos""""""""""""""""""""""""""""""

    data lv_counter type i.                      "Contador para loop y hacer un incremento del registro

    read table lt_alumno into data(ls_alumno) index lines( lt_alumno ).
    if sy-subrc = 0.
        lv_counter = ls_alumno-registro.
*        else.
*        lv_counter = 0.
    endif.

    data lt_lista type standard table of string.                "Creamos otra tabla donde meter los alumnos
    lt_lista = value #(
      ( |Alba Gómez, Sergio                 | )
      ( |Anangono Tutasig, Karen Denisse    | )
      ( |Ayala Doñas, Alejandro             | )
      ( |Barnes Calancha, Lidia             | )
      ( |Bureo Osuna, Jesús                 | )
      ( |Criado Romero, Samuel              | )
      ( |Delgado Martín, Sarah              | )
      ( |González de la Torre, José Antonio | )
      ( |Maldonado Hernández, Luis          | )
      ( |Moreno Cabrera, María Dolores      | )
      ( |Palacios Canales, Rebeca           | )
      ( |Portillo Moral, Gonzalo            | )
      ( |Prados Donaire, Miguel             | )
      ( |Rojas Moreno, Antonio              | )
      ( |Ruiz Rodríguez, Antonia            | )
      ( |Sillero Fernández, David           | )
      ( |Torres Albillo, Adrián             | )
      ( |Vela Martínez, Rafael              | )
      ( |Hermanísimo, El                    | ) ).

    out->write( |Tabla generada con la lista de alumnos, para volcarla a la base de datos:| ).
    out->write( | | ).
    out->write( | | ).
    out->write( lt_lista ).
    out->write( | | ).


    loop at lt_lista into data(lv_lista).           "loop
        clear ls_alumno.                            "Vacío de estructura para, cada vuelta de loop, que meta
                                                    "nuevos datos para introducirlos en la tabla

        out->write( |Estructura para la insercción de alumnos a la tabla, primer paso: limpieza| ).
        out->write( | | ).
        out->write( | | ).
        out->write( | Aquí debería aparecer la estructura | ).
        out->write( ls_alumno ).
        out->write( | -------------- | ).
        out->write( | | ).


        lv_counter = lv_counter + 1.
        ls_alumno-client = sy-mandt.
        ls_alumno-registro = lv_counter.
        ls_alumno-columna = lv_lista.

        out->write( |Estructura para la insercción de alumnos a la tabla, segundo paso: insercción| ).
        out->write( | | ).
        out->write( | | ).
        out->write( ls_alumno ).
        out->write( | | ).

        append ls_alumno to lt_alumno.

    endloop.

*    SELECT id, nombre FROM ztb_alumnos ORDER BY id INTO TABLE @DATA(lt_bd).
    modify zbd_alumno_ata from table @lt_alumno.

    out->write( |Tabla generada con la lista de alumnos, ya volcada a la base de datos:| ).
    out->write( | | ).
    out->write( | | ).
    out->write( lt_alumno ).
    out->write( | | ).

    """""""""""""""""""""""""""""""""""Extracción de registro al azar"""""""""""""""""""""""""



    data(lv_lineas) = lines( lt_alumno ).
*    data lv_random type string.
    data(lv_random) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
                                            min = 1
                                            max = lv_lineas )->get_next(  ).


    """""""""""""""""Copiada"""""""""""""""""""""""""""
*    data lv_random_id type i.
*
*    lv_random_id = lv_random->get_next( ).

    SELECT SINGLE * FROM zbd_alumno_ata
      WHERE registro = @lv_random
      INTO @data(ls_alumno_extraccion).

    out->write( |--- PARTE 2: EXTRACCIÓN ALEATORIA ---| ).
    out->write( |Número aleatorio generado (1..{ lv_lineas }): { lv_random }| ).
    out->write( |Alumno seleccionado: { ls_alumno_extraccion-registro } - { ls_alumno_extraccion-columna }| ).






"""""""""""""""""""""""""""""""""KK"""""""""""""""""""""""""""""""""""
*
*
*    insert

*
*    data lv_Alumno type string.
*    lv_Alumno = 'luis'.
*
*    select count( * )
*    from zbd_alumno_Ata
*    into @data(lv_total).
*
*    data(lv_id) = lv_total + 1.
*
*    insert zbd_alumno_Ata from @ls_Alumno.
*
**    data lv_contador type abap.int8 value 1.
**
**    data lt_nombres type standard table of abap.char(85).
**    lt_nombres = value #(
**    ( 'Juanes' )
**    ( 'Pacas' )
**    ( 'Pecas' )
**    ( 'Peque' )
**     ).
*
*    data lv_contador type abap.int8 value 1.
*
*     loop at lt_nombres into data(lv_nombre).
*     clear ls_alumno.
*     ls_alumno-client = sy-mandt.
*     ls_alumno-registro = lv_contador.
*     ls_alumno-columna = lv_nombre.
*
*     append ls_alumno to lt_alumno.
*
*     lv_contador = lv_contador + 1.
*
*
*
*     endloop.
*
*     insert zbd_alumno_ata from table @lt_alumno.
*
*     data lv_registro type abap.int8..
*
*     data(lv_lineas) = lines( lt_alumno ).
*
*     lv_registro = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
*                                    min = 1
*                                    max = lv_lineas )->get_next(  ).
*
*
*







*
*    loop at lt_empleado into data(ls_empleado).
*
*    out->write( zbd_e_alumno_Ata ).

*    loop at zb


    " Extensión del ejercicio pos añadir alumno nuevo y generar id

*    data ls_alumno type zbd_alumno_Ata.
**    data lt_alumno type standard table of zbd_alumno_Ata.

*    data lv_nuevo type string value 'Joni'.

*    data(lv_total) = lines(lt_alumno).

*    data lv_id type i.
*    lv_id = lv_total + 1.

*
*   select * from zbd_alumno_Ata
*   into table @data(lt_alumno).

*    insert zbd_alumno_ata from @lv_nuevo.

*    loop at zbd_alumno_Ata into data(lv_nombre).

*
""""""""""""""""""""""""""""""""""""""""""""""""""""
"lo de dani.

"subida individual de registros

*data lv_nuevo_nombre type string value 'juan'.
*data lv_check type i value 0.
*
*select from zbd_Alumno_Ata
*fields *
*into table @data(lv_Existe).
*
*loop at lv_Existe into data(ls_nueva).
*
*if ls_nueva-nombre = ls_nueva-nombre.
*lv_check = 1.
*
*endif.
*
*endloop.
*
*if lv_check = 0.
*select count(*) from zbd_alumno_Ata into @data(lv_count2).
*
*lv_id = lv_count2 + 1.
*insert base from bllblb id = lv_id nombre = lv_nuevo_nombre









* loop at lt_nueva into ls_nueva.
* if ls_nueva-nombre = lv_nuevo-nombre.

*else.
*

*endif.
*endloop.

*if lv_Var = 1.
*select count










  ENDMETHOD.
ENDCLASS.
