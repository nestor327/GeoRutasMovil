import 'package:georutasmovil/features/Routes/domain/entities/trip.dart';

class TripPaginated {
  final List<Trip> Records;
  final PagingInf PagingInfo;

  TripPaginated({required this.Records, required this.PagingInfo});
}

class PagingInf {
  final int PerPage;
  final int CurrentPage;
  final int TotalRecords;
  late final int TotalPages;

  PagingInf(
      {required this.PerPage,
      required this.CurrentPage,
      required this.TotalRecords}) {
    TotalPages = int.parse(((PerPage == 0)
            ? 0
            : (TotalRecords / PerPage) + (TotalRecords % PerPage == 0 ? 0 : 1))
        .toString());
  }

  bool IsValid() {
    return CurrentPage >= 1 && CurrentPage <= TotalPages;
  }
}
