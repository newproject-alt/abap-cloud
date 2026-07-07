CLASS zcl_cds_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Llamada a CDS para ahorrar los inner join
    select from zi_ejemplo17_Ata as Booking
        fields
        Booking~TravelID,
        Booking~bookingID,
        \_Travel-AgencyID,
        \_Travel\_Agency-name as AgencyName,
        \_Travel\_Customer-customer_id as CustomerID,

        concat_with_space( \_Travel\_Customer-first_name, \_Travel\_Customer-last_name, 2 ) as CustomerName

        where booking~CarrierID eq 'AA'

        into table @data(lt_resultados)
        up to 5 rows.

    if sy-subrc = 0.
        out->write( lt_resultados ).
    endif.







  ENDMETHOD.
ENDCLASS.
