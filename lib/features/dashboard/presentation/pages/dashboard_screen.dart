import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mini_project/theme/color.dart';
import 'package:mini_project/theme/textstyle.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mini_project/service_locator.dart';
import 'package:intl/intl.dart';
import 'edit_dashboard_screen.dart';

const String DataDiriBoxName = "BOX_Friends";

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(LoadDashboard());
    BlocProvider.of<DashboardBloc>(context).add(GetDashboard());
  }

  late String nm;
  late String gender;
  late String tempLahir;
  late String tglLahir;
  late String jlnPertama;
  late String provinsiPertama;
  late String kabupatenPertama;
  late String kecamatanPertama;
  late String desaPertama;
  late String rtPertama;
  late String rwPertama;
  late String jlnKedua;
  late String provinsiKedua;
  late String kabupatenKedua;
  late String kecamatanKedua;
  late String desaKedua;
  late String rtKedua;
  late String rwKedua;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 0, 0),
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ValueListenableBuilder(
                  valueListenable:
                      Hive.box<DataDiri>(DataDiriBoxName).listenable(),
                  builder: (context, Box<DataDiri> box, _) {
                    print(box.values.isEmpty);
                    if (box.values.isEmpty)
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(42))),
                        child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          child: Text(
                            "No Data",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ),
                      );
                    SizedBox(
                      height: 32,
                    );
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(42))),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 35, left: 20, right: 20),
                        child: ListView.builder(
                          itemCount: box.values.length,
                          itemBuilder: (context, index) {
                            var currentDataDiri = box.getAt(index);
                            var indeks = index;
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 1.5,
                              color: ColorPalette.grays,
                              child: ListTile(
                                title: Text(
                                  currentDataDiri!.name,
                                  style: TextPalette.fieldStyle,
                                ),
                                subtitle: Text(currentDataDiri.jalan),
                                leading: CircleAvatar(
                                  backgroundColor: ColorPalette.primary,
                                  backgroundImage: AssetImage("assets/user-img.png"),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    PopupMenuButton(
                                        itemBuilder: (context) => [
                                              PopupMenuItem(
                                                child: TextButton.icon(
                                                  style: TextButton.styleFrom(
                                                      primary:
                                                          ColorPalette.primary),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    showDialog(
                                                        context: context,
                                                        builder: (_) {
                                                          return Dialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 20,
                                                                      top: 10,
                                                                      right:
                                                                          20),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .person,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                      Text(
                                                                        "Data Diri ",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),

                                                                  Divider(
                                                                    thickness:
                                                                        2,
                                                                  ),
                                                                  Text("Nama : " +
                                                                      currentDataDiri
                                                                          .name),
                                                                  Text("Jenis Kelamin : " +
                                                                      currentDataDiri
                                                                          .jenisKelamin),
                                                                  Text("Tempat : " +
                                                                      currentDataDiri
                                                                          .tempat),
                                                                  Text("Tanggal Lahir :" +
                                                                      DateFormat(
                                                                              'yyyy-MM-dd')
                                                                          .format(
                                                                              currentDataDiri.tanggalLahir)),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 5)),
                                                                  Text(
                                                                    "Alamat KTP",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  // Divider(),
                                                                  Text("Jalan : " +
                                                                      currentDataDiri
                                                                          .jalan),
                                                                  Text("Provinsi : " +
                                                                      currentDataDiri
                                                                          .provinsiKtp),
                                                                  Text("Kota/kabupaten : " +
                                                                      currentDataDiri
                                                                          .kabupatenKtp),
                                                                  Text("Kecamatan : " +
                                                                      currentDataDiri
                                                                          .kecamatanKtp),
                                                                  Text("Kelurahan/Desa : " +
                                                                      currentDataDiri
                                                                          .desaKtp),
                                                                  Text("RT : " +
                                                                      currentDataDiri
                                                                          .rtKtp),
                                                                  Text("Rw : " +
                                                                      currentDataDiri
                                                                          .rwKtp),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 5)),
                                                                  Text(
                                                                    "Alamat Tempat Tinggal",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  // Divider(),
                                                                  Text("Jalan : " +
                                                                      currentDataDiri
                                                                          .jalanRumah),
                                                                  Text("Provinsi : " +
                                                                      currentDataDiri
                                                                          .provinsiRumah),
                                                                  Text("Kota/kabupaten : " +
                                                                      currentDataDiri
                                                                          .kabupatenRumah),
                                                                  Text("Kecamatan : " +
                                                                      currentDataDiri
                                                                          .kecamatanRumah),
                                                                  Text("Kelurahan/Desa : " +
                                                                      currentDataDiri
                                                                          .desaRumah),
                                                                  Text("RT : " +
                                                                      currentDataDiri
                                                                          .rtRumah),
                                                                  Text("Rw : " +
                                                                      currentDataDiri
                                                                          .rwRumah),
                                                                  Divider(
                                                                    thickness:
                                                                        2,
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 10))
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  icon:
                                                      Icon(Icons.info_outline),
                                                  label: Text("Detail"),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                  child: TextButton.icon(
                                                      style:
                                                          TextButton.styleFrom(
                                                              primary:
                                                                  ColorPalette
                                                                      .primary),
                                                      onPressed: () {
                                                        setState(() {
                                                          indeks = index;
                                                          nm = currentDataDiri
                                                              .name;
                                                          gender =
                                                              currentDataDiri
                                                                  .jenisKelamin;
                                                          tempLahir =
                                                              currentDataDiri
                                                                  .tempat;
                                                          tglLahir =
                                                              currentDataDiri
                                                                  .tanggalLahir
                                                                  .toString();
                                                          jlnPertama =
                                                              currentDataDiri
                                                                  .jalan;
                                                          provinsiPertama =
                                                              currentDataDiri
                                                                  .provinsiKtp;
                                                          kabupatenPertama =
                                                              currentDataDiri
                                                                  .kabupatenKtp;
                                                          kecamatanPertama =
                                                              currentDataDiri
                                                                  .kecamatanKtp;
                                                          desaPertama =
                                                              currentDataDiri
                                                                  .desaKtp;
                                                          rtPertama =
                                                              currentDataDiri
                                                                  .rtKtp;
                                                          rwPertama =
                                                              currentDataDiri
                                                                  .rwKtp;
                                                          jlnKedua =
                                                              currentDataDiri
                                                                  .jalanRumah;
                                                          provinsiKedua =
                                                              currentDataDiri
                                                                  .provinsiRumah;
                                                          kabupatenKedua =
                                                              currentDataDiri
                                                                  .kabupatenRumah;
                                                          kecamatanKedua =
                                                              currentDataDiri
                                                                  .kecamatanRumah;
                                                          desaKedua =
                                                              currentDataDiri
                                                                  .desaRumah;
                                                          rtKedua =
                                                              currentDataDiri
                                                                  .rtRumah;
                                                          rwKedua =
                                                              currentDataDiri
                                                                  .rwRumah;
                                                        });

                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return BlocProvider(
                                                            create: (_) =>
                                                                serviceLocator.get<
                                                                    DashboardBloc>(),
                                                            child:
                                                                EditDataDiriForm(
                                                              index: indeks,
                                                              nama: nm,
                                                              gender: gender,
                                                              tempLahir:
                                                                  tempLahir,
                                                              tglLahir:
                                                                  tglLahir,
                                                              jlnPertama:
                                                                  jlnPertama,
                                                              provPertama:
                                                                  provinsiPertama,
                                                              kabPertama:
                                                                  kabupatenPertama,
                                                              kecPertama:
                                                                  kecamatanPertama,
                                                              desaPertama:
                                                                  desaPertama,
                                                              ertPertama:
                                                                  rtPertama,
                                                              erwPertama:
                                                                  rwPertama,
                                                              jlnKedua:
                                                                  jlnKedua,
                                                              provKedua:
                                                                  provinsiKedua,
                                                              kabKedua:
                                                                  kabupatenKedua,
                                                              kecKedua:
                                                                  kecamatanKedua,
                                                              desaKedua:
                                                                  desaKedua,
                                                              ertKedua: rtKedua,
                                                              erwKedua: rwKedua,
                                                            ),
                                                          );
                                                        }));
                                                      },
                                                      icon: Icon(
                                                          Icons.edit_outlined),
                                                      label: Text("Edit"))),
                                              PopupMenuItem(
                                                  child: TextButton.icon(
                                                      style:
                                                          TextButton.styleFrom(
                                                              primary:
                                                                  ColorPalette
                                                                      .primary),
                                                      onPressed: () {
                                                        Alert(
                                                          context: context,
                                                          type:
                                                              AlertType.warning,
                                                          title: "Hapus Data",
                                                          desc:
                                                              "Apa anda yakin menghapus data?",
                                                          buttons: [
                                                            DialogButton(
                                                                child: Text(
                                                                  "Ya",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                onPressed: () {
                                                                  box.deleteAt(
                                                                      index);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                color:
                                                                    ColorPalette
                                                                        .main),
                                                            DialogButton(
                                                                child: Text(
                                                                  "Batal",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                color:
                                                                    ColorPalette
                                                                        .main)
                                                          ],
                                                        ).show();
                                                      },
                                                      icon: Icon(Icons
                                                          .delete_outline_outlined),
                                                      label: Text("Hapus")))
                                            ]),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
