import 'dart:async';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  @override
  CounterState get initialState => InitialCounterState();

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
