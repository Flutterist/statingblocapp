import 'dart:async';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  ConfigurationBloc(ConfigurationState initialState) : super(initialState);

  @override
  ConfigurationState get initialState => InitialConfigurationState();

  @override
  Stream<ConfigurationState> mapEventToState(
    ConfigurationEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
