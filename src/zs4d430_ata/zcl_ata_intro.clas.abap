CLASS zcl_ata_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ata_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data var type /LRN/S4D430_IND.

  select from /LRN/S4D430_IND
    fields *
        into table @data(result).


  ENDMETHOD.
ENDCLASS.
