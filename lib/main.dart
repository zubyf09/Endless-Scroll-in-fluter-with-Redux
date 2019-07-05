import 'package:flutter/material.dart';
import 'environment.dart';
import 'package:upday_assignment/store/store.dart';
import 'package:upday_assignment/store/state/app.state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:upday_assignment/bloc/theme_bloc.dart';
import 'package:upday_assignment/pages/shutterstock_home.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'constants/api.dart';

void main() async {
  final Store<AppState> store = await Environment.setup();
  return runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store, child: MaterialApp(home: ShutterStockHome()));
  }
}
