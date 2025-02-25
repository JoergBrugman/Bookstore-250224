/// <summary>
/// Book Master Table
/// </summary>
namespace GuATraining.Books.Book;

table 50100 "BSB Book"
{
    Caption = 'Book';
    DataCaptionFields = "No.", Description;
    LookupPageId = "BSB Book List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';

            trigger OnValidate()
            begin
                if ("Search Description" = UpperCase(xRec.Description)) or ("Search Description" = '') then
                    "Search Description" := CopyStr(Description, 1, MaxStrLen("Search Description"));
            end;
        }
        //[x] Standard Search Description Impl. noch machen
        field(3; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Hardcover,Paperback;
            OptionCaption = ' ,Hardcover,Paperback';
        }
        field(7; Created; Date) //[ ] Created automatisch befüllen
        {
            Caption = 'Created';
            Editable = False;
        }
        field(8; "Last Date Modified"; Date) //[ ] Last Date Modified automatisch befüllen
        {
            Caption = 'Last Date Modified';
            Editable = False;
        }
        field(10; Author; Text[50])
        {
            Caption = 'Author';
        }
        field(11; "Author Provision %"; Decimal)
        {
            Caption = 'Author Provision %';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
        }
        field(15; ISBN; Code[20])
        {
            Caption = 'ISBN';
        }
        field(16; "No. of Pages"; Integer)
        {
            Caption = 'No. of Pages';
            MinValue = 0;
        }
        field(17; "Edition No."; Integer)
        {
            Caption = 'Edition No.';
            MinValue = 0;
        }
        field(18; "Date of Publishing"; Date)
        {
            Caption = 'Date of Publishing';
        }
    }

    keys
    {
        key(PK; "No.") { Clustered = true; }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, Author) { }
    }

    trigger OnDelete()
    begin
        Error(OnDeleteBookErr);
    end;
    //[x] Ein Buch darf nicht gelöscht
    //[x] TestBlocked() implementieren
    //[x] PermissionSet noch machen
    var
        OnDeleteBookErr: Label 'A Book cannot be deleted';


    trigger OnInsert()
    begin
        Created := Today;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    /// <summary>
    /// Tests on base of the Record Variable if Book is blocked. If true an Error comes up.
    /// </summary>
    procedure TestBlocked()
    begin
        TestBlocked(Rec);
    end;

    /// <summary>
    /// Function first read the Book-Record in base of parameter.If Book is blocked. If true an Error comes up.
    /// </summary>
    /// <param name="No">No. of the Book to test</param>
    procedure TestBlocked(No: Code[20])
    var
        BSBBook: Record "BSB Book";
    begin
        if No = '' then
            exit;
        BSBBook.Get(No);
        TestBlocked(BSBBook);
    end;

    procedure ShowCard()
    begin
        ShowCard(Rec);
    end;

    procedure ShowCard(No: Code[20])
    var
        BSBBook: Record "BSB Book";
    begin
        if No = '' then
            exit;
        BSBBook.Get(No);
        ShowCard(BSBBook);
    end;

    local procedure ShowCard(BSBBook: Record "BSB Book")
    begin
        Page.RunModal(Page::"BSB Book Card", BSBBook);

    end;

    local procedure TestBlocked(BSBBook: Record "BSB Book")
    begin
        BSBBook.TestField(Blocked, false);
    end;

}