CLASS zcl_calculadora_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

    PUBLIC SECTION.

    METHODS:
      sumar IMPORTING num1          TYPE zdecimal_ata
                      num2          TYPE zdecimal_ata
            RETURNING VALUE(result) TYPE zdecimal_ata,

      restar IMPORTING num1          TYPE zdecimal_ata
                       num2          TYPE zdecimal_ata
             RETURNING VALUE(result) TYPE zdecimal_ata,

      multiplicar IMPORTING num1          TYPE zdecimal_ata
                            num2          TYPE zdecimal_ata
                  RETURNING VALUE(result) TYPE zdecimal_ata,

      dividir IMPORTING num1          TYPE zdecimal_ata
                        num2          TYPE zdecimal_ata
              RETURNING VALUE(result) TYPE zdecimal_ata
              RAISING   cx_sy_zerodivide
                        zcx_resultado_no_valido_ata.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calculadora_ata IMPLEMENTATION.

  METHOD sumar.

    result = num1 + num2.

  ENDMETHOD.

  METHOD restar.

    result = num1 - num2.

  ENDMETHOD.

  METHOD multiplicar.

    result = num1 * num2.

  ENDMETHOD.

  METHOD dividir.

    IF num2 = 0.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.

    result = num1 / num2.

    IF result = 100.
      RAISE EXCEPTION NEW zcx_resultado_no_valido_ata( valor = result ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
