@isTest
public with sharing class SortControllerTest {
    @IsTest
    static void getDefaultTextSuccessTest(){
        Test.startTest();
        String testResponse = SortController.getDefaultText();
        Test.stopTest();
        System.assert(String.isNotBlank(testResponse), 'Method should not return empty string.');
    }

    @IsTest
    static void sortTextSuccessTest(){
        String testString = 'Test string';
        Test.startTest();
        String testResponseString = SortController.sortText(testString);
        Test.stopTest();
        System.assertEquals(testString, testResponseString, 'Method should return back the same string.');
    }

    @IsTest
    static void sortTextErrorTest(){
        Boolean isError = false;
        Test.startTest();
        try {
            SortController.sortText(null);
        } catch (AuraHandledException ex) {
            isError = true;
        }
        Test.stopTest();
        System.assert(isError, 'Aura exception should be thrown.');
    }


    
}