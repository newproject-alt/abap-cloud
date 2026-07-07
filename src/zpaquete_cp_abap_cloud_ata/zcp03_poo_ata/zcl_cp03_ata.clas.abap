CLASS zcl_cp03_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp03_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    data(lo_manager) = new zcl_flight_manager_ata( ).

lo_manager->zif_flight_manager_ata~add_flight( value #(
                                aerolinea = 'LH' num_vuelo = '0400' origen  = 'FRA' destino = 'JFK' precio = '899.00' ) ).

lo_manager->zif_flight_manager_ata~add_flight( value #(
                                aerolinea = 'IB' num_vuelo = '3740' origen = 'MAD' destino = 'BCN' precio = '120.00' ) ).

lo_manager->zif_flight_manager_ata~add_flight( value #(
                                aerolinea = 'AA' num_vuelo = '0017' origen = 'JFK' destino = 'SFO' precio = '450.50' ) ).

lo_manager->zif_flight_manager_ata~add_flight( value #(
                                aerolinea = 'LH' num_vuelo = '0455' origen = 'FRA' destino = 'MAD' precio = '310.75' ) ).

lo_manager->zif_flight_manager_ata~add_flight( value #(
                                aerolinea = 'SQ' num_vuelo = '0026' origen = 'SIN' destino = 'FRA' precio = '1250.00' ) ).


try.

    lo_manager->zif_flight_manager_ata~add_flight(
      value #(
        aerolinea = 'IB'
        num_vuelo = '9999'
        origen    = 'MAD'
        destino   = 'BCN'
        precio    = -60
      )
    ).

  catch zcx_flight_error_ata into data(lx_error).

*    out->write( lx_error->mensaje ).

endtry.

try.

    lo_manager->zif_flight_manager_ata~add_flight(
      value #(
        aerolinea = 'LH'
        num_vuelo = '0400'
        origen    = 'FRA'
        destino   = 'JFK'
        precio    = 999
      )
    ).

  catch zcx_flight_error_ata into data(lx_error2).

*    out->write( lx_error2->mensaje ).

endtry.

data(lt_lh) = lo_manager->zif_flight_manager_ata~get_flights_by_airline( 'LH' ).

loop at lt_lh into data(ls_vuelo).
*  out->write(
*    |{ ls_vuelo-aerolinea } { ls_vuelo-num_vuelo } { ls_vuelo-origen }-{ ls_vuelo-destino } { ls_vuelo-precio }|
*  ).
endloop.



data(ls_cheapest) = lo_manager->zif_flight_manager_ata~get_cheapest_flight( ).

*out->write(
*  |{ ls_cheapest-aerolinea } { ls_cheapest-num_vuelo } { ls_cheapest-origen }-{ ls_cheapest-destino } { ls_cheapest-precio }|
*).



data(lv_total) = lo_manager->zif_flight_manager_ata~get_total_revenue( ).

*out->write( |Total facturación: { lv_total }| ).


  ENDMETHOD.
ENDCLASS.
