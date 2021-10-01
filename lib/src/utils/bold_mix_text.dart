String firstFewWords(String bigSentence) {
  int startIndex = 0, indexOfSpace = 0;
  for (int i = 0; i < 1; i++) {
    indexOfSpace = bigSentence.indexOf(' ', startIndex);
    if (indexOfSpace == -1) {
      //-1 is when character is not found
      return bigSentence;
    }
    startIndex = indexOfSpace + 1;
  }
  return bigSentence.substring(0, indexOfSpace);
}

String restOfWords(String bigSentence) {
  int startIndex = 0, indexOfSpace = 0;
  for (int i = 0; i < 1; i++) {
    indexOfSpace = bigSentence.indexOf(' ', startIndex);
    if (indexOfSpace == -1) {
      //-1 is when character is not found
      return bigSentence;
    }
    startIndex = indexOfSpace + 1;
  }
  return bigSentence.substring(indexOfSpace);
}
