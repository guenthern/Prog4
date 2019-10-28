using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Prog3.App_Code_folder;

namespace Prog3
{
    public partial class Shopping : System.Web.UI.Page
    {
        double tax = .055;
        double price;
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnCompute_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < SQLDataClass.tblProduct.Rows.Count; i++)
            {
                System.Data.DataRow row
                = SQLDataClass.tblProduct.Rows[i];
                string temp = row[0].ToString();
                if (txtOrderID.Text.Equals(temp))
                {
                    txtName.Text = row[1].ToString();
                    txtPrice.Text = string.Format("{0:C}", row[2]);
                    Double.TryParse(row[2].ToString(), out price);
                }
            }
            Session["Prog2_ProductPrice"] = txtPrice.Text;
            Session["Prog2_ProductQuantity"] = txtQuantity.Text;
            Session["Prog2_ProductID"] = txtOrderID.Text;
            Session["Prog2_Computed"] = true;
            txtPrice.ReadOnly = true;
            txtQuantity.ReadOnly = true;
            txtOrderID.ReadOnly = true;
            CalculateTotals();
        }

        protected void CalculateTotals()
        {
            
            
            double quantity;
            Double.TryParse(txtQuantity.Text, out quantity);
            double value = price * quantity;
            double orderTax = value * tax;
            double grandTotal = value + orderTax;
            txtSub.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:C2}", value);
            txtTax.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:C2}", orderTax);
            txtGrand.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:C2}", grandTotal);
        }
        protected void text_changed(object sender, EventArgs e)
        {
           
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtPrice.ReadOnly = false;
            txtQuantity.ReadOnly = false;
            txtOrderID.ReadOnly = false;
            Session["Prog2_ProductID"] = "";
            Session["Prog2_ProductPrice"] = "";
            Session["Prog2_ProductQuantity"] = "";
            Session["Prog2_Computed"] = false;
            txtOrderID.Text = (string)Session["Prog2_ProductID"];
            txtQuantity.Text = (string)Session["Prog2_ProductQuantity"];
            txtPrice.Text = (string)Session["Prog2_ProductPrice"];
            CalculateTotals();
            txtOrderID.Focus();
        }
    }
}