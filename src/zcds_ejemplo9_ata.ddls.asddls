@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds nuevo'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_ejemplo9_Ata 
    as select from /dmo/customer
{
    key customer_id             as CustomerID,
    
        case country_code
                                  // Concatenación dentro de una concatenación
            when 'US' then concat( 'United States - ', concat_with_space( last_name, first_name, 2 ) )           // Para meter todo en una columna
            when 'DE' then 'Germany'
            when 'ES' then 'Spain'
            else 'Código de país distinto'
        end as Case1,    
        
        
        
        $session.client             as Cliente,             // Mandante
        $session.system_date        as ClientField,         // Fecha actual del servidor SAP
        $session.system_language    as systemIdioma,        // Idioma del sistema
        $session.user               as UserField,           // ID del usuario logeado
        $session.user_date          as userDate,            // Fecha local del usuario
        $session.user_timezone      as userTz               // Zona horaria del usuario
        
        
}
