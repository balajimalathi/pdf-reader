// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_ui/design/ui1.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   // debugPaintSizeEnabled = true;
//   // debugPaintLayerBordersEnabled = true;
//   // debugPaintBaselinesEnabled = true;
//   // debugPaintPointersEnabled = true;
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   ThemeMode _themeMode = ThemeMode.light;

//   void _toggleTheme() {
//     setState(() {
//       _themeMode = _themeMode == ThemeMode.light
//           ? ThemeMode.dark
//           : ThemeMode.light;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       themeMode: _themeMode,
//       theme: ThemeData(
//         textTheme: GoogleFonts.interTightTextTheme(),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         textTheme: GoogleFonts.interTightTextTheme(ThemeData.dark().textTheme),
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.white,
//           brightness: Brightness.dark,
//         ),
//       ),
//       home: MyHomePage(
//         title: 'Flutter Demo Home Page',
//         onToggleTheme: _toggleTheme,
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     super.key,
//     required this.title,
//     required this.onToggleTheme,
//   });

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;
//   final VoidCallback onToggleTheme;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => UI1()),
//                 );
//               },
//               child: Text('UI1'),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: widget.onToggleTheme,
//         tooltip: 'Toggle theme',
//         child: Icon(
//           Theme.of(context).brightness == Brightness.dark
//               ? Icons.light_mode
//               : Icons.dark_mode,
//         ),
//       ),
//     );
//   }
// }
