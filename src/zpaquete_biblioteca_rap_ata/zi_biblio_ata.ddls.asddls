@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds para biblioteca'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_biblio_ata 
        as select from zbd_biblio_ata
        composition [0..*] of zi_libro_ata as _Libros
{
      key biblioteca_id     as BibliotecaID,
      nombre                as Nombre,
      direccion             as Direccion,
      telefono              as Telefono,
      email                 as Email,
      responsable           as Responsable,
      fecha_alta            as FechaAlta,
      activa                as Activa,
      
      created_by as CreatedBy, 
      created_at as CreatedAt, 
      last_changed_by as LastChangedBy, 
      last_changed_at as LastChangedAt, 
      local_last_changed_at as LocalLastChangedAt,
     
      _Libros
}
