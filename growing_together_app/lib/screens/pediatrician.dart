import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'dart:math' as math;
import 'dart:io' as io;
import 'package:growing_together/ui_utils/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Pediatrician extends StatefulWidget {
  const Pediatrician({Key? key}) : super(key: key);

  @override
  State<Pediatrician> createState() => _PediatricianState();
}

class _PediatricianState extends State<Pediatrician> {
  late DialogFlowtter _dialogflow;
  TextEditingController _controller = TextEditingController();
  List<String> responses = [];
  List<String> queries = [];

  @override
  void initState() {
    super.initState();
    _initialise();
  }

  Future<void> _initialise() async {
    // await io.File(syncPath).exists();
    // io.File(syncPath).existsSync();

    DialogAuthCredentials credentials = await DialogAuthCredentials.fromFile(
        'assets/keys/growing-together-382320-691427eb5c51.json');
    var rnd = math.Random();

    setState(() {
      _dialogflow = DialogFlowtter(
        credentials: credentials,
        sessionId: (rnd.nextInt(89999) + 10000).toString(),
      );
    });
  }

  Future<void> submitQuery(String query) async {
    final QueryInput queryInput = QueryInput(
      text: TextInput(
        text: query,
        languageCode: "en",
      ),
    );

    DetectIntentResponse response = await _dialogflow.detectIntent(
      queryInput: queryInput,
    );

    String? textResponse = response.text;
    print(response.text);

    if (textResponse == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error in retrieving response, please try again"),
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      List<String> new_responses = [textResponse, ...responses];
      List<String> new_queries = [_controller.text, ...queries];
      setState(() {
        queries = new_queries;
        _controller.text = "";
        responses = new_responses;
      });
    }
  }

  Widget findPediatrician(Function errorCallback) {
    TextEditingController _pincode = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    controller: _pincode,
                    onSubmitted: (value) async {
                      if (_pincode.text != "" && _pincode.text.length == 6) {
                        if (await canLaunchUrlString(
                            "https://www.cybo.com/IN-pin-code/${_pincode.text}_mumbai/pediatricians/")) {
                          await launchUrlString(
                              "https://www.cybo.com/IN-pin-code/${_pincode.text}_mumbai/pediatricians/");
                        } else {
                          errorCallback();
                        }
                      } else {
                        errorCallback();
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                  child: OutlinedButton(
                    child: Text("Find"),
                    onPressed: () async {
                      if (_pincode.text != "" && _pincode.text.length == 6) {
                        if (await canLaunchUrlString(
                            "https://www.cybo.com/IN-pin-code/${_pincode.text}_mumbai/pediatricians/")) {
                          Navigator.of(context).pop();
                          await launchUrlString(
                              "https://www.cybo.com/IN-pin-code/${_pincode.text}_mumbai/pediatricians/");
                        } else {
                          errorCallback();
                        }
                      } else {
                        errorCallback();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: MediaQuery.of(context).size.height - 75,
                // width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 50,
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                                labelText: "Ask me anything!"),
                            onSubmitted: (value) {
                              submitQuery(value);
                            },
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              submitQuery(_controller.text);
                            },
                            child: Icon(Icons.search))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: responses.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (_, i) {
                        return ListTile(
                          leading: Icon(Icons.chat_bubble),
                          title: Text(queries[i]),
                          subtitle: Text(responses[i]),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            // const BottomNavBar(currInd: 2,),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
          child: FloatingActionButton.extended(
            backgroundColor: MyColors.accent3,
            label: Text("Find a Pediatrician"),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    void isError() {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Pincode not valid please try again"),
                        behavior: SnackBarBehavior.floating,
                      ));
                    }

                    return findPediatrician(isError);
                  });
            },
          ),
        ),
      ),
    );
  }
}
