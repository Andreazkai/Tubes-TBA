import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class KonversiEvent extends Equatable{}

class LatinToAksara implements KonversiEvent {
  final String s;
  LatinToAksara({@required this.s});
  @override
  List<Object> get props => [s];

  @override
  // TODO: implement stringify
  bool get stringify => false;
}

class AksaraToLatin implements KonversiEvent {
  final String s;
  AksaraToLatin({@required this.s});
  @override
  List<Object> get props => [s];

  @override
  // TODO: implement stringify
  bool get stringify => false;
}