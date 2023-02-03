import 'package:dio/dio.dart';

import '../apis/worksites_api_client.dart';
import '../models/worksites_model.dart';

class WorksitesRepository {
  final _worksitesApiClient = WorksitesApiClient(Dio());

  Future<dynamic> get(int id) async {
    return _worksitesApiClient.get(id)
      .then((value) {
        // APIで返ってきたJSONをモデルに変換
        return WorksitesModel.fromJson(value as Map<String, dynamic>);
      })
      .catchError((e) {
        int? errorCode = 0;
        String? errorMessage = "";
        switch (e.runtimeType) {
          case DioError:
            final res = (e as DioError).response;
            if (res != null) {
              errorCode = res.statusCode;
              errorMessage = res.statusMessage;
            }
            break;
          default:
        }
      });
  }

  Future<dynamic> getAll() async {
    return _worksitesApiClient.getAll().then((value) {
      // APIで返ってきたJSONをモデルに変換
      return value
        .map((e) => WorksitesModel.fromJson(e as Map<String, dynamic>))
        .toList();
    });
  }

  Future<dynamic> add(WorksitesModel worksites) async {
    return _worksitesApiClient.add(worksites).then((value) {
      return true;
    });
  }

  Future<dynamic> edit(int id, WorksitesModel worksites) async {
    return _worksitesApiClient.edit(id, worksites).then((value) {
      return true;
    });
  }

  Future<dynamic> del(int id) async {
    return _worksitesApiClient.del(id).then((value) {
      return true;
    });
  }
}