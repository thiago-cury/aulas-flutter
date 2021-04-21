import 'package:equatable/equatable.dart';

class CepEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class ResetCepEvent extends CepEvent {}

class FetchCepEvent extends CepEvent {

  final _numberCep;

  FetchCepEvent(this._numberCep);

  @override
  List<Object> get props => [_numberCep];

  // @override
  // List<Object> get props {
  //   return [_numberCep];
  // }

}