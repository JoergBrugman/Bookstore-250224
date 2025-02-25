namespace GuATraining.Books.Reports;

using GuATraining.Books.Book;

report 50100 "BSB Book List"
{
    Caption = 'Book List';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = '.\Books\Reports\BSBBookList.Report.rdlc';

    dataset
    {
        dataitem("BSB Book"; "BSB Book")
        {
            RequestFilterFields = "No.", Author;

            column(No_BSBBook; "No.") { IncludeCaption = true; }
            column(Description_BSBBook; Description) { IncludeCaption = true; }
            column(ISBN_BSBBook; ISBN) { IncludeCaption = true; }
            column(Author_BSBBook; Author) { IncludeCaption = true; }
        }
    }
}