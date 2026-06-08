@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'funciones de sistema en cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_ejemplo4_ata as select from /dmo/customer
{
    key customer_id             as CustomerID,
    $session.client             as NumeroSesion,    // el mandante
    $session.system_date        as FechaSistema,    // la fecha DEL SERVIDOR de sap(independiente del usuario)
    $session.system_language    as LenguaSistema,   // idioma del sistema
    $session.user               as CampoUsuario,    // el nombre del usuario que ejecuta la consulta
    $session.user_date          as FechaUsuario,    // la fecha según la zona horaria DEL USUARIO
    $session.user_timezone      as UserTZ           // la zona horaria configurada del usuario          
    
}
