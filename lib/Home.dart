import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  TextEditingController text1 = TextEditingController();
  GoogleTranslator translator = GoogleTranslator(client: ClientType.siteGT);
  var result = "Default Text";
  String dropDownValue = "English";
  String targetdropDownValue = "Tamil";
  static const List<String> source = ["Tamil", "English", "Hindi", "Malayalam"];
  static const List<String> target = ["Tamil", "English", "Hindi", "Malayalam"];

  String _fromLang = 'en';
  String _toLang = 'ta';

  String dropDownConvert(String value) {
    if (value == "English") {
      _fromLang = 'en';
    } else if (value == "Tamil") {
      _fromLang = 'ta';
    } else if (value == "Hindi") {
      _fromLang = 'hi';
    } else if (value == "Malayalam") {
      _fromLang = 'ml';
    }
    return _fromLang;
  }

  String targetDropDownConvert(String value) {
    if (value == "English") {
      _toLang = 'en';
    } else if (value == "Tamil") {
      _toLang = 'ta';
    } else if (value == "Hindi") {
      _toLang = 'hi';
    } else if (value == "Malayalam") {
      _toLang = 'ml';
    }
    return _toLang;
  }

  void trans() async {
    if (text1.text.isNotEmpty) {
      await translator
          .translate(text1.text, from: _fromLang, to: _toLang)
          .then((value) => setState(() {
                result = value.toString();
              }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          'Please type Something 😒',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: (Colors.cyan),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Language Translator',
          style: TextStyle(fontSize: 22),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //sourceLang DropDown
            Container(
                margin:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 5, color: Colors.cyan)),
                child: sourceDropDown()),

            //Input box
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 5, color: Colors.cyan)),
              height: 190,
              width: w/1,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: ' Please Enter Something to Translate'),
                  maxLines: 200,
                  controller: text1,
                  cursorColor: Colors.cyan,
                  cursorHeight: 20,
                  cursorRadius: Radius.circular(10),
                ),
              ),
            ),

            OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.only(left: 30, right: 30),
                    backgroundColor: Colors.cyan.shade500),
                onPressed: () {
                  trans();
                  print(result);
                },
                icon: Icon(
                  Icons.g_translate,
                  color: Colors.black,
                ),
                label: Text(
                  'Translate',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),

            SizedBox(
              height: 6,
            ),

            //TargetDropDown
            Container(
                margin:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                height: 50,
                width: w/1,
                //width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 5, color: Colors.cyan)),
                child: targetDropDown()),

            //output
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 5, color: Colors.cyan)),
              height: 190,
              width: w/1.0,
              margin: EdgeInsets.all(20),
              child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Text(
                        result == null
                            ? "Select Any Language"
                            : result.toString(),
                        style: TextStyle(
                            color:
                                result.isNotEmpty ? Colors.grey : Colors.white,
                            fontSize: 18),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> targetDropDown() {
    return DropdownButton(
      value: targetdropDownValue,
      underline: Container(
        width: 0,
      ),
      icon: Padding(
        padding: const EdgeInsets.only(left: 160.0),
        child: const Icon(
          Icons.keyboard_arrow_down,
        ),
      ),
      iconSize: 30,
      items: target.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              items,
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          targetdropDownValue = newValue!;
          targetDropDownConvert(targetdropDownValue);
        });
      },
    );
  }

  DropdownButton<String> sourceDropDown() {
    return DropdownButton(
      value: dropDownValue,
      underline: Container(
        width: 0,
      ),
      icon: Padding(
        padding: const EdgeInsets.only(left: 160.0),
        child: const Icon(
          Icons.keyboard_arrow_down,
        ),
      ),
      iconSize: 30,
      items: source.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              items,
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropDownValue = newValue!;
          dropDownConvert(dropDownValue);
        });
      },
    );
  }
}
