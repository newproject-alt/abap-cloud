@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds de nuevo'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_ejemplo8_ata               // Para comentar
    as select from /dmo/flight                     // Para relacionar tu cds con una base de datos
{

    key carrier_id                      as AerolineaID,            // Un campo clave con alias
    key connection_id                   as ConnectionID,
    key flight_date                     as FlightDate,
    @Semantics.amount.currencyCode: 'moneda'                       // Semantics - moneda según el país se pone de X manera (coma, punto...)
    @EndUserText.label: 'Precio'                                   // Es como para poner el tipo, y luego label para alias/etiqueta
    price                               as Precio,
    currency_code                       as moneda,
    
    // Un mundo de posibilidades
    'USD'                               as manual,                 // Para rellenar con mismo dato una columna nueva, nuevo campo
    '20300101'                          as fecha,
    // Con un valor forzado, un 'literal'
    cast('20300202' as abap.dats)       as FechaC,     // Alias    // Convierte un dato al tipo mencionado
    1.2                                 as flotante,
    fltp_to_dec(3.2 as abap.dec( 4,2 )) as NumDecimal   
    
}
