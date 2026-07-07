@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociaciones con clases'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_ejemplo16_Ata 
as select from /dmo/travel as Travel

association[1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerID

association[1..1] to /dmo/agency as _Agency on _Agency.agency_id = $projection.AgencyID


{
    key travel_id as TravelID,
        customer_id as CustomerID,
        agency_id as AgencyID,
        _Customer,
        _Agency
    
}
