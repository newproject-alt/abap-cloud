CLASS zcl_ej3004_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ej3004_ata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* Ejercicio de If por Dani

* Declaramos las variables para los nombres

*   data lv_nombre     type string.                 " Variable para nombre
*    data lv_nombre1    type string value 'Pedro'.   " Variable para Pedro
*    data lv_nombre2    type string value 'Sara' .   " Variable para Sara
*    data lv_nombre3    type string value 'Juan' .   " Variable para Juan
*    data lv_nombre4    type string value 'Laura'.   " Variable para Laura

* Declaramos las variables para las edades

*   data lv_edad    type i.             " Variable para la edad
*    data lv_edad1   type i value 20.    " Variable de 20 años
*    data lv_edad2   type i value 25.    " Variable de 25 años
*    data lv_edad3   type i value 30.    " Variable de 30 años

* Declaramos variable para gustar ¿?
*   data lv_gustar type string value 'Sí'.  " Variable de acción positiva de gustar
*    data lv_gustar type string value 'No'.  " Variable de acción negativa de gustar

*   Ojo a esto
*   if lv_edad1 = 25 and lv_gustar = 'Sí' and lv_nombre1 = Pedro.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

* Ejercicio 2 de If por Dani

* Declaramos la variable para la edad
*   DATA lv_edad type i value 5.

                """""/Variedad del ejercicio/"""""""""

* Declaramos las variables
   DATA lv_edad type i.             " Variable para la edad
   DATA lv_persona type string.     " Variable para la persona
    lv_persona = 'padre'.
*  data lv_tarifa type i.
*   data lv_persona type string value 'preadolescente'. otro ej

* El programa nos pregunta qué edad tiene el cliente

   IF lv_persona  = 'padre'.
    lv_edad = 45.
*    lv_tarifa = 1.

   ELSEIF lv_persona = 'hijo'.
    lv_edad = 2.
*    lv_tarifa = 1.

   ELSE.
    IF lv_persona  = 'adolescente'.
        lv_edad = 17.
*    lv_tarifa = 1.

       elseif lv_persona = 'anciano'.

      lv_edad = 70.
*    lv_tarifa = 1.

      else.
      out->write( 'tarifa no contemplada' ).
*    lv_tarifa = 0.


*      else
*       aquí era decirle que me diga que ancianos de 70 a x tienen
*       mismo precio que los adolescentes
       "lv_persoana es un anciano.
*       lv_persona = 'anciano'.
*       lv_edad = 70.
*       y en elseif abajo en la de >= 4 y 18 pones:
*       18 or lv_Edad <= 70.

      ENDIF.

    ENDIF.


*El programa nos pregunta, según la edad del cliente, su precio
*    if lv_tarifa = 1.
        if lv_edad < 4.
            out->write( 'Este cliente puede entrar gratis' ).

            elseif lv_edad >= 4 and lv_edad <= 18.
                out->write( 'Este cliente debe pagar 5€' ).

            else.
                out->write( 'Este cliente debe pagar 10€' ).

        endif.

* decirle una tarifa no contemplada para ancianos??
*
* else.
* out->write( 'tarifa no contemplada' ). aqui si el no contemplado

*endif.

* out->write( lv_tarifa ).












    """"""""""""""""""""""""""""""""""""""""""""""""""""""""

*   Dado un valor numérico que representa una nota (0–10),
*   muestra por
*   consola si el estudiante ha obtenido Suspenso (0–4),
*   Aprobado (5–6),
*   Notable (7–8) o Sobresaliente (9–10). Si el valor es
*   negativo o mayor
*   que 10, muestra un mensaje de error.

*   Mi intento

*    DATA lv_nota type i VALUE 9.
*
*    case lv_nota
*
*        when 0 or 1 or 2 or 3 or 4.
*            out->write( | el alumno ha obtenido una calificación de suspenso, con una nota de { lv_nota } | ).
*        when 5 or 6.
*            out->write( | el alumno ha obtenido una calificación de aprobado, con una nota de { lv_nota } | ).
*        when 7 or 8.
*            out->write( | el alumno ha obtenido una calificación de notable, con una nota de { lv_nota } | ).
*        when 9 or 10.
*            out->write( | el alumno ha obtenido una calificación de sobrealiente, con una nota de { lv_nota } | ).
*        others.
*              out->write( 'Error 404' ).
*
*    endcase.


  ENDMETHOD.

ENDCLASS.
