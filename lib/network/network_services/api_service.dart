import 'package:chopper/chopper.dart';

// this is necessary for the generated code to find your class
part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  // helper methods that help you instantiate your service
  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://www.omdbapi.com/?apikey=540a2040&t=',
      services: [_$ApiService()],
      converter: const JsonConverter(),
    );
    return _$ApiService(client);
  }

  @Get(path: '{title}&y={year}')
  Future<Response> getMovie(
    @Path('title') final String title,
    @Path('year') final String year,
  );
}
