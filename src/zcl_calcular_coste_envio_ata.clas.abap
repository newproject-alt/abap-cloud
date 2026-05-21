CLASS zcl_calcular_coste_envio_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calcular_coste_envio_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                    "Ejercicio de repaso de lógica, más nivelillo"
            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """""""""""""""""""""""""""""""""""""""Ejercicio 1."""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    data lv_peso type p length 8 decimals 2.
    data lv_zona type string. "value 'A'.  "A, B ó C
    data lv_tipo_cliente type string.       "normal o premium
    data lv_urgente type i.    "1 ó 0
    data lv_peligroso type i.   "1 ó 0

    data lv_coste type p length 8 decimals 2.
    data lv_codigo type string. "value 'OK'


*    if lv_peso <= 0.
*        lv_codigo   = 'PESO INVALIDO'.
*        lv_coste    = 0.
*    endif.
*
*   if lv_zona <> 'A' and lv_zona <> 'B' and lv_zona <> 'C'.
*    if lv_zona <> 'A' or lv_zona <> 'B' or lv_zona <> 'C'.
*       lv_codigo = 'ZONA INVALIDA'.
*       lv_coste = 0.
*
*        if lv_zona = 'A' and lv_urgente = 1 .
*                lv_coste = 0 * '1.5'.
*           else.
*                lv_coste = 0.
*        endif.
*
*        if lv_zona = 'B' and lv_urgente = 1 .
*                lv_coste = 8 * '1.5'.
*           else.
*                lv_coste = 8.
*        endif.
*
*        if lv_zona = 'C' and lv_urgente = 1 .
*                lv_coste = 15 + 30.
*           else.
*                lv_coste = 15.
*        endif.
*    endif.


    """""""""""""""""Apartado 5. Descuento de cliente PREMIUM""""""""""""""

*    if lv_tipo_cliente = ('Premium' and lv_peligroso = 0 or lv_coste <= 200.
*        lv_coste = lv_coste - lv_coste * 20 / 100.
*
*        else.

    lv_tipo_cliente = 'Premium'.
    lv_peligroso = 1.
    lv_coste = 200.

    if lv_tipo_cliente = 'Premium'.

        if lv_peligroso = 0 or lv_coste <= 200.

        lv_coste = lv_coste - ( lv_coste * 20 / 100 ).
        out->write( lv_coste ).

        endif.

    endif.
        out->write( lv_coste ).


*if lv_cliente = 'Premium'.
*  if  lv_danger = abap_true or lv_coste > 200.
*"NOOO se aplica aplica descuento
*  else.
*" se aplica aplica descuento
*  endif.
*endif.
*

if lv_peso <= 0.
endif.













*    if lv_peso <= 5.
*
*        lv_coste = 5.
*
*        elseif lv_peso > 5 and lv_peso <= 20.
*        lv_coste = 12.
*
*        elseif lv_peso > 20 and lv_peso <= 50.
*        lv_coste = 25.
*
*        elseif lv_peso < 50.
*        lv_coste = 25.
*
*    endif.


    """""""""""""""""""""Microejercicio Dani 21-5"""""""
    "Del código que va a pasar, adaptarlo a meter la zona
    "y que tenga sentido

*    data lv_edad type i value 5.
*
*" ofrecer descuento de un 10% a personas entre los 1 -12 años, descuento de del 5% a personas entre 12 - 18 , precio normal a personas entre 18-65
*" descuento del 5% a personas mayores de 65.
*
*
*
*
*
*
*data lv_peso type p LENGTH 8 DECIMALS 2 value 0.
*data lv_zona type string value 'T'. " A , B , C
*data lv_tipo_cliente type string value 'Normal'. " normal premium
*data lv_urgente type i VALUE 1. " 1 o 0
*data lv_peligroso type i VALUE 1. " 1 o 0
*
*DATA lv_coste type  p LENGTH 8 DECIMALS 2.
*DATA lv_codigo type string.
*
*DATA lv_coste_extra type i.
*
*
*
*
*
*
*
*if lv_peso <= 0.
*
*    lv_codigo = 'PESO INVALIDO'.
*    lv_coste = 0.
*
*
*elseif lv_peso <= 5.
*
*         lv_coste = 5.
*
*elseif lv_peso > 5 and lv_peso <= 20.
*
*         lv_coste = 20.
*
*elseif lv_peso > 20 and lv_peso <= 50.
*
*         lv_coste = 25.
*else.
*
*        lv_coste_extra = lv_peso - 50.
*        lv_coste = 25 + lv_coste_extra.
*
*endif.
*out->write( lv_coste ).
*
*
*
*
*
*
*if lv_zona <> 'A' or lv_zona <> 'B' or lv_zona <> 'C'.
*
*    lv_coste = 0.
*    lv_codigo = 'PESO INVALIDO'.
*
*
*
*
*
*ENDIF.
*
*
*
* if lv_zona = 'A'.
*       if lv_urgente = 1 .
*            lv_coste = 0 * '1.5'.
*       else.
*            lv_coste = 0.
*
*       endif.
*
*   elseif lv_zona = 'B'.
*
*        if lv_urgente = 1 .
*            lv_coste = 8 * '1.5'.
*        else.
*            lv_coste = 8.
*        endif.
*
*   ELSEif lv_zona = 'C' .
*
*       if lv_urgente = 1 .
*
*            lv_coste = 15 + 30.
*       else.
*            lv_coste = 15.
*
*       endif.
* endif.
*
*
*
*
*
*
*
*
**types: BEGIN OF ty_cliente,
**       nombre TYPE string,
**       edad TYPE i,
**       telefono TYPE string,
**       correo TYPE string,
**
**END of TY_cliente.
**
**DATA ls_cliente TYPE ty_cliente.
**
**if lv_nombre = 'daniel'.
**
**    ls_cliente-nombre = 'Daniel'.
**    ls_cliente-edad = 44.
**    ls_cliente-telefono = '+526885555'.
**    ls_cliente-correo = '@@@'.
**
**    lv_nombre = 'juan'.
**
**ENDIF.
**
**
**out->write( ls_cliente ).
**
**
**if lv_nombre = 'juan'.
**
**    ls_cliente-nombre = 'Juan'.
**    ls_cliente-edad = 54.
**    ls_cliente-telefono = '+5268ads85555'.
**    ls_cliente-correo = '@@@'.
**
**ENDIF.
**
**out->write( ls_cliente ).
*





  ENDMETHOD.
ENDCLASS.
