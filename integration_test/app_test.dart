import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_task3/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {

    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final Finder userNameSignUpTextFormFiled = find.byKey(Key("userNameSignUp"));
      final Finder emailSignUpTextFormFiled = find.byKey(Key("emailSignUp"));
      final Finder passwordSignUpTextFormFiled = find.byKey(Key("passwordSignUp"));
      final Finder confirmPasswordSignUpTextFormFiled = find.byKey(Key("confirmPasswordSignUp"));
      final Finder singUpButton = find.byKey(Key("singUpButton"));
      await tester.enterText(userNameSignUpTextFormFiled, "abdelhady");
      await tester.enterText(emailSignUpTextFormFiled, "abdelhadymohamed1121@gmail.com");
      await tester.enterText(passwordSignUpTextFormFiled, "Ssss1234@");
      await tester.enterText(confirmPasswordSignUpTextFormFiled, "Ssss1234@");

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(singUpButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      final Finder emailSendEmailForVerificationTextFormFiled = find.byType(TextFormField).first;
      final Finder sendEmailButton = find.byType(MaterialButton).first;

      await tester.enterText(emailSendEmailForVerificationTextFormFiled, "abdelhadymohamed1121@gmail.com");
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(sendEmailButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      final Finder VerificationTextFormFiled = find.byType(TextFormField).first;
      final Finder verifyCodeButton = find.byType(MaterialButton).first;

      await tester.enterText(VerificationTextFormFiled, "19521");
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(verifyCodeButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      final Finder newPasswordTextFormFiled = find.byType(TextFormField).first;
      final Finder confirmPassworedTextFormFiled = find.byType(TextFormField).last;
      final Finder forgetButton = find.byType(MaterialButton).first;

      await tester.enterText(newPasswordTextFormFiled, "Ssss1234*");
      await tester.enterText(confirmPassworedTextFormFiled, "Ssss1234*");
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(forgetButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      final Finder emailLoginTextFormFiled = find.byType(TextFormField).first;
      final Finder passwordLoginTextFormFiled = find.byType(TextFormField).last;
      final Finder loginButton = find.byType(MaterialButton).first;

      await tester.enterText(emailLoginTextFormFiled, "abdelhadymohamed1121@gmail.com");
      await tester.enterText(passwordLoginTextFormFiled, "Ssss1234@");
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 4));

    });


}
