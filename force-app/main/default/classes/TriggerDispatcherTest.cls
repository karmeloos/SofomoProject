@isTest
public with sharing class TriggerDispatcherTest {
  @IsTest
  static void successTriggerDispatcherTest() {
    Invoice__c testInvoice = new Invoice__c();
    Test.startTest();
    Database.SaveResult insertResult = Database.insert(testInvoice, false);
    Database.SaveResult updateResult = Database.update(testInvoice, false);
    Database.DeleteResult deleteResult = Database.delete(testInvoice.Id, false);
    Database.UndeleteResult undeleteResult = Database.undelete(
      testInvoice.Id,
      false
    );
    Test.stopTest();
    System.assert(insertResult.isSuccess(), 'Test should not generate errors.');
    System.assert(updateResult.isSuccess(), 'Test should not generate errors.');
    System.assert(deleteResult.isSuccess(), 'Test should not generate errors.');
    System.assert(
      undeleteResult.isSuccess(),
      'Test should not generate errors.'
    );
  }
}
