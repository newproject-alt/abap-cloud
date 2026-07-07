CLASS zcl_ata_connections DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  methods: get_connections  importing       i_departure     type /dmo/airport_from_id
                            RETURNING VALUE(r_connections)  type zcert_connections.
*                            ya habia fallado aqui, con exporting en vez de returning value
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ata_connections IMPLEMENTATION.

  METHOD get_connections.

*       PLANTEAMIENTO ALEX: Vuelos directos e indirectos
*       yo estaba pensando en hacerlo todo en un select, pero ni idea

*    data r_connections type zcert_connections.

    select  carrier_id,
            airport_from_id,
            airport_to_id,
            '-' as airport_via_id
*           solucion de Sara pa vuelos directos
    from /dmo/connection
    where airport_from_id = @i_departure
*    algo de alex para decir que el valor
*    importado es el valor de tal campo

**********************************duda:
*se puede meter desde zcert_Connes el airport_via_id
*con un inner join aqui?


*    as con
*    inner join zcert_connection             as r
*            on con~carrier_id = r~carrier_id
    into table @r_connections.

*    ya esto ni idea pero ni de lejo
    select from /dmo/connection as c1
     inner join /dmo/connection as c2
*     no lo habia pensado meterle dos veces la misma

                on c1~carrier_id = c2~carrier_id
*                obliga a que sea la misma aerolínea - esto si

                and
*                la llegada del primer vuelo es la salida del segundo
                   c1~airport_to_id = c2~airport_from_id
                and
*                la salida del primer vuelo no es la llegada del segundo
                   c1~airport_from_id <> c2~airport_to_id
*    FFFFFFFFFFFFFFFFFFFF
    fields  c1~carrier_id,
            c1~airport_from_id,
            c2~airport_to_id,
            c1~airport_to_id as airport_via_id
            where c1~airport_from_id = @i_departure
    appending table @r_connections.












  ENDMETHOD.

ENDCLASS.
