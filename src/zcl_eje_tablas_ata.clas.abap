CLASS zcl_eje_tablas_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_eje_tablas_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  """""""""""""""""Ejercicio 15-5"""""""""""""""""

  types:Begin of ty_empleado,           "Se crea un tipo personalizado para
          nombre    type string,        "la estructura
          edad      type i,
          telefono  type string,
          correo    type string,

    end of ty_empleado.

  data lt_tabla1    type table of ty_empleado.  "Se crea una tabla standard
                                                "usando el tipo anterior

  data lt_tabla2    like lt_tabla1.             "Creamos una segunda tabla standard
                                                "que heredará el tipo y estructura
                                                "de la primera


  "Rellenamos nuestra tabla con la manera más moderna, esta vez de manera manual

  lt_tabla1 = value #(

    ( nombre = 'Paco'  edad = 20 telefono = '+34600601602' correo = 'jdndner@gmail.com' )
    ( nombre = 'Paca'  edad = 28 telefono = '+34294050943' correo = 'pp@goutmail.com'   )
    ( nombre = 'Pecas' edad = 90 telefono = '+33676766667' correo = 'pqs@outlook.es'    )
    ( nombre = 'Peque' edad = 33 telefono = '+34900600693' correo = 'jdndner@gmail.de'  )

     ).

   "Además, vamos a introducir una línea en blanco a la segunda tabla
    insert INITIAL LINE INTO table lt_tabla2.

    insert lines of lt_tabla1 INTO table lt_tabla2. "Metemos de golpe los valores
                                                    "de la tabla 1 a la tabla 2


   "A continuación, añadimos otra nueva línea a la última tabla creada
   append value #(
                  nombre    = 'Pablo'
                  edad      = 5
                  telefono  = '4353'
                  correo    = 'dicsdjcn@fifdn.co' ) to lt_tabla2.

   "Se detectarán el tamaño máximo de registros

   data(lv_nregistros) = lines( lt_tabla2 ).    "Se crea una variable donde
                                                "guardar el valor resultante

   "El valor del número de registros lo asignaremos a la función random
   "para indicarle el máximo valor que deberá tener
   data(lv_nfila) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )         "Declaración de la variable que guardará
                                                                                        "los valores mínimos y máximos de las
                                                 min = 1                                "líneas a extraer

                                                 max = lv_nregistros )->get_next(  ).

   out->write( lv_nregistros ).
   out->write( | | ).

   out->write( lt_tabla1 ).
   out->write( | | ).

   out->write( lt_tabla2 ).
   out->write( | | ).

   out->write( lv_nfila ).












  ENDMETHOD.
ENDCLASS.
