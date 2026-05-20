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
    data lv_zona type string value 'A'.  "A, B ó C
    data lv_tipo_cliente type string value 'Normal'.       "normal o premium
    data lv_urgente type i value 1.     "1 ó 0
    data lv_peligroso type i value 1.   "1 ó 0

    data lv_coste type p length 8 decimals 2.
    data lv_codigo type string. "value 'OK'


    if lv_peso <= 0.
        lv_codigo = 'PESO INVALIDO'.
        lv_coste = 0.
    endif.

*   if lv_zona <> 'A' and lv_zona <> 'B' and lv_zona <> 'C'.
    if lv_zona <> 'A' or lv_zona <> 'B' or lv_zona <> 'C'.
       lv_codigo = 'ZONA INVALIDA'.
       lv_coste = 0.
    endif.

    if lv_peso <= 5.

        lv_coste = 5.

        elseif lv_peso > 5 and lv_peso <= 20.
        lv_coste = 12.

        elseif lv_peso > 20 and lv_peso <= 50.
        lv_coste = 25.

        elseif lv_peso < 50.
        lv_coste = 25.

    endif.







  ENDMETHOD.
ENDCLASS.
