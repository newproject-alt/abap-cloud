@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociaciones'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_ejemplo12_ata 
as select from /dmo/travel      as Travel

association[1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerID
                                                        // Se puede sustituir el
                                                        // $projection.CustomerID por Travel.CustomerID 
{
    key Travel.travel_id                                                    as TravelID,
        Travel.customer_id                                                  as CustomerID,
        concat_with_space( _Customer.first_name, _Customer.first_name, 2)   as CustomerName
        
    
}
