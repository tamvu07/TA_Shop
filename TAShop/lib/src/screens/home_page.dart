import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ta_shop/src/core/app_assets.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Demo",
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFF2A43F),
      ),
      body: Expanded(
        child: Column(
          children: [const SizedBox(height: 20), _buildMainContent()],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      height: 120.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _buildItemDetail("Add Users", () {
              context.go('/addUsers');
              logger.v("a2.....tam1......");
            }),
          ),
          Expanded(
            child: _buildItemDetail("ABC", () {
              print("a2.........2...........");
            }),
          ),
          Expanded(
            child: _buildItemDetail("XYZ", () {
              print("a2.........3...........");
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildItemDetail(String name, Function() actionClick) {
    return GestureDetector(
      onTap: () {
        actionClick();
      },
      child: Center(
          child: Column(
        children: [
          ClipOval(
            child: SizedBox(
              width: 80,
              height: 80,
              child: Container(
                color: Color(0xFFF2A43F),
                child: Transform.scale(
                  scale: 0.5,
                  child: Image.asset(AppAssets.icAddPersons),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w100)),
        ],
      )),
    );
  }
}
