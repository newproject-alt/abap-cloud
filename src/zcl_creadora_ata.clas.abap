CLASS zcl_creadora_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

*  types tty_emp type table of ztab_eje_obj_ata WITH EMPTY KEY.  " Tipo de tabla con las líneas de base de datos
                                                                " con clave vacía
                                                                " Se usa como retorno para lecturas

  "Métodos

  "Método 1: para construir una tabla con la información de un empleado
  methods Constructor
            importing iv_nombre             type zde_nombre_ata
                      iv_apellido           type zde_nombre_der
                      iv_telefono           type zde_tele_ata
                      iv_experiencia        type i
                      iv_certificaciones    type i.

  "Apartado 2.3 voy



  PROTECTED SECTION.
  PRIVATE SECTION.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  "Atributos

*  data lt_registro type tty_emp.            "Tabla interna para lecturas

  data ls_prueba type ztab_eje_obj_ata.     "Estructura con datos del empleado actual

  data: lv_experiencia      type i,         "Años de experiencia
        lv_id_empleado      type i,         "ID del empleado (modificaciones)
        lv_certificaciones  type i.         "Nº de certificaciones

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


ENDCLASS.



CLASS zcl_creadora_ata IMPLEMENTATION.
  METHOD constructor.

    data ls_prueba type ztab_eje_obj_ata.     "Estructura con datos del empleado actual

    lv_experiencia      = iv_experiencia.
    lv_certificaciones  = iv_certificaciones.






  ENDMETHOD.

ENDCLASS.
