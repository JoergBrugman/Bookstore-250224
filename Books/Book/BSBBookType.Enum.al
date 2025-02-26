namespace GuATraining.Books.Book;
using GuATraining.Books.Interfaces;

enum 50100 "BSB Book Type" implements "BSB Book Type Process"
{
    Extensible = true;
    // DefaultImplementation = "BSB Book Type Process" = "BSB Book Type None Impl.";
    UnknownValueImplementation = "BSB Book Type Process" = "BSB Book Type None Impl.";

    value(0; " ")
    {
        Caption = 'None', Comment = 'de-DE=Kein';
        Implementation = "BSB Book Type Process" = "BSB Book Type None Impl.";
    }
    value(1; Hardcover)
    {
        Caption = 'Hardcover', Comment = 'de-DE=Gebundenes Buch';
        Implementation = "BSB Book Type Process" = "BSB Book Type Hardcover Impl.";
    }
    value(2; Paperback)
    {
        Caption = 'Paperback', Comment = 'de-DE=Taschenbuch';
        Implementation = "BSB Book Type Process" = "BSB Book Type Paperback Impl.";
    }
}