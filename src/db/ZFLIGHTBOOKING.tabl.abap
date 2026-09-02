@EndUserText.label : 'Flight Booking Table'
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED

define table zflightbooking {
  key client            : abap.clnt not null;
  key booking_uuid      : sysuuid_x16 not null;
  booking_id            : abap.numc(8);
  airline_id            : abap.char(3);
  flight_number         : abap.char(6);
  flight_date           : abap.dats;
  passenger_name        : abap.char(50);
  passenger_email       : abap.char(100);
  seat_number           : abap.char(5);
  booking_status        : abap.char(1);
  total_price           : abap.curr(15,2);
  currency_code         : abap.cuky;
  created_by            : syuname;
  created_at            : utclong;
  last_changed_by       : syuname;
  last_changed_at       : utclong;
  local_last_changed_at : utclong;
}
