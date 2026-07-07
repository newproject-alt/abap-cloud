CLASS zcl_cp04_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp04_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  """"""""""""""""""""Carga de vuelos en tabla interna"""""""""""""""""""""""

    data ls_reservas type zst_booking_ata.
    data: lt_reservas type ztt_bookings_ata.

lt_reservas = value #(
  ( id_reserva = 1 aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Ana García'    fecha = '20260515' precio = '899.00'  estado = 'A' )
  ( id_reserva = 2 aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Carlos López'  fecha = '20260515' precio = '120.00'  estado = 'A' )
  ( id_reserva = 3 aerolinea = 'AA' num_vuelo = '0017' pasajero = 'John Smith'    fecha = '20260520' precio = '450.50'  estado = 'A' )
  ( id_reserva = 4 aerolinea = 'LH' num_vuelo = '0455' pasajero = 'María Pérez'   fecha = '20260520' precio = '310.75'  estado = 'A' )
  ( id_reserva = 5 aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Pedro Ruiz'    fecha = '20260515' precio = '120.00'  estado = 'C' )
  ( id_reserva = 6 aerolinea = 'SQ' num_vuelo = '0026' pasajero = 'Lisa Tan'      fecha = '20260601' precio = '1250.00' estado = 'A' )
  ( id_reserva = 7 aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Hans Müller'   fecha = '20260515' precio = '899.00'  estado = 'A' )
  ( id_reserva = 8 aerolinea = 'AA' num_vuelo = '0064' pasajero = 'Sarah Jones'   fecha = '20260525' precio = '510.00'  estado = 'A' )
).

*out->write( lt_reservas ).

""""""""""""""""""""""""Tarea 2.1""""""""""""""""""""""""""""""""""""""""""

append value #(
  id_reserva = 9
  aerolinea  = 'IB'
  num_vuelo  = '3950'
  pasajero   = 'Elena Martín'
  fecha      = '20260601'
  precio     = '275.30'
  estado     = 'A'
) to lt_reservas.

append value #(
  id_reserva = 10
  aerolinea  = 'LH'
  num_vuelo  = '2030'
  pasajero   = 'Franz Weber'
  fecha      = '20260610'
  precio     = '95.00'
  estado     = 'A'
) to lt_reservas.

*out->write( lt_reservas ).

""""""""""""""""""""""""Tarea 2.2""""""""""""""""""""""""""""""""""""""""""

loop at lt_reservas into ls_reservas where
                                            id_reserva = 3.
    ls_reservas-precio = 480.
    modify lt_reservas from ls_reservas.
*    out->write( ls_reservas ).
*    out->write( | | ).
endloop.

*out->write( lt_reservas ).
*out->write( | | ).

loop at lt_reservas into ls_reservas where
                                            aerolinea = 'LH'.

    ls_reservas-precio = ls_reservas-precio * '0.90'.
    modify lt_reservas from ls_reservas.
*    out->write( ls_reservas ).
*    out->write( | | ).
endloop.

*out->write( lt_reservas ).

""""""""""""""""""""""""Tarea 2.3""""""""""""""""""""""""""""""""""""""""""

loop at lt_reservas into ls_reservas where
                                            id_reserva = 4.
    ls_reservas-estado = 'C'.
    modify lt_reservas from ls_reservas.

endloop.

*out->write( lt_reservas ).
*out->write( | | ).


data(lv_registros) = lines( lt_reservas ).

loop at lt_reservas into ls_reservas where
                                            estado = 'C'.
    delete lt_reservas index sy-tabix.

endloop.

data(lv_registros_despues) = lines( lt_reservas ).

data(lv_num_reg_eliminados) = lv_registros - lv_registros_despues.


*out->write( lt_reservas ).
*out->write( | | ).
*out->write( | Han sido eliminados: { lv_num_reg_eliminados } registros | ).

""""""""""""""""""""""""Tarea 2.4""""""""""""""""""""""""""""""""""""""""""

read table lt_reservas WITH KEY pasajero = 'Lisa Tan' TRANSPORTING NO FIELDS.

if sy-subrc = 0.

*  out->write( 'Estás de suerte, Lisa Tan.' ).
*  out->write( | | ).
*else.
*  out->write( 'No estás de suerte, Lisa Tan.' ).
*  out->write( | | ).

endif.


read table lt_reservas reference into data(lv_reserva_ref) with key id_reserva = 6.

if sy-subrc = 0.
*  out->write( lv_reserva_ref ).
*  out->write( | | ).
endif.


data(lv_pasajero) = value #(
                            lt_reservas[ id_reserva = 1 ]-pasajero
                            default ''          "Anotación de IA: excepción si no existe ningún registro
                            ).

*out->write( |Pasajero: { lv_pasajero }| ).
*out->write( | | ).

""""""""""""""""""""""""Tarea 2.5""""""""""""""""""""""""""""""""""""""""""
data(lv_reservas) = 0.
data lv_precio_total type p length 8 decimals 2.

loop at lt_reservas into ls_reservas where estado = 'A'
                                     group by ls_reservas-aerolinea into data(ls_grupos).
*                                     group size into data(lv_reservas).

    loop at group ls_grupos into data(ls_aerolinea).

    lv_reservas += 1.
    lv_precio_total += ls_aerolinea-precio.

*    out->write( lv_reservas ).
*    out->write( | | ).
*
*    out->write( lv_precio_total ).
*    out->write( | | ).

    endloop.

DATA(lv_precio_medio) = round(
                                val  = lv_precio_total /  lv_reservas
                                dec  = 2 ).

out->write(
    |Aerolínea: { ls_grupos } | &&
    |Reservas: { lv_reservas } | &&
    |Total: { lv_precio_total } | &&
    |Media: { lv_precio_medio }|
  ).

endloop.


  ENDMETHOD.
ENDCLASS.
