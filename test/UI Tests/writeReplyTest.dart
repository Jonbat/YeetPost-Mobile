// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yeetpost/replyPage.dart';

void main() {
  testWidgets('UI test for writing a yeet', (WidgetTester tester) async {
    await tester.pumpWidget(
      ReplyPage('test', 'test', 'test',)
    );

    // Enter 'Test yeet text' into the TextField.
    await tester.enterText(find.byType(TextField), 'Test reply text');

    // Tap the 'write yeet' button
    await tester.tap(find.byType(IconButton));

    // Rebuild the widget with updated data
    await tester.pump();

    expect(find.text('Test reply text'), findsOneWidget);
  });
}
