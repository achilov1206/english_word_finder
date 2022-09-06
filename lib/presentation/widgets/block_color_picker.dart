import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/theme/theme_cubit.dart';

import '../../theme/main_theme.dart';

class BlockColorPickerWidget extends StatefulWidget {
  const BlockColorPickerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BlockColorPickerWidget> createState() => _BlockColorPickerWidgetState();
}

class _BlockColorPickerWidgetState extends State<BlockColorPickerWidget> {
  Widget pickerLayoutBuilder(
    BuildContext context,
    List<Color> colors,
    PickerItem child,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [for (Color color in colors) child(color)],
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
      ],
    );
  }

  Widget pickerItemBuilder(
    Color color,
    bool isCurrentColor,
    void Function() changeColor,
  ) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.8),
            offset: const Offset(1, 2),
            blurRadius: 5,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: changeColor,
          borderRadius: BorderRadius.circular(30),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isCurrentColor ? 1 : 0,
            child: Icon(
              Icons.done,
              size: 24,
              color: useWhiteForeground(color) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          AppLocalizations.of(context).changeTheme,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(AppLocalizations.of(context).selectColor),
                  content: SingleChildScrollView(
                    child: BlockPicker(
                      pickerColor: Theme.of(context).primaryColor,
                      onColorChanged: (color) {
                        context.read<ThemeCubit>().changeTheme(
                              MyTheme.colorToThemeName(color),
                            );
                      },
                      availableColors: MyTheme.getColorsList(myThemes),
                      layoutBuilder: pickerLayoutBuilder,
                      itemBuilder: pickerItemBuilder,
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
