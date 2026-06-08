@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds con base referenciada'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_ejemplo10_Ata as select from /dmo/flight
{
    key carrier_id          as CarrierId,
    key connection_id       as ConnectionId,
    key flight_date         as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'          //Falta el semantics, porque price y currencycode son campo moneda          // El currencycode se pone porque es el tipo moneda
    price                   as Price,
    currency_code           as CurrencyCode,                           
    plane_type_id           as PlaneTypeId,
    seats_max               as SeatsMax,
    seats_occupied          as SeatsOccupied
}
