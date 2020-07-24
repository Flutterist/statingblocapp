import 'package:cubit/cubit.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void divideby2() => emit((state/2).toInt());
  void multiplyby2() => emit((state*2).toInt());

  @override
  void onTransition(Transition<int> transition) {
    /// Log all state changes (transitions).
    print(transition);
    super.onTransition(transition);
  }
}
