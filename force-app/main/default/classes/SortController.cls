public with sharing class SortController {

  @AuraEnabled(cacheable=true)
  public static String getDefaultText() {
      return SortService.getDefaultText();
  }

  @AuraEnabled(cacheable=true)
  public static String sortText(String inText) {
    try {
      return SortService.sortText(inText);
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
