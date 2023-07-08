// import 'dart:math';

// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// List<String> names = ['Alice', 'Bob', 'Charlie', 'Dave', 'Eve'];
// String getRandomName(List<String> names) {
//   final random = Random();
//   int randomIndex = random.nextInt(names.length);
//   return names[randomIndex];
// }

// class NameCubit extends Cubit<String?> {
//   NameCubit(super.initialState);

//   void pickNames() {
//     emit(getRandomName(names));
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late final NameCubit cubit;
//   @override
//   void initState() {
//     super.initState();
//     cubit = NameCubit(null);
//   }

//   @override
//   void dispose() {
//     cubit.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home page'),
//       ),
//       body: StreamBuilder<String?>(
//         stream: cubit.stream,
//         builder: (context, snapshot) {
//           final button = ElevatedButton(onPressed: () {
//             cubit.pickNames();
//           }, child: const Text('Name'));
//           switch (snapshot.connectionState) {
//             case ConnectionState.active:
//               return Column(
//                 children: [
//                   Text(snapshot.data ?? ""),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   button
//                 ],
//               );
//             case ConnectionState.done:
//               return const SizedBox();
//             case ConnectionState.none:
//               return button;
//             case ConnectionState.waiting:
//               return button;
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:bloc1/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
            return Text(state.counterValue.toString());
          })
        ],
      )),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterCubit>(context).incrementCounter();
          },
          child: const Text('+'),
        ),
        FloatingActionButton(
          onPressed: () {
             BlocProvider.of<CounterCubit>(context).decrementCounter();
          },
          child: const Text('-'),
        )
      ]),
    ));
  }
}
