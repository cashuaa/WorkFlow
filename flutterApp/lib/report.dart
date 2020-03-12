// import 'package:flutter_example/pdf.dart';
// import 'package:flutterApp/pdfPage.dart';
import 'package:pdf/pdf.dart';
// import 'dart:io';
// import 'package:flutter/material.dart' as material;
import 'package:pdf/widgets.dart';
// import 'package:path_provider/path_provider.dart';

reportView(context) async {
  final Document pdf = Document();

pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      build: ( context) {
        return Container(
        child:Text("some content asdfhlaskdhf;lhj;alskjdf;   ;asldfj fasdf ; kjdf;asf"),
        // return Center(
        //   child: Text("Hello World"),
         // Center
        );}));
  //save PDF
  // final String dir = (await getApplicationDocumentsDirectory()).path;
  // final String path = '$dir/report.pdf';
  // final File file = File(path);
  // await file.writeAsBytes(pdf.save());
  // material.Navigator.of(context).push(
  //   material.MaterialPageRoute(
  //     builder: (_) => PdfViewerPage(path: path),
  //   ),
  // );

}