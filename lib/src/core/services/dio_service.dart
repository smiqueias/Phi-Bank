import 'package:dio/dio.dart';

abstract class IDioService {
  Dio getDio();
}

class DioService implements IDioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://desafio-mobile-bff.herokuapp.com',
        headers: {
          'Content-Type': 'application/json',
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'
        },
      ),
    );
  }
}
