@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds - base datos empleadoder nombre-edad'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_prueba_ata as select from zbd_alumno_ata
// Si aparece bombilla, es una advertencia

{
    // key client          as client,
    registro              as registro,
    
    case
        when columna like 'Paco%' then 'Alumno Paco'
        when columna like 'A%'    then 'Alumno Mates A'
        when columna like 'B%' or columna like 'C%'    then 'Alumno Mates B'
        else 'No hay alumno'
    end as Case1
   
}    
