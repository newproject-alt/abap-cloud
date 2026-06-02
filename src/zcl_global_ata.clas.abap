CLASS zcl_global_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  types tty_emp type table of zbd_usuario_ata. "with empty key.

  methods constructor
        importing
            iv_nombre           type string     "sustituir el string por el elemento de datos, si lo tienes
            iv_apellido         type string
            iv_telefono         type string
            iv_experiencia      type i
            iv_Certificaciones  type i.

  methods calcular_sueldo.

  methods id_empleado.



  PROTECTED SECTION.
  PRIVATE SECTION.

    data: lv_nombre           type string,
          lv_apellido         type string,
          lv_telefono         type string,
          lv_experiencia      type i,
          lv_Certificaciones  type i,

          lv_sueldo           type i.

ENDCLASS.


CLASS zcl_global_ata IMPLEMENTATION.
  METHOD constructor.







  ENDMETHOD.

  METHOD calcular_sueldo.

    lv_sueldo = 1000 + ( lv_certificaciones * 50 ) + ( lv_experiencia * 100 ).


  ENDMETHOD.

  METHOD id_empleado.



  ENDMETHOD.

ENDCLASS.
