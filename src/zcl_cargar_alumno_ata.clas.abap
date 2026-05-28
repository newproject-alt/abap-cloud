CLASS zcl_cargar_alumno_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cargar_alumno_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  define table zbd_e_alumno_ata {
*    key client : abap.clnt not null;
*    key registro : abap.int8 not null;
*    columna : abap.char(85);
*
*  }

  delete from zbd_alumno_ata.

  modify zbd_alumno_ata from table @( value #(

           ( client = sy-mandt
             registro = 1
             columna = 'Paco Rodríguez' )

           ( client = sy-mandt
             registro = 2
             columna = 'Juan Rodríguez' )

           ( client = sy-mandt
             registro = 3
             columna = 'Esther Rodríguez' )

           ( client = sy-mandt
             registro = 4
             columna = 'Lola Rodríguez' )

           ( client = sy-mandt
             registro = 5
             columna = 'Daniel Rodríguez' )

            ) ).
*
*    data ls_alumno type zbd_alumno_ata.
*    data lt_alumno type standard table of zbd_alumno_ata.
*
*    data lv_Alumno type string.
*    lv_Alumno = 'luis'.
*
*    select count( * )
*    from zbd_alumno_Ata
*    into @data(lv_total).
*
*    data(lv_id) = lv_total + 1.
*
*    insert zbd_alumno_Ata from @ls_Alumno.
*
**    data lv_contador type abap.int8 value 1.
**
**    data lt_nombres type standard table of abap.char(85).
**    lt_nombres = value #(
**    ( 'Juanes' )
**    ( 'Pacas' )
**    ( 'Pecas' )
**    ( 'Peque' )
**     ).
*
*    data lv_contador type abap.int8 value 1.
*
*     loop at lt_nombres into data(lv_nombre).
*     clear ls_alumno.
*     ls_alumno-client = sy-mandt.
*     ls_alumno-registro = lv_contador.
*     ls_alumno-columna = lv_nombre.
*
*     append ls_alumno to lt_alumno.
*
*     lv_contador = lv_contador + 1.
*
*
*
*     endloop.
*
*     insert zbd_alumno_ata from table @lt_alumno.
*
*     data lv_registro type abap.int8..
*
*     data(lv_lineas) = lines( lt_alumno ).
*
*     lv_registro = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
*                                    min = 1
*                                    max = lv_lineas )->get_next(  ).
*
*
*







*
*    loop at lt_empleado into data(ls_empleado).
*
*    out->write( zbd_e_alumno_Ata ).

*    loop at zb


    " Extensión del ejercicio pos añadir alumno nuevo y generar id

*    data ls_alumno type zbd_alumno_Ata.
**    data lt_alumno type standard table of zbd_alumno_Ata.

*    data lv_nuevo type string value 'Joni'.

*    data(lv_total) = lines(lt_alumno).

*    data lv_id type i.
*    lv_id = lv_total + 1.

*
*   select * from zbd_alumno_Ata
*   into table @data(lt_alumno).

*    insert zbd_alumno_ata from @lv_nuevo.

*    loop at zbd_alumno_Ata into data(lv_nombre).

*
""""""""""""""""""""""""""""""""""""""""""""""""""""
"lo de dani.

"subida individual de registros

*data lv_nuevo_nombre type string value 'juan'.
*data lv_check type i value 0.
*
*select from zbd_Alumno_Ata
*fields *
*into table @data(lv_Existe).
*
*loop at lv_Existe into data(ls_nueva).
*
*if ls_nueva-nombre = ls_nueva-nombre.
*lv_check = 1.
*
*endif.
*
*endloop.
*
*if lv_check = 0.
*select count(*) from zbd_alumno_Ata into @data(lv_count2).
*
*lv_id = lv_count2 + 1.
*insert base from bllblb id = lv_id nombre = lv_nuevo_nombre









* loop at lt_nueva into ls_nueva.
* if ls_nueva-nombre = lv_nuevo-nombre.

*else.
*

*endif.
*endloop.

*if lv_Var = 1.
*select count










  ENDMETHOD.
ENDCLASS.
