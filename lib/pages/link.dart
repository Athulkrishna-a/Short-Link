import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class ShortLink extends StatefulWidget {
  const ShortLink({super.key});

  @override
  State<ShortLink> createState() => _ShortLinkState();
}

class _ShortLinkState extends State<ShortLink> {
  TextEditingController controller = TextEditingController();
  Future<String?> shorternUrl({required String url}) async {
    try {
      final result = await http.post(
          Uri.parse("https://cleanuri.com/api/v1/shorten"),
          body: {'url': url});
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        return response['result_url'];
      }
    } catch (e) {
      print('error ${e.toString()}');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 55.0, right: 55.0, top: 22.0),
          child: Lottie.asset("assets/logo/data.json"),
        ),
        const SizedBox(
          height: 35,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 35.0, right: 35.0),
          child: Text(
            " URL Shortener for transforming long, ugly links into nice, memorable and trackable short URLs. ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              height: 2.0,
            ),
          ),
        ),
        const SizedBox(
          height: 46,
        ),
        Padding(
          padding: EdgeInsets.only(left: 35.0, right: 35.0),
          child: TextField(
            controller: controller,
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
        const SizedBox(
          height: 45,
        ),
        ElevatedButton(
          onPressed: () async {
            final shortenedUrl = await shorternUrl(url: controller.text);
            print(shortenedUrl);
            if (shortenedUrl != null) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      "Link Shortened Successfully",
                    ),
                    content: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  shortenedUrl,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(text: shortenedUrl),
                                  );
                                },
                                icon: const Icon(Icons.copy),
                              )
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                return Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.done_all_rounded,
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Please Enter Url ",
                  ),
                  duration: Duration(seconds: 1),
                  backgroundColor: Colors.black54,
                ),
              );
            }
          },
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
    );
  }
}
