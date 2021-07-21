import 'package:flutter/material.dart';
import 'package:mini_project/config/stringresource.dart';
import 'package:mini_project/theme/color.dart';
import 'package:mini_project/theme/textstyle.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Formdata extends StatelessWidget {
  Formdata({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  var provOptions = ["Jawa Tengah", "Jawa Timur", "Jawa Barat"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).copyWith().size.height / 1.5,
            height: MediaQuery.of(context).copyWith().size.height / 5,
            color: ColorPalette.gray,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: ColorPalette.black,
                      ),
                      Text(StringResources.TEXT_APP_TITLE,
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.red))
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 140.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lengkapi Data Diri",
                        style: TextPalette.secondaryTxtStyle,
                      ),
                      Text(
                        "Mohon Untuk Melengkapi Data Diri Anda",
                        style: TextPalette.altTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          FormBuilder(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, right: 25, bottom: 15, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama",
                    style: TextPalette.fieldStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FormBuilderTextField(
                    name: 'name',
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray, filled: true,
                      
                    ),
                    // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.maxLength(context, 25),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Jenis Kelamin",
                    style: TextPalette.fieldStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FormBuilderRadioGroup(
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.gray),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.gray,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      // fillColor: Colors.white,
                      fillColor: ColorPalette.gray, 
                      filled: true,
                    ),
                    name: 'jenKel',
                    validator: FormBuilderValidators.required(context),
                    options: ['Laki - Laki', 'Perempuan']
                        .map((lang) => FormBuilderFieldOption(value: lang))
                        .toList(growable: false),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Tempat",
                    style: TextPalette.fieldStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FormBuilderTextField(
                    name: 'tempatLhr',
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray, filled: true,
                      
                    ),
                    // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.maxLength(context, 25),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Tanggal Lahir",
                    style: TextPalette.fieldStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                   FormBuilderDateTimePicker(
                    name: 'tglLahir',
                    // onChanged: _onChanged,
                    inputType: InputType.date,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray, filled: true,
                      // prefixIcon: Align(
                      //   alignment: Alignment.centerRight,
                      //   child: const Icon(
                      //     Icons.calendar_today,
                      //     color: Colors.black,
                      //   ),
                      // ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Alamat KTP",
                    style: TextPalette.fieldStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FormBuilderTextField(
                    name: 'alamat_ktp',
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray, filled: true,
                      
                    ),
                    // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Jalan",
                    style: TextPalette.fieldStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FormBuilderTextField(
                    name: 'jalan',
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray, filled: true,
                      
                    ),
                    // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Provinsi",
                    style: TextPalette.fieldStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FormBuilderDropdown(
                    name: 'province',
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray, filled: true,
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: Text('Select Province'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                      items: provOptions
                        .map((province) => DropdownMenuItem(
                              value: province,
                              child: Text('$province'),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
