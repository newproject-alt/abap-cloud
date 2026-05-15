CLASS zclase_5mayo_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclase_5mayo_ata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Bucle do"
*
*DATA lv_num         type i value 0.
*DATA lv_contador    type i value 0.
*DATA lv_vueltas type i.
*data(lv_random) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
*                                                   min = 1
*                                                   max = 6 )->get_next(  ).
*
**    data(lv_cliente) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
**                                                   min = 1
**                                                   max = 6 )->get_next(  ).
**        case lv_cliente.
*
**        when 1.
**            out->write( lv_cliente ).
**            out->write( 'Compañía del cliente 1' ).
**        when 2.
**            out->write( lv_cliente ).
**            out->write( 'Compañía del cliente 2' ).
**        when 3.
**            out->write( lv_cliente ).
**            out->write( 'Compañía del cliente 3' ).
**        when others.
**            out->write( lv_cliente ).
**            out->write( 'Compañía del cliente superior al 3' ).
*
**        endcase.
*
**out->write( lv_cliente ).
**lv_cliente = 3.
**
**do lv_cliente times.
**    out->write( lv_contador ).
**    lv_contador = lv_contador + 1.
**
**enddo.
**    out->write( lv_contador ).
**        out->write( 'Fin del programa.' ).
*
*lv_vueltas = 8.
*
*do lv_vueltas times.
*
*    lv_contador = lv_contador + 1.
*    out->write( | Esto es el contador { lv_contador } | ).
*
*    lv_random = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
*                                             min = 1
*                                             max = 6 )->get_next(  ).
*
*    out->write( | Esto es el random { lv_random } | ).
*
*    if lv_random = 5.
*        exit.
*    endif.
*
*enddo.
**    out->write( lv_contador ).
*        out->write( 'Fin del programa.' ).

    "Bucle while"

data lv_num type i value 5.
*data(lv_random) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
*                                                    min = 1
*                                                    max = 6 )->get_next(  ).


while lv_num <= 10.  "puedes hacer bucles infinitos; se vuelve a hacer la misma
                     "pregunta una y otra vez, hasta que no se cumpla requisito
                     "hay condicion de entrada y salida

*    lv_num = lv_num + 1.       "esta linea hace lo mismo que la linea de abajo"
*    lv_num += 1.

    lv_num = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
                                                    min = 1
                                                    max = 11 )->get_next(  ).

    out->write( lv_num ).

endwhile.

     out->write( 'Fin de programa' ).






  ENDMETHOD.

ENDCLASS.
