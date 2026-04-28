CLASS zclase_ata2704tablas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclase_ata2704tablas IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  types:BEGIN OF ty_cliente,
          nombre    TYPE ZDE_CLIENTE_ATA,
          id        TYPE string,
          edad      TYPE i,
          telefono  TYPE string,
          correo    TYPE string,

    end of ty_cliente.

    DATA ls_cliente2j TYPE ty_cliente.

*   primer ejemplo
*    ls_cliente2j-nombre = 'Adri'.
*    ls_cliente2j-edad = 10.
*    ls_cliente2j-telefono = '665665665'.
*    ls_cliente2j-correo = 'holaworld@gmail.com'.

    DATA lt_cliente type TABLE of ty_cliente.


    ls_cliente2j-nombre = 'Adri'.
    ls_cliente2j-edad = 33.
    ls_cliente2j-id = 007.
    ls_cliente2j-telefono = '665665665'.
    ls_cliente2j-correo = 'hola@gmail.com'.

    insert ls_cliente2j into lt_cliente index 1.

* otra manera de hacerlo esto de introduccir datos

    insert value #(
    nombre = 'Adrien'
    edad = 7
    id = 8
    telefono = '665665665'
    correo = 'halaaaa@gmail.com'
     ) into table lt_cliente.

* aquí out write ese

*DATA lt_cliente2 like lt_cliente.
* o en vez de like pos type table of

*insert lines of lt_cliente into table lt_cliente2.
*
*out->write( lt_cliente2 ).

*insert lines of lt_cliente to 1 into table lt_cliente2.
* para copiar hasta X


*otra forma

*insert lines of lt_cliente from 2 to 3 into table lt_cliente2.

* para mirar segun identificador, al revés xq miras los datos
* de tabla en estructura

    loop at lt_cliente into ls_cliente2j.


    endloop.



*    tabla nueva

DATA lt_aeropuerto type table OF /dmo/airport.

lt_aeropuerto = value #(

(
    client = 100
    airport_id = 'FRA'
    NAME = 'AD'
    CITY = 'PA'
    COUNTRY = 'DE'
)

).



  ENDMETHOD.

ENDCLASS.
