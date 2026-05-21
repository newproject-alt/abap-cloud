CLASS zcl_do_repaso_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_do_repaso_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_num type i VALUE 0.
    data lv_edad type i.
    data lv_nombre type string value 'Fernando'.
    DATA lv_pelo type string VALUE 'castaño'.

*do 5 times.
*            out->write( lv_num ).
*            lv_num = lv_num + 1.
*
*            if lv_num = 3.
*            exit.
*            endif.
*
*        enddo.
*
*        out->write( lv_num ).
*        out->write( 'finde' ).

        "no intenteis llegr sin exp a direct el resultado, tu como el
        "debug


do 5 times.

lv_edad = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
                                    min = 3
                                    max = 15 )->get_next(  ).

out->write( lv_edad ).


if lv_nombre = 'Daniel'.

 CASE lv_edad.
        when 8.
            if lv_pelo = 'castaño'.
                                                    "aqui pense en meter el if lv_name = otra cosa, con luego su else"
            out->write( 'tu pae es ricardo' ).

            else.

            out->write( 'tu pae es gonzalo' ).

            endif.
        when 6.
            out->write( 'tu pae es pedro' ).
        when 5.
            out->write( 'tu pae es pedro' ).
        when 9.
            out->write( 'tu pae es luis' ).
        when others.
            out->write( 'whos your father daniel' ).
            exit.
    endcase.

else.
    out->write( 'no es ningún niño que sea Daniel' ).

endif.

enddo.

*mañana ej con do, case, if etc, y numeros random*

  ENDMETHOD.
ENDCLASS.
