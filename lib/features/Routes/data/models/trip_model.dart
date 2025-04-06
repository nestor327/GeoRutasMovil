import 'package:georutasmovil/features/Routes/domain/entities/trip.dart';

class TripModel extends Trip {
  TripModel(
      {required super.Id,
      required super.TotalWaitingTime,
      required super.TotalTravelTime,
      required super.trips});
}

class TripDataModel extends TripData {
  TripDataModel(
      {required super.Id,
      required super.TripId,
      required super.scheduleId,
      required super.BusId,
      required super.BusTypeId,
      required super.FromStopId,
      required super.FromStopLatitude,
      required super.FromStopLongitude,
      required super.ToStopId,
      required super.ToStopLatitude,
      required super.ToStopLongitude,
      required super.ArrivalTime,
      required super.UTCDepartureTime});
}
