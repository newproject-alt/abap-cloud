CLASS zcl_prueba_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_prueba_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(lo_jugador) =
  NEW zcl_jugador_ata(
      iv_nombre           = 'Lamine Yamal'
      iv_pais             = 'España'
      iv_num_acreditacion = 'FIFA-001'
      iv_fecha_caducidad  = '20260731'
      iv_dorsal           = 19
      iv_posicion         = 'Extremo'
      iv_convocado        = abap_true
                                                         ).

      DATA(lo_periodista) =
  NEW zcl_periodista_ata(
      iv_nombre           = 'Marta López'
      iv_pais             = 'España'
      iv_num_acreditacion = 'FIFA-100'
      iv_fecha_caducidad  = '20260731'
      iv_medio            = 'Cadena SER'
      iv_tipo_prensa      = 'Radio'
      iv_zona_mixta       = abap_true ).

out->write( lo_jugador->describir_pase( ) ).
out->write( lo_periodista->describir_pase( ) ).
  ENDMETHOD.
ENDCLASS.
