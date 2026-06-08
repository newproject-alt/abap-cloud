@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'primer cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_ejemplo_ata as select from /dmo/flight
{
      key carrier_id    as Airline_id,
      key connection_id as Connection_id,
      key flight_date   as Flight_date,
      @Semantics.amount.currencyCode: 'Currency'
      @EndUserText.label:             'Price'
      price             as Price,
      currency_code     as Currency,
      
      'USD'             as Personal_CurrencyDocument,
      '20300101'        as Personal_DataString,
      
      cast( '20300101'  as abap.dats ) as dateDate,                  // cast para conversión de tipos
      1.2               as FloatingPointElement,
      fltp_to_dec(1.2   as abap.dec( 4,2 )) as DecimalElement
}

// en un CDS se comenta con //
