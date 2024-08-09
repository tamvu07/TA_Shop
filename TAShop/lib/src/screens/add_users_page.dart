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
      backgroundColor: Color.fromARGB(254, 245, 245, 245),
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
            const SizedBox(height: 20),
            _buildContentItem("Nguyen An", "222999333", () {}),
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
                "Khách Hàng",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: Image.asset(AppAssets.icAdd)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContentItem(String name, String phone, Function() actionClick) {
    return GestureDetector(
      onTap: () {
        actionClick();
      },
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 10),
                Transform.scale(
                  scale: 0.7,
                  child: Image.asset(AppAssets.icEditUser),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Text("Tên:  ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w100)),
                            Text(name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("sdt:  ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w100)),
                            Text(phone,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Image.asset(AppAssets.icNextItem),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
