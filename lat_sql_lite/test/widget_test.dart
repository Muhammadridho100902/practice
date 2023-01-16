// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:lat_sql_lite/db/db_helper.dart';

void main() {
  test(
    "DB Name = Kindacode.com and table name = items",
    () {
      SqlHelper sqlHelper = SqlHelper();

      expect(sqlHelper.databaseName, "kindacode.db");
    },
  );

  test(
    "Table name should be items",
    () {
      SqlHelper sqlHelper = SqlHelper();

      expect(sqlHelper.tableName, "items");
    },
  );

  test(
    "Db name and table name should be String",
    () {
      SqlHelper sqlHelper = SqlHelper();

      expect(
        sqlHelper.databaseName,
        isA<String>(),
      );

      expect(
        sqlHelper.tableName,
        isA<String>(),
      );
    },
  );
}
