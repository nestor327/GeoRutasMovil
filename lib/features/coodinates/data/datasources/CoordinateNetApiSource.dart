import 'package:georutasmovil/features/coodinates/data/models/CoordinateModel.dart';
import 'package:dio/dio.dart';

abstract class CoordinateNetApiSource {
  Future<List<CoordinateModel>> getCoordinatesBetweenTwoPoints(
      double firstLatitude,
      double secondLatitude,
      double firstLongitude,
      double secondLongitude);

  Future<List<CoordinateModel>> getCoordinatesBetweenTwoBusStops(
      int firstBusStopId, double secondBusStopId);
}

class CoordinateNetApiSourceImpl implements CoordinateNetApiSource {
  final Dio dio = Dio();

  @override
  Future<List<CoordinateModel>> getCoordinatesBetweenTwoBusStops(
      int firstBusStopId, double secondBusStopId) async {
    final response = await dio.get("api/getCoordinatesBetweenBusStops");

    return CoordinateModel.fromJsonList(response.data);
  }

  @override
  Future<List<CoordinateModel>> getCoordinatesBetweenTwoPoints(
      double firstLatitude,
      double secondLatitude,
      double firstLongitude,
      double secondLongitude) async {
    final response = await dio.get("api/getCoordinatesBetweenBusStops");

    return CoordinateModel.fromJsonList(response.data);
  }
}
