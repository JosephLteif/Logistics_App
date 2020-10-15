import 'dart:html';

void onChanged(String email) {
  var accessKey = "2f9817480c1e60683d05b338d52e41ff";
  var path = 'myData.json';
  HttpRequest.getString(path).then((String fileContents) {
    print(fileContents.length);
  }).catchError((error) {
    print(error.toString());
  });
}
