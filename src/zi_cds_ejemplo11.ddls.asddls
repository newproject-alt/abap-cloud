@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociación con parámetros'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_ejemplo11 
with parameters
    pCountryCode    : land1,
    pCity           : abap.char( 40 )       // Parámetro como si fuera una variable, tiene su nombre
as select from /dmo/agency
{
    
    key agency_id       as AgencyID,
    name                as Name,
    street              as Street,
    postal_code         as PostalCode,
    city                as City,            // Campo de tabla
    country_code        as CountryCode,
    phone_number        as PhoneNumber,
    email_address       as EmailAddress,
    web_address         as WebAddress,
    attachment          as Attachment,
    mime_type           as MimeType,
    filename            as Filename
}
where
    city            = $parameters.pCity     // Indicas que el valor del campo tenga el valor definido por el parámetro X
    and 
    country_code    = $parameters.pCountryCode;
    
    
    
    
    
