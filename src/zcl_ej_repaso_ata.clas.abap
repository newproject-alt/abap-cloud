CLASS zcl_ej_repaso_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ej_repaso_ata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                    "Ejercicios de repaso de lógica"
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Ejercicio 1.
    "Pide un número y determina si es par o impar.

    "Para ello, habría que crear una variable a la que darle valor,
    "ya sea manual o automático

    "|   "Variable para número generada directamente      |"
    "|   "a la vez que llamo a la función random para     |"
    "|   "generar números aleatorios                      |"

    data(lv_num_ap1_random) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
                                                   min = 1
                                                   max = 100 )->get_next(  ).

    out->write( 'Ejercicio 1' ).                                        "Comienzo de ejercicio 1
    out->write( '"""""""""""' ).

    out->write( |Este es el número generado: { lv_num_ap1_random }.| ).


    "Determinar si es par o impar
    "Usamos la instancia if para preguntar si es par o impar

    if lv_num_ap1_random mod 2 = 0.                        "se pregunta al programa, si el valor de la variable
       out->write( |{ lv_num_ap1_random } es par.  | ).    "dividido entre 2, da 0, resultando siempre par
       else.
       out->write( |{ lv_num_ap1_random } es impar.| ).    "y que, según el resultado, imprima uno u otro mensaje
    endif.
    out->write( 'Fin del ejercicio 1' ).

    out->write( | | ).
    out->write( '"""""""""""""""""""""""""""""""""""""""""""""""""""""' ).
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( '"""""""""""""""""""""""""""""""""""""""""""""""""""""' ).
    out->write( | | ).

    "Ejercicio 2.
    "Pedir el mayor de tres números.

    "|   "Variable para número generada directamente      |"
    "|   "a la vez que llamo a la función random para     |"
    "|   "generar números aleatorios                      |"

    data(lv_num_ap2_random) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )      "Primera variable
                                                   min = 1
                                                   max = 100 )->get_next(  ).


    data(lv_num2_ap2_random) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )     "Segunda variable
                                                   min = 1
                                                   max = 100 )->get_next(  ).

    data(lv_num3_ap2_random) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )     "Tercera variable
                                                   min = 1
                                                   max = 100 )->get_next(  ).

    out->write( 'Ejercicio 2' ).                                                        "Comienzo de ejercicio 2
    out->write( '"""""""""""' ).

    out->write( |Este es el primer  número generado:     { lv_num_ap2_random }.  | ).
    out->write( |Este es el segundo número generado:     { lv_num2_ap2_random }. | ).
    out->write( |Este es el tercer  número generado:     { lv_num3_ap2_random }. | ).


    "Lógica para indicar el mayor dentro de tres números

    if lv_num_ap2_random > lv_num2_ap2_random.

       if lv_num_ap2_random > lv_num3_ap2_random.

            out->write( |El número mayor es { lv_num_ap2_random }  | ).

            else.

            out->write( |El número mayor es { lv_num3_ap2_random } | ).

       endif.

      else.

      if lv_num2_ap2_random > lv_num3_ap2_random.

           out->write( |El número mayor es { lv_num2_ap2_random }  | ).

           else.

           out->write( |El número mayor es { lv_num3_ap2_random }  | ).

      endif.

    endif.
    out->write( 'Fin del ejercicio 2' ).

















  ENDMETHOD.

ENDCLASS.
