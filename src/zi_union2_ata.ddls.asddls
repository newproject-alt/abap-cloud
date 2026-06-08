@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds ej bases datos (empleado - alumnos)'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_union2_ata as select from zbd_alumno_ata

//o con una nueva con info de empleado
{

    columna as columna
    

}



//define view entity zi_union2_ata as select from zbd_empleado_der
//{
    //key correo                      as Correo,
    //key cast(0 as abap.int4)        as ID
    //nombre                          as Nombre        
//}

//union select distinct from ztb_alumnos
//{
   // key cast('' as abap.char(20))   as Correo,
   // key id                          as ID   
    //cast(nombre as abap.string( 256 ))      as Nombre
    
//}
