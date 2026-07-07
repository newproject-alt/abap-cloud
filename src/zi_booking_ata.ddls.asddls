@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'vista cds ej agencia reserva-claude-luis'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_booking_Ata 
as select from /dmo/booking

{
    //key client          as client,
    key travel_id       as travel_id,
    key booking_id      as booking_id,
        booking_date    as booking_date,
    @Semantics.amount.currencyCode: 'currencyCode'    
        
        flight_price    as flight_price,
        //currency_code   as currency_code,
        
        currency_code   as currencyCode,
        
       // (flight_price * 0.1 + flight_price) as precioFinal,
        
        case
        
            when flight_price < 500 then 'Economy'
            when flight_price >= 500 and flight_price <= 1500 then 'Business'
            when flight_price > 1500 then 'First Class'
            else 'eror'
       end as categoria //.   
       
       //case 
           // when booking_date < 01-01-2020 then 'Histórica'
           // else 'Reciente' 
      // end as EstadoFecha
              
    
}
