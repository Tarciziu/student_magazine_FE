import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:practica_fe/locator.dart';
import 'package:practica_fe/main.dart';
import 'package:practica_fe/services/navigation_service.dart';
import 'package:practica_fe/utils/api_caller.dart';
import 'package:practica_fe/utils/responsive_helper.dart';

class CreateArticleContentDesktop extends StatefulWidget {
  const CreateArticleContentDesktop({Key? key}) : super(key: key);

  @override
  _CreateArticleContentDesktopState createState() =>
      _CreateArticleContentDesktopState();
}

class _CreateArticleContentDesktopState
    extends State<CreateArticleContentDesktop> {
  final HtmlEditorController controller = HtmlEditorController();
  final TextEditingController _titleController = TextEditingController();
  String selectedOccasion = "Secțiune";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Titlu:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50.0,
                        width: 300.0,
                        child: TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButton<String>(
                        itemHeight: 100.0,
                        value: selectedOccasion,
                        items: <String>[
                          'Secțiune',
                          'Matematică',
                          'Informatică',
                          'Istorie'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedOccasion = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  TextButton(
                    child: Text("Creează articol"),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.green.shade700,
                      onSurface: Colors.grey,
                      fixedSize: Size(150, 40),
                    ),
                    onPressed: () async {
                      if (_titleController.text.isEmpty ||
                          controller.getText().toString().isEmpty ||
                          selectedOccasion == "Secțiune") {
                        Fluttertoast.showToast(
                            msg: "All fields are required",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        var content = await controller.getText();
                        print(content);
                        var section = selectedOccasion.toString() == "Matematică" ? "math" :
                        selectedOccasion.toString() == "Istorie" ? "history" : "computerScience";
                        Caller()
                            .createArticleRequest(
                                title: _titleController.text,
                                section: section,
                                content: content,
                                email: GlobalData.email)
                            .then((value) async {
                          if (value != 'server error...') {

                            Fluttertoast.showToast(
                                msg: "Article created successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            locator<NavigationService>().navigateTo('home');
                          } else {
                            Fluttertoast.showToast(
                                msg: value,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              HtmlEditor(
                controller: controller, //required
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "Continutul articolului aici...",
                  shouldEnsureVisible: true,
                  initialText: "",
                  characterLimit: 64000,
                ),
                otherOptions: OtherOptions(
                  height: responsiveHtmlEditorHeight(MediaQuery.of(context)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
