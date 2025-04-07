import 'package:georutasmovil/features/Routes/data/models/trip_model.dart';
import 'package:georutasmovil/features/Routes/domain/entities/trip_paginated.dart';

class TripPaginatedModel extends TripPaginated {
  TripPaginatedModel({required super.Records, required super.PagingInfo});

  factory TripPaginatedModel.fromJson(json) {
    return TripPaginatedModel(
        PagingInfo: PagingInfModel.fromJson(json["pagingInfo"]),
        Records: TripModel.parseEntidades(json["records"]));
  }
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

  factory PagingInfModel.fromJson(json) {
    return PagingInfModel(
        CurrentPage: json["currentPage"],
        PerPage: json["perPage"],
        TotalRecords: 0);
  }

  bool IsValid() {
    return CurrentPage >= 1 && CurrentPage <= TotalPages;
  }
}
