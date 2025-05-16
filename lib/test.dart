import 'package:e_commerce_application/core/functions/checkinternet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;
  initstate() async {
    res = await CheckInternet();
    print(res);
  }

  @override
  void initState() {
    initstate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
