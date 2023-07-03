import 'dart:math';

String generateDocumentId() {
final random = Random();
final now = DateTime.now().millisecondsSinceEpoch;
return 'doc$now${random.nextInt(99999)}';
}