// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
final class _$LoginApiService extends LoginApiService {
  _$LoginApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = LoginApiService;

  @override
  Future<Response<dynamic>> loginUser(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}