CLASS zcl_clase_estructura_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CLASE_ESTRUCTURA_ATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

"Estructura simple

*    data: lv_nombre     type string,           "si fuera como variables sueltas
*          lv_edad       type i,
*          lv_telefono   type string,
*          lv_correo     type string.


    types:Begin of ty_empleado,                 "como crear un type personalizado para una estructura
          nombre    type string,
          edad      type i,
          telefono  type string,             "si tienes telefono type /dmo/city pilla un tipo personalizado de dominio"
          correo    type string,

    end of ty_empleado.
*
*    data ls_empleado type ty_empleado.          "se crea una estructura con el type recien creado
*
*    ls_empleado-nombre = 'Dani'.
*    ls_empleado-edad = 2.
*    ls_empleado-telefono = '600000000000'.
*    ls_empleado-correo = 'ajjjjjjjjjjj@gmail.com'.
*
*    out->write( ls_empleado ).


    "Ejercicio de prueba, crear una estructura con un tipo personalizado para una tienda de muebles"

    types: begin of ty_tienda,
           sofa      type i,
           mesa      type i,
           cama      type i,
           lampara   type i,

    end of ty_tienda.

        data ls_mueble type ty_tienda.

            ls_mueble-sofa      = 6.
            ls_mueble-mesa      = 5.
            ls_mueble-cama      = 22.
            ls_mueble-lampara   = 1.

*out->write( ls_mueble ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    data ls_empleado type ty_empleado.

    "Forma 2"
    data(ls_empleado2) = value ty_empleado( nombre = 'Dani' edad = 2 telefono = '+600000' correo = 'a@a.c' ).

    "forma tres, la mezclada"

*    ls_empleado = value #( nombre = 'Dani' edad = 2 telefono = '+600000' correo = 'a@a.c' ).

*    out->write( ls_empleado ).
*    out->write( ls_empleado2 ).


*    data ls_empleado type /dmo/airport.           "Hereda un tipo de un tipo personalizado"
*    out->write( ls_empleado ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Estructuras anidadas

   data: begin of ls_empleadonuevo,                                             "para crear una estructura
         nombre         type string value 'laura',
         id             type i,
         email          type /dmo/email_address value 'a@acom',                 "elemento de datos estándar

   end of ls_empleadonuevo.

*out->write( ls_empleadonuevo ).

"y aqui dani escribe los valores con la forma 3"


    "Estructura anidada, toma ya

    data: begin of ls_empleado_info,

            begin of info,
                id      type zde_idnuevo_ata    value 01,
                nombre  type string             value 'Dani',
            end of info,

            begin of direccion,
                ciudad  type string value 'Madrid',
                calle   type string value 'Norfeo',
                pais    type string value 'España',
            end of direccion,

            begin of posicion,
                departamento    type string value 'Finanza',
                sueldo          type p decimals 2 value '1000.55',
            end of posicion,


    end of ls_empleado_info.
*    out->write( ls_empleado_info ).


    data lv_ejemplo type zde_idnuevo_ata.

    lv_ejemplo = 55.



    "Para los tipos simples del principio, el primero de la estructura, dale tipos personalizados para cada dominio


    types: Begin of ty_empleadonuevo,
           nombre    type zde_nombrenuevo_ata,
           edad      type zde_edadnuevo_ata,
           telefono  type zde_telefononuevo_ata,
           correo    type zde_correonuevo_ata,
    end of ty_empleadonuevo.

    data ls_empleadonuevoej type ty_empleadonuevo.

    ls_empleadonuevoej = value #(
                                    nombre = 'Adri'
                                    edad = 20
                                    telefono = '+600601610'
                                    correo = 'alo@gmail.com'
                                    ).

out->write( ls_empleadonuevoej ).












  ENDMETHOD.
ENDCLASS.
