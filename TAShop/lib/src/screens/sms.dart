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
  final FocusNode _nodeMessage = FocusNode();
  late TextEditingController messageTextController;

  @override
  void initState() {
    messageTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messageTextController.dispose();
    super.dispose();
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeMessage,
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
    _nodeMessage.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
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
      body: KeyboardActions(
        config: _buildConfig(context),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - appBarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const SizedBox(height: 10),
                        _buildContentTitle(),
                        const SizedBox(height: 20),
                        _buildContentItem("Nguyen An", "222999333", () {
                          showAlertDetailInfoUser(context);
                        }),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  _buildContentFooter(),
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: 80,
              child: GestureDetector(
                onTap: () {
                  showAlertDetailSMS(context);
                },
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Color(0xFFF2A43F),
                  child: Transform.scale(
                    scale: 0.7,
                    child: Image.asset(AppAssets.icEyesMessage),
                  ),
                ),
              ),
            ),
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
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
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
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Transform.scale(
                              scale: 0.7,
                              child: Image.asset(AppAssets.icCloseAlert),
                            ),
                          )),
                    ),
                  ))
            ],
          )),
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

  Widget _buildContentFooter() {
    return Container(
      color: Color.fromRGBO(128, 128, 128, 0.2),
      height: 60.0,
      child: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: TextFormField(
                  focusNode: _nodeMessage,
                  controller: messageTextController,
                  decoration: const InputDecoration(
                    hintText: "Nhập tin nhắn",
                    hintStyle: TextStyle(
                      color: Colors.grey, // Set the placeholder color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue, // Set the focused border color
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey, // Set the enabled border color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Transform.scale(
                scale: 0.7,
                child: Image.asset(AppAssets.icSendMessage),
              )
            ],
          ),
        ],
      ),
    );
  }

  // show detail SMS
  showAlertDetailSMS(BuildContext context) {
    // set up the AlertDialog
    Dialog alert = Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white.withOpacity(1.0)),
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Stack(
            children: [
              const SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text("Nội dung tin nhắn",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "T.A BarBerShop xin chào quý khách.\n Hiện tại Shop đang có chương trình khuyến mãi giảm giá trong các khung giờ 11h, 13h, 14h.\n Quý khách vui lòng truy cập website để biết thêm chi tiết. Website: www.tatocnam.com \n T.A BarBerShop xin chân thành cảm ơn.",
                          maxLines: 15,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500)),
                    )
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
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Transform.scale(
                              scale: 0.7,
                              child: Image.asset(AppAssets.icCloseAlert),
                            ),
                          )),
                    ),
                  ))
            ],
          )),
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
}
