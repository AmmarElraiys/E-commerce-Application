import 'package:e_commerce_application/core/class/statusrequist.dart';
import 'package:e_commerce_application/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Handlingdataview extends StatelessWidget {
  final StatusRequist statusRequist;
  final Widget widget;
  const Handlingdataview({
    super.key,
    required this.statusRequist,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequist == StatusRequist.loading
        ? Center(child: Lottie.asset(AppImageassets.loading))
        : statusRequist == StatusRequist.offlinefailure
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "offlinefailure",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Lottie.asset(AppImageassets.offlineloading),
            ],
          ),
        )
        : statusRequist == StatusRequist.serverfailure
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "serverfailure",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Lottie.asset(AppImageassets.serviceloading),
            ],
          ),
        )
        : statusRequist == StatusRequist.failure
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: 15),
              Lottie.asset(AppImageassets.nodataloading),
            ],
          ),
        )
        : widget;
  }
}

class HandlingdataRequest extends StatelessWidget {
  final StatusRequist statusRequist;
  final Widget widget;
  const HandlingdataRequest({
    super.key,
    required this.statusRequist,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequist == StatusRequist.loading
        ? Center(child: Lottie.asset(AppImageassets.loading))
        : statusRequist == StatusRequist.offlinefailure
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "offlinefailure",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Lottie.asset(AppImageassets.offlineloading),
            ],
          ),
        )
        : statusRequist == StatusRequist.serverfailure
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "serverfailure",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Lottie.asset(AppImageassets.serviceloading),
            ],
          ),
        )
        : widget;
  }
}
