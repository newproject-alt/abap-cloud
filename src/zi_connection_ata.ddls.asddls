@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ej cds - modelo de vuelos'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_connection_Ata 
as select from /dmo/connection      as Connection

    // Todos los and quitados porque Maxi le pregunta al profe y le dice que los quito
    // "Innecesario"
    // Yo no voy a ser menos

association[1..1] to /dmo/carrier   as _Carrier             on _Carrier.carrier_id          = $projection.CarrierID     // + _Carrier.name    =     $projection.CarrierID
                                                            //and _Carrier.name               = $projection.Carriername
association[1..1] to /dmo/airport   as _DepartureAirport    on _DepartureAirport.airport_id = $projection.AirportFromID

                    // Vale, es que yo estaba diciendo que _departureblbl.airportid era igual a connection.airport_

                                                            //and _DepartureAirport.name      = $projection.DepartureAirportname
                                                            //and _DepartureAirport.city      = $projection.DepartureAirportCity
association[0..*] to /dmo/flight    as _Flights             on _Flights.connection_id       = $projection.ConnectionID
                                                           // and _Flights.carrier_id         = $projection.FlightCarrierID
                                                            //and _Flights.flight_date        = $projection.FlightDate
                                                            //and _Flights.price              = $projection.Price


{
    key Connection.carrier_id       as CarrierID,
    key Connection.connection_id    as ConnectionID,
        Connection.airport_from_id  as AirportFromID,
        Connection.airport_to_id    as AirportToID,
        Connection.departure_time   as DepartureTime,
        @Semantics.quantity.unitOfMeasure: 'DistanceUnit'   // No puesto
        Connection.distance         as Distance,
        
        distance_unit               as DistanceUnit,        // Tampoco
        
        _Carrier,
        _DepartureAirport,
        _Flights
        
        
}
