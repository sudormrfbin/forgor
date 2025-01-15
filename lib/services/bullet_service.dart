import 'package:forgor/repositories/database.dart';
import 'package:lite_ref/lite_ref.dart';

final bulletServiceRef = Ref.singleton(() => BulletService(dbRef()));

class BulletService {
  final AppDatabase _database;

  BulletService(this._database);

  Future<List<BulletNoteData>> allNotes() => _database.allBulletNotes;
  Future<void> newNote() => _database.newBulletNote();
  Future<void> updateNote(BulletNoteData note) => _database.updateBulletNote(note);
  Future<void> deleteNote(BulletNoteData note) => _database.deleteBulletNote(note);
}
