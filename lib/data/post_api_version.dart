

import 'package:chopper/chopper.dart';


part "post_api_version.chopper.dart";

@ChopperApi(baseUrl : '/posts')
abstract class PostApiService extends ChopperService {

  // helper methods that help you instanciate your service
//  static PostApiService create([ChopperClient client]) =>
//      _$PostApiService(client);
  @Get()
  Future<Response> getPosts();

  @Get(path: '/{id}')
  Future<Response> getPost(@Path('id') int id);

  @Post()
  Future<Response> postPosts(
    @body Map<String , dynamic> body
    );

  static PostApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        // The generated implementation
        _$PostApiService(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$PostApiService(client);
  }
}
