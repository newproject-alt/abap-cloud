CLASS zcl_t_rangos_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_t_rangos_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "sign -> dice si la condición es incluir (I) o excluir (E)
                "I - si la quiero
                "E - si no la quiero

  "option -> dice si el tipo de comparacion
                "EQ -> igual a
                "NE -> diferente a
                "GT -> mayor que
                "LT -> menor que
                "BT -> entre
                "CP -> patron (como un "like")
  "low -> valor min o valor exacto
  "high -> valor maximo (solo se usa con un "entre")

  "imagina una lista de coches y quieres los rojos y azules pero no los amarillos

  "sing                 option          low         high
  "i                    eq              rojo
  "i                    eq              azul
  "e                    eq              amarillo

    "Declarar una tabla de rangos"

    data lr_asientos type range of /dmo/plane_seats_occupied.

*    out->write( 'Write de lr_asientos' ).
*    out->write( lr_asientos ).
*    out->write( | | ).

    "Introducir valores en tabla de rangos

    append value #( sign = 'I' option = 'BT' low = 50 high = 100 ) to lr_asientos.      "quiero vuelos con asientos entre 50 y 100

    append value #( sign = 'I' option = 'EQ' low = 150 ) to lr_asientos.        "se cambio a 141"  "quiero vuelos con 150 asientos

    append value #( sign = 'E' option = 'LT' low = 10 ) to lr_asientos.         "se cambio a 76"   "no quiero vuelos con menos de 10 asientos

    out->write( 'Write de lr_asientos' ).
    out->write( lr_asientos ).
    out->write( | | ).

    "Ya con los datos de filtracion en nuestra tabla de rangos, creamos una tabla normal
    " -Tabla interna standard
    " -Manera tradicional

    data lt_Vuelos type table of /dmo/flight.

    "Hacemos una filtracion a la misma

    select * from /dmo/flight
    where seats_occupied in @lr_asientos            "aquí seleccionamos nuestra tabla de reangos como condicion de filtro
    into table @lt_vuelos.                          "para que lo realice sobre esta tabla

    out->write( 'Write de tabla con filtracion' ).
    out->write( lt_vuelos ).
    out->write( | | ).

    loop at lt_vuelos into data(ls_vuelos).

*if ls_vuelos-carrier_id = 'UA'.
    out->write( 'Write de estructura con filtración de select' ).
    out->write( ls_vuelos ).
    out->write( | | ).
*endif.
    out->write( 'Write de estructura con filtración de select para campo carrier_id' ).
    out->write( ls_vuelos-carrier_id ).
    out->write( | | ).

    out->write( 'Write de estructura con filtración de select para seats_occupied' ).
    out->write( ls_vuelos-seats_occupied ).
    out->write( | | ).

    endloop.





















  ENDMETHOD.
ENDCLASS.
