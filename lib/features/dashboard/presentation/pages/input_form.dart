import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mini_project/config/stringresource.dart';
import 'package:mini_project/theme/color.dart';
import 'package:mini_project/theme/textstyle.dart';

class InputForm extends StatefulWidget {
  InputForm({Key? key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  TextEditingController name = new TextEditingController();
  TextEditingController place = new TextEditingController();
  TextEditingController bdate = new TextEditingController();
  TextEditingController street = new TextEditingController();
  TextEditingController jalan = new TextEditingController();

  String jenkel = "";
  String provinsi = "";
  String kabupaten = "";
  String kecamatan = "";
  String kelurahan = "";
  String ert = "";
  String erw = "";

  late var pvc = [];

  var provMenu = ["Jawa Tengah", "Jawa Timur", "Jawa Barat"];
  var kabMenu = ["Purbalingga", "Banyumas", "Cilacap"];
  var kecMenu = ["Kutasari", "Bojongsari", "Padamara"];
  var desMenu = ["Karangcegak", "Karangjengkol", "Candiwulan"];
  var rwMenu = ["01", "02", "03"];
  var rtMenu = ["001", "002", "003"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            children: [
              toolbar(),
              inputnama(),
              inputjenkel(),
              inputttl(),
              inputalamatktp(),
              inputjalan(),
              inputprovinsi(),
              inputkota(),
              inputkecamatan(),
              inputdesa(),
              inputrtrw(),
              inputalamatrmh(),
              inputcheck(),
              jln(),
              prov(),
              kota(),
              kec(),
              desa(),
              rtrw(),
              simpan()
            ],
          ),
        ),
      ),
    );
  }

  Widget toolbar() {
    return Container(
      width: MediaQuery.of(context).copyWith().size.height / 1.5,
      height: 170,
      color: ColorPalette.gray,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorPalette.black,
                  ),
                  onPressed: () {},
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
    );
  }

  Widget inputnama() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 300, 0),
            child: Text(
              "Nama",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderTextField(
                name: 'nama',
                controller: name,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // onChanged: _onChanged,
                // valueTransformer: (text) => num.tryParse(text),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.maxLength(context, 25),
                ]),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputjenkel() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 250, 0),
            child: Text(
              "Jenis Kelamin",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderRadioGroup(
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
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
                onChanged: (lang) {
                  setState(() {
                    jenkel = lang.toString();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputttl() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 85, 10),
                  // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                  child: Text(
                    "Tempat",
                    style: TextPalette.titleTextFieldStyle,
                  ),
                ),
                FormBuilderTextField(
                  name: 'tempatLhr',
                  controller: place,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray,
                    filled: true,
                  ),
                  // onChanged: _onChanged,
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.maxLength(context, 25),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15.0,
            height: 20.0,
          ),
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                  // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                  child: Text(
                    "Tanggal Lahir",
                    style: TextPalette.titleTextFieldStyle,
                  ),
                ),
                FormBuilderDateTimePicker(
                  name: 'tglLahir',
                  controller: bdate,
                  // onChanged: _onChanged,
                  inputType: InputType.date,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today),
                    contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray,
                    filled: true,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }

  Widget inputalamatktp() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
      // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
      child: Row(
        children: [
          Flexible(
            child: Text(
              "Alamat KTP",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          Expanded(
              child: Center(
            child: Divider(
              color: ColorPalette.grayline,
              thickness: 2,
              indent: 20,
              endIndent: 0,
            ),
          ))
        ],
      ),
    );
  }

  Widget inputjalan() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 300, 0),
            child: Text(
              "Jalan",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderTextField(
                name: 'jalan',
                controller: street,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // onChanged: _onChanged,
                // valueTransformer: (text) => num.tryParse(text),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.maxLength(context, 25),
                ]),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputprovinsi() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 280, 0),
            child: Text(
              "Provinsi",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderDropdown(
                name: 'province',
                onChanged: (provMenu) {
                  provinsi = provMenu.toString();
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // initialValue: 'Male',
                allowClear: true,
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: provMenu
                    .map((prov) => DropdownMenuItem(
                          value: prov,
                          child: Text('$prov'),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputkota() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 220, 0),
            child: Text(
              "Kota / Kabupaten",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderDropdown(
                name: 'city',
                onChanged: (kabMenu) {
                  kabupaten = kabMenu.toString();
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // initialValue: 'Male',
                allowClear: true,
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: kabMenu
                    .map((kab) => DropdownMenuItem(
                          value: kab,
                          child: Text('$kab'),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputkecamatan() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 250, 0),
            child: Text(
              "Kecamatan",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderDropdown(
                name: 'subdistrict',
                onChanged: (kecMenu) {
                  kecamatan = kecMenu.toString();
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // initialValue: 'Male',
                allowClear: true,
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: kecMenu
                    .map((kec) => DropdownMenuItem(
                          value: kec,
                          child: Text('$kec'),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputdesa() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 220, 0),
            child: Text(
              "Kelurahan/Desa",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderDropdown(
                name: 'village',
                onChanged: (desMenu) {
                  kelurahan = desMenu.toString();
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // initialValue: 'Male',
                allowClear: true,
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: desMenu
                    .map((des) => DropdownMenuItem(
                          value: des,
                          child: Text('$des'),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputrtrw() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 110, 10),
                  // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                  child: Text(
                    "RT",
                    style: TextPalette.titleTextFieldStyle,
                  ),
                ),
                FormBuilderDropdown(
                  name: 'rt',
                  onChanged: (rtMenu) {
                    ert = rtMenu.toString();
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray,
                    filled: true,
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: rtMenu
                      .map((rt) => DropdownMenuItem(
                            value: rt,
                            child: Text('$rt'),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15.0,
            height: 20.0,
          ),
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 110, 10),
                  // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                  child: Text(
                    "RW",
                    style: TextPalette.titleTextFieldStyle,
                  ),
                ),
                FormBuilderDropdown(
                  name: 'rw',
                  onChanged: (rwMenu) {
                    erw = rwMenu.toString();
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray,
                    filled: true,
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: rwMenu
                      .map((rw) => DropdownMenuItem(
                            value: rw,
                            child: Text('$rw'),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }

  Widget inputalamatrmh() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
      // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
      child: Row(
        children: [
          Flexible(
            child: Text(
              "Alamat Tempat Tinggal",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 10.0,
            // height: 20.0,
          ),
          Flexible(
            child: FormBuilderTextField(
              name: 'alamat_rmh',
              // onChanged: _onChanged,
              // valueTransformer: (text) => num.tryParse(text),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
              keyboardType: TextInputType.text,
            ),
          ),
        ],
      ),
    );
  }

  Widget inputcheck() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Flexible(
        child: FormBuilderCheckbox(
          name: 'checkalamat',
          initialValue: false,
          // onChanged: _onChanged,
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Samakan Dengan Alamat KTP',
                    style: TextPalette.checkInputText),
              ],
            ),
          ),
          onChanged: (checkalamat) {
            if (checkalamat == true) {
              jalan.text = street.text;
              
            }
          },
        ),
      ),
    );
  }

  Widget jln() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 300, 0),
            child: Text(
              "Jalan",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderTextField(
                name: 'jln_baru',
                controller: jalan,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // onChanged: _onChanged,
                // valueTransformer: (text) => num.tryParse(text),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.maxLength(context, 25),
                ]),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prov() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 280, 0),
            child: Text(
              "Provinsi",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderDropdown(
                name: 'prov',
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // initialValue: 'Male',
                allowClear: true,
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: provMenu
                    .map((prov) => DropdownMenuItem(
                          value: prov,
                          child: Text('$prov'),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget kota() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 220, 0),
            child: Text(
              "Kota / Kabupaten",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderDropdown(
                name: 'kota',
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // initialValue: 'Male',
                allowClear: true,
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: kabMenu
                    .map((kab) => DropdownMenuItem(
                          value: kab,
                          child: Text('$kab'),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget kec() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 250, 0),
            child: Text(
              "Kecamatan",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderDropdown(
                name: 'kecamatan',
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // initialValue: 'Male',
                allowClear: true,
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: kecMenu
                    .map((kec) => DropdownMenuItem(
                          value: kec,
                          child: Text('$kec'),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget desa() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 220, 0),
            child: Text(
              "Kelurahan/Desa",
              style: TextPalette.titleTextFieldStyle,
            ),
          ),
          SizedBox(
            width: 950,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
              child: FormBuilderDropdown(
                name: 'desa',
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.gray,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: ColorPalette.gray,
                  filled: true,
                ),
                // initialValue: 'Male',
                allowClear: true,
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: desMenu
                    .map((des) => DropdownMenuItem(
                          value: des,
                          child: Text('$des'),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rtrw() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 110, 10),
                  // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                  child: Text(
                    "RT",
                    style: TextPalette.titleTextFieldStyle,
                  ),
                ),
                FormBuilderDropdown(
                  name: 'rt_1',
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray,
                    filled: true,
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: rtMenu
                      .map((rt) => DropdownMenuItem(
                            value: rt,
                            child: Text('$rt'),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15.0,
            height: 20.0,
          ),
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 110, 10),
                  // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                  child: Text(
                    "RW",
                    style: TextPalette.titleTextFieldStyle,
                  ),
                ),
                FormBuilderDropdown(
                  name: 'rw_1',
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray,
                    filled: true,
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: rwMenu
                      .map((rw) => DropdownMenuItem(
                            value: rw,
                            child: Text('$rw'),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }

  Widget simpan() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 50),
      child: SizedBox(
        height: 55,
        child: Container(
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.amber,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: SizedBox(
                        height: 400,
                        child: Column(
                          children: [
                            Text(
                              "Data Diri",
                              style: TextPalette.textDataStyle,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Nama : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      name.text,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Tempat Lahir : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      place.text,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Tanggal Lahir : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      bdate.text,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Jenis Kelamin : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      jenkel,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Alamat KTP", style: TextPalette.poptext),
                                Row(
                                  children: [
                                    Text(
                                      "Jalan : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      street.text,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Provinsi : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      provinsi,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Kabupaten : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      kabupaten,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Kecamatan : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      kecamatan,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Kelurahan : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      kelurahan,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "RT : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      ert,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "RW : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      erw,
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ));
                    });
              },
              child: Center(
                child: Text(
                  "Simpan",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                ColorPalette.redBtn,
                ColorPalette.btnRed,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
      ),
    );
  }
}
