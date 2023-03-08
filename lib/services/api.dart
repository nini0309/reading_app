import 'package:dio/dio.dart';
import 'package:reading_app/models/bookdesc.dart';
import 'package:reading_app/models/trending.dart';

class ApiService {
  Dio dio = Dio();
  String baseURL = "https://openlibrary.org";

  Future<List<Trending>> getTrending() async {
    try {
      final response =
          await dio.get('$baseURL/trending/forever/.json?cover_edition_key');
      final List works = response.data["works"];
      works.removeWhere((m) => m['cover_edition_key'] == null);
      return (works.map((e) => Trending.fromJson(e)).toList()).sublist(0, 7);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<BookDesc> getBook(String key) async {
    try {
      final response = await dio.get('$baseURL$key.json');
      final cover = response.data['covers'][0].toString() ?? '';
      final author = response.data['authors'][0]['author']['key'] ?? 'Unknown';
      return BookDesc(
        title: response.data['title'],
        key: response.data['key'],
        description:
            response.data['description'].toString() ?? 'No description',
        cover: cover,
        author: author,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getAuthor(String olid) async {
    try {
      final response = await dio.get('https://openlibrary.org$olid.json');
      final author = response.data['name'];
      return author;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}