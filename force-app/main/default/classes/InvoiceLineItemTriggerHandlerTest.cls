@isTest
public with sharing class InvoiceLineItemTriggerHandlerTest {

    @IsTest
    static void successAllMethodExecutionTest(){
        Boolean isNotError = true;
        InvoiceLineItemTriggerHandler testHandler = new InvoiceLineItemTriggerHandler();
        List<SObject> emptyList = new List<SObject>();
        Map<Id,SObject> emptyMap = new Map<Id,SObject>();
        Test.startTest();
        try {
            testHandler.beforeInsert(emptyList);
            testHandler.beforeUpdate(emptyMap, emptyMap);
            testHandler.beforeDelete(emptyMap);
            testHandler.afterInsert(emptyMap);
            testHandler.afterUpdate(emptyMap, emptyMap);
            testHandler.afterDelete(emptyMap);
            testHandler.afterUndelete(emptyMap);
        } catch (Exception exp) {
            isNotError = false;
        }
        Test.stopTest();
        System.assert(isNotError, 'Error should not be thrown.');
    }
}