import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egzaminy',
      theme: ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFFFF7373), 
        onPrimary: Color(0xFFFF7373), 
        surface: Color(0xFFD2D2D2), 
        onSurface: Colors.black, 
        secondary: Colors.blue,
        onSecondary: Colors.white,
        background: Color(0xFFD2D2D2),
        error: Colors.red,
        onError: Colors.redAccent,
      ),
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFFF7373), 
        onPrimary: Color(0xFFFF7373),
        surface: Color(0xFF222222), 
        onSurface: Colors.white, 
        secondary: Colors.blueAccent,
        onSecondary: Colors.white,
        background: Color(0xFF222222),
        error: Colors.red,
        onError: Colors.redAccent,
      ),
    ),
      themeMode: _themeMode,
      home: MyHomePage(
        title: 'Egzaminy',
        onToggleTheme: _toggleTheme,
        isDarkMode: _themeMode == ThemeMode.dark,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  final String title;
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

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

  List<String> getMenuItems(String category) {
    switch(category)
    {
      case 'Programista':
      return[
        'INF 03',
        'INF 04',
      ];
      case 'Informatyk':
      return[
        'INF 03',
        'INF 02'
      ];
      case 'Elektryk':
      return[
        'ELE.05',
        'ELM.02',
        'ELE.02',
        'E.08',
      ];
      case 'Elektronik':
      return[
        'ELM.05',
        'E.06',
        'ELM.02',
        'EE.22',
      ];
      case 'Teleinformatyk':
      return[
        'INF.08',
        'INF.07',
      ];
      case 'Automatyk':
      return[
        'ELM.04',
        'ELM.01',
      ];
      default:
      return[

      ];
    }
  }

  Widget buildPopupMenu(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
    child: PopupMenuButton<String>(
      tooltip: title,
      offset: const Offset(0, kToolbarHeight),
      color: widget.isDarkMode ? Color(0xFF666666) : Color(0xFFAAAAAA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onSelected: (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Wybrano: $value")),
        );
      },
      itemBuilder: (context) {
        return getMenuItems(title).map((item) {
          return PopupMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList();
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: 80, 
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: [
        Spacer(), 
        buildPopupMenu('Strona Główna'),
        buildPopupMenu('Programista'),
        buildPopupMenu('Informatyk'),
        buildPopupMenu('Elektryk'),
        buildPopupMenu('Elektronik'),
        buildPopupMenu('Teleinformatyk'),
        buildPopupMenu('Automatyk'),
        Spacer(), 
        IconButton(
          icon: Icon(widget.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
          tooltip: 'Przełącz motyw',
          onPressed: widget.onToggleTheme,
        ),
      ],
    ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text(
            'Egzamin z teorii (test 40 pytań)',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 48,         
                ),
                textAlign: TextAlign.center,
          ),
             SizedBox(height: 16),
              Text(
            'Oferujemy tutaj całkowicie darmowy dostęp do ogromnej bazy pytań z informatycznych egzaminów zawodowych. '
            'Pytania pochodzą wprost z arkuszy z lat ubiegłych. Wybierz poniżej swoją kwalifikację i zacznij zdobywać wiedzę:',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                  textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _buildQualificationBox(
                  context,
                  title: 'INF.02 (dawniej EE.08)',
                  subtitle: 'sprzęt, systemy i sieci',
                  onTap: () {
                  },
                ),
                _buildQualificationBox(
                  context,
                  title: 'INF.03 (dawniej EE.09/E14)',
                  subtitle: 'programowanie',
                  onTap: () {
                  },
                ),
              ],

              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildQualificationBox(
  BuildContext context, {
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(Icons.assignment, size: 50, color: Color(0xFFFF7373)),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
