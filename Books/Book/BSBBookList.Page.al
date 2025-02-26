namespace GuATraining.Books.Book;

using GuATraining.Books.Tool;
using Microsoft.Sales.Customer;

page 50101 "BSB Book List"
{
    Caption = 'Books';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "BSB Book";
    PageType = List;
    Editable = false;
    CardPageId = "BSB Book Card";

    layout
    {
        area(Content)
        {
            repeater(Books)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(ISBN; Rec.ISBN)
                {
                    ToolTip = 'Specifies the value of the ISBN field.', Comment = '%';
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Specifies the value of the Author field.', Comment = '%';
                }
                field("No. of Pages"; Rec."No. of Pages")
                {
                    ToolTip = 'Specifies the value of the No. of Pages field.', Comment = '%';
                    Visible = false;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = RecordLinks; }
            systempart(Notes; Notes) { ApplicationArea = Notes; }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CreateBooks)
            {
                Caption = 'Create Books';
                Image = CreateDocuments;
                ToolTip = 'Create 100 Books for Testing';
                RunObject = codeunit "BSB Create Books";
            }

            action(ProcWithComplexReturnValue)
            {
                Caption = 'Demo Proc. w. Cpml. Return';
                Image = Process;
                ToolTip = 'Demo Proc. w. Cpml. Return';

                trigger OnAction()
                begin
                    Message('%1', GetCustomer('10000'));
                end;
            }
        }
    }

    procedure GetCustomer(No: Code[20]) Customer: Record Customer
    begin
        Customer.Get(No);
    end;
}