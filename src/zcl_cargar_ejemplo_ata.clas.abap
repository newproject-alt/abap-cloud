CLASS zcl_cargar_ejemplo_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cargar_ejemplo_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  modify zbd_ejemplo_ata from table @(
        value #(

              ( client = '100'
                correo = 'daniel@com'
                nombre = 'daniel'
                edad = 33
                telefono = '600601610' )

              ( client = '100'
                correo = 'julia@com'
                nombre = 'julia'
                edad = 23
                telefono = '602601610' )

              ( client = '100'
                correo = 'alejandra@com'
                nombre = 'alejandra'
                edad = 36
                telefono = '600601610' )

            )
            ).



  ENDMETHOD.
ENDCLASS.
