CLASS zcl_granadatour_ata7 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_granadatour_ata7 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(lo_experiencia) = NEW zcl_experiencia_ata( i_nombre = 'Visita a Isla Mayor'
                                                   i_precio = '10.50'
                                                   i_duracion = 60
                                                   i_num_part = 20 ).

*    DATA(lv_total) = lo_experiencia->calcular_precio(  ).
    out->write( | El precio es { lo_experiencia->calcular_precio(  ) } | ).

*    data(lv_precio_base) = lo_experiencia->precio(  ).

    data lv_precio_base type zdecimal2_25.
    lo_experiencia->get_precio_base( IMPORTING o_precio = lv_precio_base ).
    out->write( | El precio base es { lv_precio_base } | ).

    DATA(lo_monumento) = NEW zcl_visita_monumento_ata( i_nombre = 'Visita'
                                                   i_precio = '10.50'
                                                   i_duracion = 60
                                                   i_num_part = 20
                                                   i_monumento = 'La Alhambra'
                                                   i_reserva = abap_false ).

    data(lv_total) = lo_monumento->calcular_precio(  ).
    out->write( | El precio base es { lv_total } | ).

    if lo_monumento->reserva = abap_true.

    out->write( | El monumento { lo_monumento->monumento } tiene reserva obligatoria | ).

    endif.

    DATA(lo_ruta_gastro) = NEW zcl_ruta_gastronomica_ata(
                                                  i_nombre = 'Cena en Granada'
                                                   i_precio = '10.50'
                                                   i_duracion = 60
                                                   i_num_part = 20
                                                   i_num_tapas = 2
                                                   i_nocturno = abap_false ).

     lv_total = lo_ruta_gastro->calcular_precio(  ).
     out->write( | El precio es { lv_total } | ).

     if lo_ruta_gastro->nocturno = abap_true.
        out->write( | La ruta { lo_ruta_gastro->nombre } es una cena | ).
        else.
        out->write( | La ruta { lo_ruta_gastro->nombre } es un almuerzo | ).
        endif.





  ENDMETHOD.
ENDCLASS.
