CLASS zcl_filtracion_ejemplo_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_filtracion_ejemplo_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  select from zbd_ejemplo_ata
  fields *
  into table @data(lt_empleado).

  if sy-subrc = 0.

  out->write( 'Tabla con toda la información' ).
  out->write( lt_empleado ).
  out->write( | | ).

  endif.

  loop at lt_empleado into data(ls_empleado) where correo = 'julia@com'.

  if sy-subrc = 0.

  out->write( ls_empleado ).
  out->write( | | ).

  endif.

  endloop.

  if sy-subrc = 0.
    data(lv_index) = line_index( lt_empleado[ correo = 'julia@com' ] ).
    out->write( lv_index ).
  endif.

  data(lv_registro) = lines( lt_empleado ).







  ENDMETHOD.
ENDCLASS.
