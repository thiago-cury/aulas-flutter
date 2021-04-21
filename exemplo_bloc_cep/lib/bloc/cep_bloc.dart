import 'package:exemplo_cep/bloc/bloc.dart';
import 'package:exemplo_cep/model/model.dart';
import 'package:exemplo_cep/service/cep_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CepBloc extends Bloc<CepEvent, CepState> {

  CepService _cepService;

  CepBloc(this._cepService) : super(CepIsNotSearchedState());

  @override
  Stream<CepState> mapEventToState(CepEvent event) async* {

    if(event is ResetCepEvent) {
      yield* mapEventResetCepToState(event);
    } else if(event is FetchCepEvent) {
      print('eventFetchCep');
      yield* mapEventFetchCepToState(event);
    } else {
      print('else event bloc');
    }

  }

  Stream<CepState> mapEventResetCepToState(CepEvent event) async* {
    print('entrou mapEventToState ResetCepEvent');
    yield CepIsNotSearchedState();
  }

  Stream<CepState> mapEventFetchCepToState(CepEvent event) async* {
    yield CepIsLoadingState();

    print('entrou mapEventToState FetchCepEvent');
    print('recebi CEP: ${event.props}');

    Cep cep = await _cepService.getCEP(event.props[0].toString());

    if(cep != null)
      yield CepIsLoadedState(cep);
    else
      // throw Exception();
      yield CepIsNotLoadedState("Algum erro ocorreu :-/");
  }

}