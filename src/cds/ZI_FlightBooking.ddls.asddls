@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Booking - Interface View'

define root view entity ZI_FlightBooking
  as select from zflightbooking
{
  key booking_uuid          as BookingUUID,
      booking_id            as BookingID,
      airline_id            as AirlineID,
      flight_number         as FlightNumber,
      flight_date           as FlightDate,
      passenger_name        as PassengerName,
      passenger_email       as PassengerEmail,
      seat_number           as SeatNumber,
      booking_status        as BookingStatus,
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt
}
