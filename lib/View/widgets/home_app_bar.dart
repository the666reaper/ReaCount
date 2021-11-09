// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppBars {
  final Color appBarColor;

  AppBars([this.appBarColor = Colors.lightBlue]);
  static const String username = '';

  static PreferredSizeWidget HomeAppBar = AppBar(
    title: Title(color: Colors.black, child: const Text(username)),
  );

  static PreferredSizeWidget DetailAppBar = AppBar(
    title: Title(color: Colors.black, child: const Text(username)),
  );
}
