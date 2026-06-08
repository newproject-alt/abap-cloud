@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'segundo cds de prueba'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_ejemplo2_ata as select from zbd_alumno_ata
{
   // key client as Vamos_EspaNa,       Este no se pone con alias, porque no es visible en la BD
   key registro as Lo_Lo_Lo_Lo,
   columna      as La_SEGUNDAAA
}
