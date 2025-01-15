import 'package:forgor/repositories/database.dart';
import 'package:lite_ref/lite_ref.dart';
import 'package:signals/signals.dart';

final bulletServiceRef = Ref.singleton(() => BulletService(dbRef()));

class BulletService {
  final AppDatabase _database;

  late final allNotes = computedAsync(() => _database.allBulletNotes);

  BulletService(this._database);

  Future<void> newNote() async {
    await _database.newBulletNote();
    allNotes.refresh();
  }

  // All notes are not refreshed after an update because even through
  //the note is updated, the list itself is not.
  Future<void> updateNote(BulletNoteData note) =>
      _database.updateBulletNote(note);

  Future<void> deleteNote(BulletNoteData note) async {
    await _database.deleteBulletNote(note);
    allNotes.refresh();
  }
}
