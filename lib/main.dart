import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startingblocapp/Authentication/authentication_bloc.dart';
import 'package:startingblocapp/TestingBloCApp.dart';
import 'package:startingblocapp/pages/home_page.dart';
import 'package:startingblocapp/pages/login_page.dart';
import 'package:startingblocapp/pages/splash_page.dart';
import 'package:startingblocapp/widgets/loading_indicator.dart';

import 'Repository/user_repository.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
 // runApp(TestingBloCApp());
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return SplashPage();
          }
          if (state is AuthenticationSuccess) {
            return HomePage();
          }
          if (state is AuthenticationFailure) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthenticationInProgress) {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}