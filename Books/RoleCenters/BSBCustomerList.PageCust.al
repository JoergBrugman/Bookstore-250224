namespace GuATraining.Books.RoleCenters;

using Microsoft.Sales.Customer;

pagecustomization "BSB Customer List" customizes "Customer List"
{
    layout
    {
        modify("Location Code") { Visible = false; }
    }
}