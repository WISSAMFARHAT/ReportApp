import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:open_file/open_file.dart';
import '../Screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import '../../../constant.dart';
import 'package:intl/intl.dart';

class Report extends StatefulWidget {
  final String branch;

  const Report({Key? key,required this.branch}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<Asset> images = [];
  List<Widget> list = [];


  DateTime now = DateTime.now();
  String date = new DateFormat.yMMMMd('en_US').format(DateTime.now());
  String title="";
  TextEditingController textbranch = TextEditingController();

  TextEditingController textvitrine = TextEditingController();
  TextEditingController textsignage = TextEditingController();
  TextEditingController textgeneralbeanch = TextEditingController();
  TextEditingController textgerneralremark = TextEditingController();
  TextEditingController textcashieremployee = TextEditingController();
  TextEditingController textcashiersection = TextEditingController();
  TextEditingController textcashierremark = TextEditingController();
  TextEditingController textstationaryemployee = TextEditingController();
  TextEditingController textstationarsection = TextEditingController();
  TextEditingController textstationarremark = TextEditingController();
  TextEditingController textserviceemployee = TextEditingController();
  TextEditingController textservicesection = TextEditingController();
  TextEditingController textserviceremark = TextEditingController();
  TextEditingController textmanageroverall = TextEditingController();
  TextEditingController textmanagerleader = TextEditingController();
  TextEditingController textmanagerknow = TextEditingController();
  TextEditingController textmanagerperformance = TextEditingController();
  TextEditingController textmanagerinnovative = TextEditingController();
  TextEditingController textmanagercomunication = TextEditingController();
  TextEditingController textmanagerremark = TextEditingController();
  var Rmanagercommunication = 0.0;
  var Rmanagerinnovative = 0.0;
  var Rmanagerperformance = 0.0;
  var Rmanagerknow = 0.0;
  var Rmanagerleader = 0.0;
  var Rmanageroverall = 0.0;
  var Rservicesection = 0.0;
  var Rserviceemployee = 0.0;
  var Rstationarysection = 0.0;
  var Rstationaryemployee = 0.0;
  var Rcashiersection = 0.0;
  var Rcashieremployee = 0.0;
  var Rgeneralvitrine = 0.0;
  var Rgeneralsignage = 0.0;
  var Rgeneralbranch = 0.0;

  get fullpath => null;
  ScrollController _scrollController=ScrollController();
  late Uint8List logobytes;
  List<Uint8List> imagesUint8list = [];
  final pdf=pw.Document();
  bool _changeColor1 = false;
  bool _changeColor2 = false;
  bool _changeColor3 = false;
  bool _changeColor4 = false;
  bool _changeColor5 = false;
  bool _changeColor6 = false;
  bool _changeColor7 = false;
  bool _changeColor8 = false;
  bool _changeColor9 = false;

  getImageBytes(Asset assetImage) async {
    ByteData _bytes = await assetImage.getByteData(quality:25);
    logobytes = _bytes.buffer.asUint8List();
    imagesUint8list.add(logobytes);
  }


  Future<void> writeOnPdf() async
  {
  if(textbranch.text!="") {
    pdf.addPage(
        pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            margin: pw.EdgeInsets.all(32),
            build: (pw.Context context) {
              return <pw.Widget>[
                pw.Header(
                    level: 0,
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text("Powered by The Services Departement",
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex("#e61f4b"),
                                  fontSize: 15)),
                        ]
                    )
                ),
                pw.SizedBox(height: 10),
                pw.Text("Branch : ${textbranch.text}",
                    style: pw.TextStyle(fontSize: 20)),
                pw.SizedBox(height: 10),
                pw.Text("$date", style: pw.TextStyle(fontSize: 15)),
                pw.SizedBox(height: 10),
                pw.Text("Departement : ${widget.branch}",
                    style: pw.TextStyle(fontSize: 20)),
                pw.SizedBox(height: 10),
                pw.Header(
                    level: 0,
                    child: pw.Text("General : ", style: pw.TextStyle(
                        color: PdfColor.fromHex("#e61f4b"), fontSize: 20))
                ),
                pw.SizedBox(height: 10),
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Row(

                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text("Vitrine : ", style: pw.TextStyle(
                            color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                        pw.SizedBox(width: 10,),
                        pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Container(
                                alignment: pw.Alignment.topLeft,
                                child:
                                pw.Text("Raiting : $Rgeneralvitrine/5",
                                    style: pw.TextStyle(fontSize: 15)),
                              ),
                              pw.SizedBox(height: 10),
                              pw.Container(
                                width: 300,
                                child: pw.Text("Remark: ${textvitrine.text}",
                                    overflow: pw.TextOverflow.visible,
                                    style: pw.TextStyle(fontSize: 15)),

                              )
                            ]
                        )
                      ]
                  ),
                ),

                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Signage : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 10,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rgeneralsignage/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Container(
                              width: 300,
                              child: pw.Text("Remark: ${textsignage.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Branch all in \n all Organization : ",
                          style: pw.TextStyle(
                              color: PdfColor.fromHex("#031e28"),
                              fontSize: 20)),
                      pw.SizedBox(width: 10,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rgeneralbranch/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textgeneralbeanch.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Container(
                  width: 500,
                  child: pw.Text("Remarks: ${textgerneralremark.text}",
                      overflow: pw.TextOverflow.visible,
                      style: pw.TextStyle(fontSize: 15)),
                ),
                pw.SizedBox(height: 10),
                pw.Header(
                    level: 0,
                    child: pw.Text("Cashier : ", style: pw.TextStyle(
                        color: PdfColor.fromHex("#e61f4b"), fontSize: 20))
                ),
                pw.SizedBox(height: 15),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Employee : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 10,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rcashieremployee/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textcashieremployee.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Organization \nSection : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 10,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rcashiersection/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textcashiersection.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Container(
                  width: 500,
                  child: pw.Text("Remarks: ${textcashierremark.text} ",
                      overflow: pw.TextOverflow.visible,
                      style: pw.TextStyle(fontSize: 15)),
                ),
              ];
            }
        )
    );
    pdf.addPage(
        pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            margin: pw.EdgeInsets.all(32),
            build: (pw.Context context) {
              return <pw.Widget>[
                pw.Header(
                    level: 0,
                    child: pw.Text("Stationary : ", style: pw.TextStyle(
                        color: PdfColor.fromHex("#e61f4b"), fontSize: 20))
                ),
                pw.SizedBox(height: 15),

                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Employee : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 10,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rstationaryemployee/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textstationaryemployee.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Organization \nSection : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 10,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rstationarysection/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textstationarsection.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Container(
                  width: 500,
                  child: pw.Text("Remarks: ${textstationarremark.text} ",
                      overflow: pw.TextOverflow.visible,
                      style: pw.TextStyle(fontSize: 15)),
                ),
                pw.SizedBox(height: 15),

                pw.Header(
                    level: 0,
                    child: pw.Text("Service : ", style: pw.TextStyle(
                        color: PdfColor.fromHex("#e61f4b"), fontSize: 20))
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Employee : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 10,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rserviceemployee/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 15),
                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textserviceemployee.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text("Organization \nSection : ", style: pw.TextStyle(
                        color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                    pw.SizedBox(width: 10,),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          alignment: pw.Alignment.topLeft,
                          child:
                          pw.Text("Raiting : $Rservicesection/5",
                              style: pw.TextStyle(fontSize: 15)),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Container(
                          width: 300,
                          child: pw.Text("Remark: ${textservicesection.text} ",
                              overflow: pw.TextOverflow.visible,
                              style: pw.TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                  ],),
                pw.SizedBox(height: 10),
                pw.Divider(),
                pw.Container(
                  width: 500,
                  child: pw.Text("Remarks: ${textserviceremark.text} ",
                      overflow: pw.TextOverflow.visible,
                      style: pw.TextStyle(fontSize: 15)),
                ),


              ];
            })
    );

    pdf.addPage(
        pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            margin: pw.EdgeInsets.all(32),
            build: (pw.Context context) {
              return <pw.Widget>[
                pw.Header(
                    level: 0,
                    child: pw.Text("Manager : ", style: pw.TextStyle(
                        color: PdfColor.fromHex("#e61f4b"), fontSize: 20))
                ),
                pw.SizedBox(height: 15),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Overall : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 15,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rmanageroverall/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 15),
                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textmanageroverall.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Leadership \nSkills : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 15,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rmanagerleader/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 15),
                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textmanagerleader.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("The Know How : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 15,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rmanagerknow/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 15),
                            pw.Container(
                              width: 300,
                              child: pw.Text("Remark: ${textmanagerknow.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Performance : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 15,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rmanagerperformance/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 15),

                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textmanagerperformance.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Innovative : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 15,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rmanagerinnovative/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 15),
                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textmanagerinnovative.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text("Communication\nSkills : ", style: pw.TextStyle(
                          color: PdfColor.fromHex("#031e28"), fontSize: 20)),
                      pw.SizedBox(width: 10,),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child:
                              pw.Text("Raiting : $Rmanagercommunication/5",
                                  style: pw.TextStyle(fontSize: 15)),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Container(
                              width: 300,
                              child: pw.Text(
                                  "Remark: ${textmanagercomunication.text} ",
                                  overflow: pw.TextOverflow.visible,
                                  style: pw.TextStyle(fontSize: 15)),

                            )
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Container(
                  width: 500,
                  child: pw.Text("Remarks: ${textmanagerremark.text} ",
                      overflow: pw.TextOverflow.visible,
                      style: pw.TextStyle(fontSize: 15)),
                ),

              ];
            }
        )
    );

    pdf.addPage(
        pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            margin: pw.EdgeInsets.all(32),
            build: (pw.Context context) {
              return <pw.Widget>[
                pw.Header(
                    level: 0,
                    child: pw.Text("Images : ", style: pw.TextStyle(
                        color: PdfColor.fromHex("#e61f4b"), fontSize: 20))
                ),


              pw.GridView(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: [
                      for(int i = 0; i < imagesUint8list.length; i++)
                        pw.Image(pw.MemoryImage(imagesUint8list[i]),
                            fit: pw.BoxFit.contain),
                    ]

                ),

              ];
            }
        )
    );

    String directory = (await getApplicationDocumentsDirectory()).path;
    title = new DateFormat('yyyy-MM-dd').format(DateTime.now()) +
        "_${textbranch.text}.pdf";
    final path=Directory('$directory/${widget.branch}');
    if ((await path.exists())){
      final pdfName = '$directory/${widget.branch}/$title';
      final File file = File(pdfName);
      await file.writeAsBytes(await pdf.save());
      clear();
      OpenFile.open('$pdfName');
    }else{
      path.create();
      final pdfName = '$directory/${widget.branch}/$title';
      final File file = File(pdfName);
      await file.writeAsBytes(await pdf.save());
      clear();
      OpenFile.open('$pdfName');
    }

  }else{
    // Create button
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();

      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Alert !! "),
      content: Text("Branch name is requirement."),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  }


 void LoadAsset(num) async
  {
    List<Asset> resultList = [];
    try{
      resultList=await MultiImagePicker.pickImages(
        maxImages: 100,

        enableCamera: true,
        selectedAssets: images,
        materialOptions: const MaterialOptions(
          actionBarTitle: "Select images",
        ),
      );
      print(resultList.length);
      for(int i=0;i<resultList.length;i++)
      {
        getImageBytes(resultList[i]);
      }
      if(resultList.length!=0)
        {
          if(num==1)
          setState(() => _changeColor1 = true);
          else if(num==2)
            setState(() => _changeColor2 = true);
          else if(num==3)
            setState(() => _changeColor3 = true);
          else if(num==4)
            setState(() => _changeColor4 = true);
          else if(num==5)
            setState(() => _changeColor5 = true);
          else if(num==6)
            setState(() => _changeColor6 = true);
          else if(num==7)
            setState(() => _changeColor7 = true);
          else if(num==8)
            setState(() => _changeColor8 = true);
          else if(num==9)
            setState(() => _changeColor9 = true);
        }

    }on Exception catch(e)
    {
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //return total size , w ,hof screen
    return
      SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            clipBehavior: Clip.antiAlias,
            controller: _scrollController,
            children: [
              Row(children: [
                Container(
                  width: size.width * 0.7,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Ksecond,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(80))),
                )
              ]),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: textbranch,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Ksecond, width: 2.0),
                        ),
                        fillColor: Colors.white,
                        icon: Icon(
                          Icons.select_all,
                          color: Colors.white,
                        ),
                        iconColor: Colors.white,
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 3.0)),
                        border: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 2.0),
                        ),
                        hintText: 'Enter a Branch name',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Text(
                        "General : ",
                        style: TextStyle(color: Ksecond, fontSize: 30),
                     //   textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 10),
                          const Text(
                            "Vitrine : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          RatingBar.builder(
                            initialRating: Rgeneralvitrine,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              Rgeneralvitrine = rating;
                            },
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width - 50,
                            child: TextFormField(
                              controller: textvitrine,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Ksecond, width: 2.0),
                                ),
                                iconColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Ksecond, width: 2.0),
                                ),
                                hintText: 'Enter a Remark',
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width - 100,
                            child: ElevatedButton(
                                style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                                  return _changeColor1? Colors.green:Ksecond;
                                })),
                                onPressed:()=> LoadAsset(1),
                                child: const Text("Upload",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 10),
                          const Text(
                            "Signage : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          RatingBar.builder(
                            initialRating: Rgeneralsignage,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              Rgeneralsignage = rating;
                            },
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width - 50,
                            child: TextFormField(
                              controller: textsignage,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Ksecond, width: 2.0),
                                ),
                                iconColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Ksecond, width: 2.0),
                                ),
                                hintText: 'Enter a Remark',
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width - 100,
                            child: ElevatedButton(
                                style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                                  return _changeColor2? Colors.green:Ksecond;
                                })),
                                onPressed:()=> LoadAsset(2),
                                child: const Text("Upload",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 10),
                          const Text(
                            "Branch all in all Organization : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          RatingBar.builder(
                            initialRating: Rgeneralbranch,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              Rgeneralbranch = rating;
                            },
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width - 50,
                            child: TextFormField(
                              controller: textgeneralbeanch,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Ksecond, width: 2.0),
                                ),
                                iconColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Ksecond, width: 2.0),
                                ),
                                hintText: 'Enter a Remark',
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width - 100,
                            child: ElevatedButton(
                                style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                                  return _changeColor3? Colors.green:Ksecond;
                                })),
                                onPressed:()=> LoadAsset(3),
                                child: const Text("Upload",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 230,
                            width: size.width - 50,
                            child: TextFormField(
                              controller: textgerneralremark,
                              keyboardType: TextInputType.multiline,
                              maxLines: 8,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Ksecond, width: 2.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Ksecond, width: 2.0),
                                  ),
                                  hintText: 'Enter overall Remark',
                                  hintStyle: TextStyle(color: Colors.black),
                                  fillColor: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: const [
                      Text(
                        "Cashier : ",
                        style: TextStyle(color: Ksecond, fontSize: 30),
                        //textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 10),
                          const Text(
                            "Employee : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          RatingBar.builder(
                            initialRating: Rcashieremployee,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              Rcashieremployee = rating;
                            },
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width - 50,
                            child: TextFormField(
                              controller: textcashieremployee,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Ksecond, width: 2.0),
                                ),
                                iconColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Ksecond, width: 2.0),
                                ),
                                hintText: 'Enter a Remark',
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width - 100,
                            child: ElevatedButton(
                                style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                                  return _changeColor4? Colors.green:Ksecond;
                                })),
                                onPressed: ()=> LoadAsset(4),
                                child: const Text("Upload",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 10),
                          const Text(
                            "Organization Section : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          RatingBar.builder(
                            initialRating: Rcashiersection,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              Rcashiersection = rating;
                            },
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width - 50,
                            child: TextFormField(
                              controller: textcashiersection,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Ksecond, width: 2.0),
                                ),
                                iconColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Ksecond, width: 2.0),
                                ),
                                hintText: 'Enter a Remark',
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width - 100,
                            child: ElevatedButton(
                                style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                                  return _changeColor5? Colors.green:Ksecond;
                                })),
                                onPressed: ()=> LoadAsset(5),
                                child: const Text("Upload",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 230,
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textcashierremark,
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Ksecond, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Ksecond, width: 2.0),
                              ),
                              hintText: 'Enter overall Remark',
                              hintStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Text(
                    "Stationary : ",
                    style: TextStyle(color: Ksecond, fontSize: 30),
                   // textDirection: TextDirection.ltr,
                  ),
                ],
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "Employee : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: Rstationaryemployee,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Rstationaryemployee = rating;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textstationaryemployee,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            iconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            hintText: 'Enter a Remark',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 100,
                        child: ElevatedButton(
                            style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                              return _changeColor6? Colors.green:Ksecond;
                            })),
                            onPressed:()=> LoadAsset(6),
                            child: const Text("Upload",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "Organization Section : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: Rstationarysection,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Rstationarysection = rating;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textstationarsection,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            iconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            hintText: 'Enter a Remark',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 100,
                        child: ElevatedButton(
                            style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                              return _changeColor7? Colors.green:Ksecond;
                            })),
                            onPressed:()=> LoadAsset(7),
                            child: const Text("Upload",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 230,
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textstationarremark,
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Ksecond, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Ksecond, width: 2.0),
                              ),
                              hintText: 'Enter overall Remark',
                              hintStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Text(
                    "Service : ",
                    style: TextStyle(color: Ksecond, fontSize: 30),
                  //  textDirection: TextDirection.ltr,
                  ),
                ],
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "Employee : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: Rserviceemployee,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Rserviceemployee = rating;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textserviceemployee,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            iconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            hintText: 'Enter a Remark',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 100,
                        child: ElevatedButton(
                            style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                              return _changeColor8? Colors.green:Ksecond;
                            })),
                            onPressed:()=> LoadAsset(8),
                            child: const Text("Upload",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "Organization Section : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: Rservicesection,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Rservicesection = rating;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textservicesection,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            iconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            hintText: 'Enter a Remark',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 100,
                        child: ElevatedButton(
                            style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                              return _changeColor9? Colors.green:Ksecond;
                            })),
                            onPressed: ()=> LoadAsset(9),
                            child: const Text("Upload",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 230,
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textserviceremark,
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Ksecond, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Ksecond, width: 2.0),
                              ),
                              hintText: 'Enter overall Remark',
                              hintStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Text(
                    "Manager : ",
                    style: TextStyle(color: Ksecond, fontSize: 30),
                   // textDirection: TextDirection.LTR,
                  ),
                ],
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "Overlall : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: Rmanageroverall,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Rmanageroverall = rating;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textmanageroverall,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            iconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            hintText: 'Enter a Remark',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "Leadership Skills : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: Rmanagerleader,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Rmanagerleader = rating;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textmanagerleader,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            iconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            hintText: 'Enter a Remark',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "The Know How : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: Rmanagerknow,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Rmanagerknow = rating;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textmanagerknow,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            iconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            hintText: 'Enter a Remark',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "Performance : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: Rmanagerperformance,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Rmanagerperformance = rating;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textmanagerperformance,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            iconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            hintText: 'Enter a Remark',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "Innovative : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: Rmanagerinnovative,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Rmanagerinnovative = rating;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textmanagerinnovative,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            iconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            hintText: 'Enter a Remark',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "Communication Skills : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        onRatingUpdate: (rating) {
                          Rmanagercommunication = rating;
                        },
                        initialRating: Rmanagercommunication,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textmanagercomunication,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            iconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Ksecond, width: 2.0),
                            ),
                            hintText: 'Enter a Remark',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 230,
                        width: size.width - 50,
                        child: TextFormField(
                          controller: textmanagerremark,
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Ksecond, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Ksecond, width: 2.0),
                              ),
                              hintText: 'Enter overall Remark',
                              hintStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  SizedBox(
                    width: size.width * 0.4,
                    child: ElevatedButton(
                        style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                          return Ksecond;
                        })),
                        onPressed: () {
                          clear();
                        },
                        child: const Text("Clear",
                            style:
                            TextStyle(fontSize: 20, color: Colors.white))),
                  ),
                  SizedBox(
                    width: size.width * 0.4,
                    child: ElevatedButton(
                        style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                          return Ksecond;
                        })),
                        onPressed: writeOnPdf,
                        child: const Text("Export",
                            style:
                            TextStyle(fontSize: 20, color: Colors.white))),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 25),
            ],
          )
        ],
      ),
    );
  }

  void clear() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Screen(value:"${widget.branch}")));
  }
}
