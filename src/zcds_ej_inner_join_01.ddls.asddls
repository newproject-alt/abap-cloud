@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds ej repaso 1 - nv basico conexiones'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_ej_inner_join_01
as select from /dmo/carrier             as car
    inner join /dmo/connection          as con on car.carrier_id = con.carrier_id
    
{
   //key con.carrier_id                   as carrier_id,
   key con.connection_id                as connectionID,   
   car.name                             as carrier_name,
   con.airport_from_id                  as airport_from_id,
   con.airport_to_id                    as airport_to_id,
   con.distance_unit                    as distance_unit
      
    
}
where car.currency_code = 'EUR'
