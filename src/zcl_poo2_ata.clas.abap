CLASS zcl_poo2_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_poo2_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  data(lo_perro)    = new zcl_poo_ata(  ).
  data(lo_perro2)   = new zcl_poo_ata(  ).

  data(lo_perro3)   = new zcl_poo_ata(  ).


  if lo_perro is bound.

    lo_perro->lv_nombre = 'Dante'.
    lo_perro->lv_color = 'Rojo'.
    out->write( lo_perro->ladrar(  ) ).
    out->write( | | ).

  endif.


  if lo_perro2 is bound.

    lo_perro2->lv_nombre = 'Paco'.
*    lo_perro2->lv_color = 'Amarillo'.

    out->write( lo_perro2->lanzar_pelota( ) ).
    out->write( lo_perro2->ladrar(  ) ).
    out->write( | | ).

  endif.



  if lo_perro3 is bound.

    lo_perro3->lv_nombre = 'Josejuan'.
    lo_perro3->lv_color = 'Amarillo'.
    out->write( lo_perro->dormir(  ) ).
    out->write( | | ).

  endif.



  ENDMETHOD.
ENDCLASS.
