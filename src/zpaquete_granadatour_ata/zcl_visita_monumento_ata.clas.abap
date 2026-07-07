CLASS zcl_visita_monumento_ata DEFINITION
  PUBLIC
  INHERITING FROM zcl_experiencia_ata
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  data: monumento type string,
        reserva type abap_bool.

  methods: constructor IMPORTING i_nombre type string
                                i_precio type zdecimal2_25
                                i_duracion type i
                                i_num_part type i
                                i_monumento type string
                                i_reserva type abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_visita_monumento_ata IMPLEMENTATION.
  METHOD constructor.

  "Llamando al constructor del padre

                            "parametro padre -> parametro hijo
    super->constructor( i_nombre = i_nombre
                        i_precio = i_precio
                        i_duracion = i_duracion
                        i_num_part = i_num_part ).

    "atributo -> parametro
*    me->monumento = i_monumento.
    monumento = i_monumento.

    reserva = i_reserva.


  ENDMETHOD.

ENDCLASS.
