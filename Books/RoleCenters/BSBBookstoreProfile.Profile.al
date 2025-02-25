namespace GuATraining.Books.RoleCenters;
using Microsoft.Sales.RoleCenters;

profile "BSB Bookstore Profile"
{
    Caption = 'Profile for Bookstore';
    RoleCenter = "Order Processor Role Center";
    Customizations = "BSB Customer Card", "BSB Customer List";
}