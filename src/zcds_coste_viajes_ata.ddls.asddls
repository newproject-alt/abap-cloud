@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'primer ej de cds, listado de costes'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_coste_viajes_Ata as select from /dmo/travel
{
    key travel_id            as TravelID,
    cast('' as abap.numc(4)) as bookingID
    //currency_code            as CurrencyCode,
    // @Semantics.amount.currencyCode : 'CurrencyCode'
    // booking_fee              as BookingFee
   // total_price              as TotalPrice,
   // cast(0 as abap.curr(16,2)) as FlightPrice
    
}


union select distinct from /dmo/booking
{
    key travel_id            as TravelID,
    booking_id               as BookingID
   // currency_code            as CurrencyCode,
    // cast(booking_id as abap.numc(4)) as BookingID,
    // 
    // currency_code            as CurrencyCode
    //cast(null as abap.curr(5,2)) as BookingFee          
    //Booking_fee              as BookingFee
    //cast(null as abap.curr(16,2)) as TotalPrice,
    //cast(total_price as abap.curr(16,2)) as TotalPrice,
   // flight_price as FlightPrice
    
    
    
        
}
