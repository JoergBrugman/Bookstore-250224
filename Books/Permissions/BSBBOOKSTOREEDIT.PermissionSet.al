namespace GuATraining.Books.Permissions;

using GuATraining.Books.Book;
using GuATraining.UpdateInstall;
using GuATraining.Books.Tool;

permissionset 50100 "BSB BOOKSTORE, EDIT"
{
    Caption = 'Edit and Create Bokks etc.';
    Assignable = true;
    Permissions = tabledata "BSB Book" = RIMD,
        table "BSB Book" = X,
        tabledata "BSB Internal Log" = RIMD;
}