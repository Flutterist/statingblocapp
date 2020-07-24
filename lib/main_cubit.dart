import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:startingblocapp/CounterCubit.dart';

void main_cubit() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CubitProvider(
        create: (_) => CounterCubit(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int _counter = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Cubit"),
      ),
      body: CubitBuilder<CounterCubit,int>(
        cubit: context.cubit(),
        builder: (context, count) {

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$count',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        }
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: context.cubit<CounterCubit>().increment,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: context.cubit<CounterCubit>().decrement,
            ),
          ), Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: FloatingActionButton(
              child: const Icon(Icons.face),
              onPressed: context.cubit<CounterCubit>().multiplyby2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: FloatingActionButton(
              child: const Icon(Icons.tag_faces),
              onPressed: context.cubit<CounterCubit>().divideby2,
            ),
          ),
        ],
      ),
    );
  }
}
