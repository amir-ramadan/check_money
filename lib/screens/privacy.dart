import 'package:flutter/material.dart';

class PrivacyInfo extends StatelessWidget {
  const PrivacyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: Column(
          children: [
            Text('Privacy Policy',style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            Text("-Privacy Policy: This section would detail how user data is collected, used, and protected. It should cover what information the app collects (such as personal data or financial information), how it's stored, and if it's shared with third parties"),
            Text("-Security Measures: The policy should outline the security measures in place to protect user data and financial information. This could include encryption methods, secure data storage practices, and measures to prevent unauthorized access."),
            Text("-Usage Policy: This section would outline the acceptable use of the application. It might include rules against illegal activities, such as using the app to scan counterfeit checks or engage in fraudulent behavior."),
            Text("-Accuracy Disclaimer: Since the app is scanning financial documents, it's important to include a disclaimer about the accuracy of the scans. This could include statements about the limitations of the technology and the possibility of errors in the scanning process."),
            Text("-Liability Disclaimer: This section would limit the developer's liability for any damages that may occur from using the app. It might include clauses stating that the developer is not responsible for any financial losses resulting from inaccurate scans or fraudulent activities."),
            Text("-Terms of Service: This would outline the terms under which the app is provided to the user, including any subscription fees, payment terms, and termination clauses."),
            Text("-Compliance with Laws: The policy should state that users are responsible for complying with all relevant laws and regulations when using the app, including those related to check processing and financial transactions."),
            Text("-Updates and Changes: The policy should outline how updates and changes to the app or the terms of policy will be communicated to users."),
            Text("-Contact Information: Finally, the policy should provide contact information for users to reach out with any questions or concerns about the app or the terms of policy."),
          ],

        ),

      ),
    );
  }
}
