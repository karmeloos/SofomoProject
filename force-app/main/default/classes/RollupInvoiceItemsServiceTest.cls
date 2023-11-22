@isTest
public with sharing class RollupInvoiceItemsServiceTest {
  @TestSetup
  static void setup() {
    Invoice__c testInvoice = new Invoice__c();
    insert testInvoice;

    insert new List<Invoice_Line_Item__c>{
      new Invoice_Line_Item__c(Invoice__c = testInvoice.Id),
      new Invoice_Line_Item__c()
    };
  }

  @IsTest
  static void nullTest() {
    Boolean isNotError = true;
    Test.startTest();
    try {
      new RollupInvoiceItemsService().updateInvoiceAmountField(null);
    } catch (Exception ex) {
      isNotError = false;
    }
    Test.stopTest();
    System.assert(isNotError, 'Error should not be thrown.');
  }

  @IsTest
  static void noInvoiceToUpdateTest() {
    List<Invoice_Line_Item__c> testList = [
      SELECT Id, Invoice__c
      FROM Invoice_Line_Item__c
      WHERE Invoice__c = NULL
    ];
    Boolean isNotError = true;
    Test.startTest();
    try {
      new RollupInvoiceItemsService().updateInvoiceAmountField(testList);
    } catch (Exception ex) {
      isNotError = false;
    }
    Test.stopTest();
    System.assert(isNotError, 'Error should not be thrown.');
  }

  @IsTest
  static void successUpdateInvoiceAmountFieldTest() {
    Invoice__c testInvoice = [
      SELECT Id, Amount_of_line_items__c
      FROM Invoice__c
      LIMIT 1
    ];
    Invoice_Line_Item__c testInvoiceItem = [
      SELECT ID
      FROM Invoice_Line_Item__c
      WHERE Invoice__c = NULL
      LIMIT 1
    ];
    testInvoiceItem.Invoice__c = testInvoice.Id;
    update testInvoiceItem;
    Test.startTest();
    new RollupInvoiceItemsService()
      .updateInvoiceAmountField(
        new List<Invoice_Line_Item__c>{ testInvoiceItem }
      );
    Test.stopTest();
    Invoice__c newTestInvoice = [
      SELECT Id, Amount_of_line_items__c
      FROM Invoice__c
      WHERE ID = :testInvoice.Id
    ];
    System.assertEquals(
      testInvoice.Amount_of_line_items__c + 1,
      newTestInvoice.Amount_of_line_items__c,
      'Value of Amount_of_line_items__c field should be incremented by one'
    );
  }
}
