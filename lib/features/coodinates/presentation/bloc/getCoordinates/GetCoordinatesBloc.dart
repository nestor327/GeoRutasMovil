import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/coodinates/domain/use_cases/GetCoordinatesBetweenTwoBusStopsUseCase.dart';
import 'package:georutasmovil/features/coodinates/domain/use_cases/GetCoordinatesBetweenTwoPointsUseCase.dart';
import 'package:georutasmovil/features/coodinates/presentation/bloc/getCoordinates/GetCoordinatesEvent.dart';
import 'package:georutasmovil/features/coodinates/presentation/bloc/getCoordinates/GetCoordinatesState.dart';

class GetCoordinatesBloc
    extends Bloc<GetCoordinatesEvent, GetCoordinatesState> {
  final GetCoordinatesBetweenTwoBusStopsUseCase
      _getCoordinatesBetweenTwoBusStopsUseCase;
  final GetCoordinatesBetweenTwoPointsUseCase
      _getCoordinatesBetweenTwoPointsUseCase;

  GetCoordinatesBloc(this._getCoordinatesBetweenTwoBusStopsUseCase,
      this._getCoordinatesBetweenTwoPointsUseCase)
      : super(GetcoordinatesInitial()) {
    on<OnGetCoordinatesBetweenTwoBusStops>((event, emit) async {
      emit(GetcoordinatesLoading());

      final resp = await _getCoordinatesBetweenTwoBusStopsUseCase(
          event.firstBusStopId, event.secondBusStopId);

      resp.fold((f) => emit(GetCoordinatesFailure(failure: LocalFailure())),
          (p) => emit(GetCoordinatesBetweenTwoBusStopsState(list: p.cast())));
    });

    on<OnGetCoordinatesBetweenTwoPoints>((event, emit) async {
      emit(GetcoordinatesLoading());

      final resp = await _getCoordinatesBetweenTwoPointsUseCase(
          event.firstLatitude,
          event.secondLatitude,
          event.firstLongitude,
          event.secondLongitude);

      resp.fold((f) => emit(GetCoordinatesFailure(failure: LocalFailure())),
          (p) => emit(GetCoordinatesBetweenTwoPointsState(list: p.cast())));
    });
  }
}
