CLASS zclase_ata2704 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclase_ata2704 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    types:BEGIN OF ty_cliente,
          nombre    TYPE ZDE_CLIENTE_ATA,
          id        TYPE string,
          edad      TYPE i,
          telefono  TYPE string,
          correo    TYPE string,

    end of ty_cliente.

    DATA ls_clientej TYPE ty_cliente.

    ls_clientej-nombre = 'Adri'.
    ls_clientej-edad = 10.
    ls_clientej-telefono = '665665665'.
    ls_clientej-correo = 'holaworld@gmail.com'.




    out->write( ls_clientej ).

  ENDMETHOD.

ENDCLASS.
