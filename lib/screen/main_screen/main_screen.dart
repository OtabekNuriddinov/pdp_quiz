import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          // 1-usul: Ichki navigatsiya uchun Navigator o'rniga loyihalangan widget ishlatish
          FirstPage(),

          // 2-usul: Navigator.push o'rniga materialdan foydalanish
          SecondPage(),

          // 3-usul: Child Scaffold ishlatish
          ThirdPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Birinchi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Ikkinchi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Uchinchi',
          ),
        ],
      ),
    );
  }
}

// 1-usul: Navigator.push o'rniga qo'shimcha widget/ekranlarni ko'rsatish
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _showDetailScreen = false;

  @override
  Widget build(BuildContext context) {
    return _showDetailScreen
        ? DetailScreen(
      onBack: () {
        setState(() {
          _showDetailScreen = false;
        });
      },
    )
        : Center(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _showDetailScreen = true;
          });
        },
        child: Text('Batafsil ma\'lumot ko\'rish'),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final VoidCallback onBack;

  const DetailScreen({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: BackButton(onPressed: onBack),
          title: Text('Batafsil ma\'lumot'),
        ),
        Expanded(
          child: Center(
            child: Text('Bu batafsil ma\'lumot sahifasi'),
          ),
        ),
      ],
    );
  }
}

// 2-usul: Navigator.push o'rniga materialyi modallar
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // BottomNavigationBar saqlanib qoladi chunki bu modal dialog
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => DraggableScrollableSheet(
              initialChildSize: 0.9,
              maxChildSize: 0.9,
              minChildSize: 0.5,
              builder: (_, controller) => Container(
                color: Colors.white,
                child: Column(
                  children: [
                    AppBar(
                      title: Text('Modal sahifa'),
                      automaticallyImplyLeading: false,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        itemCount: 25,
                        itemBuilder: (_, index) => ListTile(
                          title: Text('Element $index'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Text('Modal sahifa ochish'),
      ),
    );
  }
}

// 3-usul: Ichki Navigator bilan
class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Bu usul uchun Navigator.push BottomNavigationBar yo'qotmaydigan holda ishlatiladi
    return Navigator(
      // Bu ichki Navigator
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Uchinchi sahifa'),
              // Bosh Navigator.pushi
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Bu yerda Navigator.push ishlatilingan bo'lsada, asosiy Scaffold'ga ta'sir qilmaydi
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text('Ichki sahifa'),
                        ),
                        body: Center(
                          child: Text('Bu ichki sahifa. BottomNavigationBar hali ko\'rinib turibdi!'),
                        ),
                      ),
                    ),
                  );
                },
                child: Text('Ichki Navigator.push'),
              ),
            ),
          ),
        );
      },
    );
  }
}