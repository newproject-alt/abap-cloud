CLASS zcl_obj2_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_obj2_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data(lo_contrato) = new zcl_obj_ata(  ).     "Declaración de un objeto
  data lv_proceso type string.

  data(lo_contrato2) = new zcl_obj_ata(  ).

    if lo_contrato is bound.                     "Comprobación de la correcta creación del objeto

*       lo_contrato->set_cliente(
*                    exporting
*                            iv_cliente      = 'Experis'
*                            iv_localizacion = 'Calle X'         "space
*                    importing
*                            ev_status       = data(lv_status)
*                    changing
*                            cv_proceso      = lv_proceso
*                            ).
*
*        lo_contrato->get_cliente(
*                    importing
*                            ev_cliente      = data(lv_cliente)
*                    ).
*
*        lo_contrato->lv_region = 'EU'.

    endif.


*        if lo_contrato is bound.
*
*        lo_contrato->set_cliente(
*
*            EXPORTING
*                iv_cliente = 'Experis'
*                iv_localizacion = 'calle x '
*            IMPORTING
*                 ev_status =  data(lv_status)
*            CHANGING
*                  cv_proceso = lv_proceso
*             ).
*
*        lo_contrato->get_cliente(
*
*            importing ev_cliente = data(lv_cliente)
*            ).
*
*        lo_contrato->lv_region = 'EU'.
*
*
*
*
*    endif.


    zcl_obj_ata=>lv_moneda = 'USD'.         "Desde una llamada a la clase, sólo puedes ver los atributos estáticos
                                            "Desde una llamada al objeto, puedes llamar a atributos y métodos tanto estáticos como de instancia


*    out->write( | { lo_contrato->lv_moneda }| ).
*    out->write( | { lo_contrato2->lv_moneda }| ).

        "llamada a la clase directamente, a la funcionalidad
*        zcl_obj_Ata=>set_cntr_type( exporting iv_cntr_type = 'Construcción' ).
*        zcl_obj_Ata=>get_cntr_type( importing ev_cntr_type = data(lv_cntr_type) ).

    "Llamada al objeto:     blblblb->
    "Llamada a la fábrica:  nllll=>



    lo_contrato->get_cliente_nombre(
                exporting
                        iv_cliente_id = '01'
                receiving
                        rv_cliente_nombre = data(lv_cliente_nombre)
    ).

    if not lo_contrato->get_cliente_nombre( iv_cliente_id = '01' ) is initial.
        out->write( lo_contrato->get_cliente_nombre( iv_cliente_id = '01' ) ).
    endif.


*        out->write( | { lv_cliente }-{ lv_status }-{ lv_proceso }-{ lo_contrato->lv_region } { lv_cntr_type }| ).







  ENDMETHOD.
ENDCLASS.
