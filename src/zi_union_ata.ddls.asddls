@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'union vistas (nombre bien, zi para cds)'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_union_ata as select from /dmo/travel
{
    key travel_id                   as TravelID,
        // Casteo "ficticio" para meter un campo que no esté en esta tabla
    cast( '' as abap.numc(4))       as BookingID
}

union select distinct from /dmo/booking                  // el distinct es para que no haya valores vacíos para los campos clave?
{
    key travel_id                   as TravelID,         // estos dos primeros (travel_id) comparten data element
    booking_id                      as BookingID
}
