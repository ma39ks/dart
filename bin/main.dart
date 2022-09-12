import 'dart:io';

void main() async {
  var dir = Directory('.');
  try {
    var dirList = dir.list();
    dirList.forEach((element) {
      if (element is File) {
        print('Found file ${element.path}');
      } else if (element is Directory) {
        print('Found dir ${element.path}');
      }
    });
  } catch (e) {
    print(e.toString());
  }
}