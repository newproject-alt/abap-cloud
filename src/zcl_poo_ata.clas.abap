CLASS zcl_poo_ata DEFINITION
  PUBLIC


  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    data lv_nombre type string.     "atributos
    data lv_color type string.      "atributos

        methods: ladrar         returning value(rv_Accion) type string. "metodo/funcion
        methods: lanzar_pelota  returning value(rv_Accion) type string. "metodo/funcion
        methods: dormir         returning value(rv_Accion) type string. "metodo/funcion


        methods: carga_datos    returning value(rv_Accion) type string.
        methods: id_exponencial returning value(rv_Accion) type string.
        methods: random         returning value(rv_Accion) type string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_poo_ata IMPLEMENTATION.


  METHOD ladrar.
                rv_accion = |{ lv_nombre } de color { lv_color } dice: Guau guau.|.
  ENDMETHOD.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  METHOD lanzar_pelota.
                rv_accion = |{ lv_nombre } de color { lv_color } corre a por la pelota.|.
  ENDMETHOD.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  METHOD dormir.
                rv_accion = |{ lv_nombre } de color { lv_color } se queda dormido.| .
  ENDMETHOD.

  METHOD carga_datos.


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

    loop at lt_lista into data(lv_lista).           "loop
        clear ls_alumno.                            "Vacío de estructura para, cada vuelta de loop, que meta
                                                    "nuevos datos para introducirlos en la tabla




        lv_counter = lv_counter + 1.
        ls_alumno-client = sy-mandt.
        ls_alumno-registro = lv_counter.
        ls_alumno-columna = lv_lista.



        append ls_alumno to lt_alumno.

    endloop.

*    SELECT id, nombre FROM ztb_alumnos ORDER BY id INTO TABLE @DATA(lt_bd).
    modify zbd_alumno_ata from table @lt_alumno.


    rv_accion = |Todo en su sitio|.





  ENDMETHOD.

  METHOD id_exponencial.

    select from zbd_alumno_ata          "Indicamos que coja, desde tal base de datos
    fields *                            "todos los campos
    into table @data(lt_alumno).        "y que los introduzca en una tabla creada directamente

    data lv_counter type i.

    read table lt_alumno into data(ls_alumno) index lines( lt_alumno ).
    if sy-subrc = 0.
        lv_counter = ls_alumno-registro.
*        else.
*        lv_counter = 0.
    endif.


    rv_accion = 'Registros exponenciales.'.



  ENDMETHOD.

  METHOD random.

    select from zbd_alumno_ata          "Indicamos que coja, desde tal base de datos
    fields *                            "todos los campos
    into table @data(lt_alumno).        "y que los introduzca en una tabla creada directamente

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

    rv_accion = |Random creado por { lv_color }: { lv_lineas } |.


  ENDMETHOD.

ENDCLASS.
