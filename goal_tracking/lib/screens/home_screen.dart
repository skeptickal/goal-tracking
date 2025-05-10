import 'package:flutter/material.dart';
import 'package:goal_tracking/common/goals_screen_wrapper.dart';
import 'package:goal_tracking/common/goals_text.dart';
import 'package:goal_tracking/screens/goal_flow/goal_flow_initial_screen.dart';
import 'package:goal_tracking/theme/goals_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GoalsScreenWrapper(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GoalsText.titleLarge(
              text: 'Welcome! ',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GoalsText.bodyLarge(
              text: 'Consider me your Goal Tracking assistant!',
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GoalFlowInitialScreen())),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: GoalsTheme.primary,
                ),
                width: 100,
                height: 75,
                child: Center(
                  child: GoalsText.titleMedium(
                    text: 'Create a Goal Flow?',
                    color: GoalsTheme.white,
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   Future<void> _generateAndPreviewPdf() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) => pw.Center(
//           child: pw.Text('Hello World!'),
//         ),
//       ),
//     );

//     // Show the preview
//     await Printing.layoutPdf(
//       onLayout: (PdfPageFormat format) async => pdf.save(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("PDF Generator")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _generateAndPreviewPdf,
//           child: const Text("Generate PDF"),
//         ),
//       ),
//     );
//   }
// }
