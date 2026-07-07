@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds para libros'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_libro_ata 
   as select from zbd_libro_ata
   association to parent zi_biblio_ata  as _Biblioteca
   on $projection.BibliotecaID          = _Biblioteca.BibliotecaID

{
    key biblioteca_id       as BibliotecaID,
    libro_id                as LibroID,
    titulo                  as Titulo,
    autor                   as Autor,
    genero                  as Genero,
    isbn                    as ISBN,
    fecha_publicacion       as FechaPublicacion,
    editorial               as Editorial,
    disponible              as Disponible,
    activo                  as Activo,
      
    created_by              as CreatedBy, 
    created_at              as CreatedAt, 
    last_changed_by         as LastChangedBy, 
    last_changed_at         as LastChangedAt, 
    local_last_changed_at   as LocalLastChangedAt,
    
    _Biblioteca

}
  
  
