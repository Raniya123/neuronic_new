// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List selectedItem = [];
  TextEditingController pulesRate = TextEditingController();
  TextEditingController intensity = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "QEEG Points 1",
            style: TextStyle(
                color: Color(0xff606060),
                fontSize: 13,
                fontWeight: FontWeight.w400),
          ),
          backgroundColor: const Color(0xfff9fafa),
        ),
        body: Container(
          margin: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          height: 355.0,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/brain_Illustration.png"),
                  fit: BoxFit.contain)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        selectAll();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 6),
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                spreadRadius: 2),
                          ],
                          borderRadius: BorderRadius.circular(36),
                          border: Border.all(
                              width: 1, color: const Color(0xFFc2c9D1)),
                          color: const Color(0xFFf0f2f3),
                        ),
                        child: const Text(
                          "Select All",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ))
                ],
              ),
              Wrap(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: buttonCircle("FP1", context),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: buttonCircle("FP2", context),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  AnimatedPositioned(
                    width: 60,
                    height: 60,
                    top: -7.0,
                    right: 40,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: buttonCircle("F8", context),
                  ),
                  AnimatedPositioned(
                    width: 60,
                    height: 60,
                    top: -7.0,
                    left: 40,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: buttonCircle("F7", context),
                  ),
                  SizedBox(
                      child: Wrap(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("F4", context),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("FZ", context),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("F3", context),
                      ),
                    ],
                  ))
                ]),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  SizedBox(
                      child: Wrap(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("T3", context),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("C3", context),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("CZ", context),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("C4", context),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("T4", context),
                      ),
                    ],
                  ))
                ]),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  AnimatedPositioned(
                    width: 60,
                    height: 60,
                    bottom: -3.0,
                    right: 20,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: buttonCircle("T6", context),
                  ),
                  AnimatedPositioned(
                    width: 60,
                    height: 60,
                    bottom: -3.0,
                    left: 40,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: buttonCircle("T5", context),
                  ),
                  SizedBox(
                      child: Wrap(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("P3", context),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("PZ", context),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: buttonCircle("P4", context),
                      ),
                    ],
                  ))
                ]),
              ),
              Wrap(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: buttonCircle("02", context),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: buttonCircle("01", context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttonCircle(String? title, BuildContext cnx) {
    return GestureDetector(
        onTap: () {
          if (!selectedItem.contains(title)) {
            showModalBottomSheet<void>(
              context: cnx,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Pulse Rate (Hz)"),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: const Color(0xffe1e4e8),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                autofocus: false,
                                onFieldSubmitted: (value) {},
                                controller: pulesRate,
                                cursorColor: Colors.grey[400],
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(right: 5),
                                    hintText: "-",
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0))),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Intensity (%)"),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: const Color(0xffe1e4e8),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                autofocus: false,
                                onFieldSubmitted: (value) {},
                                controller: intensity,
                                cursorColor: Colors.grey[400],
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(right: 5),
                                    hintText: "-",
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0))),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: bottomButton(() {
                            confirmFunction(title, cnx);
                          }, "CONFIRM"))
                    ],
                  ),
                );
              },
            );
          }
          setState(() {
            if (!selectedItem.contains(title)) {
              selectedItem.add(title);
            } else {
              selectedItem.remove(title);
            }
          });
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 3),
                    color:
                        const Color.fromARGB(255, 27, 27, 27).withOpacity(0.1),
                    blurRadius: 2,
                    spreadRadius: 1),
              ],
              borderRadius: BorderRadius.circular(36),
              border: Border.all(width: 3, color: const Color(0xFFe6f1ef)),
              color: !selectedItem.contains(title)
                  ? const Color(0xFFc2ddd7)
                  : const Color(0xff439242),
            ),
            margin: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                title!,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            )));
  }

  bottomButton(Function()? onTap, String? label) {
    return GestureDetector(
      onTap: pulesRate.text.isEmpty || intensity.text.isEmpty ? () {} : onTap,
      child: Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: pulesRate.text.isEmpty || intensity.text.isEmpty
                  ? const Color(0xffe5eff4)
                  : const Color(0xff00648f)),
          child: Text(
            label!,
            style: const TextStyle(
                color: Color(0xffcccccc), fontWeight: FontWeight.w700),
          )),
    );
  }

  selectAll() {
    setState(() {
      selectedItem = [
        "FP1",
        "FP2",
        "F7",
        "F4",
        "FZ",
        "F3",
        "F8",
        "T3",
        "PZ",
        "C3",
        "CZ",
        "C4",
        "T4",
        "T5",
        "P3",
        "P4",
        "T6",
        "02",
        "01"
      ];
    });
  }

  confirmFunction(String? text, BuildContext cnx) async {
    if (pulesRate.text.isEmpty || intensity.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please make sure to fill out all the data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    //  var _url = Uri.https("#", '#');
    const Map<String, String> header = {
      'Content-type': 'application/json',
    };
    var body = json.encode({
      "title": text,
      "pulesRate": pulesRate.text,
      "intensity": intensity.text
    });

    // var response = await http.post(
    //   _url,
    //   body: body,
    //   headers: header,
    // );
    // if (response.statusCode == 200 || response.statusCode == 201) {}
    Fluttertoast.showToast(
        msg: body,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
