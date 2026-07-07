CLASS zcl_prueba_certf_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_prueba_certf_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    data(lo_conexion) = new zcl_ata_connections(  ).

*    if lo_conexion is bound.
*
*        lo_conexion->get_connections(
*                                    EXPORTING
*                                            i_departure = 'SFO'
*                                    ).
*
*
*
*    endif.


*    out->write( lo_conexion->get_connections( i_departure = 'JFK' ) ).
*    pa escribir por consola el resultado del objeto
*    llamando al metodo, se pone en la misma consola supg


*    estaba poniendo - ni idea - el out dentro del if?









*                               -------------------------------------------
try.
*data(lo_vuelo) = new zcl_ata_flight(
*                                    i_carrier_id = 'AA'
*                                    i_connection_id = 0001
*                                    i_plane_type = 'A320-200'
*                                    ).

data(lo_vuelo) = new zcl_ata_passenger_flight(
                                                i_carrier_id = 'AA'
                                                i_connection_id = 0001
                                                i_plane_type = 'A320-200'
                                                ).


out->write( 'OK' ).

catch zcx_c_abapd_no_connection.
    out->write( 'No flight found' ).
*    exit.   "no return como la ia decia - aunque hace lo mismo aqui
endtry.

*out->write( lo_vuelo-> )     aqui iba un out write, y encima otro try diferente ni idea de cual






  ENDMETHOD.
ENDCLASS.
