import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: 'Article title here...',
                        border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0))),
                      ),
                    ),
                    DropdownButton<String>(
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
              SizedBox(
                height: 60,
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
                  height: 200,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
