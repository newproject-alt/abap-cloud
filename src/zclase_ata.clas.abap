CLASS zclase_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
       INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclase_ata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    data lv_edad2 type i.
*    "ejemplo"
*
*
*
*    Data lv_name type string.
*
*    lv_name = 'hola'.
*
*    DATA: lv_namex TYPE string.  "qué ocurre"
*
*    lv_namex = 'Adri'.
*
*    DATA lv_name2 TYPE string value 'PEDRO'.
*
*    "Forma moderna"
*
*    data(lv_name3) = 'Sara'.
*
*    "creación de variable forma i"
*
*    DATA lv_edad type i value 10.
*
*
*    lv_edad2 = 10.
*
*
*    DATA lv_name6 type string.
*
*    lv_name = 'Dani'.
*
*    lv_name = 'Sara'.
*
*out->write( lv_name ).
*
*
*    DATA lv_num1 TYPE i VALUE 2.
*    DATA lv_num2 TYPE i VALUE 1.
*
*    DATA lv_resultado TYPE i.
*
*    lv_resultado = lv_num1 + lv_num2.
*
*out->write( lv_resultado ).
*
*"constantes ejemplos"
*
*    DATA lv_num3 TYPE i VALUE 2.
*    DATA lv_num4 TYPE i VALUE 1.
*    constants lc_num TYPE i value 3.
*
*    DATA lv_resultado2 TYPE i. "míralo"
*
*    lv_resultado2 = lv_num3 + lv_num4.
*
*
*
*
*"lógica"
*
*
*    DATA lv_name10 type string value 'B'.
*
*    if lv_name10 = 'A'.
*        out->write( 'hola A' ).
*
*    elseif lv_name10 = 'B'.
*        out->write( 'hola nuevo' ).
*        else.
*        out->write( 'who' ).
*    endif.
*        out->write( 'tontooo' ).
*
*
*
*        "case"
*
*    DATA lv_edad3 type i VALUE 10.
*
*    case lv_edad3.
*        when 10.
*            out->write( 'bobo' ).
*        when 20.
*            out->write( 'ja' ).
*        when 30.
*            out->write( 'je' ).
*        when others.
*            out->write( 'nada' ).
*
*    endcase.
*
*
*    DATA lv_do TYPE i VALUE 5.
*    DATA lv_num TYPE i VALUE 1.
*        "do 5 times".
*    do lv_do times.
*
*       lv_num = lv_num + 1.
*       out->write( lv_num ).
*
*    enddo.
*
*
*
*








  ENDMETHOD.

ENDCLASS.
