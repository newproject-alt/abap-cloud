CLASS zcl_probar_reservas_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_probar_reservas_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_reservas) = new zcl_gestor_reservas_ata(  ).

*    lo_reservas->reservar_pista( exporting "no es obligatorio el exporting
*                                i_hora = 10
*                                i_nombre_pista = 'PISTA_2'
*                                i_num_jugadores = 4
*                                ).
*    se puede meter todo esto en un out write

    try.

        out->write( lo_reservas->reservar_pista( exporting
                                                i_hora = 10
                                                i_num_jugadores = 4
                                                i_nombre_pista = 'PISTA_2'
                                                ) ).

    catch zcl_reserva_no_valida_ata into data(lo_excepcion).

        out->write( lo_excepcion->motivo ).

    endtry.

  ENDMETHOD.
ENDCLASS.
