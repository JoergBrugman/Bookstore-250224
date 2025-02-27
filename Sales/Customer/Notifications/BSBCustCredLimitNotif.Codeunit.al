namespace GuATraining.Sales.Customer.Notifications;

using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;
using System.Environment.Configuration;

codeunit 50102 "BSB Cust. Cred. Limit Notif."
{
    var
        Customer: Record Customer;
        MyNotifications: Record "My Notifications";
        CredLimitNotif: Notification;
        CredLimitNotifIDTxt: Label 'd6ac53cc-9004-4d52-bea7-7aba4808d806', Locked = true;
        CredLimitNotifMsg: Label '%1 %2 of %3 %4 %5 is larger than %6', Comment = 'de-DE=%1 %2 of %3 %4 %5 istgrößer als %6';
        CredLimitNotifTxt: Label 'Customer Balance exceeds Credit Limit.', Comment = 'de-DE=Der Saldo ist größer als das Kreditlimit.';
        CredLimitNotifDescriptionTxt: Label 'Balance of Customer is lager than Credit Linit', Comment = 'de-DE=Der Saldo des Debitors überschreitet sein Kreditlimit';

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnAfterGetCurrRecordEvent, '', false, false)]
    local procedure "Sales Order_OnAfterGetCurrRecordEvent"(var Rec: Record "Sales Header")
    begin
        if Rec."Bill-to Customer No." = '' then
            exit;

        Customer.SetAutoCalcFields("Balance (LCY)");
        Customer.Get(Rec."Bill-to Customer No.");
        if Customer."Credit Limit (LCY)" = 0 then
            exit;
        if (Customer."Balance (LCY)" > Customer."Credit Limit (LCY)") and
            MyNotifications.IsEnabledForRecord(CredLimitNotifIDTxt, Customer)
        then begin
            CredLimitNotif.Id := CredLimitNotifIDTxt;
            CredLimitNotif.Scope := CredLimitNotif.Scope::LocalScope;
            CredLimitNotif.Message :=
                StrSubstNo(CredLimitNotifMsg,
                    Customer.FieldCaption("Balance (LCY)"),
                    Customer."Balance (LCY)",
                    Customer.TableCaption,
                    Customer."No.",
                    Customer.Name,
                    Customer."Credit Limit (LCY)");
            CredLimitNotif.SetData('CustNo', Customer."No.");
            CredLimitNotif.AddAction('Edit Customer', Codeunit::"BSB Cust. Cred. Limit Notif.", 'OpenCustCard');
            CredLimitNotif.Send();
        end;

    end;

    procedure OpenCustCard(Notification: Notification)
    var
        Customer: Record Customer;
    begin
        Customer.Get(Notification.GetData('CustNo'));
        Page.Run(Page::"Customer Card", Customer);
    end;

    [EventSubscriber(ObjectType::Page, Page::"My Notifications", OnInitializingNotificationWithDefaultState, '', false, false)]
    local procedure "My Notifications_OnInitializingNotificationWithDefaultState"()
    begin
        MyNotifications.InsertDefaultWithTableNum(CredLimitNotifIDTxt, CredLimitNotifTxt, CredLimitNotifDescriptionTxt, Database::Customer);
    end;

}