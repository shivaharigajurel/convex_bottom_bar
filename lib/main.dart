import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:package_try_2/screens/home.dart';



void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const homepage(),
    ));

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  int _selectIndex = 2;

  // ignore: unused_element
  void _navigateBottomBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const DiscoveryPage(),
    const AddPage(),
    const MessagePage(),
    const ProfilePage(),

    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            color: Colors.white,
            child: const TextField(
              cursorColor: Color.fromARGB(255, 0, 0, 0),
              cursorHeight: 30.5,
              autocorrect: true,
              cursorWidth: 1.1,
              decoration: InputDecoration(
                icon: Icon(Icons.search_rounded),
                hintText: "Search Here",
              ),
            ),
          ),
        ),
        body: _pages[_selectIndex],
        bottomNavigationBar: ConvexAppBar(
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
         initialActiveIndex: _selectIndex,
        onTap: (int i) {
          _navigateBottomBar(i);
        },
        ));
  }
}
