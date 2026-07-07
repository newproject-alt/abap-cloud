CLASS zcl_acreditado_ata DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      constructor
        IMPORTING
          iv_nombre            TYPE string
          iv_pais              TYPE string
          iv_num_acreditacion  TYPE string
          iv_fecha_caducidad   TYPE d,

      get_num_acreditacion
        RETURNING VALUE(rv_numero) TYPE string,

      describir_pase
        RETURNING VALUE(rv_texto) TYPE string.

  PROTECTED SECTION.

   DATA:
      nombre TYPE string,
      pais TYPE string,
      fecha_caducidad TYPE d.



  PRIVATE SECTION.

  DATA:
      num_acreditacion TYPE string.


ENDCLASS.



CLASS zcl_acreditado_ata IMPLEMENTATION.
  METHOD constructor.

    nombre = iv_nombre.
    pais = iv_pais.
    fecha_caducidad = iv_fecha_caducidad.
    num_acreditacion = iv_num_acreditacion.

  ENDMETHOD.

  METHOD describir_pase.

  rv_texto = 'Acreditación FIFA'.


  ENDMETHOD.

  METHOD get_num_acreditacion.

  rv_numero = num_acreditacion.

  ENDMETHOD.

ENDCLASS.
