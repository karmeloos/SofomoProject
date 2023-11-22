@isTest
public with sharing class TriggerDispatcherTest {
  @IsTest
  static void successTriggerDispatcherTest() {
    Airport__c testAirport = new Airport__c(
      Name = 'Test Airport',
      IATA_Code__c = 'TST',
      Localization__Longitude__s = 0,
      Localization__Latitude__s = 0
    );
    insert testAirport;
    Flight__c testFlight = new Flight__c(
      Name = 'testName',
      Departure_Airport__c = testAirport.Id,
      Arrival_Airport__c = testAirport.Id
    );
    Test.startTest();
    Database.SaveResult insertResult = Database.insert(testFlight, false);
    Database.SaveResult updateResult = Database.update(testFlight, false);
    Database.DeleteResult deleteResult = Database.delete(testFlight.Id, false);
    Database.UndeleteResult undeleteResult = Database.undelete(
      testFlight.Id,
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
