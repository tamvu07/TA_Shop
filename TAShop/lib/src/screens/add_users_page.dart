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

class AddUsersPage extends StatefulWidget {
  const AddUsersPage({Key? key}) : super(key: key);

  @override
  State<AddUsersPage> createState() => _AddUsersPageState();
}

class _AddUsersPageState extends State<AddUsersPage> {
  final FocusNode _nodeName = FocusNode();
  final FocusNode _nodePhone = FocusNode();
  final FocusNode _nodeLinkZalo = FocusNode();
  final FocusNode _nodeLinkFacebook = FocusNode();
  final FocusNode _nodeAge = FocusNode();

  late TextEditingController nameTextController;
  late TextEditingController phoneTextController;
  late TextEditingController linkZaloTextController;
  late TextEditingController linkFacebookTextController;
  late TextEditingController ageTextController;

  @override
  void initState() {
    nameTextController = TextEditingController();
    phoneTextController = TextEditingController();
    linkZaloTextController = TextEditingController();
    linkFacebookTextController = TextEditingController();
    ageTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    phoneTextController.dispose();
    linkZaloTextController.dispose();
    linkFacebookTextController.dispose();
    ageTextController.dispose();
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
        KeyboardActionsItem(
          focusNode: _nodePhone,
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
        KeyboardActionsItem(
          focusNode: _nodeLinkZalo,
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
        KeyboardActionsItem(
          focusNode: _nodeLinkFacebook,
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
        KeyboardActionsItem(
          focusNode: _nodeAge,
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
    _nodePhone.unfocus();
    _nodeLinkZalo.unfocus();
    _nodeLinkFacebook.unfocus();
    _nodeAge.unfocus();
  }

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
              showAlertAddUser(context);
            }),
            const SizedBox(height: 20),
            _buildContentItem("Nguyen An", "222999333", () {}),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildContentTitle(Function() actionClick) {
    return SizedBox(
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
            child: GestureDetector(
              onTap: () {
                actionClick();
              },
              child: SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: Image.asset(AppAssets.icAdd)),
            ),
          )
        ],
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

  showAlertAddUser(BuildContext context) {
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
                          child: Text("Thông tin"),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                          "Tên:", "Nhập tên...", _nodeName, nameTextController),
                      const SizedBox(height: 20),
                      _buildTextField("Số điện thoại:", "Nhập số điện thoại...",
                          _nodePhone, phoneTextController),
                      const SizedBox(height: 20),
                      _buildTextField("Link Zalo:", "Nhập link Zalo...",
                          _nodeLinkZalo, linkZaloTextController),
                      const SizedBox(height: 20),
                      _buildTextField("Link Facebook:", "Nhập link Facebook...",
                          _nodeLinkFacebook, linkFacebookTextController),
                      const SizedBox(height: 20),
                      _buildTextField(
                          "Tuổi:", "Nhập tuổi...", _nodeAge, ageTextController),
                      const SizedBox(height: 20),
                      _buildContentCheckBox(),
                      const SizedBox(height: 40),
                      _buildBTSave(() {}),
                      const SizedBox(height: 20),
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

  Widget _buildContentCheckBox() {
    return ChangeNotifierProvider(
      create: (_) => GenderProvider(),
      child:
          Consumer<GenderProvider>(builder: (context, genderProvider, child) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Set the border color
              width: 1.0, // Set the border width
            ),
            borderRadius: BorderRadius.circular(8.0), // Set the border radius
          ),
          width: MediaQuery.of(context).size.width / 1.5,
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Chọn giới tính:",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w100)),
              ),
              Container(height: 10),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Checkbox(
                        value: genderProvider.isBoyChecked,
                        onChanged: (value) {
                          genderProvider.toggleBoy(value!);
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text("Nam")
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Checkbox(
                        value: genderProvider.isGirlChecked,
                        onChanged: (value) {
                          genderProvider.toggleGirl(value!);
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text("Nữ")
                    ],
                  )),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildBTSave(Function() actionClick) {
    return GestureDetector(
      onTap: () {
        actionClick();
      },
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF2A43F),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Center(
              child: Text("Lưu",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}
