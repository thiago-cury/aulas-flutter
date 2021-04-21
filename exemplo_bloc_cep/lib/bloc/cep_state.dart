import 'package:equatable/equatable.dart';
import 'package:exemplo_cep/model/model.dart';

class CepState extends Equatable {

  @override
  List<Object> get props => [];

}

class CepIsLoadingState extends CepState {}
class CepIsNotSearchedState extends CepState {}

class CepIsNotLoadedState extends CepState {
  final _message;

  CepIsNotLoadedState(this._message);

  String get getMessage => _message;

  @override
  List<Object> get props => [_message];
}

class CepIsLoadedState extends CepState {

  final _cep;

  CepIsLoadedState(this._cep);

  Cep get getCep => _cep;

  @override
  List<Object> get props => [_cep];

}