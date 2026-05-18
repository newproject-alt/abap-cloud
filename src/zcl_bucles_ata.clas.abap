CLASS zcl_bucles_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BUCLES_ATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "Expresión lógica con if, case y do"

    "variables e if"

*    data lv_name type string value 'Daniel'.

    "Primeros ejemplos"

*    if lv_name = 'Daniel'.
*        out->write( 'Hola Daniel' ).
*        "si escribieses solo aqui lv_name = 'Fernan', pues al terminar este if, te escribe los sigs out->write"
*
*    endif.
*
*    lv_name = 'Fernan'.
*
*    if lv_name = 'Fernan'.
*        out->write( 'Hola Fernan' ).
*    endif.


    "Else"

    data lv_name type string value 'Juan'.
    data lv_edad type i value 5.

   if lv_name = 'Daniel'.

    if lv_edad = 5.

        out->write( 'Hola Daniel de 5 años' ).
        else.   "elseif lv_edad = 15.
        out->write( 'Hola Daniel de no 5 años' ).

    endif.

    elseif lv_name = 'Juan'.

        out->write( 'Hola Juan' ).

    else.
        out->write( 'Tú eres...' ).

    endif.




    out->write( 'El programa ha terminado' ).




  ENDMETHOD.
ENDCLASS.
