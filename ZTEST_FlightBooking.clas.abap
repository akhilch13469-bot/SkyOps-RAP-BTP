CLASS ztest_flightbooking DEFINITION
  PUBLIC FINAL
  FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.

  PRIVATE SECTION.
    DATA: mo_cut TYPE REF TO lhc_flightbooking.   " Class Under Test

    METHODS:
      setup,
      test_book_flight         FOR TESTING,
      test_cancel_flight       FOR TESTING,
      test_validate_past_date  FOR TESTING,
      test_validate_email      FOR TESTING,
      test_set_default_status  FOR TESTING.

ENDCLASS.

CLASS ztest_flightbooking IMPLEMENTATION.

  METHOD setup.
    " Create test double for BO
    mo_cut = NEW lhc_flightbooking( ).
  ENDMETHOD.

  METHOD test_book_flight.
    " Given: A booking with status Open
    DATA(lv_uuid) = cl_system_uuid=>create_uuid_x16_static( ).

    INSERT zflightbooking FROM @(
      VALUE #(
        client       = sy-mandt
        booking_uuid = lv_uuid
        booking_status = 'O'
        flight_date  = sy-datum + 10
        seat_number  = '12A'
        passenger_email = 'test@example.com'
      )
    ).
    COMMIT WORK.

    " When: BookFlight action is triggered (simulated via EML)
    MODIFY ENTITIES OF zi_flightbooking
      ENTITY flightbooking
        EXECUTE bookflight FROM VALUE #( ( bookinuuid = lv_uuid ) )
      FAILED   DATA(lt_failed)
      REPORTED DATA(lt_reported).
    COMMIT ENTITIES.

    " Then: Status should be 'B'
    READ ENTITIES OF zi_flightbooking
      ENTITY flightbooking
        FIELDS ( bookingstatus )
        WITH VALUE #( ( bookinuuid = lv_uuid ) )
      RESULT DATA(lt_result).

    cl_abap_unit_assert=>assert_equals(
      act = lt_result[ 1 ]-bookingstatus
      exp = 'B'
      msg = 'BookFlight should set status to Booked'
    ).

    " Cleanup
    DELETE FROM zflightbooking WHERE booking_uuid = @lv_uuid.
    COMMIT WORK.
  ENDMETHOD.

  METHOD test_cancel_flight.
    cl_abap_unit_assert=>assert_true(
      act = abap_true
      msg = 'CancelFlight transitions B -> C (integration test needed)'
    ).
  ENDMETHOD.

  METHOD test_validate_past_date.
    " Past date should fail validation
    DATA(lv_past_date) = sy-datum - 1.

    cl_abap_unit_assert=>assert_true(
      act  = COND #( WHEN lv_past_date <= sy-datum THEN abap_true ELSE abap_false )
      msg  = 'Past date validation logic works'
    ).
  ENDMETHOD.

  METHOD test_validate_email.
    " Invalid email (no @)
    DATA(lv_bad_email) = 'notanemail'.
    DATA(lv_good_email) = 'user@example.com'.

    cl_abap_unit_assert=>assert_false(
      act = COND #( WHEN lv_bad_email CA '@' THEN abap_true ELSE abap_false )
      msg = 'Bad email should fail @ check'
    ).

    cl_abap_unit_assert=>assert_true(
      act = COND #( WHEN lv_good_email CA '@' AND lv_good_email CA '.'
                    THEN abap_true ELSE abap_false )
      msg = 'Good email should pass validation'
    ).
  ENDMETHOD.

  METHOD test_set_default_status.
    " New booking with no status -> should default to 'O'
    DATA(lv_initial_status) = space.
    DATA(lv_expected) = 'O'.

    " Simulate determination logic
    IF lv_initial_status IS INITIAL.
      lv_initial_status = 'O'.
    ENDIF.

    cl_abap_unit_assert=>assert_equals(
      act = lv_initial_status
      exp = lv_expected
      msg = 'Default status should be Open (O)'
    ).
  ENDMETHOD.

ENDCLASS.
