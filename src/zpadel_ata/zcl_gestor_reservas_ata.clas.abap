CLASS zcl_gestor_reservas_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    methods:
        reservar_pista
                        importing i_hora            type i
                                  i_num_jugadores   type i
                                  i_nombre_pista    type string
                        returning value(r_mensaje)  type string
*                        por aqui me he quedado, nada de returning value por mi parte
                        raising   zcl_reserva_no_valida_ata.            "me he equivocado en el nombre - deberia ser zcx

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gestor_reservas_ata IMPLEMENTATION.
  METHOD reservar_pista.

    "solucion separada

*    if i_hora < 8. "and > 23. fallos me daba porque es:
*    if i_hora < 8 and i_hora > 23.
*        raise exception type zcl_reserva_no_valida_ata "no new como tenia puesto - raise expection new
*                        exporting
*                                hora = i_hora
*                                i_motivo = '*Horario fuera de servicio*'.
*    endif.

*     if i_num_jugadores <> 4. "> 4.
*        raise exception type zcl_reserva_no_valida_ata
*                        exporting
*                                num_jug = i_num_jugadores
*                                i_motivo = '*Aforo de jugadores incorrecto*'.
*    endif.

*     if i_nombre_pista = 'PISTA_1'.
*        raise exception type zcl_reserva_no_valida_ata
*                        exporting
*                                nom_pista = i_nombre_pista
*                                i_motivo = '*Pista no disponible*'.
*    endif.

    "solucion conjunta

    if ( i_hora < 8 or i_hora > 23 ) or i_num_jugadores <> 4 or i_nombre_pista = 'PISTA_1'.
        raise exception type zcl_reserva_no_valida_ata
                        exporting
                                hora        = i_hora
                                num_jug     = i_num_jugadores
                                nom_pista   = i_nombre_pista
                                motivo      = '*Horario fuera de servicio*'.
    endif.

    r_mensaje = 'Reserva realizada'.

  ENDMETHOD.

ENDCLASS.
