import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/widgets/utils/pick_date_time.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

class _TextFormFieldCustom extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final void Function()? onTap;
  final TextEditingController? controller;
  final Color? labelColor;

  const _TextFormFieldCustom(
      {this.hintText = '',
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.suffixIcon,
      this.onChanged,
      this.validator,
      this.maxLength,
      this.textCapitalization = TextCapitalization.none,
      this.readOnly = false,
      this.onTap,
      this.controller,
      this.labelColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionText(text: hintText, color: labelColor ?? Colors.white),
        SizedBox(height: Dimens.padding10),
        TextFormField(
          controller: controller,
          /*autocorrect: ,
          autofillHints: ,
          autofocus: ,*/
          autovalidateMode: AutovalidateMode.disabled,
          /*buildCounter: ,
          cursorColor: ,
          cursorHeight: ,
          cursorRadius: ,
          cursorWidth: ,
          enableIMEPersonalizedLearning: ,
          enableInteractiveSelection: ,
          enableSuggestions: ,*/
          enabled: true,
          /*expands: ,
          focusNode: ,*/
          // initialValue: initialValue,
          /*inputFormatters: [],
          key: ,
          keyboardAppearance: ,*/
          keyboardType: keyboardType,
          maxLength: maxLength,
          /*maxLengthEnforcement: ,*/
          // maxLines: maxLines,
          /*minLines: ,
          mouseCursor: ,*/
          obscureText: obscureText,
          obscuringCharacter: '•',
          onChanged: onChanged,
          /*onEditingComplete: ,
          onFieldSubmitted: ,
          onSaved: ,*/
          onTap: onTap,
          readOnly: readOnly,
          /*restorationId: ,
          scrollController: ,
          scrollPadding: ,
          scrollPhysics: ,
          selectionControls: ,
          showCursor: ,
          smartDashesType: ,
          smartQuotesType: ,
          strutStyle: ,*/

          style: TextStyle(
            fontSize: Dimens.fontSize20,
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          textCapitalization: textCapitalization,
          textDirection: TextDirection.ltr,
          textInputAction: TextInputAction.done,
          /*toolbarOptions: const ToolbarOptions(
            copy: true,
            cut: true,
            paste: true,
            selectAll: true
          ),*/
          validator: validator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(Dimens.padding20),
            // alignLabelWithHint: ,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius:
                    BorderRadius.circular(Dimens.roundedCornerRadius10)),
            // constraints
            counter: null, // Cambiar cuando sea necesario
            counterStyle: null,
            counterText: "",
            // disabledBorder / enabled / enabledBorder:
            // errorBorder / errorText ,
            errorMaxLines: 1,
            errorStyle: TextStyle(color: Colors.red[400]),
            fillColor: Colors.white,
            filled: true,
            // floatingLabelAlignment / floatingLabelBehavior / floatingLabelStyle
            // focusColor / focusedBorder / focusedErrorBorder
            // helperMaxLines / helperStyle / helperText
            hintMaxLines: 1,
            // hintStyle / hintTextDirection
            hintText: hintText,
            // hoverColor: ,
            // icon / iconColor
            // isCollapsed / isDense
            // label / labelStyle / labelText
            // prefix / prefixIcon / prefixIconColor / prefixConstraints / prefixStyle / prefixText ,
            // semanticCounterText:
            suffixIcon: suffixIcon,
            // suffix / suffixIconColor /  suffixIconConstraints / suffixStyle /suffixText,
          ),
        ),
      ],
    );
  }
}

class DateTimeTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(DateTime) onChanged;
  final TextEditingController? controller;
  final Color? labelColor;

  const DateTimeTextFormField(
      {super.key,
      required this.hintText,
      required this.onChanged,
      this.controller,
      this.labelColor});

  @override
  Widget build(BuildContext context) {
    return _TextFormFieldCustom(
        labelColor: labelColor,
        controller: controller,
        hintText: hintText,
        onChanged: (String value) {
          onChanged(DateTime.parse(value));
          controller?.text = value;
        },
        readOnly: true,
        onTap: () async {
          final DateTime? selectedDate = await pickDateTime(context,
              DateTime(1920), DateTime.now().add(const Duration(days: 1)));
          if (selectedDate != null) {
            onChanged(selectedDate);
            controller?.text = selectedDate.toString();
          }
        });
  }
}

class BasicTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final Color? labelColor;

  const BasicTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return _TextFormFieldCustom(
        labelColor: labelColor,
        hintText: hintText,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        textCapitalization: TextCapitalization.words);
  }
}

class NumericTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Color? labelColor;

  const NumericTextFormField(
      {super.key,
      required this.hintText,
      this.onChanged,
      this.validator,
      this.labelColor,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return _TextFormFieldCustom(
      labelColor: labelColor,
      hintText: hintText,
      keyboardType: const TextInputType.numberWithOptions(),
      onChanged: onChanged,
      validator: validator,
      maxLength: maxLength,
    );
  }
}

class EmailTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Color? labelColor;

  const EmailTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return _TextFormFieldCustom(
      labelColor: labelColor,
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      validator: validator,
    );
  }
}

class ContrasenaTextFormField extends StatelessWidget {
  final String value;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool withMaxLenght;
  final Color? labelColor;

  const ContrasenaTextFormField(
      {super.key,
      required this.value,
      this.onChanged,
      this.validator,
      this.labelColor,
      this.withMaxLenght = false});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ContrasenaTextFormFieldProvider(),
      child: Builder(builder: (context) {
        final contrasenaProvider =
            Provider.of<_ContrasenaTextFormFieldProvider>(context);
        return _TextFormFieldCustom(
          labelColor: labelColor,
          hintText: 'Contraseña',
          obscureText: !contrasenaProvider.esVisible,
          keyboardType: TextInputType.visiblePassword,
          suffixIcon: (value.isNotEmpty)
              ? IconButton(
                  icon: Icon((contrasenaProvider.esVisible)
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () => contrasenaProvider.esVisible =
                      !contrasenaProvider.esVisible)
              : null,
          onChanged: onChanged,
          validator: validator,
          maxLength: (withMaxLenght) ? 16 : null,
        );
      }),
    );
  }
}

class _ContrasenaTextFormFieldProvider extends ChangeNotifier {
  bool _esVisible = false;

  bool get esVisible => _esVisible;
  set esVisible(bool value) {
    _esVisible = value;
    notifyListeners();
  }
}
