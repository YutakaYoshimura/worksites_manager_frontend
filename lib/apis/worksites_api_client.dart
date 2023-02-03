import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../constant/url.dart';
import '../models/worksites_model.dart';

part 'worksites_api_client.g.dart';

const tableName = 'worksites';

@RestApi(baseUrl: 'http://$apiUrl/$tableName')
abstract class WorksitesApiClient {
  factory WorksitesApiClient(Dio dio, {String baseUrl}) = _WorksitesApiClient;

  @GET('/{id}')
  Future<dynamic> get(@Path("id") int id);

  @GET('/')
  Future<dynamic> getAll();

  @GET('/updated/from/{strFrom}/to/{strTo}')
  Future<dynamic> getByUpdatedBetween(@Path("strFrom") String strFrom, @Path("strTo") String strTo);

  @GET('/maxid')
  Future<dynamic> getByMaxid();

  @POST('')
  Future<dynamic> add(@Body() WorksitesModel worksites);

  @PUT('/{id}')
  Future<dynamic> edit(@Path("id") int id, @Body() WorksitesModel worksites);

  @DELETE('/{id}')
  Future<dynamic> del(@Path("id") int id);
}