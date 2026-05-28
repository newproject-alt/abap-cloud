CLASS zcl_ej_rangos_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ej_rangos_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  """""""""""""""""""""Ejercicio de tabla de rangos, por claude"""""""""""""""""""""""

  "Creamos tablas de rangos cada una con diferentes condiciones

                                      "tabla de rango para filtrar compañías
*  data: lr_compania     type range of /dmo/flight-carrier_id,
*
*                                      "tabla de rango para filtrar fechas
*        lr_fecha        type range of /dmo/flight-flight_date,
*
*                                      "tabla de rango para filtrar conexiones
**        lr_patron       type range of /dmo/flight-connection_id,
*         lr_patron      type range of string,
*
*                                      "tabla de rango para excluir compañías
*        lr_exclusion    type range of /dmo/flight-carrier_id,
*
*                                      "tabla de rango para filtrar precios
*        lr_precio       type range of /dmo/flight-price.
*
*    "Tarea 1:
*
*  append value #( sign = 'I' option = 'EQ' low = 'AA' ) to lr_compania.
*  append value #( sign = 'I' option = 'EQ' low = 'LH' ) to lr_compania.
*  append value #( sign = 'I' option = 'EQ' low = 'SQ' ) to lr_compania.
*
*    "Tarea 2
*  append value #( sign = 'I' option = 'BT' low = '20250101' high = '20260630' ) to lr_fecha.
*
*    "Tarea 3
*  append value #( sign = 'I' option = 'CP' low = '1*' ) to lr_patron.
*
*    "Tarea 4
*  append value #( sign = 'E' option = 'EQ' low = 'UA' ) to lr_exclusion.
*
*    "Tarea 5
*  append value #( sign = 'I' option = 'GT' low = 100 ) to lr_precio.
*  append value #( sign = 'I' option = 'LT' low = 50 ) to lr_precio.
*
*    "Tarea 6
*  "Filtración a la tabla /Dmo/flight
*
*  data lt_vuelos type table of /dmo/flight.
*
**  select * from /dmo/flight           "*
***  fields carrier_id, connection_id, flight_date, price
**
**  where carrier_id  in @lr_compania
**    and carrier_id  in @lr_exclusion
**    and flight_date in @lr_fecha
**  into table @lt_vuelos.                "into table @DATA(lt_vuelos)
*
*
*    select * from /dmo/flight
*    where connection_id in @lr_patron
*    into table @lt_vuelos.
*
*
*  out->write( lt_vuelos ).
*  out->write( | | ).
*
*  "Conteo de líneas
*  data(lv_registro) = lines( lt_vuelos ).       "Variable donde contener la información
*    out->write( lv_registro ).


    """""""""""""Nuevo ejercicio de DANI: Base de datos con filtro""""""""""""""""""""

*    data l











  ENDMETHOD.
ENDCLASS.
