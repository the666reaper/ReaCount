// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  List<Object> list = [const <dynamic>[]];
  Failure(list);

  @override
  List<Object> get props => list;
}
