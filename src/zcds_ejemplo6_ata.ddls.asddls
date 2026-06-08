@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'union - joints'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_ejemplo6_ata as select from /dmo/travel
{
    key travel_id            as TravelID,
    cast('' as abap.numc(4)) as bookingID
}

// Cuando haces una union, todas las ramas deben devolver exactamente las mismas columnas, con los mismos tipos de datos.
// En este caso, la tabla /dmo/travel no tiene ningun campo booking_id, pero la vista necesaria 

union select from /dmo/booking              // distinct para distinguir supongo 
{
    key travel_id           as TravelID,
    booking_id              as BookingID
}    
