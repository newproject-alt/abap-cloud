CLASS zcl_periodista_ata DEFINITION
  PUBLIC
    INHERITING FROM zcl_acreditado_ata

  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   METHODS:
      constructor
        IMPORTING
          iv_nombre            TYPE string
          iv_pais              TYPE string
          iv_num_acreditacion  TYPE string
          iv_fecha_caducidad   TYPE d
          iv_medio             TYPE string
          iv_tipo_prensa       TYPE string
          iv_zona_mixta        TYPE abap_bool,

      describir_pase REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.

  data: medio type string,
        tipo_prensa type string,
        zona_mixta type abap_bool.


ENDCLASS.



CLASS zcl_periodista_ata IMPLEMENTATION.
  METHOD constructor.

    super->constructor( iv_nombre = iv_nombre
                        iv_pais = iv_pais
                        iv_num_acreditacion = iv_num_acreditacion
                        iv_fecha_caducidad = iv_fecha_caducidad ).

    medio = iv_medio.
    tipo_prensa = iv_tipo_prensa.
    zona_mixta = iv_zona_mixta.

  ENDMETHOD.

  METHOD describir_pase.

  rv_texto =
      |Periodista: { nombre } ({ pais }) - Sala de prensa|.

    IF zona_mixta = abap_true.
      rv_texto = rv_texto && | y acceso a zona mixta|.

      endif.

  ENDMETHOD.

ENDCLASS.
