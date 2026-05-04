CLASS zclase_4mayo_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun. "Para preparar entorno, puedes hacer ctrl+espacio
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclase_4mayo_ata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Sentencia case, igual casi al if pero hacer una pregunta o dstintas a la = variable"

DATA lv_operacion   type string VALUE '-'   .    ""si vas a hacer varias variables, :"
DATA lv_num1        type i      value 2     .
DATA lv_num2        type i      value 3     .
DATA lv_resultado   TYPE i.

    case lv_operacion.

            when '-'.
            lv_resultado = lv_num1 - lv_num2. "primero el resultado y luego los valores, al reves que en mates"
*                out->write( 'Esto es una resta.'                ).
                out->write( | esto es una resta de resultado { lv_resultado } y toma un valor { lv_num1 } | ).
            when '+'.
            lv_resultado = lv_num1 + lv_num2.
*                out->write( 'Esto es una suma.'                 ).
                out->write( lv_resultado ).
            when '*'.
            lv_resultado = lv_num1 * lv_num2.
*                out->write( 'Esto es una multiplicación.'       ).
                out->write( lv_resultado ).
            when '/'.
            lv_resultado = lv_num1 / lv_num2.
*                out->write( 'Esto es una división.'             ).
                out->write( lv_resultado ).
            when others.
                out->write( 'Error: operación no contemplada.'  ).

    endcase.


"el proximo dia una sentencia de numero aleatorio


  ENDMETHOD.

ENDCLASS.
