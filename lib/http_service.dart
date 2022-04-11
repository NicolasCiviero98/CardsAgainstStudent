import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'post_model.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  static void getPosts() async {

    var url =
    Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }


    // var uri = new Uri(postsURL);
    // Response res = await get(postsURL);
    //
    // if (res.statusCode == 200) {
    //   List<dynamic> body = jsonDecode(res.body);
    //
    //   List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
    //
    //   return posts;
    // } else {
    //   throw "Unable to retrieve posts.";
    // }
  }
}