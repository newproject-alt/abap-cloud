CLASS zcl_select_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_select_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""
    """Clase de repaso de select y read table"""""
    """"""""""""""""""""""""""""""""""""""""""""""


  select from /dmo/airport
  fields *
  where country = 'US'
  into table @data(lt_vuelos).

  if sy-subrc = 0.

  select from /dmo/airport
  fields *
  where name like 'L%'
  into table @data(lt_vuelos2).

  ENDIF.

*  data(ls_vuelo_filtro) = lt_vuelos[ name ]-name.

OUT->WRITE( |Prueba para lt_vuelo: | ).
out->write( lt_vuelos ).
OUT->WRITE( | | ).
OUT->WRITE( lt_vuelos2 ).



  ENDMETHOD.
ENDCLASS.
