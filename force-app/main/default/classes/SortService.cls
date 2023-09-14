public with sharing class SortService {
  private static final String DEFAULT_TEXT = 'Wlazł kotek na płotek\ni mruga,\nładna to piosenka,\nnie długa.\nNie długa, nie krótka,\nlecz w sam raz,\nzaśpiewaj koteczku,\njeszcze raz';

  public static String getDefaultText() {
    return DEFAULT_TEXT;
  }

  public static String sortText(String inText) {
    if(String.isBlank(inText)) {
      throw new NullPointerException();
    }
    List<String> textArray = inText.split('\n');
    if(textArray.size() == 1) {
      return inText;
    }
    for (Integer i = 0; i < textArray.size(); i++) {
      for (Integer j = 0; j < textArray.size(); j++) {
        if(textArray[i].length() <= textArray[j].length()) {
          continue;
        }
        String temp = textArray[i];
        textArray[i] = textArray[j];
        textArray[j] = temp;
      }
    }
    return String.join(textArray, '\n');
  }
}
