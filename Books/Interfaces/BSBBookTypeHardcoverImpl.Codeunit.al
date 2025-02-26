namespace GuATraining.Books.Interfaces;

codeunit 50110 "BSB Book Type Hardcover Impl."
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