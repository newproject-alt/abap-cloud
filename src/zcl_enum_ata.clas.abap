CLASS zcl_enum_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_enum_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "Función enum: fija las opciones disponibles para un tipo

  types: begin of enum ty_Color,
         rojo,
         verde,
         azul,
         amarillo,                  "se le puede añadir más tarde
  end of enum ty_Color.

  data lv_color type ty_Color.

  lv_color = amarillo.

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  types: begin of enum ty_vuelos,

         nacional,              "vuelos dentro del mismo país
         internacional,         "vuelos entre países
         charter,               "vuelo especial/privado

  end of enum ty_vuelos.

  data lv_vuelo type ty_vuelos.

  lv_Vuelo = internacional.

  case lv_Vuelo.
    when nacional.
        out->write( 'Vuelos dentro de tu mismo país' ).
    when internacional.
        out->write( 'Vuelos entre países' ).
    when charter.
        out->write( 'Vuelo especial/privado' ).
  "when others podría valer para contemplar otras opciones, en el caso en que
  "en un futuro se añadan más valores
  endcase.









  ENDMETHOD.
ENDCLASS.
