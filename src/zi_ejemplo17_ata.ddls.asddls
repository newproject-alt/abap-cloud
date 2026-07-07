@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds...........para el 16'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_ejemplo17_Ata 
as select from /dmo/booking

association[1..1] to zi_ejemplo16_Ata as _Travel on _Travel.TravelID = $projection.TravelID


{
    key travel_id as TravelID,
    key booking_id as BookingID,
    booking_date as BookingDate,
    customer_id as CustomerID,
    carrier_id as CarrierID,
    connection_id as ConnectionID,
    flight_date as FlightDate,
    _Travel
}
