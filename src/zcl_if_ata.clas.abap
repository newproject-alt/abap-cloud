CLASS zcl_if_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_if_ata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* Declarar/crear una variable, con su tipo y valor
* Variable de tipo string
*   DATA lv_name type string value 'Pedro'.

* Variables de tipo i para realizar operaciones
*    data lv_num     type i value 1.
*    data lv_num2    type i value 12.
*
*    data lv_resul   type i.
*    data lv_resul2  type i.
*    data lv_resul3  type i.
*
*
*    lv_resul = lv_num + lv_num2.
*    lv_num = 5.
*
*    lv_resul2 = lv_num + lv_num2.

* Se pueden hacer operaciones con números literales con variables
*    lv_resul3 = 5 + lv_num2.



        """"""""""""""""""""""""""""""""""""""""""""""""""""""
* La constante, la cual no se puede cambiar

*    CONSTANTS lv_num3 type i value 7.
*
*    lv_num2 = 6 + lv_num3.


        """"""""""""""""""""""""""""""""""""""""""""""""""""""

* If, else y elseif; combinaciones de los tres

*    if lv_name = 'Sergio'.
*        out->write( 'Hola pana' ).
*
*        else.
*            out->write( 'who' ).
*
*    endif.
*        out->write( 'Final' ).

* and y or
*DATA lv_nombre type string value 'paco'.
*DATA lv_nombre2 type string value 'sebas'.

*    if lv_nombre = 'paco' or lv_nombre = 'jose'.
*
*    out->write( 'Hola paco o jose' ).

*    if lv_nombre = 'paco' and lv_nombre2 = 'sebas'.
*        out->write( 'Hola paco y sebas' ).
*
*    endif.



* Combinacion de los tres
*    if lv_nombre = 'paco'.
*        out->write( 'Hola pana' ).
*
*       elseif lv_nombre2 = 'Sebas'.
*            out->write( 'Eres Sebas' ).
*       else.
*            out->write( 'dareda' ).
*
*    endif.
*        out->write( 'Final' ).

* If anidado = un if dentro de un if, que se evite si hay algo
* más eficiente


DATA lv_nombre type string value 'paco'.
DATA lv_nombre2 type string value 'toni'.
DATA lv_edad type i value 10.

    if lv_nombre = 'paco'.
        out->write( 'hola paco' ).

        if lv_nombre2 = 'sebas'.
            out->write( 'hola sebas' ).

        endif.

*           out->write( 'hola paco y hola sebas' ).

            if lv_nombre2 = 'toni'.

                if  lv_edad = 10.
                    out->write( 'hola toni de 10 años' ).
                endif.

                if lv_edad = 11.
                    out->write( 'hola toni de 11 años' ).
                endif.

            endif.
                out->write( 'Final?' ).

    endif.
        out->write( 'Final' ).

  ENDMETHOD.

ENDCLASS.
