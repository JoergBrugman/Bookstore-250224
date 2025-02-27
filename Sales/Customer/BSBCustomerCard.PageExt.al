namespace GuATraining.Sales.Customer;

using Microsoft.Sales.Customer;
using GuATraining.Books.Book;
using Microsoft.Inventory.Item;
using GuATraining.Sales.Customer.BingMapsControl;

pageextension 50100 "BSB Customer Card" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group("BSB Bookstore")
            {
                Caption = 'Bookstore';

                field("BSB Favorite Book No."; Rec."BSB Favorite Book No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Favorite Bokk No. field.', Comment = '%';
                    Importance = Promoted;
                }
                field("BSB Favorite Book Description"; Rec."BSB Favorite Book Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Favorite Book Description field.', Comment = '%';
                }
            }
        }
        addafter(Control149)
        {
            part(BSBBookFactbox; "BSB Book Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("BSB Favorite Book No.");
            }

            part(BSBBingMapsCardPart; "BSB BingMapsCardPart")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }
}