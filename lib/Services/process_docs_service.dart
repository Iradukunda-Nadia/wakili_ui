import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:wakili_ui/Services/common_service.dart';

class DocsProcessing{

  Future<Map<String, dynamic>> extractWebPage(String url) async {
    String extractedText = '';
    var result;
    try {
      // Fetch web page content
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final htmlContent = response.body;

        // Parse HTML to extract text
        var document = html_parser.parse(htmlContent);
        String parsedText = document.body?.text ?? '';

        // Convert HTML to PDF
        final output = await getTemporaryDirectory();
        final targetPath = output.path;
        final targetFileName = "example.pdf";
        final pdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
            htmlContent, targetPath, targetFileName);

        extractedText = parsedText;

        print('PDF file generated at: ${pdfFile.path}');
        result = {
          "status": true,
          "extractedText": extractedText,
          "filePath": pdfFile.path
        };

      } else {
        CommonService().toast("Failed to load the webpage.");
        extractedText = 'Failed to load the webpage.';
        result = {
          "status": false,
          "extractedText": extractedText,
          "filePath": ""
        };
      }
    } catch (e) {
      CommonService().toast('Error: ${e.toString()}');
      extractedText = 'Error: ${e.toString()}';
      result = {
        "status": false,
        "extractedText": extractedText,
        "filePath": ""
      };
    }
    return result;
  }
}