CLASS zcl_cp01_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp01_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

""""""""""""""""""""Carga de vuelos en tabla interna"""""""""""""""""""""""

    types:begin of ty_vuelos,
                            aerolinea        type char03,
                            num_vuelo        type numc4,
                            origen           type char03,
                            destino          type char03,
                            precio           type p length 5 decimals 2,
                            plazas_libres    type i,
                            categoria_precio type string,   "Campo para usar comando cond

    end of ty_vuelos.

    data ls_vuelos   type ty_vuelos.

    data lt_vuelos  type standard table of ty_vuelos.

*    insert value #(
*                    aerolinea       = 'LH'
*                    num_vuelo       = 0400
*                    origen          = 'FRA'
*                    destino         = 'JFK'
*                    precio          = 899
*                    plazas_libres   = 15    ) into TABLE lt_vuelos.

    lt_vuelos = value #(

    ( aerolinea       = 'LH'
      num_vuelo       = 0400
      origen          = 'FRA'
      destino         = 'JFK'
      precio          = 899
      plazas_libres   = 15
      )
    ( aerolinea       = 'AA'
      num_vuelo       = 0017
      origen          = 'JFK'
      destino         = 'SFO'
      precio          = '450.50'
      plazas_libres   = 0
      )
    ( aerolinea       = 'IB'
      num_vuelo       = 3740
      origen          = 'MAD'
      destino         = 'BCN'
      precio          = 120
      plazas_libres   = 42
      )
    ( aerolinea       = 'LH'
      num_vuelo       = 0455
      origen          = 'FRA'
      destino         = 'MAD'
      precio          = '310.75'
      plazas_libres   = 8
      )
    ( aerolinea       = 'AA'
      num_vuelo       = 0064
      origen          = 'SFO'
      destino         = 'JFK'
      precio          = 510
      plazas_libres   = 3
      )
    ( aerolinea       = 'IB'
      num_vuelo       = 3950
      origen          = 'BCN'
      destino         = 'LHR'
      precio          = '275.30'
      plazas_libres   = 0
      )
    ( aerolinea       = 'LH'
      num_vuelo       = 2030
      origen          = 'MUC'
      destino         = 'FRA'
      precio          = 95
      plazas_libres   = 60
      )
    ( aerolinea       = 'SQ'
      num_vuelo       = 0026
      origen          = 'SIN'
      destino         = 'FRA'
      precio          = 1250
      plazas_libres   = 5
      )
    ).

*out->write( lt_vuelos ).
*out->write( | | ).

""""""""""""""""""""Tarea 1.1"""""""""""""""


DATA: lt_vuelos_categoria type STANDARD TABLE OF ty_vuelos.


loop at lt_vuelos into ls_vuelos.    "lectura de datos de tabla interna

    ls_vuelos-categoria_precio = cond string(
        when ls_vuelos-precio < 150 then 'Económico'
        when ls_vuelos-precio >= 150 and ls_vuelos-precio < 500 then 'Estándar'
        when ls_vuelos-precio >= 500 and ls_vuelos-precio < 1000 then 'Premium'
        else 'First class'
     ).
append ls_vuelos to lt_vuelos_categoria.
endloop.



*out->write( lt_vuelos_categoria ).


"""""""""""""""""""""""Tarea 1.2""""""""""""""""""""""""""""""""""""""""""""""""
DATA: lt_vuelos_filtro type STANDARD TABLE OF ty_vuelos.

loop at lt_vuelos_categoria into ls_vuelos where
                                        plazas_libres   > 0       and
                                        ( origen        = 'FRA'   or
                                        destino         = 'FRA' ) and
                                        precio          <= 1000.

    insert ls_vuelos into lt_vuelos_filtro index 1.
endloop.

*out->write( lt_vuelos_filtro ).

"""""""""""""""""""""""""""""Tarea 1.3""""""""""""""""""""""""""""""""""""""""""

DATA: lv_codigo         TYPE string,
      lv_destino_minus  TYPE string,
      lv_longitud       TYPE i.

loop at lt_vuelos_filtro into ls_vuelos.

lv_codigo           = |{ ls_vuelos-aerolinea }-{ ls_vuelos-num_vuelo }|.
lv_destino_minus    = to_lower( ls_vuelos-destino ).
lv_longitud         = strlen( lv_codigo ).

*out->write( |{ lv_codigo } { lv_destino_minus } { lv_longitud }| ).
*out->write( | | ).

endloop.

"""""""""""""""""""""""""""""Tarea 1.4"""""""""""""""""""""""""""""""""""""""""
data: lv_precio_max     type p LENGTH 5 decimals 2 value 0,
      lv_precio_min     type p LENGTH 5 decimals 2 value 0,
      lv_suma_precio    type p LENGTH 7 decimals 2 VALUE 0,
      lv_suma_plaza     type i.

    lv_precio_max = ls_vuelos-precio.
    lv_precio_min = ls_vuelos-precio.

loop at lt_vuelos_categoria into ls_vuelos.

    if ls_vuelos-precio > lv_precio_max.
       lv_precio_max    = ls_vuelos-precio.
    endif.

    if ls_vuelos-precio < lv_precio_min.
       lv_precio_min    = ls_vuelos-precio.
    endif.

    lv_suma_precio  += ls_vuelos-precio.
    lv_suma_plaza   += ls_vuelos-plazas_libres.

endloop.

DATA(lv_precio_medio) = round(
                                val  = lv_suma_precio / lines( lt_vuelos_categoria )
                                dec  = 2 ).

out->write( |Suma total de plazas libres: { lv_suma_plaza }| ).
out->write( |Precio medio: { lv_precio_medio }| ).
out->write( |Precio max: { lv_precio_max }| ).
out->write( |Precio min: { lv_precio_min }| ).


  ENDMETHOD.
ENDCLASS.
