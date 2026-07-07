CLASS zcl_ata_flight DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    data:
        carrier_id  type /dmo/carrier_id read-only,
        connection_id type /dmo/connection_id read-only,
        airport_from type /dmo/airport_from_id read-only,
        airport_to type /dmo/airport_to_id read-only.

    methodS:
            constructor
                        importing i_carrier_id      type /dmo/carrier_id
                                  i_connection_id   type /dmo/connection_id
                                  i_plane_type      type /dmo/plane_type_id
                        RAISING   zcx_c_abapd_no_connection.



  PROTECTED SECTION.

  data plane_Type type /dmo/plane_type_id.


  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ata_flight IMPLEMENTATION.
  METHOD constructor.

    "aqui se estaba poniendo me->xxxx y ya campo y valor




*    select from /dmo/connection



  ENDMETHOD.

ENDCLASS.
