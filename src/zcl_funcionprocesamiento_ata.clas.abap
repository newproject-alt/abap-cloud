CLASS zcl_funcionprocesamiento_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FUNCIONPROCESAMIENTO_ATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    data(lv_num) = strlen( 'dani' ).    "strlen es para contar el nº caracteres
*    out->write( lv_num ).



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

                        "Función de procesamiento"

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    data lv_var type string value 'Hola, este es el curso de ABAP'.


*    data lv_num type i value 5.
*    data lv_num2 type i value 10.
*    data lv_resultado type i.
*
*    lv_resultado = lv_num + lv_num2.
*
*    out->write( lv_resultado ).            "Ni puta idea para que era todo esto"



*    out->write( | { lv_var } mayúsculas -> { to_upper( lv_var ) } | ).      "to_upper transforma a mayusculas
*
*    lv_var = to_upper( lv_var ).
*
*    out->write( | { lv_var } minusculas -> { to_lower( lv_var ) } | ).      "to_lower transforma a minusculas
*
*
*    out->write( | { lv_var } encriptamiento -> { reverse( lv_var ) } | ).      "reverse transforma y cambia el orden de las letras
*
*
*    out->write( | { lv_var } shift_left -> { shift_left( val = lv_var places = 5 ) } | ).      "shift_left para mover el texto X casillas a la izquierda
*
*    out->write( | { lv_var } shift_right -> { shift_right( val = lv_var places = 5 ) } | ).      ""shift_left para mover el texto X casillas a la izquierda
*
*
*    out->write( | { lv_var } substring -> { substring( val = lv_var off = 9 len = 6 ) } | ).      ""substring extrae info con unos parametros de posicion del texto
*
*
*    out->write( | { lv_var } substring_from -> { substring_from( val = lv_var sub = 'el' ) } | ).      ""substring_from extrae del texto desde que encuentra X valor, añadiendolo
*
*    out->write( | { lv_var } substring_after -> { substring_after( val = lv_var sub = 'el' ) } | ).      ""substring_after extrae info despues de encontrar X valor
*
*    out->write( | { lv_var } substring_before -> { substring_before( val = lv_var sub = 'el' ) } | ).      ""substring_before extrae info del texto antes de que encuentra X valor
*
*
*    out->write( | { lv_var } condense -> { condense( val = lv_var ) } | ).      "condense

    """"""""""""""""""""""""""""""""
    "Funciones de control¿?contenido"

    "se crean las variables"

    data:   lv_text     type string,        "variable para texto donde buscar los patrones"
            lv_pattern  type string,        "variable para primer patrón
            lv_pattern2 type string.        "variable para segundo patrón, por aquí voy

            lv_text     =   'the employees dnoivoidvoifdilxsssssssdkkddk daniel.elviraruizexperis.es osdpsdjsdpodsc number is: 123-456-7890 sdldsckmcsk'.
            lv_pattern  =   `\d{3}-\{d3}-\{d4}`.
*            lv_pattern  = `\d{3}-\d{3}-\d{4}`.

            lv_pattern2 =   `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{  2, }\b`.


""
    data(lv_number) = match( val = lv_text pcre = lv_pattern occ = 1 ).             "va a encontrar y añadir "
    out->write( lv_number ).

*        if contains( val = lv_text pcre = lv_pattern2 ).

*        out->write( 'Tiene una dirección de correo electrónico' ).
*        data(lv_count) = count( val = lv_text pcre = lv_pattern2 ).
*
*        out->write( lv_count ).
*
*         data(lv_correo) = match( val = lv_text pcre = lv_pattern2 occ = 1 ).          "occ es primer correo que te encuentres
                                                                                        "para poder pillar todos seria o un bucle con difrs variables o una tabla o......
*         out->write( lv_correo ).





*    out->write( lv_number ).


*if











  ENDMETHOD.
ENDCLASS.
