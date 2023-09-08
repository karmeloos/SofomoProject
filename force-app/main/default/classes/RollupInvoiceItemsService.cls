public with sharing class RollupInvoiceItemsService {

    public void updateInvoiceAmountField(List<Invoice_Line_Item__c> invoiceItemList) {
        System.debug(invoiceItemList[0].Invoice__c);
        Set<Id> invoiceIds = new Set<Id>();
        for (Invoice_Line_Item__c loopInvoiceItem : invoiceItemList) {
            if(loopInvoiceItem.Invoice__c == null) {
                continue;
            }
            invoiceIds.add(loopInvoiceItem.Invoice__c);
        }
        List<Invoice__c> invoiceList = [SELECT Id, Amount_of_line_items__c, (SELECT ID FROM Invoice_Line_Items__r) FROM Invoice__c WHERE Id IN :invoiceIds];
        List<Invoice__c> invoicesToUpdate = new List<Invoice__c>();
        for(Invoice__c loopInvoice: invoiceList) {
            if(loopInvoice.Amount_of_line_items__c == loopInvoice.Invoice_Line_Items__r.size()) {
                continue;
            }
            loopInvoice.Amount_of_line_items__c = loopInvoice.Invoice_Line_Items__r.size();
            invoicesToUpdate.add(loopInvoice);
        }
        update invoicesToUpdate;
    }
}