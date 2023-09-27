import 'package:aiapait/utils/constants.dart';
import 'package:chopper/chopper.dart';

// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
part 'signup_api_service.chopper.dart';

@ChopperApi(baseUrl: '/register')
abstract class SignUpApiService extends ChopperService {
  @Post()
  Future<Response> signUpUser(
    @Body() Map<String, dynamic> body,
  );

  static SignUpApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: Uri.parse(baseUrl),
      services: [
        // The generated implementation
        _$SignUpApiService(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: const JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$SignUpApiService(client);
  }
}
