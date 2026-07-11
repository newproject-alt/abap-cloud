CLASS zcl_main_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_main_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA lt_accion TYPE i VALUE 4.

    DATA(lo_employee) = NEW zcl_creadora_ata(
      iv_nombre          = 'Natalia'
      iv_apellido        = 'Ruiz'
      iv_telefono        = '666555777'
      iv_experiencia     = 4
      iv_certificaciones = 2
    ).


  CASE lt_accion.

      WHEN 1.

        DATA(lv_mensaje) = lo_employee->alta_empleado( ).

        out->write( lv_mensaje ).


      WHEN 2.

lv_mensaje = lo_employee->modificacion(
          iv_nombre          = 'rrra'   "metida ya
          iv_apellido        = 'Ruiz'       "id - 1
          iv_telefono        = '666555777'
          iv_experiencia     = 4
          iv_certificaciones = 2
          iv_id_empleado     = 10
        ).

        out->write( lv_mensaje ).


      WHEN 3.

        DATA(lt_empleados) = lo_employee->traer_lt(
          iv_id_empleado = 0
        ).

        out->write( lt_empleados ).


      WHEN 4.

lt_empleados = lo_employee->traer_n_filas(
          iv_n_filas = 2
        ).

        out->write( lt_empleados ).

    ENDCASE.




  ENDMETHOD.
ENDCLASS.
