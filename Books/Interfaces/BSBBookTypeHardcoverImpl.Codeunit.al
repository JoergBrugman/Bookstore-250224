namespace GuATraining.Books.Interfaces;

codeunit 50110 "BSB Book Type Hardcover Impl." implements "BSB Book Type Process"
{
    procedure DeployBook()
    begin
        Message('Inventory Pick');
    end;

    procedure DeliverBook()
    begin
        Message('UPS Premium');
    end;
}