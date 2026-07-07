CLASS zcl_ej_inner_loin_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ej_inner_loin_01 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""Ejercicio 1"""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""

"Se quiere un catálogo de rutas aéreas para las aerolíneas que usen euros.
"Se necesita saber qué conexiones tiene cada aerolínea y qué distancia tiene cada ruta

"Crea un programa para mostrar el catálogo entero de conexiones - aerolínea (moneda 'EUR')
"Para cada conexión, se mostrará:
"-nombre completo de la aerolínea
"-id de la conexión
"-aeropuertos origen-destino
"-distancia con su unidad


select  car~name,
        con~connection_id,
        con~airport_from_id,
        con~airport_to_id,
        con~distance_unit
from /dmo/carrier                   as car
inner join /dmo/connection          as con
on car~carrier_id = con~carrier_id
where car~currency_code = 'EUR'
into table @data(lt_resultado).

sort lt_resultado by name.

















ENDMETHOD.

ENDCLASS.
