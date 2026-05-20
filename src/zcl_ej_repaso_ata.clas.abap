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

    """""""""""""""""""""""""""""""""""""""Ejercicio 1."""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
    out->write( | | ).

    out->write( |Este es el número generado: { lv_num_ap1_random }.| ).


    "Determinamos si es par o impar
    "Usamos la instancia if para preguntar si es par o impar

    if lv_num_ap1_random mod 2 = 0.                        "se pregunta al programa si el valor de la variable
       out->write( |{ lv_num_ap1_random } es par.  | ).    "dividido entre 2, da 0, resultando siempre par
       else.                                               "|
       out->write( |{ lv_num_ap1_random } es impar.| ).    "Y que, según el resultado, imprima uno u otro mensaje
    endif.

    out->write( | | ).
    out->write( 'Fin del ejercicio 1' ).


    out->write( | | ).
    out->write( '"""""""""""""""""""""""""""""""""""""""""""""""""""""' ).
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( '"""""""""""""""""""""""""""""""""""""""""""""""""""""' ).
    out->write( | | ).


    """""""""""""""""""""""""""""""""""""""Ejercicio 2."""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Pedir el mayor de tres números.

    "Vamos a crear tres variables random para que actúen como los valores a usar

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
    out->write( | | ).

    out->write( |Este es el primer  número generado:     { lv_num_ap2_random }.  | ).
    out->write( |Este es el segundo número generado:     { lv_num2_ap2_random }. | ).
    out->write( |Este es el tercer  número generado:     { lv_num3_ap2_random }. | ).


    "Lógica que usaré para indicar el mayor dentro de tres números - mejorable

    if lv_num_ap2_random > lv_num2_ap2_random.                              "Pregunta si el primer número es mayor que el segundo
                                                                            "|
       if lv_num_ap2_random > lv_num3_ap2_random.                           "Si así es, preguntar una comparativa con el tercero
            out->write( |El número mayor es { lv_num_ap2_random }  | ).     "|
            else.                                                           "De no ser así, imprimiría la siguiente línea
            out->write( |El número mayor es { lv_num3_ap2_random } | ).     "|
       endif.                                                               "|
                                                                            "|
      else.                                                                 "|
                                                                            "|
      if lv_num2_ap2_random > lv_num3_ap2_random.                           "De no ser posible la segunda pregunta, entraría en esta alternativa
           out->write( |El número mayor es { lv_num2_ap2_random }  | ).     "|
           else.                                                            "En el caso de no ser cierta, imprime la próxima línea
           out->write( |El número mayor es { lv_num3_ap2_random }  | ).     "|
      endif.                                                                "|
                                                                            "|
    endif.                                                                  "Termina la lógica

    out->write( | | ).
    out->write( 'Fin del ejercicio 2' ).


    out->write( | | ).
    out->write( '"""""""""""""""""""""""""""""""""""""""""""""""""""""' ).
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( '"""""""""""""""""""""""""""""""""""""""""""""""""""""' ).
    out->write( | | ).


    """""""""""""""""""""""""""""""""""""""Ejercicio 3."""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Crea una tabla de multiplicar.

    "Vamos a crear la tabla de multiplicar del 7

    data lv_numtabla        type i value 7.                        "Variable que contenga el valor que se multiplicará
    data lv_numtabla_alt    type i.                                "















  ENDMETHOD.

ENDCLASS.
