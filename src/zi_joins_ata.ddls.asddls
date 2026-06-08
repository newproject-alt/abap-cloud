@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'joins'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_joins_Ata 
as select from /dmo/travel     as Viaje
    inner join /dmo/booking    as Reserva on Reserva.travel_id = Viaje.travel_id
{
    key Viaje.travel_id        as TravelID,
    key Reserva.booking_id     as BookingID,
        Viaje.agency_id        as AgencyID,
        Viaje.begin_date       as BeginDate,
        Viaje.end_date         as EndDate,
        Reserva.booking_date   as BookingDate,
        @Semantics.amount.currencyCode: 'CurrencyCode'
        Viaje.total_price      as TotalPrice,
        @Semantics.amount.currencyCode: 'CurrencyCode'
        Reserva.flight_price   as BookingPrice,
        Reserva.currency_code  as CurrencyCode
}
