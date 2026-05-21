CLASS zcl_case_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_case_ata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

"hay 20 niños en la clase
    "4 niños se llaman daniel, 8->ricardo, 6->pedro, 5->fernando, 9->luis


"ahora hay dos daniel con 8
    data lv_edad type i VALUE 8.
    data lv_nombre type string value 'Fernando'.
    DATA lv_pelo type string VALUE 'castaño'.

"if lv_edad = 8

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
        when 9.
            out->write( 'tu pae es luis' ).
        when others.
            out->write( 'whos your father daniel' ).
    endcase.

else.
    out->write( 'no es ningún niño que sea Daniel' ).

endif.


"programar es dividir por bloques, ejs o problms a resolver, extraer valor
"y a variable pa luego usarlo en otras cosillas













  ENDMETHOD.

ENDCLASS.
