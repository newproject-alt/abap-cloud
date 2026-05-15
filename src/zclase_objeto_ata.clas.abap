CLASS zclase_objeto_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclase_objeto_ata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    data(lo_perro) = new ZCLASE_POO_ATA(  ).

    out->write( lo_perro ).

*    buena practica, comprobacion

    if lo_perro is bound.

        lo_perro->nombre = 'Adri'.

            out->write( lo_perro->ladrar(  ) ).

        lo_perro->lanzar_pelota(
                                receiving
                                  rv_accion = data(lv_accion)
                                  ).

            out->write( lv_accion ).

    endif.

  ENDMETHOD.

ENDCLASS.
