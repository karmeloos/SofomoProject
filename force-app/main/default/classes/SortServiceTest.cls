@IsTest
public with sharing class SortServiceTest {
  @IsTest
  static void getDefaultTextSuccessTest() {
    Test.startTest();
    String testResponse = SortService.getDefaultText();
    Test.stopTest();
    System.assert(
      String.isNotBlank(testResponse),
      'Method should not return empty string.'
    );
  }

  @IsTest
  static void sortTextErrorTest() {
    Boolean isError = false;
    Test.startTest();
    try {
      SortService.sortText(null);
    } catch (NullPointerException ex) {
      isError = true;
    }
    Test.stopTest();
    System.assert(isError, 'Null pointer exception should be thrown.');
  }

  @IsTest
  static void oneLineTestSortTest() {
    String testString = 'One line string';
    Test.startTest();
    String returnedString = SortService.sortText(testString);
    Test.stopTest();
    System.assertEquals(
      testString,
      returnedString,
      'Method should return back the same string.'
    );
  }

  @IsTest
  static void sameOrderStringReturnTest() {
    String testString = '111\n22\n3';
    Test.startTest();
    String returnedString = SortService.sortText(testString);
    Test.stopTest();
    System.assertEquals(
      testString,
      returnedString,
      'Method should return back the same string.'
    );
  }

  @IsTest
  static void successSortTest() {
    String testString = '22\n3\n111';
    String correctOrderString = '111\n22\n3';
    Test.startTest();
    String returnedString = SortService.sortText(testString);
    Test.stopTest();
    System.assertEquals(
      correctOrderString,
      returnedString,
      'Method should return back sorted string.'
    );
  }
}
