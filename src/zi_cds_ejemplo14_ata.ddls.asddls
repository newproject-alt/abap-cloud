@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'asociacion a otros cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_ejemplo14_ata 
with parameters
    pCountryCode : land1
as select from /dmo/travel as Travel

association[1..1] to zi_cds_13_der as _Agency on _Agency.AgencyId = $projection.AgencyID

{
    key travel_id                                                                   as TravelID,
        agency_id                                                                   as AgencyID,
_Agency(pCountryCode : $parameters.pCountryCode)[ City='Chicago' ].Name     as AgencyName
}
