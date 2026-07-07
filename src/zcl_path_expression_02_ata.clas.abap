CLASS zcl_path_expression_02_ata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_path_expression_02_ata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    select from zi_ejemplo17_Ata as Booking
        fields
        Booking~TravelID,
        Booking~bookingID,
        Booking~CarrierID,
        \_Travel-AgencyID,
        \_Travel\_Agency-name as AgencyName,
        \_Travel\_Customer-customer_id as CustomerID,

        concat_with_space( \_Travel\_Customer-first_name, \_Travel\_Customer-last_name, 2 ) as CustomerName

        where \_Travel\_Customer-last_name eq 'S%'

        order by \_Travel\_Customer-last_name, TravelID


        into table @data(lt_resultados)
        up to 20 rows.

    if sy-subrc = 0.

        out->write( lt_resultados ).

        "order "by""
    endif.




  ENDMETHOD.







ENDCLASS.
