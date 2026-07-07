CLASS zcl_ruta_gastronomica_ata DEFINITION
  PUBLIC
  INHERITING FROM zcl_experiencia_ata
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    data: num_tapas type i,
          nocturno type abap_bool.

    methods:
            constructor importing   i_nombre type string
                                    i_precio type zdecimal2_25
                                    i_duracion type i
                                    i_num_part type i
*                                    num_tapas type i
*                                    inocturno type abap_bool.
                                    i_num_tapas type i         "buenas practicas
                                    i_nocturno type abap_bool,

    "se modifica el metodo original del padre
    calcular_precio redefinition.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ruta_gastronomica_ata IMPLEMENTATION.
  METHOD constructor.

    super->constructor( i_nombre = i_nombre
                        i_precio = i_precio
                        i_duracion = i_duracion
                        i_num_part = i_num_part ).

    num_tapas = i_num_tapas.
    nocturno = i_nocturno.



  ENDMETHOD.

  METHOD calcular_precio.

        DATA lv_precio_base TYPE zdecimal2_25.
    get_precio_base( IMPORTING o_precio = lv_precio_base ).

    r_total = lv_precio_base * num_part.

    IF num_part > 5.
      r_total = r_total * '0.8'.
    ENDIF.




  ENDMETHOD.

ENDCLASS.
