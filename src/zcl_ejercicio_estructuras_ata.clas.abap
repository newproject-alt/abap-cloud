
CLASS zcl_ejercicio_estructuras_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejercicio_estructuras_ata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    """""""""""""Ejercicio de práctica; estructuras""""""""""""""""""""""""""

    "En una aerolínea internacional, gestionamos y organizamos la información de vuelos y aeropuertos"
    "Necesitamos una estructura para almacenar y manipular información de vuelos, aerolíneas y conexiones"
    "Vamos a usar out->write para imprimir por consola los resultados"

    types: begin of ty_flights,                             "Se crea el tipo
           iduser       type zde_ej_estructura_iduser_ata,  "personalizado para la estructura, ty_flights"
           aircode      type /dmo/carrier_id,
           flightnum    type /dmo/connection_id,
           key          type land1,
           seat         type /dmo/plane_seats_occupied,
           flightdate   type /dmo/flight_date,

    end of ty_flights.

    types: begin of ty_airlines,                             "Se crea el segundo tipo
           carrid      type /dmo/carrier_id,                 "personalizado para la estructura, ty_airlines"
           connid      type /dmo/connection_id,
           countryfr   type land1,
           cityfrom    type /dmo/city,
           airpfrom    type /dmo/airport_id,
           countryto   type land1,

    end of ty_airlines.

   types: begin of ty_nested,                               "Se crea un tercer tipo
           vuelos      type ty_flights,                     "personalizado para la estructura, ty_nested"
           aerolineas  type ty_airlines,                    "Este tiene la particularidad que contiene
                                                            "los campos vuelos y aerolíneas con los
    end of ty_nested.                                       "tipos anteriormente creados"

data ls_ejemplo type ty_nested.

out->write( ls_ejemplo ).

*    data ls_conexion type
*
*                                        iduser      = '666600601'
*                                        aircode     = 333
*                                        flightnum   = 4589392
*                                        key         = 'SPA'
*                                        seat        = 2020
*                                        flightdate  = '20210101'
*
*                                        carrid      = 603
*                                        connid      = 6585739
*                                        countryfr   = 'SPA'
*                                        cityfrom    = 'Madrid'
*                                        airpfrom    = '101'
*                                        countryto   = 'ALE'
*                                        ).









  ENDMETHOD.

ENDCLASS.
