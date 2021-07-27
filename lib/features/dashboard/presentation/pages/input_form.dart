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
  TextEditingController placeOfBirth = new TextEditingController();
  TextEditingController dateOfBirth = new TextEditingController();
  TextEditingController streetKtp = new TextEditingController();
  TextEditingController streetHome = new TextEditingController();

  String genderFirst = "";
  String provinceSecond = "";
  String districtFirst = "";
  String subdistrictFirst = "";
  String wardFirst = "";
  String rtFirst = "";
  String rwFirst = "";

  String provinceFirst = "";
  String districtSecond = "";
  String subdistrictSecond = "";
  String wardSecond = "";
  String rtSecond = "";
  String rwSecond = "";

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
                name: 'name',
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
                name: 'gender',
                validator: FormBuilderValidators.required(context),
                options: ['Laki - Laki', 'Perempuan']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
                onChanged: (lang) {
                  setState(() {
                    genderFirst = lang.toString();
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
    return Row(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: FormBuilderTextField(
                  name: 'placeBirth',
                  controller: placeOfBirth,
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.maxLength(context, 25),
                  ]),
                  keyboardType: TextInputType.text,
                ),
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
                padding: const EdgeInsets.fromLTRB(10, 0, 40, 10),
                // padding: const EdgeInsets.fromLTRB(left, top, right, bottom)
                child: Text(
                  "Tanggal Lahir",
                  style: TextPalette.titleTextFieldStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: FormBuilderDateTimePicker(
                  name: 'dateBirth',
                  controller: dateOfBirth,
                  // onChanged: _onChanged,
                  inputType: InputType.date,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today),
                    contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 0),
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
                    // fillColor: ColorPalette.gray,
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
      ],
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
              child: FormBuilderTextField(
                name: 'streetKtp',
                controller: streetKtp,
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
              child: FormBuilderDropdown(
                name: 'provincePrimary',
                onChanged: (provMenu) {
                  provinceFirst = provMenu.toString();
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
              child: FormBuilderDropdown(
                name: 'districtPrimary',
                onChanged: (kabMenu) {
                  districtFirst = kabMenu.toString();
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
              child: FormBuilderDropdown(
                name: 'subdistrictPrimary',
                onChanged: (kecMenu) {
                  subdistrictFirst = kecMenu.toString();
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
              child: FormBuilderDropdown(
                name: 'wardPrimary',
                onChanged: (desMenu) {
                  wardFirst = desMenu.toString();
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
                  child: Text(
                    "RT",
                    style: TextPalette.titleTextFieldStyle,
                  ),
                ),
                FormBuilderDropdown(
                  name: 'rtPrimary',
                  onChanged: (rtMenu) {
                    rtFirst = rtMenu.toString();
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
                  child: Text(
                    "RW",
                    style: TextPalette.titleTextFieldStyle,
                  ),
                ),
                FormBuilderDropdown(
                  name: 'rwPrimary',
                  onChanged: (rwMenu) {
                    rwFirst = rwMenu.toString();
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

  Widget inputcheck() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: FormBuilderCheckbox(
        name: 'checkAddress',
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
            streetHome.text = streetKtp.text;

            provinceSecond = provinceFirst;
            districtSecond = districtFirst;
            subdistrictSecond = subdistrictFirst;
            wardSecond = wardFirst;
            rtSecond = rtFirst;
            rwSecond = rwFirst;

            _formKey.currentState?.fields['provinceSecondary']
                ?.didChange(provinceSecond);

            _formKey.currentState?.fields['districtSecondary']
                ?.didChange(districtSecond);

            _formKey.currentState?.fields['subdistrictSecondary']
                ?.didChange(subdistrictSecond);

            _formKey.currentState?.fields['wardSecondary']
                ?.didChange(wardSecond);

            _formKey.currentState?.fields['rtSecondary']?.didChange(rtSecond);

            _formKey.currentState?.fields['rwSecondary']?.didChange(rwSecond);
          }
        },
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
              child: FormBuilderTextField(
                name: 'streetHome',
                controller: streetHome,
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
              child: FormBuilderDropdown(
                name: 'provinceSecondary',
                onChanged: (provMenu) {
                  provinceSecond = provMenu.toString();
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
              child: FormBuilderDropdown(
                name: 'districtSecondary',
                onChanged: (kabMenu) {
                  districtSecond = kabMenu.toString();
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
              child: FormBuilderDropdown(
                name: 'subdistrictSecondary',
                onChanged: (kecMenu) {
                  subdistrictSecond = kecMenu.toString();
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
                name: 'wardSecondary',
                onChanged: (desMenu) {
                  wardSecond = desMenu.toString();
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
                  name: 'rtSecondary',
                  onChanged: (rtMenu) {
                    rtSecond = rtMenu.toString();
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
                  child: Text(
                    "RW",
                    style: TextPalette.titleTextFieldStyle,
                  ),
                ),
                FormBuilderDropdown(
                  name: 'rwSecondary',
                  onChanged: (rwMenu) {
                    rwSecond = rwMenu.toString();
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
                                      placeOfBirth.text,
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
                                      dateOfBirth.text,
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
                                      genderFirst,
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
                                      streetKtp.text,
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
                                      provinceFirst,
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
                                      districtFirst,
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
                                      subdistrictFirst,
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
                                      wardFirst,
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
                                      rtFirst,
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
                                      rwFirst,
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
                                Text("Alamat Tempat Tinggal",
                                    style: TextPalette.poptext),
                                Row(
                                  children: [
                                    Text(
                                      "Jalan : ",
                                      style: TextPalette.biodataTextStyle,
                                    ),
                                    Text(
                                      streetHome.text,
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
                                      provinceSecond,
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
                                      districtSecond,
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
                                      subdistrictSecond,
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
                                      wardSecond,
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
                                      rtSecond,
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
                                      rwSecond,
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
