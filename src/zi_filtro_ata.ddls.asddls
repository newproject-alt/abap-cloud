@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds para path expression'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_filtro_Ata 
as select from /dmo/travel

association[0..*] to I_CurrencyText as _Currency on _Currency.Currency = $projection.Currency

{
    key travel_id               as TravelID,
    @Semantics.amount.currencyCode: 'Currency'
    total_price                 as Price,
    currency_code               as Currency,
    // _Currency.CurrencyName
    
    //_Currency[ Language = $session.system_language ].CurrencyName
    _Currency[ 1: Language = $session.system_language ].CurrencyName
}
