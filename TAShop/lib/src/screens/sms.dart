import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ta_shop/src/core/app_assets.dart';
import 'package:logger/logger.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:ta_shop/src/provider/add_user/GenderProvider.dart';
import 'package:provider/provider.dart';

final logger = Logger();

class SMSPage extends StatefulWidget {
  const SMSPage({Key? key}) : super(key: key);

  @override
  State<SMSPage> createState() => _SMSPageState();
}

class _SMSPageState extends State<SMSPage> {
  final FocusNode _nodeName = FocusNode();

  late TextEditingController nameTextController;

  @override
  void initState() {
    nameTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    super.dispose();
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeName,
          displayActionBar: false,
          footerBuilder: (_) => PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    GestureDetector(
                      onTap: () {
                        resetNode();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text(
                          'Close',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }

  void resetNode() {
    _nodeName.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(254, 245, 245, 245),
      appBar: AppBar(
        title: const Text(
          "SMS",
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
            _buildContentTitle(),
            const SizedBox(height: 20),
            _buildContentItem("Nguyen An", "222999333", () {
              showAlertDetailInfoUser(context);
            }),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildContentTitle() {
    return const SizedBox(
      height: 50.0,
      child: Center(
            child: Text(
              "Gửi tin nhắn",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
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
                  child: Image.asset(AppAssets.icUnSelectedUser),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String titleValue, String hintValue, FocusNode _node,
      TextEditingController textController) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 70.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleValue,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w100)),
          const SizedBox(height: 5),
          TextFormField(
            focusNode: _node,
            controller: textController,
            decoration: InputDecoration(
              hintText: hintValue,
              hintStyle: const TextStyle(
                color: Colors.grey, // Set the placeholder color
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue, // Set the focused border color
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey, // Set the enabled border color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  // show detail information of user
  showAlertDetailInfoUser(BuildContext context) {
    // set up the AlertDialog
    Dialog alert = Dialog(
      backgroundColor: Colors.transparent,
      child: KeyboardActions(
        config: _buildConfig(context),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(1.0)),
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text("Thông tin",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ),
                      const SizedBox(height: 40),
                      _buildLableTextDetailInfo("Tên:", "minh tam"),
                      const SizedBox(height: 20),
                      _buildLableTextDetailInfo("Số điện thoại:", "0522978530"),
                      const SizedBox(height: 20),
                      _buildLableTextDetailInfo("Link Zalo:", "0522978530"),
                      const SizedBox(height: 20),
                      _buildLableTextDetailInfo("Link Facebook:", "tamtam"),
                      const SizedBox(height: 20),
                      _buildLableTextDetailInfo("Tuổi:", "33"),
                      const SizedBox(height: 20),
                      _buildLableTextDetailInfo("Giới tính:", "Nam"),
                    ],
                  ),
                ),
                Positioned(
                    right: 0.0,
                    child: MouseRegion(
                      cursor: MaterialStateMouseCursor.clickable,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 14.0,
                                backgroundColor: Colors.transparent,
                                child: Icon(Icons.close,
                                    color: Colors.red, size: 30),
                              ),
                            )),
                      ),
                    ))
              ],
            )),
      ),
    );

    // Show the Dialog
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: alert,
        );
      },
    );
  }

  Widget _buildLableTextDetailInfo(String title, String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 60.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w100)),
          const SizedBox(height: 5),
          Text(text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          Container(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
