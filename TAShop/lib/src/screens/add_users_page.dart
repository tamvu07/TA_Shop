import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ta_shop/src/core/app_assets.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class AddUsersPage extends StatefulWidget {
  const AddUsersPage({Key? key}) : super(key: key);

  @override
  State<AddUsersPage> createState() => _AddUsersPageState();
}

class _AddUsersPageState extends State<AddUsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thêm Khách Hàng",
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFF2A43F),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            ),
          onPressed: () {
            context.go('/home');
          },
        ),
      ),
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildContentTitle(() {
              logger.v("a2.....tam1......");
            }),
            //  const SizedBox(height: 20),
            ],
        ),
      ),
    );
  }

  Widget _buildContentTitle(Function() actionClick) {
    return GestureDetector(
      onTap: () {
        actionClick();
      },
      child: SizedBox(
         height: 50.0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Center(
              child: Text(
                "Khách Hàng",style: TextStyle(
                  color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
            ),
            Positioned(
            top: 10,
            right: 20,
            child: SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: Image.asset(AppAssets.icAdd) ),
          )
          ],
        ),
      ),
    );
  }
}
