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


"hoy 5 de mayo"

data(lv_cliente) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
                                                    min = 1
                                                    max = 6 )->get_next(  ).
    "Lin 18-20 es para generar un numero generado random llamando a una clase estandar de sap"
*    data(lv_cliente) - "Para indicar variables en línea, puede ser sin indicarle valor"

        case lv_cliente.

        when 1.
            out->write( lv_cliente ).
            out->write( 'Compañía del cliente 1' ).
        when 2.
            out->write( lv_cliente ).
            out->write( 'Compañía del cliente 2' ).
        when 3.
            out->write( lv_cliente ).
            out->write( 'Compañía del cliente 3' ).
        when others.
            out->write( lv_cliente ).
            out->write( 'Compañía del cliente superior al 3' ).

        endcase.


  ENDMETHOD.

ENDCLASS.
