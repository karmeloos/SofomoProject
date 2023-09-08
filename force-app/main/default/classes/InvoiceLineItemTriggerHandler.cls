public with sharing class InvoiceLineItemTriggerHandler implements ITriggerHandler {
    public void beforeInsert(List<SObject> newItems) {

    }
    public void beforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {

    }
    public void beforeDelete(Map<Id, SObject> oldItems) {

    }
    public void afterInsert(Map<Id, SObject> newItems) {
        new RollupInvoiceItemsService().updateInvoiceAmountField(newItems.values());
    }
    public void afterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        new RollupInvoiceItemsService().updateInvoiceAmountField(newItems.values());
    }
    public void afterDelete(Map<Id, SObject> oldItems) {
        new RollupInvoiceItemsService().updateInvoiceAmountField(oldItems.values());
    }
    public void afterUndelete(Map<Id, SObject> oldItems) {
        new RollupInvoiceItemsService().updateInvoiceAmountField(oldItems.values());
    }
}