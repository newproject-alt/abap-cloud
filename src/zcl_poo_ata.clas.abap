CLASS zcl_poo_ata DEFINITION
  PUBLIC


  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    data lv_nombre type string.     "atributos
    data lv_color type string.      "atributos

        methods: ladrar         returning value(rv_Accion) type string. "metodo/funcion
        methods: lanzar_pelota  returning value(rv_Accion) type string. "metodo/funcion
        methods: dormir         returning value(rv_Accion) type string. "metodo/funcion



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_poo_ata IMPLEMENTATION.


  METHOD ladrar.
                rv_accion = |{ lv_nombre } de color { lv_color } dice: Guau guau.|.
  ENDMETHOD.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  METHOD lanzar_pelota.
                rv_accion = |{ lv_nombre } de color { lv_color } corre a por la pelota.|.
  ENDMETHOD.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  METHOD dormir.
                rv_accion = |{ lv_nombre } de color { lv_color } se queda dormido.|.
  ENDMETHOD.

ENDCLASS.
