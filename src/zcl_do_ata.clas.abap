CLASS zcl_do_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_do_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

data lv_num type i value 0.

"""""""""""""""""""""""""""""""""""""""""""Bucle do""""""""""""""""""""""""""""""""""

*  data lv_num type i value 0.
*  data lv_repetir type i value 5.
*
*
*  do lv_repetir times.     "para indicar con una variable el nº de veces que repita el bucle"
*
*    do 5 times.
*
*    lv_num = lv_num + 1.            "También se puede poner lv_num += 1 para indicar directamente la operacion"
*
*    out->write( lv_num ).
*
*    if lv_num = 3.
*        exit.
*    endif.
*
*    enddo.
*   out->write( 'Fin de programa ).

"""""""""""""""""""""""""""""""""""""""""""Bucle while"""""""""""""""""""""""""""""""""""

while lv_num < 10.
    lv_num += 1.
    out->write( lv_num ).

    if lv_num = 3.

        exit.       "Para salir/parar terminantemente un bucle

    endif.

endwhile.

out->write( 'Fin de programa' ).



  ENDMETHOD.
ENDCLASS.
