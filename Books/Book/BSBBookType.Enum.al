namespace GuATraining.Books.Book;

enum 50100 "BSB Book Type"
{
    Extensible = true;

    value(0; " ") { Caption = 'None', Comment = 'de-DE=Kein'; }
    value(1; Hardcover) { Caption = 'Hardcover', Comment = 'de-DE=Gebundenes Buch'; }
    value(2; Paperback) { Caption = 'Paperback', Comment = 'de-DE=Taschenbuch'; }
}