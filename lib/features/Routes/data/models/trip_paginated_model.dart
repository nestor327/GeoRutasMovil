import 'package:georutasmovil/features/Routes/domain/entities/trip_paginated.dart';

class TripPaginatedModel extends TripPaginated {
  TripPaginatedModel({required super.Records, required super.PagingInfo});
}

class PagingInfModel extends PagingInf {
  PagingInfModel(
      {required super.PerPage,
      required super.CurrentPage,
      required super.TotalRecords}) {
    TotalPages = int.parse(((PerPage == 0)
            ? 0
            : (TotalRecords / PerPage) + (TotalRecords % PerPage == 0 ? 0 : 1))
        .toString());
  }

  bool IsValid() {
    return CurrentPage >= 1 && CurrentPage <= TotalPages;
  }
}
