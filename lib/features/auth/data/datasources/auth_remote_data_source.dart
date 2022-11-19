import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:bond/features/auth/data/models/user.dart';
import 'package:bond/features/auth/data/models/user_meta.dart';
import 'package:one_studio_core/core.dart';

class AuthRemoteDataSource extends DataSource {
  final ApiClient _client;

  AuthRemoteDataSource(this._client);

  Future<SingleMResponse<User, UserMeta>> register(UserDto user) async {
    Map<String, dynamic> body = await user.body;
    return mapSingleMResponse<User, UserMeta>(await _client.post(
      AuthApis.register(),
      body: body,
      headers: Api.headers(),
    ));
  }

  Future<SingleMResponse<User, UserMeta>> login(UserDto user) async {
    Map<String, dynamic> body = await user.body;
    return mapSingleMResponse<User, UserMeta>(await _client.post(
      AuthApis.login(),
      body: body,
      headers: Api.headers(),
    ));
  }
}

extension AuthApis on Api {
  static String register() => 'auth/signup';

  static String login() => 'auth/login';
}
