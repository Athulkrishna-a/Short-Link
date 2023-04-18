import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  var data = "";

  final TextEditingController tfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              child: QrImage(
                data: tfController.text,
                gapless: false,
                foregroundColor: Color.fromARGB(255, 61, 55, 55),
                backgroundColor: Color.fromARGB(179, 247, 244, 244),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  data = value;
                });
              },
              controller: tfController,
              decoration: InputDecoration(
                labelText: 'Url Link ',
                labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.purple),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: "Enter   proper   Url ...",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              backgroundColor: const Color.fromARGB(240, 241, 241, 241),
            ),
            child: Image.asset(
              "assets/image/checkmark.png",
              height: 45,
              width: 35.0,
            ),
          )
        ],
      ),
    );
  }
}
