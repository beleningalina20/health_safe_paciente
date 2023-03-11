import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class DropDownButtonCustom<T> extends StatefulWidget {
  T? value;
  final String label;
  final Color labelColor;
  final List<T> items;
  final void Function(T?)? onChanged;

  DropDownButtonCustom(
      {super.key,
      required this.label,
      this.labelColor = Colors.black,
      required this.items,
      required this.value,
      this.onChanged});

  @override
  State<DropDownButtonCustom<T>> createState() =>
      _DropDownButtonCustomState<T>();
}

class _DropDownButtonCustomState<T> extends State<DropDownButtonCustom<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionText(text: widget.label, color: widget.labelColor),
        SizedBox(height: Dimens.padding10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: Dimens.padding30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(Dimens.roundedCornerRadius10)),
          child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                  isExpanded: true,
                  iconSize: Dimens.iconSize50,
                  iconEnabledColor: Colors.blue,
                  iconDisabledColor: Colors.grey[400],
                  items: widget.items
                      .map((element) => DropdownMenuItem<T>(
                            value: element,
                            onTap: () => setState(() => widget.value = element),
                            child: Text(element.toString()),
                          ))
                      .toList(),
                  onChanged: widget.onChanged,
                  value: widget.value)),
        )
      ],
    );
  }
}
