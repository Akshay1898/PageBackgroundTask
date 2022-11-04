codeunit 50102 BackgroundTask
{
    trigger OnRun()
    var
        Customer: Record Customer;
        CustomerCountDictionary: Dictionary of [Text, Text];
    begin
        Customer.Reset();
        Customer.SetRange(Blocked, Customer.Blocked::All);
        CustomerCountDictionary.Add('TotalBlockedCustomer', Format(Customer.Count));
        Page.SetBackgroundTaskResult(CustomerCountDictionary);
    end;

}