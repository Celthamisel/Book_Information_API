import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class ApiService {
  final String baseUrl = 'https://book-information-library.p.rapidapi.com/api/books/getall-books';
  final Map<String, String> headers = {
    'x-rapidapi-host': 'book-information-library.p.rapidapi.com',
    'x-rapidapi-key': 'b89e01d954msh4a97b27868290c8p1774f5jsn1c63a14e947a',
    'Content-Type': 'application/json',
  };

  Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse(baseUrl), headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> booksJson = jsonResponse['books'];
      return booksJson.map((book) => Book.fromJson(book)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
