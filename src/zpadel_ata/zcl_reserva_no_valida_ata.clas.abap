CLASS zcl_reserva_no_valida_ata DEFINITION
  PUBLIC
  INHERITING FROM cx_no_check   "una de las mas permisivas
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    "cosas dichas por la clase
    "variable motivo - mensaje resultado pista reservada o no

    data motivo     type string. "lo crea?

    METHODS constructor
      IMPORTING
        !textid     LIKE if_t100_message=>t100key OPTIONAL
        !previous   LIKE previous OPTIONAL
*        valor       TYPE i OPTIONAL. - nanai de la china, copiada
        motivo      type string OPTIONAL"<---------------------------- y esto si lo crea arriba?

        hora        type i optional            "pa complicar to
        num_jug     type i optional
        nom_pista   type string optional.

*    DATA valor TYPE i. esto no xd

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_reserva_no_valida_ata IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( "textid = textid
                        previous = previous
                      ).


    " solucion separada

     """""""""""""""Primera forma de respuesta para hora"""""""""""""""""""""""""""""""""""""""""""""
*    if hora is bound.                                           "bound - ligado, un objeto
*        me->motivo = | A las { hora } no se puede reservar |
*    endif.
    """"""""""""""""""""""""""""""""""RESPUESTA"""""""""""""""""""""""""""""""""""""""""""""""""""""
*    if hora is not initial.
*        me->motivo = | A las { hora } no se puede reservar. El horario es de 8 a 23.|.
*    endif.



*    -----------------Formas probadas para jugadores--------------------------------
*    if num_jug is not initial. "no func?
*    if num_jug is supplied. "funciona
*   ---------------------------------RESPUESTA------------------------------------------------
*    if num_jug <> 4.        "funciona...?
*        me->motivo = | Se necesitan 4 jugadores y no { num_jug }.|.
*    endif.



*    if nom_pista is not initial.
*        me->motivo = | La pista { nom_pista } está ocupada.|.
*    endif.
*
*    me->motivo = motivo. "antes de complicar todo


*    clear me->textid.
*    if textid is initial.
*        if_t100_message~t100key = if_t100_message=>default_textid.
*        else.
*        if_t100_message~t100key = textid.
*    endif.

    "solucion conjunta

    if hora < 8 or hora > 23.
        me->motivo = | A las { hora } no se puede reservar. El horario es de 8 a 23.|.
    endif.


    if num_jug <> 4.
        me->motivo = | { me->motivo } Se necesitan 4 jugadores y no { num_jug }.|.
    endif.

    if nom_pista = 'PISTA_1'.
        me->motivo = | { me->motivo } La pista { nom_pista } está ocupada.|.
    endif.


    clear me->textid.
    if textid is initial.
        if_t100_message~t100key = if_t100_message=>default_textid.
        else.
        if_t100_message~t100key = textid.
    endif.


  ENDMETHOD.

ENDCLASS.
