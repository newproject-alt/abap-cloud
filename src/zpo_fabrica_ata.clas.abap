CLASS zpo_fabrica_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  " Funciones para acciones disponibles para nuestro objeto

  methods: cargar_datos     returning value(rv_accion) type string. "Carga de datos en la base
  methods: id_nuevo         returning value(rv_accion) type string. "Suma de un registro nuevo e incremento de id
  methods: random           returning value(rv_accion) type string. "Extracción de un registro al azar

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zpo_fabrica_ata IMPLEMENTATION.
  METHOD cargar_datos.

        rv_accion = 'Registros exponenciales.'.


  ENDMETHOD.



  METHOD random.



    rv_accion = 'Registros exponenciales.'.

  ENDMETHOD.



  METHOD id_nuevo.

    rv_accion = 'Registros exponenciales.'.


  ENDMETHOD.

ENDCLASS.
