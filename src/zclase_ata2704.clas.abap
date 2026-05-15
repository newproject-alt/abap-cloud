CLASS zclase_ata2704 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclase_ata2704 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    types:BEGIN OF ty_cliente,
*          nombre    TYPE ZDE_CLIENTE_ATA,
*          id        TYPE string,
*          edad      TYPE i,
*          telefono  TYPE string,
*          correo    TYPE string,
*
*    end of ty_cliente.
*
*    DATA ls_clientej TYPE ty_cliente.
*
*    ls_clientej-nombre = 'Adri'.
*    ls_clientej-edad = 10.
*    ls_clientej-telefono = '665665665'.
*    ls_clientej-correo = 'holaworld@gmail.com'.
*
*
*
*
*    out->write( ls_clientej ).

* nueva clase 28-04

*    data lv_d type D value 20260428.
*
*    data lv_t type T value hhmmss.

*   tipos completos
*   tipo i es 4 bytes
*   tipo f para numero de tipo flotante
*   string para cadena de caracteres, dinamico
*
*   tipos incompletos
*   C para cadena caracteres de rango de longitud de 1 a 65535 caracteres
*   N cadena caractere numerica de longitud de 1 a 65535 caracteres
*   X cadena hexadecimal longitud 1 a 65535 caracteres
*   p tipo para nmero empaquetado 1 a 16 bytes, decimals. es para declarar en la variable con lo ue vas a trarabajr
*       lv_decimal type p length 3 decimals 2.

    data lv_p type p length 8 decimals 2 value '202501.10'.
    data lv_decimal type p length 3 decimals 2.
    data lv_c type c length 10 value 'Experis'.

    out->write( lv_p ).

* + - / *

*    data(lv_mult) = 8 * 16.
*    out->write( lv_mult ).
*
*    data(lv_div) = 8 / 16.
*    out->write( lv_div ).

*    DATA lv_name type string value 'Juan'.
*    me falta lv_operation y lv_resultado

*        data lv_mult type string VALUE '*'.
*        data lv_sum type string VALUE '+'.
*        data lv_rest type string VALUE '-'.
*        data lv_div type string VALUE '/'.
**        esto no hace falta
*
*        data lv_num type i VALUE 2.
*        data lv_num2 type i VALUE 3.
*
*    if lv_name = 'Juan'.
*        out->write( 'No tienes acceso' ).
*    exit.
*
*    elseif lv_name = 'Paco'.

*    if lv_ -> esto no hacia falta
*
*    case lv_calc
*
*        when '*'.
*            lv_operacion = lv_num * lv_num2.
*
*        when '+'.
*            lv_operacion = lv_num + lv_num2.
*
*        when '-'.
*            lv_operacion = lv_num - lv_num2.
*
*        when '/'.
*            lv_operacion = lv_num / lv_num2.
*



  ENDMETHOD.

ENDCLASS.
