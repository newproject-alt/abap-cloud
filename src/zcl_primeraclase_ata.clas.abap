CLASS zcl_primeraclase_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRIMERACLASE_ATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "Declarar una variable"

  DATA lv_nombre type string. "(quitando el punto) value = 'Pedro' "  "Forma de introducir valor a la variable directamente"

    lv_nombre = 'Pedro'.      "no hace falta dar valor al momento de crear"                        "Forma de introducir valor a la variable posteriormente "

  DATA lv_edadprueba type i VALUE 20.

    lv_edadprueba = 30.           "se cambia a medida que progresa el código, el valor de la variable"

  "con los type i, al sumarlos, lo que haces es dejar los valores en sus variables pero rellenando otra con tales valores"

  DATA lv_nombre2 type string VALUE 'Juan'.

    lv_nombre = 'Juan'.

    lv_nombre = 'Daniel'.

    lv_nombre = lv_nombre2.

*  DATA lv_edad type i value 2.

  "Estos son valores literales, porque lo dice quien programa, no por otro programa"

  DATA lv_edad type i VALUE 5.
  DATA lv_edad2 type i.
  DATA lv_total_edad type i.
  lv_edad2 = 10.

  lv_total_edad = lv_edad + lv_edad2.

  lv_edad = lv_edad + 5.

  "Cuidado con los espacios"
  "Para ejecutar programa, activar la cerilla y run as"
  "Y limpia la consola"

    out->write( | Esto es texto literario para la variable de edad { lv_edad } y esto también, la edad total { lv_total_edad } . | ). "Así se imprime por consola"


    "Mejor tener para cada cosa (clases, tablas, diccionarios...) su clase"




















  ENDMETHOD.
ENDCLASS.
