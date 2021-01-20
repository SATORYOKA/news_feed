import 'package:moor/moor.dart';
import 'package:news_feed/models/db/database.dart';

part 'dao.g.dart';

@UseDao(tables: [ArticleRecords])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin {
  NewsDao(MyDatabase attachedDatabase) : super(attachedDatabase);

  Future clearDB() => delete(articleRecords).go();
  Future insertDB(List<ArticleRecord> articles) async {
    await batch((batch) => batch.insertAll(articleRecords, articles));
  }
  Future<List<ArticleRecord>> get articlesFromDB => select(articleRecords).get();
}
