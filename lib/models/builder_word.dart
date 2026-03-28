enum WordType { subject, verb, object, polite }

class BuilderWord {
  final String thai;
  final String shan;
  final WordType type;

  BuilderWord({required this.thai, required this.shan, required this.type});
}