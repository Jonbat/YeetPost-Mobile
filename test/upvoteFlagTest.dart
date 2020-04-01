// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yeetpost/yeet.dart';

void main() {
  testWidgets('Upvote and flag values should be incremented when upvote is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      Yeet().buildReplyYeet(1)
    );

    await tester.tap(find.byType(IconButton,));

    // Rebuild the widget with updated data
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}
