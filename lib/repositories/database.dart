import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:lite_ref/lite_ref.dart';

part 'database.g.dart';

final dbRef = Ref.singleton(() => AppDatabase());

class BulletNote extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
}

@DriftDatabase(tables: [BulletNote])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase() : super(driftDatabase(name: 'forgor'));

  @override
  int get schemaVersion => 1;

  Future<List<BulletNoteData>> get allBulletNotes => select(bulletNote).get();

  Future<void> newBulletNote() async {
    await into(bulletNote).insert(BulletNoteCompanion.insert(content: ""));
  }

  Future<void> updateBulletNote(BulletNoteData bullet) async {
    await update(bulletNote).replace(bullet);
  }

  Future<void> deleteBulletNote(BulletNoteData bullet) async {
    await delete(bulletNote).delete(bullet);
  }
}
