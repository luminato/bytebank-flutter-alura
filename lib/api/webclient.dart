import 'package:bytebank/api/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


final Client client =
    InterceptedClient.build(interceptors: [LoggingInterceptor()]);

const String baseUrl = 'http://192.168.100.26:8080/transactions';

