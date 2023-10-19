import 'package:flutter/material.dart';

import 'src/WebView/web_view.dart';

Future main() async {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  String urlOfMagellan = 'https://dev.magellan.helpo.kozocom-lab.com/';
  bool condition = true;
  double heightAppBar = 56.0;
  int _selectedIndex = 0;

  void updateUrl(String url) {
    setState(() {
      condition = url == 'https://dev.magellan.helpo.kozocom-lab.com/' ||
          url == 'https://dev.magellan.helpo.kozocom-lab.com/magellan';
    });
  }

  final List<Widget> _pages = [];
  @override
  void initState() {
    _pages.add(Center(child: Text("Page 1")));
    _pages.add(Center(child: Text("Page 2")));
    _pages.add(Center(child: Text("Page 3")));
    _pages.add(WebViewScreen(
      updateUrlMagellan: updateUrl,
    ));
    _pages.add(Center(child: Text("Page 5")));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(condition ? heightAppBar : 0),
        child: AnimatedSwitcher(
          duration: Duration(
              milliseconds: 300), // Set the curve for the hide animation
          child: condition
              ? AppBar(
                  title: Text('Helpo Magellan App'),
                  backgroundColor: Color.fromARGB(255, 187, 235, 250),
                  centerTitle: true,
                  elevation: 0.0,
                )
              : null,
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: condition
          ? BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.white,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Color.fromARGB(255, 238, 176, 158),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                  backgroundColor: Color.fromARGB(255, 255, 248, 181),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                  backgroundColor: Color.fromARGB(255, 171, 252, 173),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Magellan',
                    backgroundColor: Color.fromARGB(255, 167, 212, 248)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                    backgroundColor: Color.fromARGB(255, 248, 167, 194)),
              ],
              // Define the function to handle item taps
            )
          : null,
    );
  }
}
