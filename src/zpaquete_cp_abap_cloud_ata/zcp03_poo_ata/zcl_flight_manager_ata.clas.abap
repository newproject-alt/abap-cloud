CLASS zcl_flight_manager_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_flight_manager_ata .

    methods: constructor importing it_vuelos type zif_flight_manager_ata=>tty_vuelos optional.

  PROTECTED SECTION.
  PRIVATE SECTION.

  data lt_vuelos type zif_flight_manager_ata=>tty_vuelos.

ENDCLASS.


CLASS zcl_flight_manager_ata IMPLEMENTATION.

  METHOD zif_flight_manager_ata~add_flight.

    if is_vuelo-precio < 0.
        raise exception new zcx_flight_error_ata(
                                                 i_mensaje = 'Precio de vuelo debe ser positivo.'
                                                ).
    endif.

    read table lt_vuelos
       with key aerolinea  = is_vuelo-aerolinea
                num_vuelo  = is_vuelo-num_vuelo
       transporting no fields.

    if sy-subrc = 0.
        raise exception new zcx_flight_error_ata(
                                                 i_mensaje = 'Ya existe.'
                                                ).
    endif.

    append is_vuelo to lt_vuelos.


  ENDMETHOD.


  METHOD zif_flight_manager_ata~get_cheapest_flight.

    rs_vuelo = reduce zif_flight_manager_ata=>ty_vuelo(
    init ls_min = lt_vuelos[ 1 ]
    for ls_vuelo in lt_vuelos
    next ls_min = cond #(
                            when ls_vuelo-precio < ls_min-precio
                            then ls_vuelo
                            else ls_min )
                    ).

    if lt_vuelos is initial.
            raise exception new zcx_flight_error_ata(
                                                     i_mensaje = 'No existen vuelos.'
                                                    ).
    endif.

  ENDMETHOD.


  METHOD zif_flight_manager_ata~get_flights_by_airline.

    rt_vuelos = value #(
    for ls_vuelo in lt_vuelos
    where ( aerolinea = i_aerolinea )
    ( ls_vuelo )
  ).

  ENDMETHOD.


  METHOD zif_flight_manager_ata~get_total_revenue.

    r_total = reduce #(
  init result = 0
  for ls_vuelo in lt_vuelos
  next result = result + ls_vuelo-precio
).

  ENDMETHOD.


  METHOD constructor.

    if it_vuelos is supplied.
        lt_vuelos = it_vuelos.
    endif.

  ENDMETHOD.

ENDCLASS.
