@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS ej asociacion - reserva'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_12_booking_Ata 
as select from /dmo/booking             as Booking

association[1..1] to /dmo/carrier as _Carrier on _Carrier.carrier_id = Booking.carrier_id

{
    key Booking.booking_id                                          as BookingID,
    key Booking.carrier_id                                          as CarrierID,       
    // El key en las asociaciones de CDS lo eliges tú
        Booking.flight_date                                         as FlightDate,
        concat_with_space( _Carrier.carrier_id, _Carrier.name, 1)   as CarrierInfo
        
}
