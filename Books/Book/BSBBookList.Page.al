namespace GuATraining.Books.Book;

using GuATraining.Books.Tool;
using GuATraining.Books.Interfaces;
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
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
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
        area(Promoted)
        {
            actionref(WithProcedure_Promoted; WithProcedure) { }
        }
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

            action(WithProcedure)
            {
                Caption = 'Process with Procedure';
                Image = Process;
                ToolTip = 'Process with Procedure';

                trigger OnAction()
                var
                    BSBBookTypeNoneImpl: Codeunit "BSB Book Type None Impl.";
                    BSBBookTypeHardcoverImpl: Codeunit "BSB Book Type Hardcover Impl.";
                    BSBBookTypePaperbackImpl: Codeunit "BSB Book Type Paperback Impl.";
                    IsHandled: Boolean;
                begin

                    OnBeforeStartBookProcess(Rec, IsHandled); // Keine Verpflichtung, NUR ein Angebot!!!!
                    case Rec.Type of
                        "BSB Book Type"::" ":
                            begin
                                BSBBookTypeNoneImpl.DeployBook();
                                BSBBookTypeNoneImpl.DeliverBook();
                            end;
                        "BSB Book Type"::Hardcover:
                            begin
                                BSBBookTypeHardcoverImpl.DeployBook();
                                BSBBookTypeHardcoverImpl.DeliverBook();
                            end;
                        "BSB Book Type"::Paperback:
                            begin
                                BSBBookTypePaperbackImpl.DeployBook();
                                BSBBookTypePaperbackImpl.DeliverBook();
                            end;
                    end;
                end;
            }
        }
    }

    procedure GetCustomer(No: Code[20]) Customer: Record Customer
    begin
        Customer.Get(No);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeStartBookProcess(Rec: Record "BSB Book"; var IsHandled: Boolean)
    begin
    end;
}