CLASS zcl_jugador_ata DEFINITION



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
          iv_dorsal            TYPE i
          iv_posicion          TYPE string
          iv_convocado         TYPE abap_bool,

      describir_pase REDEFINITION.



  PROTECTED SECTION.
  PRIVATE SECTION.

   DATA:
      dorsal TYPE i,
      posicion TYPE string,
      convocado TYPE abap_bool.

ENDCLASS.



CLASS zcl_jugador_ata IMPLEMENTATION.





  METHOD constructor.

    super->constructor( iv_nombre = iv_nombre
                        iv_pais = iv_pais
                        iv_num_acreditacion = iv_num_acreditacion
                        iv_fecha_caducidad = iv_fecha_caducidad ).

    dorsal = iv_dorsal.
    posicion = iv_posicion.
    convocado = iv_convocado.

  ENDMETHOD.

  METHOD describir_pase.

  rv_texto =
      |Jugador: { nombre } ({ pais }) - | &&
      |Acceso a campo y vestuarios|.

  ENDMETHOD.

ENDCLASS.
