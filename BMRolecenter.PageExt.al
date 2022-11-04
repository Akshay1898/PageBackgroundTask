pageextension 50102 BMRolecenter extends "Business Manager Role Center"
{
    layout
    {
        addbefore(Emails)
        {
            part(CueBackgroundTask; CueBackgroundTask)
            {
                ApplicationArea = All;
            }
        }
    }

}