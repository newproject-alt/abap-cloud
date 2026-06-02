CLASS zcl_obj_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
                        "Evitar siempre que se pueda poner componentes públicos
  PUBLIC SECTION.       "Todos los atributos y métodos son: públicos y accesibles

                        "Existen atributos y métodos: estáticos y de instancias

  "Atributos -
  class-data lv_moneda type c length 3.     "Atributo estático (class-data)
                                            "|
                                            "Diferencia entre ambos tipos
                                            "|
  data lv_region type string.               "Atributo de instancia

    "============================================================"
    "============================================================"

  "Métodos -

  "Método 1
  methods set_cliente                       "Método estático

        "Parámetros de entrada
        importing iv_cliente        type string
                  iv_localizacion   type string

        "Parámetros de salida
        exporting ev_status         type string

        "Parámetros de cambio
        changing cv_proceso         type string.

  "Método 2
  methods get_cliente                       "Método estático
        exporting ev_cliente        type string.
        "No hace falta poner parámetros de entrada y/o de cambio

  "Método 3 y 4
*  class-methods:
*                set_cntr_type importing iv_cntr_type type string,
*                get_cntr_type exporting ev_cntr_type type string.


    "Alternativa de cómo escribir los métodos 3 y 4

  "Método 3
  class-methods set_cntr_type
                importing iv_cntr_type type string.
  "Método 4
  class-methods get_cntr_type
                exporting ev_cntr_type type string.


  "Método 5
  methods get_cliente_nombre
        importing iv_cliente_id type string
        returning value(rv_cliente_nombre) type string.






  PROTECTED SECTION.    "Sólo accesible para esta clase y las clases hijas

  class-data lv_fecha type sydate.                ""Atributo estático (class-data)




  PRIVATE SECTION.      "Sólo accesible para esta clase y las clases friends

  data lv_cliente      type string.              ""Atributo de instancia (no hay class-data)
  class-data cntr_type type string value 'Hola'.



ENDCLASS.



CLASS zcl_obj_ata IMPLEMENTATION.


  METHOD set_cliente.

    lv_cliente  = iv_cliente.
    ev_status   = 'OK'.
    cv_proceso  = 'Started'.

  ENDMETHOD.

  METHOD get_cliente.

    ev_cliente  = lv_cliente.

  ENDMETHOD.

  METHOD get_cntr_type.

    ev_cntr_type = cntr_type.

  ENDMETHOD.

  METHOD set_cntr_type.

    cntr_type   = iv_cntr_type.



  ENDMETHOD.

  METHOD get_cliente_nombre.

    case iv_cliente_id.
                when '01'.
                    rv_cliente_nombre = 'Cliente nº 01'.
                when '02'.
                    rv_cliente_nombre = 'Cliente nº 02'.
    endcase.

  ENDMETHOD.

ENDCLASS.
