import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../models/worksites_model.dart';
import '../repositories/worksites_repository.dart';

final worksitesInputPageProvider = StateNotifierProvider.autoDispose.family<WorksitesInputViewModel, WorksitesModel, int>(
  (ref, int id) => WorksitesInputViewModel(ref, id),
);

class WorksitesInputViewModel extends StateNotifier<WorksitesModel> {
  final Ref ref;
  final int id;
  WorksitesInputViewModel(this.ref, this.id) : super(WorksitesModel()) {
    if (id != 0) {
      //this.inputMode = 1;
    }
    get();
  }
  final ImagePicker picker = ImagePicker();
  final WorksitesRepository _worksitesRepository = WorksitesRepository();
  final int inputMode = 0;

  Future<void> get() async {
    try{
      if (id != 0) {
        WorksitesModel data = await _worksitesRepository.get(id);
        state = data;
      }
    } catch (error, stacktrace) {
      //state = AsyncError(error, stacktrace);
    }
  }

  Future<void> add() async {
    try{
      await _worksitesRepository.add(state);
    } catch (error, stacktrace) {
      //state = [...state, error, stacktrace](error, stacktrace);
    }
  }

  Future<void> edit() async {
    try{
      await _worksitesRepository.edit(id, state);
    } catch (error, stacktrace) {
      //state = [...state, error, stacktrace](error, stacktrace);
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if(pickedFile != null) {
      var photoBites = await pickedFile.readAsBytes();
      var encodePhoto = base64.encode(photoBites);
      state = state.copyWith(photo: encodePhoto);
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null) {
      var photoBites = await pickedFile.readAsBytes();
      var encodePhoto = base64.encode(photoBites);
      state = state.copyWith(photo: encodePhoto);
    }
  }
  
  void setStateName (String value) {
    state = state.copyWith(name: value);
  }
  void setStateSubName (String value) {
    state = state.copyWith(subName: value);
  }
  void setStateType (String value) {
    state = state.copyWith(type: value);
  }
  void setStateStaffName (String value) {
    state = state.copyWith(staffName: value);
  }
  void setStateAddress (String value) {
    state = state.copyWith(address: value);
  }
  void setStateStatus (String value) {
    state = state.copyWith(status: value);
  }
  void setStateStartAt (String value) {
    DateTime date = DateFormat('yyyy年MM月dd日').parse(value);
    state = state.copyWith(startAt: date);
  }
  void setStateEndAt (String value) {
    DateTime date = DateFormat('yyyy年MM月dd日').parse(value);
    state = state.copyWith(endAt: date);
  }
}