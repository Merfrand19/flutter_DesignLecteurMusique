import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'player_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [const HeaderSection(), PlayListSection()]),
      ),
      bottomNavigationBar: const BottomSection(),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0),
      elevation: 0,
      leading: IconButton(
          icon: const Icon(Icons.menu), onPressed: () {}, color: Colors.white),
      actions: [
        IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.white),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
        image: DecorationImage(
            image: AssetImage('images/musique_1.jpg'), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
              bottom: 30,
              left: 20,
              child: Text(
                "Ariana Grande",
                style: GoogleFonts.arizonia(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 33),
              )),
          Positioned(
              bottom: 20,
              right: 0,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlayerPage(),
                      ));
                },
                color: Colors.blue,
                shape: const CircleBorder(),
                child: const Padding(
                    padding: EdgeInsets.all(17),
                    child: Icon(Icons.play_arrow_rounded,
                        color: Colors.white, size: 30)),
              ))
        ],
      ),
    );
  }
}

class PlayListSection extends StatelessWidget {
  PlayListSection({super.key});
  final List playList = [
    {'title': 'Save your tears', 'played': false, 'duration': '3.14'},
    {'title': '7 rings', 'played': true, 'duration': '4.00'},
    {'title': 'Psycho', 'played': false, 'duration': '3.58'},
    {'title': 'So am I', 'played': false, 'duration': '3.41'},
    {'title': 'Bad liar', 'played': false, 'duration': '3.36'},
    {'title': 'Bad habits', 'played': false, 'duration': '3.14'}
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
      child: Column(children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Show All",
              style: TextStyle(fontSize: 16, color: Colors.blue),
            )
          ],
        ),
        const SizedBox(height: 20),
        Column(
          children: playList.map((song) {
            return Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      song['title'],
                      style: TextStyle(
                          color: song['played'] ? Colors.blue : Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text(
                          song['duration'],
                          style: TextStyle(
                              color:
                                  song['played'] ? Colors.blue : Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        Icon(Icons.more_vert,
                            color: song['played'] ? Colors.blue : Colors.grey),
                      ],
                    )
                  ],
                ));
          }).toList(),
        )
      ]),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.blue,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.pause, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Text(
            "7 rings-Ariana Grande",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_circle_up, color: Colors.white),
          label: '',
        )
      ],
    );
  }
}
