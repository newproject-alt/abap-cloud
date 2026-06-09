CLASS zcl_obj_bloqueo_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_obj_bloqueo_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  out->write( 'El usuario ha empezado el programa' ).

  "Función try - es como un if """"""""""""""""22

  try.

  data(lo_lock_object) = cl_abap_lock_object_factory=>get_instance( exporting iv_name = 'ezinv_Ata' ).      "copia y pega; es una función del sistema que se mete en una variable

  catch cx_abap_lock_failure.                                   "trata de, en la función, si hay un fallo
        out->write( 'El objeto de instancia no se ha creado' ).
        return.

  endtry.

  data lt_parameter type if_abap_lock_object=>tt_parameter.

  lt_parameter = value #( ( name = 'ID'
                            value = ref #( '0000001' )  ) ).

  try.
    lo_lock_object->enqueue(

        " it_table_mode =
        it_parameter = lt_parameter
        "_scope =
        "_Wait =
                            ).

        catch cx_abap_foreign_lock cx_abap_lock_failure.
            out->write( 'El objeto ya está siendo tratado por otro usuario' ).
            return.
  endtry.

  out->write( 'El objeto ya está disponible' ).

  if sy-subrc = 0.
    out->write( 'La base de datos de virus ha sido actualizada' ).
  endif.

  try.
    lo_lock_object->dequeue( it_parameter = lt_parameter ).
    catch cx_abap_lock_failure.

    out->write( 'El objeto no ha sido liberado' ).
  endtry.

  out->write( 'El objeto ha sido liberado' ).








  ENDMETHOD.
ENDCLASS.
