import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/worksites_model.dart';
import '../repositories/worksites_repository.dart';

part 'worksites_detail_view_model.freezed.dart';

@freezed
class WorksitesDetailPageState with _$WorksitesDetailPageState {
  const WorksitesDetailPageState._();
  const factory WorksitesDetailPageState({
    WorksitesModel? worksites,
    @Default(0) int id,
    @Default(false) bool errorFlg,
    @Default('') String errorState,
    @Default('') String errorMsg,
  }) = _WorksitesDetailPageState;
}

final worksitesDetailPageProvider = StateNotifierProvider.autoDispose.family<WorksitesDetailViewModel, WorksitesDetailPageState, int>((ref, int id) {
  return WorksitesDetailViewModel(WorksitesRepository(), ref, id);
});

class WorksitesDetailViewModel extends StateNotifier<WorksitesDetailPageState> {
  WorksitesDetailViewModel(this._worksitesRepository, this.ref, this.id) : super(WorksitesDetailPageState()) {
    get();
  }
  final WorksitesRepository _worksitesRepository;
  final Ref ref;
  final int id;

  Future<void> get() async {
    try{
      WorksitesModel data = await _worksitesRepository.get(1000);
      state = state.copyWith(worksites: data);
    } on HttpException catch (error) {
      state = state.copyWith(errorFlg: true);
      var a = Error();
    } catch (error, stacktrace) {
      var dioError = DioError;
      var a = DioErrorType.response;
      state = state.copyWith(errorFlg: true);
      state = state.copyWith(errorMsg: error.toString());
    }
  }

  Future<void> del() async {
    try{
      await _worksitesRepository.del(id);
    } catch (error, stacktrace) {
      //state = AsyncError(error, stacktrace);
    }
  }
}