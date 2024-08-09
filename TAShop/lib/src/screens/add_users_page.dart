import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ta_shop/src/core/app_assets.dart';
import 'package:logger/logger.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';

final logger = Logger();

class AddUsersPage extends StatefulWidget {
  const AddUsersPage({Key? key}) : super(key: key);

  @override
  State<AddUsersPage> createState() => _AddUsersPageState();
}

class _AddUsersPageState extends State<AddUsersPage> {
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
                        _nodeName.unfocus();
                        // _nodeNewPassword.unfocus();
                        // _nodeConfirmPassword.unfocus();
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
        // KeyboardActionsItem(
        //   focusNode: _nodeNewPassword,
        //   displayActionBar: false,
        //   footerBuilder: (_) => PreferredSize(
        //       preferredSize: const Size.fromHeight(50),
        //       child: SizedBox(
        //         height: 40,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Expanded(
        //               flex: 1,
        //               child: Container(),
        //             ),
        //             GestureDetector(
        //               onTap: () {
        //                 _nodeOldPassword.unfocus();
        //                 _nodeNewPassword.unfocus();
        //                 _nodeConfirmPassword.unfocus();
        //               },
        //               child: const Padding(
        //                 padding: EdgeInsets.only(right: 20.0),
        //                 child: Text(
        //                   'Close',
        //                   style: TextStyle(
        //                       fontSize: 18.0,
        //                       fontWeight: FontWeight.bold,
        //                       color: Colors.grey),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       )),
        // ),
        // KeyboardActionsItem(
        //   focusNode: _nodeConfirmPassword,
        //   displayActionBar: false,
        //   footerBuilder: (_) => PreferredSize(
        //       preferredSize: const Size.fromHeight(50),
        //       child: SizedBox(
        //         height: 40,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Expanded(
        //               flex: 1,
        //               child: Container(),
        //             ),
        //             GestureDetector(
        //               onTap: () {
        //                 _nodeOldPassword.unfocus();
        //                 _nodeNewPassword.unfocus();
        //                 _nodeConfirmPassword.unfocus();
        //               },
        //               child: const Padding(
        //                 padding: EdgeInsets.only(right: 20.0),
        //                 child: Text(
        //                   'Close',
        //                   style: TextStyle(
        //                       fontSize: 18.0,
        //                       fontWeight: FontWeight.bold,
        //                       color: Colors.grey),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       )),
        // ),
      ],
    );
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
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white.withOpacity(1.0)),
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Stack(
            children: [
              Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text("Thông tin"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildNameTextField()
                ],
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

  Widget _buildNameTextField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 70.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Tên:  ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w100)),
          const SizedBox(height: 5),
          TextFormField(
            focusNode: _nodeName,
            controller: nameTextController,
            decoration: const InputDecoration(
              hintText: 'Nhập tên...',
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
        ],
      ),
    );
  }
}
