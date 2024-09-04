import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/models.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://test.kafiil.com/api/test")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET("/dependencies")
  Future<DependenciesResponse> getDependencies();

  @POST("/user/register")
  @MultiPart()
  Future<HttpResponse> registerUser({
    @Part(name: "first_name") required String firstName,
    @Part(name: "last_name") required String lastName,
    @Part(name: "about") required String about,
    @Part(name: "tags[]") required List<String> tags,
    @Part(name: "favorite_social_media[]")
    required List<String> favoriteSocialMedia,
    @Part(name: "salary") required String salary,
    @Part(name: "password") required String password,
    @Part(name: "email") required String email,
    @Part(name: "birth_date") required String birthDate,
    @Part(name: "gender") String? gender, // Optional
    @Part(name: "type") required String type,
    @Part(name: "password_confirmation") required String passwordConfirmation,
    @Part(name: "avatar") File? avatar, // Optional
  });

  @POST("/user/login")
  Future<LoginResponse> loginUser({
    @Body() required Map<String, String> loginData,
  });

  @GET("/country")
  Future<CountryResponse> getCountries({
    @Query("page") int? page, // To handle pagination, if needed
  });

  @GET("/service")
  Future<ServiceResponse> getServices();

  @GET("/service/popular")
  Future<ServiceResponse> getPopularServices();
}
