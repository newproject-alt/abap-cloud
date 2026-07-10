CLASS LHC_ZR_ATAFLIGHT2 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.

  PRIVATE SECTION.

    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR FLIGHT2
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
            IMPORTING keys FOR FLIGHT2~validatePrice.
ENDCLASS.

CLASS LHC_ZR_ATAFLIGHT2 IMPLEMENTATION.

  METHOD GET_GLOBAL_AUTHORIZATIONS.



  ENDMETHOD.


  METHOD validatePrice.

    DATA failed_record   LIKE LINE OF failed-flight2.
    DATA reported_record LIKE LINE OF reported-flight2.

    READ ENTITIES OF Zr_ATAFlight2 IN LOCAL MODE
    ENTITY Flight2
    FIELDS ( Price )
    WITH CORRESPONDING #(  keys )
    RESULT DATA(flights2).

    LOOP AT flights2 INTO DATA(flight2).

    IF flight2-price <= 0.

      failed_record-%tky = flight2-%tky.
      APPEND failed_record TO failed-flight2.

      reported_record-%tky = flight2-%tky.

      reported_record-%msg = new_message(
                      id       = '/LRN/S4D400'
                      number   = '101'
                      severity = ms-error ).

      APPEND reported_record TO reported-flight2.

    ENDIF.


    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
