import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
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
        child: SingleChildScrollView(child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text("Titlu:",
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
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
            SizedBox(
              height: 20,
            ),
            HtmlEditor(
              controller: controller, //required
              htmlEditorOptions: HtmlEditorOptions(
                hint: "Conținutul articolului tău aici...",
                shouldEnsureVisible: true,
                //initialText: "Your text here...",
                characterLimit: 64000,
              ),
              otherOptions: OtherOptions(
                height: responsiveHtmlEditorHeight(MediaQuery.of(context)),
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
