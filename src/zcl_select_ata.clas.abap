CLASS zcl_select_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_select_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""
    """Clase de repaso de select y read table"""""
    """"""""""""""""""""""""""""""""""""""""""""""


  select from /dmo/airport
  fields *
  where country = 'US'
  into table @data(lt_vuelos).

  if sy-subrc = 0.

  select from /dmo/airport
  fields *
  where name like 'L%'
  into table @data(lt_vuelos2).

  ENDIF.

*  data(ls_vuelo_filtro) = lt_vuelos[ name ]-name.

OUT->WRITE( |Prueba para lt_vuelo: | ).
out->write( lt_vuelos ).
OUT->WRITE( | | ).
OUT->WRITE( lt_vuelos2 ).



    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""Ejercicio del lunes""""""""""""""""""""""""""""""""""""
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    data lt_empleados type zbd_ejemplo_ata.
*
*    "el ej era cambiar datos de una base de datos
*
*    select from zbd_ejemplo_ata
*        fields *
*        where edad > 18
*        into table @data(lt_vuelos3).
*
*    data ls_vuelos3 type zbd_ejemplo_ata.
*
*
*if sy_subrc = 0.       "esto es para comprobar si existe valr en campo?

*    loop at lt_vuelos3 into data(ls_empleado).
*
*    "variable para longitud de campo nombre
*    data(lv_longitud) = strlen( ls_vuelos3-nombre ).
*    out->write( lv_longitud ).
*
*    if lv_longitud > 0.            "forma de detectar que hay algo

*    "Cogemos del carácter X hasta el X lugar y añadimos S
*    ls_empleado-nombre = substring( val = ls_empleado-nombre           "cadena de caractéres que se examina
*                                     off = 0                            "posicion de inicio desde donde se quiere extraer la subcadena
*                                     len = lv_longitud - 1 ) && 's'.    "con la longitud, decimos el punto exacto donde modificar
*
*    endif.
*
*    modify lt_vuelos3 from ls_vuelos3.     "lo que coincide lo deja, lo que cambia lo cambia
*
*    endloop.
*
*    modify  zbd_ejemplo_ata from table @lt_vuelos3.

*    delete lt_vuelos3 from 2 to 4.          "borra de fila 2 a 4    "en tabl interna no pelgr, en bases de datos si
*    delete lt_vuelos3 index 2.              "borra en el registro de la fila 2
*    delete lt_vuelos3 where nombre is initial.                       "borra las filas donde el campo esté vacío
*    delete adjacent duplicates from lt_vuelos3 comparing nombre.     "borra los duplicados en nombre

    "Tabla de rangos: lista de filtros, traer cosas que cumplan X condición











  ENDMETHOD.
ENDCLASS.
