import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfz;
// import 'package:flutter_example/pdf.dart';
// import 'package:flutterApp/pdfPage.dart';


class PdfViewerPage extends StatelessWidget {

  final String path;

  PdfViewerPage({this.path});
  
  
  final pdfDoc = pdfz.Document();
  viewPDF(){
    pdfDoc.addPage(
      pdfz.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pdfz.EdgeInsets.all(16),

        build: (pdfz.Context context){
          return <pdfz.Widget> [

            pdfz.Header(level:0,
            child: pdfz.Text("HELLOOOO IT WORKED",)
            ),

            pdfz.Paragraph(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
            ),

            pdfz.Paragraph(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
            ),

            pdfz.Header(level: 2,
            child: pdfz.Text("Sub Heading HERE!!")
            ),

            pdfz.Paragraph(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
            ),


          ];
        }
         

    )
    );

  }

  Future savePDF()async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");
    file.writeAsBytesSync(pdfDoc.save());
  }



  @override
  Widget build(BuildContext context) {
      

      return PDFViewerScaffold(path: path);
  }
}
