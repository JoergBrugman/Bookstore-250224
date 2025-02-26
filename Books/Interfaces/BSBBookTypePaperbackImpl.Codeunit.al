namespace GuATraining.Books.Interfaces;

codeunit 50112 "BSB Book Type Paperback Impl." implements "BSB Book Type Process"
{
    procedure DeployBook()
    begin
        Message('Print on Demand');
    end;

    procedure DeliverBook()
    begin
        Message('DPD 2 Days');
    end;
}