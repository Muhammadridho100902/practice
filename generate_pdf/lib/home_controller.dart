import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeController extends GetxController {
  var products = List.generate(
      20,
      (index) => {
            "id": "${index + 1}",
            "name": "Product ke - ${index + 1}",
            "date": DateTime.now().toString(),
          });

  void getPdf() async {
    // create class pdf
    final pdf = pw.Document();

    // create own fonts
    var dataFonts = await rootBundle.load("assets/Silkscreen-Bold.ttf");
    var myFonts = pw.Font.ttf(dataFonts);
    var myStyle = pw.TextStyle(font: myFonts, fontSize: 30);

    // add image 
    var dataImage = await rootBundle.load("assets/image.png");
    var myImage = dataImage.buffer.asUint8List();

    // create a page
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 20),
              width: 200,
              height: 200,
              child: pw.Image(
                pw.MemoryImage(myImage),
                fit: pw.BoxFit.cover
              )
            ),
            pw.Column(
              children: products
                  .map(
                    (e) => pw.Text(
                      "The ID is : ${e['id']} - ${e['name']} \n ${e['date']}\n\n",
                      style: myStyle,
                    ),
                  )
                  .toList(),
            )
          ];
        },
      ),
    );

    // to save the pdf
    Uint8List bytes = await pdf.save();

    // create empty file in directory
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/mydocument.pdf");

    // timpa file kosong dengan file pdf
    await file.writeAsBytes(bytes);

    // open pdf file
    await OpenFile.open(file.path);
  }
}
