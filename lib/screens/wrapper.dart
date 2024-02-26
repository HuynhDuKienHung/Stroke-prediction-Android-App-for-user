import 'package:app_benh_nhan/models/myuser.dart';
import 'package:app_benh_nhan/screens/authenticate/authenticate.dart';
import 'package:app_benh_nhan/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GetUser?>(context);
    // return either Home or Authenticate widget
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
