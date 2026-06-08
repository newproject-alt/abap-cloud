@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'joins ej'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_joins_ej_Ata 
as select from /dmo/travel          as Viaje
    inner join /dmo/booking         as Reserva on Reserva.travel_id = Viaje.travel_id
    
{
    key Viaje.travel_id                 as TravelID,
    key Reserva.booking_id              as BookingID,
        Reserva.flight_date             as FlightDate,
        @Semantics.amount.currencyCode : 'CurrencyCode'
        Reserva.flight_price            as FlightPrice,
        Viaje.agency_id                 as AgencyID,
        @Semantics.amount.currencyCode : 'CurrencyCode'
        Viaje.booking_fee               as BookingFee,
        Reserva.currency_code           as CurrencyCode        
}

