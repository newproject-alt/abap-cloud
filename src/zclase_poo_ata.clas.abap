CLASS zclase_poo_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*  interfaces if_oo_adt_classrun.

*    data lv_nombre type string.
*
*    "! <p class="shorttext synchronized" lang="en"></p>
*    "!
*    methods ladrar.

*    CLASS-DATA lv_moneda TYPE c length 3.

    DATA nombre type string.
    methods: ladrar RETURNING VALUE(rv_accion) type string.

    METHODS: lanzar_pelota RETURNING VALUE(rv_accion) type string.

  PROTECTED SECTION.

*    DATA lv_fecha type sydate.

  PRIVATE SECTION.

*    data lv_cliente type string.


ENDCLASS.



CLASS zclase_poo_ata IMPLEMENTATION.

  METHOD ladrar.

        rv_accion = |{ nombre } dice guau |.

  ENDMETHOD.

  METHOD lanzar_pelota.

        rv_Accion = |{ nombre } corre a por la pelota |.

  ENDMETHOD.

ENDCLASS.
