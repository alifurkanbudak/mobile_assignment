import 'package:engineering_exercise/common/extensions/context.dart';
import 'package:flutter/cupertino.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    Key? key,
    required this.textEditingCtrlr,
  }) : super(key: key);

  final TextEditingController textEditingCtrlr;

  @override
  Widget build(BuildContext context) {
    final textFieldTheme = context.theme.textField;

    const fontSize = 14.0;

    return SizedBox(
      height: 46,
      child: CupertinoTextField(
        controller: textEditingCtrlr,
        placeholder: context.strings.searchMakeAndModel,
        placeholderStyle: TextStyle(
          fontSize: fontSize,
          color: textFieldTheme.hintColor,
        ),
        style: TextStyle(
          fontSize: fontSize,
          color: textFieldTheme.textColor,
        ),
        minLines: 1,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        decoration: BoxDecoration(
          color: textFieldTheme.backgroundColor,
          borderRadius: BorderRadius.circular(23),
        ),
      ),
    );
  }
}
