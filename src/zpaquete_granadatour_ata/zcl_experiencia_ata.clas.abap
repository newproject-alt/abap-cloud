CLASS zcl_experiencia_ata DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    DATA: nombre   TYPE string,
*          precio   TYPE zdecimal2_25,
          duracion TYPE i,
          num_part TYPE i.

    METHODS:

      constructor IMPORTING i_nombre type string
                            i_precio type zdecimal2_25
                            i_duracion type i
                            i_num_part type i,

      calcular_precio RETURNING VALUE(r_total) TYPE zdecimal2_25,

      get_precio_base exporting o_precio type zdecimal2_25.


  PROTECTED SECTION.
  PRIVATE SECTION.

  data: precio type zdecimal2_25.

ENDCLASS.



CLASS zcl_experiencia_ata IMPLEMENTATION.


  METHOD calcular_precio.

   r_total = precio * num_part.

    IF num_part > 8.
      r_total = r_total * '0.9'.
    ENDIF.

  ENDMETHOD.

  METHOD constructor.   "Sólo parámetros de importing

    "Atributo -> parámetro
    nombre   = i_nombre.
    precio   = i_precio.
    duracion = i_duracion.
    num_part = i_num_part.

  ENDMETHOD.


  METHOD get_precio_base.

    o_precio = precio.

  ENDMETHOD.

ENDCLASS.
