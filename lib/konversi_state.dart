
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class KonversiState extends Equatable{}

class AksaraInitState extends KonversiState{
  @override
  List<Object> get props => [];
}

class AksaraLoadingState extends KonversiState{
  @override
  List<Object> get props => [];
}

class AksaraLoadedState extends KonversiState{
  final String domainText;
  final String targetText;
  final bool isFromFile;
  AksaraLoadedState({@required this.domainText, @required this.targetText, @required this.isFromFile});
  @override
  List<Object> get props => [domainText, targetText];

}

class AksaraToggleState extends KonversiState{
  bool isMurdha;
  bool isCopas;
  bool isSpasi;

  AksaraToggleState({@required this.isMurdha, @required this.isCopas, @required this.isSpasi});
  @override
  List<Object> get props => [isMurdha, isCopas, isSpasi];
}