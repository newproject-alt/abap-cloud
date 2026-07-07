@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'prueba para travel 2-7-26'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_prueba_travel_Ata
  as select from /dmo/travel
{
  agency_id        as Agencia,
  count(*)         as num_reservas,

  @Semantics.amount.currencyCode: 'Moneda'
  sum(total_price) as precio_total,
  
  @Semantics.amount.currencyCode: 'Moneda'
  avg( cast( total_price as zdecimal2_25 ) as zdecimal2_25 ) as precio_medio,
  
  currency_code    as Moneda

}
group by
  agency_id,
  currency_code
