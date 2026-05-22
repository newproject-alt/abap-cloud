CLASS zcl_bucle_case_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BUCLE_CASE_ATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


   """""""""""""""""""""""""""""""

            "case"

  """""""""""""""""""""""""""""""


*    data(lv_edad) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )       "Declaración de ua variable en línea, forma de que te diga directamente el tipo
*                                                                                        "se usará mucho durante el curso
*                                                 min = 1
*
*                                                 max = 100 )->get_next(  ).

*    data lv_edad type i value 40.

*    case lv_edad.                               "sirve para "
*
*        when 12.
*            out->write( lv_edad ).
*
*        when 18.
*            out->write( lv_edad ).
*
*        when 45.
*            out->write( lv_edad ).

*        when others.
*            out->write( |cualquier otra edad { lv_edad } | ).

*    endcase.

*out->write( 'Fin de programa' ).


    "Crear programa de descuentos y según la edad, que tengan tendrán diferentes descuentos

*    12, adolescentes y mayores de 65

"""""""""""""""""""""""""""""""""/""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Este ha sido mi intento con case

*data lv_descuento type i.           "Variable sin valor aún del descuento
*
*        case lv_edad_cliente.
*
*            when 1 between 12.
*                lv_descuento = 5.
*                out->write( | El cliente de { lv_edad_cliente } tiene un descuento de { lv_descuento } | ).
*
*            when 13 to 18.
*                lv_descuento = 10.
*                out->write( | El cliente de { lv_edad_cliente } tiene un descuento de { lv_descuento } | ).
*
*            when 19 to 65.
*                lv_descuento = 20.
*                out->write( | El cliente de { lv_edad_cliente } tiene un descuento de { lv_descuento } | ).
*
*            when 66 to 100.
*                lv_descuento = 10.
*                out->write( | El cliente de { lv_edad_cliente } tiene un descuento de { lv_descuento } | ).
*
*            when others.
*                lv_descuento = 5.
*                out->write( | El cliente de { lv_edad_cliente } no tiene un descuento en nuestra tienda.  | ).
*
*         endcase.
*                out->write( 'Fin de programa, gracias por comprar' ).
*
*  ENDMETHOD.
*ENDCLASS.
*





"""""""""""""""""""""""""""""""""/""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    data(lv_edad_cliente) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  ) "Declaración de la edad del cliente de manera aleatoria
                                                                                        "a través de una llamada a un programa que lo genere
                                                 min = 1

                                                 max = 100 )->get_next(  ).

    data lv_descuento type i.           "Variable sin valor aún del descuento

        if lv_edad_cliente between 1 and 12.
                lv_descuento = 5.
                out->write( | El cliente de { lv_edad_cliente } tiene un descuento de { lv_descuento } | ).

            elseif lv_edad_cliente between 13 and 18.
                lv_descuento = 10.
                out->write( | El cliente de { lv_edad_cliente } tiene un descuento de { lv_descuento } | ).

            elseif lv_edad_cliente between 19 and 65.
                lv_descuento = 20.
                out->write( | El cliente de { lv_edad_cliente } tiene un descuento de { lv_descuento } | ).

            elseif lv_edad_cliente between 66 and 100.
                lv_descuento = 10.
                out->write( | El cliente de { lv_edad_cliente } tiene un descuento de { lv_descuento } | ).

            else.
*                lv_descuento = 5.
                out->write( | El cliente de { lv_edad_cliente } no tiene un descuento en nuestra tienda.  | ).

         endif.
                out->write( 'Fin de programa, gracias por comprar' ).



"Otro ejemplo, del profesor daniel, del dia 20-5 creo"

*DATA(lv_edad) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
*                                             min  = 1
*                                             max  = 100 )->get_next( ).
*
*DATA lv_precio TYPE i.
*DATA lv_descripcion TYPE string.
*
*" Determinar precio según edad
*IF lv_edad < 12.
*    lv_precio      = 5.
*    lv_descripcion = 'Menor de 12 años'.
*ELSEIF lv_edad >= 13 and lv_edad <= 18 .
*    lv_precio      = 10.
*    lv_descripcion = 'Adolescente (13-18 años)'.
*ELSEIF lv_edad > 18 AND lv_edad <= 65.
*    lv_precio      = 20.
*    lv_descripcion = 'Adulto (18-65 años)'.
*ELSE.
*    lv_precio      = 10.
*    lv_descripcion = 'Mayor de 65 años'.
*ENDIF.
*
*out->write( |Edad: { lv_edad } años| ).
*out->write( |Categoría: { lv_descripcion }| ).
*out->write( |Precio: { lv_precio } €| ).
*out->write( 'fin de programa' ).

  ENDMETHOD.
ENDCLASS.
