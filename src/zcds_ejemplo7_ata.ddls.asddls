@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'funciones de agregacion en cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_ejemplo7_ata as select from /dmo/travel
{
    key travel_id as TravelID,
        agency_id as AgencyID,
        
        @Semantics.amount.currencyCode: 'CurrencyCode'
        
        min( total_price ) as MinTotalPrice,
        //currency_code as CurrencyCode
        
        @Semantics.amount.currencyCode: 'CurrencyCode'
        
        max( total_price ) as MaxTotalPrice,
        
        @Semantics.amount.currencyCode: 'CurrencyCode'
        
        sum( total_price ) as SumTotalPrice,
        
        count( distinct total_price) as CountDistTotalPrice,        // valores diferentes en el grupo
        
        count( * ) as CountTotalPrice,  // total de filas del grupo
     
        currency_code as CurrencyCode
        
        
        
}

    group by
        travel_id,
        agency_id,
        currency_code;

