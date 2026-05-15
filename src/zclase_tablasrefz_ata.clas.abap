CLASS zclase_tablasrefz_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclase_tablasrefz_ata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

"Siempre al inicio de la clase, los tipos y variables, eh, e indicando que es cada cosa

*    DATA lv_nombre  type zde_nombre_ata.        "clase de 7-5-26
*    DATA lv_edad    type zde_edad_ata.          "variable con tipo personalizado

    data lv_edad type /dmo/airport.         "pasa de variable a estructura/tabla ya que le asignas el tipo creado con sus campos creados

*    lv_edad = 2.
*    out->write( lv_edad ).

    types : begin of ty_persona,
            nombre   type string,    "zde_nombre_ata,
            edad     type i,         "zde_edad_ata,
            telefono type string,
            email    type string,
    end of ty_persona.

    types : begin of ty_persona2,
            animal   type string,
            edad     type i,
            telefono type string,
            email    type string,
    end of ty_persona2.

    data lt_animal TYPE TABLE OF ty_persona2.
    data ls_animal type          ty_persona2.           "para leer los datos de una tabla necesitas una estrcutra, no para crear

    data lt_cliente type table of ty_persona.
    data lt_empleado TYPE TABLE OF ty_persona.
    data ls_cliente type ty_persona.

    ls_cliente-nombre   = 'Daniel'.
    ls_cliente-edad     = 33.
    ls_cliente-telefono = '600610601'.
    ls_cliente-email    = 'alo@gmail.com'.

insert ls_cliente into table lt_empleado.

    ls_cliente-nombre   = 'Dario'.
    ls_cliente-edad     = 33.
    ls_cliente-telefono = '600610601'.
    ls_cliente-email    = 'alo@gmail.com'.

insert ls_cliente into table lt_cliente.
                                                "si pones un solo insert, vas sobreescribiendo datos
    ls_cliente-nombre   = 'Daisy'.              "y al final insertas lo ult, como hacer: data lv_var type i
    ls_cliente-edad     = 33.                   "lv_var = 1.
    ls_cliente-telefono = '600610601'.          "lv_Var = 2.
    ls_cliente-email    = 'alo@gmail.com'.      "el valor seria de 2

insert ls_cliente into lt_cliente index 2.

    ls_cliente-nombre   = 'Dan'.
    ls_cliente-edad     = 34.
    ls_cliente-telefono = '600610601'.
    ls_cliente-email    = 'alo@gmail.com'.

insert ls_cliente into lt_cliente index 2.      "index fuerza una poscn concreta en el registro de una tabla"

*out->write( lt_cliente ).
*out->write( lt_empleado ).


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"formas mas modernas pa meter los valores en una tabla

"esta primera es meter datos ahi forzao, sin una estructura creada

insert value #( animal = 'perro' edad = 12 telefono = '601610611' email = 'guau@gmail.com' ) into table lt_animal .
insert value #( animal = 'gato' edad = 12 telefono = '601610611' email = 'guau@gmail.com' ) into table lt_animal .
insert value #( animal = 'loro' edad = 12 telefono = '601610611' email = 'guau@gmail.com' ) into lt_animal index 2.

*out->write( lt_animal ).

        "Para buscar en una tabla datos, creando una estrcutra para leerlos tras ello"
        "El loop at busca en una fila, en otra y así, de arriba a abajo, e imprime los datos en x estructura

    loop at lt_animal into ls_animal.               ""realiza un bucle" o mejor hace una busqueda de una sola lectura
                                                    "para luego coger los datos segun el if y los imprime en estructuras

        if ls_animal-animal = 'perro'.
*        out->write( | Este es el nombre del animal: { ls_animal-animal } y su edad: { ls_animal-edad } | ).
*        out->write( ls_animal ).                    para todos los datos de perro
        endif.


    endloop.



"esta segunda es en una linea

*data(lt_animal2) = value ty_persona2(
*          animal = 'leon' edad = 10
* ).


"y esta es igual pero dentro del mismo corchete? bueno esta se queda ahi x fallillos

*types ty_t_persona2 type table of ty_persona2.

*data(lt_animal2) = value ty_t_persona2(
*   ( animal = leon marino edad = 2 )
*   ( animal = leon marino edad = 2 )
* ).


*out->write( lt_animal2 ).



















  ENDMETHOD.
ENDCLASS.
