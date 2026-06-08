@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'tercer cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_ejemplo3_ata as select from /dmo/customer
{
    key customer_id as Cliente_id,
    
    case country_code
    
        when 'US' then concat( 'United States - ', concat_with_space( last_name , first_name, 2 ) )
        when 'DE' then concat('Germany - ',       last_name )
        when 'ES' then concat('Spain - ',         last_name )
        else 'Another Country Code'
        
    end as Case1,
    
    
    case
        when country_code = 'US' or country_code = 'ES' then case title
                                                                when 'Mr.'  then 'US/ES - Mr.'
                                                                when 'Mrs.' then 'US/ES - Mrs.'
                                                                else 'US/ES - Different Title'
                                                                end
                                                                
        when title = 'Mr.' then last_name
        when cast( '20300101' as abap.dats ) < dats_add_days( $session.system_date, - 30, 'NULL') then 'lower'
        else 'No condition applied'
        end as Case2                                                                
           
}
