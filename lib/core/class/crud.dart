import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequist, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await CheckInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        if (response.statusCode == 200 || response.statusCode == 2001) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequist.serverfailure);
        }
      } else {
        return const Left(StatusRequist.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequist.serverfailure);
    }
  }
}
