page 50102 CueBackgroundTask
{
    PageType = CardPart;
    RefreshOnActivate = true;
    Caption = 'Cue Background Task';

    layout
    {
        area(Content)
        {
            cuegroup(GroupName)
            {
                field(TotalBlockedCustomer; TotalBlockedCustomer)
                {
                    ApplicationArea = All;
                    Caption = 'Blocked Customers';
                    trigger OnDrillDown()
                    var
                        Customer: Record Customer;
                        CustomerList: Page "Customer List";
                    begin
                        Customer.Reset();
                        Customer.SetRange(Blocked, Customer.Blocked::All);
                        CustomerList.SetTableView(Customer);
                        CustomerList.RunModal();
                    end;

                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.EnqueueBackgroundTask(TaskID, Codeunit::BackgroundTask);
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
        Evaluate(TotalBlockedCustomer, Results.Get('TotalBlockedCustomer'));
    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    begin

    end;

    var
        TotalBlockedCustomer: Integer;
        TaskID: Integer;
}