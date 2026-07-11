CLASS zcl_creadora_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  " Tipo tabla para lecturas
    TYPES tty_emp TYPE STANDARD TABLE OF ztab_eje_obj_ata WITH EMPTY KEY.

    METHODS constructor
IMPORTING iv_nombre TYPE zde_nombre_ata
iv_apellido TYPE zde_nombre_ata
iv_telefono TYPE zde_tele_ata
iv_experiencia TYPE i
iv_certificaciones TYPE i.

METHODS modificacion
  IMPORTING
    iv_nombre          TYPE zde_nombre_ata
    iv_apellido        TYPE zde_nombre_ata
    iv_telefono        TYPE zde_tele_ata
    iv_experiencia     TYPE i
    iv_certificaciones TYPE i
    iv_id_empleado     TYPE i
  RETURNING VALUE(rv_mensaje) TYPE string.

  METHODS alta_empleado
  RETURNING VALUE(rv_mensaje) TYPE string.

METHODS calcular_sueldo.

METHODS ex_id_empleado.

METHODS traer_n_filas
  IMPORTING
    iv_n_filas TYPE i
  RETURNING
    VALUE(rv_tabla) TYPE tty_emp.

METHODS traer_lt
  IMPORTING
    iv_id_empleado TYPE i
  RETURNING
    VALUE(rv_tabla) TYPE tty_emp.




  PROTECTED SECTION.
  PRIVATE SECTION.

  " Tabla interna de trabajo
    DATA lt_registro      TYPE tty_emp.
" Estructura del empleado actual
    DATA ls_prueba        TYPE ztab_eje_obj_ata.

  DATA experiencia      TYPE i.
    DATA id_empleado      TYPE i.
    DATA certificaciones  TYPE i.

  data iv_nombre          TYPE string.

ENDCLASS.



CLASS zcl_creadora_ata IMPLEMENTATION.


  METHOD alta_empleado.

    "Calcular sueldo antes de guardar
  calcular_sueldo( ).

  "Si tiene ID asignado lo usa, si no genera uno nuevo
  IF id_empleado IS NOT INITIAL.
    ls_prueba-id_empleado = id_empleado.
  ELSE.
    ex_id_empleado( ).
  ENDIF.

  "Inserta o modifica el registro
  MODIFY ztab_eje_obj_ata FROM @ls_prueba.

  IF sy-subrc = 0.

    COMMIT WORK.
    rv_mensaje = 'Subida correcta'.
  ELSE.
    rv_mensaje = 'Error en la Subida'.

  ENDIF.






  ENDMETHOD.

  METHOD calcular_sueldo.

    ls_prueba-sueldo = ( certificaciones * 50 + experiencia * 100 ) + 1000.


  ENDMETHOD.

  METHOD constructor.

 ls_prueba-nombre        = iv_nombre.
    ls_prueba-apellido      = iv_apellido.
    ls_prueba-telefono      = iv_telefono.
    ls_prueba-currency_code = 'EUR'.

    experiencia     = iv_experiencia.
    certificaciones = iv_certificaciones.

  ENDMETHOD.

  METHOD ex_id_empleado.

    SELECT MAX( id_empleado )
    FROM ztab_eje_obj_ata
    INTO @DATA(lv_max_id).

  IF sy-subrc = 0.
    ls_prueba-id_empleado = lv_max_id + 1.
  ELSE.
    ls_prueba-id_empleado = 0001.
  ENDIF.


  ENDMETHOD.

  METHOD modificacion.

    "Sobrescribir atributos privados
  experiencia     = iv_experiencia.
  certificaciones = iv_certificaciones.
  id_empleado     = iv_id_empleado.

  "Sobrescribir estructura de trabajo
  ls_prueba-id_empleado = iv_id_empleado.
  ls_prueba-nombre      = iv_nombre.
  ls_prueba-apellido    = iv_apellido.
  ls_prueba-telefono    = iv_telefono.
  ls_prueba-currency_code = 'EUR'.

  "Comprobar si existe el empleado
  SELECT SINGLE @abap_true
    FROM ztab_eje_obj_ata
    WHERE id_empleado = @me->id_empleado
    INTO @DATA(lv_existe).

  IF sy-subrc = 0.

    "Existe, reutilizamos alta_empleado para hacer el MODIFY
    rv_mensaje = alta_empleado( ).

  ELSE.

    rv_mensaje = 'El ID no existe en la base de datos, no se ha podido hacer la modificación'.

  ENDIF.


  ENDMETHOD.

  METHOD traer_lt.

    id_empleado = iv_id_empleado.

   CLEAR lt_registro.

*  IF iv_id_empleado = 0.
    if id_empleado = 0.

    SELECT *
      FROM ztab_eje_obj_ata
      ORDER BY id_empleado
      INTO TABLE @lt_registro.

  ELSE.

    SELECT *
      FROM ztab_eje_obj_ata
      WHERE id_empleado = @iv_id_empleado
      INTO TABLE @lt_registro.

  ENDIF.

  rv_tabla = lt_registro.


  ENDMETHOD.

  METHOD traer_n_filas.

    SELECT *
        FROM ztab_eje_obj_ata
        ORDER BY id_empleado
        INTO TABLE @lt_registro
        UP TO @iv_n_filas ROWS.


  rv_tabla = lt_registro.



  ENDMETHOD.

ENDCLASS.
