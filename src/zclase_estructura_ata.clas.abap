CLASS zclase_estructura_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCLASE_ESTRUCTURA_ATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "clase de Estructuras"

*    DATA lv_var type i value 5.

    types : begin of ty_persona,
            nombre   type string,
            edad     type i,
            telefono type string,
            email    type string,
    end of ty_persona.

data ls_persona     type ty_persona.                     "nombres identificativos"
data ls_cliente     type ty_persona.                     "usar el type personalizado en tablas que tengan sent"
data ls_empleado    type ty_persona.                     "creacion de estructura con tipo pero sin valor"

*out->write( ls_persona ).

    ls_cliente-nombre   = 'Daniel'.
    ls_cliente-edad     = 33.
    ls_cliente-telefono = '600610601'.
    ls_cliente-email    = 'alo@gmail.com'.

    ls_empleado-nombre  = 'Juan'.
    ls_empleado-edad    = 25.
*    ls_empleado-telefono   = ''.

out->write( ls_persona ).
out->write( ls_cliente ).
out->write( ls_empleado ).


    data(ls_persona2) = value ty_persona(      "forma dif de rellenar una estructura nueva"
    nombre      = 'Daniel'                     "esta se crea de golpe y en la misma linea con value type
    edad        = 32                           "ty_persona creado anteriormente, se asigna tipo y valores
    telefono    = '600610601'
    email       = 'alo@gmail.com' ).

    ls_persona  = value #(                     "forma de rellenar una estructura que ya existe"
    nombre      = 'Fernan'                     "esta se ha declarado ya y rellenado su tipo, por lo que no
    edad        = 32                           "hace falta el data ni type, y si el #
    telefono    = '611612622'
    email       = 'alo@gmail.com' ).


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Tablas: tipos hay internas y 'transparentes/base de datos'

    "la t.interna es en tiempo de ejecucion del sistema, una vez termina el programa, desaparece de abap
    "la t.transparente persiste a no ser que las borres













  ENDMETHOD.
ENDCLASS.
