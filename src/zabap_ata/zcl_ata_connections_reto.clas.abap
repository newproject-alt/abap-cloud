CLASS zcl_ata_connections_reto DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  methods: get_connections  importing       i_departure     type /dmo/airport_from_id
                            RETURNING VALUE(r_connections)  type zcert_connections.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ata_connections_reto IMPLEMENTATION.

  METHOD get_connections.

*  CASO_03_B_leerr&crearLISTA.docx

    select  carrier_id,
            airport_from_id,
            airport_to_id,
            '-' as airport_via_id
    from /dmo/connection
    where airport_from_id = @i_departure
    into table @r_connections.

    select from /dmo/connection as c1
     inner join /dmo/connection as c2

                on c1~carrier_id = c2~carrier_id
*                obliga a que sea la misma aerolínea

                and
*                la llegada del primer vuelo es la salida del segundo
                   c1~airport_to_id = c2~airport_from_id
                and
*                la salida del primer vuelo no es la llegada del segundo
                   c1~airport_from_id <> c2~airport_to_id

    fields  c1~carrier_id,
            c1~airport_from_id,
            c2~airport_to_id,
            c1~airport_to_id as airport_via_id
            where c1~airport_from_id = @i_departure
    appending table @r_connections.












  ENDMETHOD.

ENDCLASS.
