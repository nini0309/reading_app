import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key, required this.body, required this.index, required this.title});

  final Widget body;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5EBE0),
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        titleTextStyle: GoogleFonts.khand(
            fontSize: 45, fontWeight: FontWeight.w500, color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: body,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: const Color(0xFFc28c8c),
        unselectedItemColor: Colors.black54,
        elevation: 0,
        currentIndex: index,
        iconSize: 30,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmarks), label: 'Saved'),
        ],),
    );
  }
}