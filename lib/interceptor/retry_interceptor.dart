import 'dart:io';

import 'package:dio/dio.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
   @override
   void onError(DioError err, ErrorInterceptorHandler handler) {
     if(_shouldRetry(err)){

     }
     return err;
   }

   bool _shouldRetry(DioError err) {
     return err.type == DioErrorType.connectTimeout &&
         err.error != null &&
         err.error is SocketException;
   }
}
