import 'package:flutter/material.dart';
import 'package:readstack/dd/lib/design/ui1.dart';
import 'util.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      final platformBrightness = View.of(
        context,
      ).platformDispatcher.platformBrightness;
      final isDark =
          _themeMode == ThemeMode.dark ||
          (_themeMode == ThemeMode.system &&
              platformBrightness == Brightness.dark);

      _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, "Gabarito", "Inter");
    final theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: _themeMode,
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.onToggleTheme,
  });

  final String title;
  final VoidCallback onToggleTheme;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UI1()),
        ),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
