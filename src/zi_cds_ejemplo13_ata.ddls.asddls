@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exposición'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_ejemplo13_ata 
as select from /dmo/travel as Travel



    // Cada viaje tiene exactamente un cliente, mínimo 1 (siempre hay cliente, no puede faltar) y máximo 1 (no puede haber dos)
    // RELACIÓN OBLIGATORIA Y ÚNICA   
    association[1..1] to /dmo/customer  as _Customer    on _Customer.customer_id    = $projection.CustomerID

    // Igual que la anterior. Cada viaje pertenece a EXACTAMENTE una agencia. Siempre hay una y sólo una
    association[1..1] to /dmo/agency    as _Agency      on _Agency.agency_id        = $projection.AgencyID 

    // Cada viaje puede tener DESDE CERO HASTA MUCHAS reservas. El 0 significa que un viaje podría no tener ninguna reserva todavía
    // * = Puede acumular tantas como haga falta
    association[0..*] to /dmo/booking   as _Booking     on _Booking.travel_id       = $projection.TravelID 

    
    // Un viaje (travel) apunta a un cliente y una agencia -> son los "padres" o datos maestros, por eso [1..1] el viaje no tiene sentido sin ellos
    // La reserva (booking) son los "hijos" que cuelgan del viaje. Un viaje agrupa varias reservas -> por eso [0..*]
    


{
    // En un CDS, podemos ver datos de...varias tablas :-)
    
    
    key Travel.travel_id        as TravelID,
        Travel.customer_id      as CustomerID,
        Travel.agency_id        as AgencyID,
        _Customer,
        _Agency,
        _Booking
        
        // Asociación/Relación  -> el hecho de que travel esté conectado con customer, agency o booking; eso es relación
        // Cardinalidad         -> es sólo el [min..max]; un atributo de la relación que cuantifica cuántas instancias hay en cada extremo
    
}
