INTERFACE zif_flight_manager_ata
  PUBLIC .

    types: begin of ty_vuelo,                           "mismo tipo que caso practico 02
                            aerolinea  TYPE c length 2,
                            num_vuelo  TYPE n length 4,
                            origen     TYPE c length 3,
                            destino    TYPE c length 3,
                            precio     TYPE p length 8 decimals 2,
    end of ty_vuelo.

    types tty_vuelos type standard table of ty_vuelo with empty key.    "Declaracion tipo tabla

    methods add_flight importing is_vuelo type ty_vuelo
                        raising zcx_flight_error_ata.

    methods get_flights_by_airline importing i_aerolinea type ty_vuelo-aerolinea
                    returning
                        VALUE(rt_vuelos) type tty_vuelos.

    methods get_cheapest_flight
                    returning
                        VALUE(rs_vuelo) type ty_vuelo.

    methods get_total_revenue
                    returning
                        VALUE(r_total) type ty_vuelo-precio.


ENDINTERFACE.
