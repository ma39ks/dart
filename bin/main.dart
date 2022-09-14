import 'dart:io';
import 'dart:math';

Future<String> getC (String char) async {

  await Future.delayed(Duration(seconds: 2));
  return char;
}

void main() async {
  var leng = ['а','б','в','г','д','е','ё','ж','з','и','к','л','м','н','о','п',
    'р','с','т','у','ф','х','ч','ш','щ','ы','э','ю','я'];
  var file = File('file.txt');
  var sink = file.openWrite();
  var rng = Random();

  try {
    for (var i = 0; i < 21; i++) {
      var tmp = await getC(leng[rng.nextInt(leng.length)]);
      print(tmp);
      sink.write(tmp);
      print(file);
    }
  } catch (e) {
    sink.close();
    print(e.toString());
  }
  sink.close();
}