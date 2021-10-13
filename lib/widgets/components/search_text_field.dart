import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

import 'package:github_search/widgets/list_page.dart';
import 'package:github_search/globals.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({Key? key, required this.showSearchTextField})
      : super(key: key);
  bool showSearchTextField;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late String text;
  bool showTextFieldIcons = false;
  final bool showProgressIndicator = false;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: AutoSizeTextField(
          controller: controller,
          onTap: () {
            widget.showSearchTextField = true;
          },
          onChanged: (value) {
            (value.isEmpty)
                ? showTextFieldIcons = false
                : showTextFieldIcons = true;
            setState(() {});
            text = value;
          },
          cursorColor: Colors.white54,
          textAlign: TextAlign.center,
          fullwidth: false,
          minWidth: 10,
          style: Theme.of(context).textTheme.headline4,
          decoration: InputDecoration(
              label: const Center(
                  child: Text('Search GitHub', textAlign: TextAlign.center)),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white54),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white54, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              prefixIcon: (showTextFieldIcons)
                  ? TextButton(
                      child: const Icon(
                        Icons.clear,
                        color: Colors.white54,
                      ),
                      onPressed: () {
                        controller.clear();
                        showTextFieldIcons = false;
                        setState(() {});
                      },
                    )
                  : null,
              suffixIcon: (showTextFieldIcons)
                  ? TextButton(
                      child: const Icon(Icons.search, color: Colors.white54),
                      onPressed: () {
                        searchText = text;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            ListPage.id, (route) => false);
                      },
                    )
                  : null),
        ),
      ),
    );
  }
}
