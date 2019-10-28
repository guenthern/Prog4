using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Prog3.App_Code_folder;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;


namespace Prog3
{
    public partial class Updating : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SQLDataClass.getAllProducts();
            txtMessage.Text = "";
            if (!IsPostBack)
            {
                DisplayRow((int)Session["Prog3_Index"]);
            }
        }

        private void DisplayRow(int index)
        {
            System.Data.DataRow row
                = SQLDataClass.tblProduct.Rows[index];
            txtID.Text = row[0].ToString();
            txtName.Text = row[1].ToString();
            txtPrice.Text = string.Format("{0:C}", row[2]);
            txtDescription.Text = row[3].ToString();
            EnableDisableButtons();
        }

        protected void BtnNext_Click(object sender, EventArgs e)
        {
            int index = (int)Session["Prog3_Index"] + 1;
            if (index > SQLDataClass.tblProduct.Rows.Count - 1)
                index = SQLDataClass.tblProduct.Rows.Count - 1;
            Session["Prog3_Index"] = index;
            DisplayRow(index);
            EnableDisableButtons();
        }

        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            int index = (int)Session["Prog3_Index"] - 1;
            if (index < 0)
                index = 0;
            Session["Prog3_Index"] = index;
            DisplayRow(index);
            EnableDisableButtons();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UWPCS3870ConnectionString1"].ConnectionString);
                conn.Open();
                string insertQuery = "Update Product set ProductID = '" + txtID.Text + "', ProductName = '" + txtName.Text + "', UnitPrice = '" + txtPrice.Text + "', Description = '" + txtDescription.Text + "' where ProductID = '" + txtID.Text + "'";

                SqlCommand com = new SqlCommand(insertQuery, conn);
                com.ExecuteNonQuery();
                txtMessage.Text = "Data Updated";
            }
            catch (Exception ex)
            {
                txtMessage.Text = "Product Not Updated: " + ex.Message;
            }
        }

        private void EnableDisableButtons()
        {
            int curIndex = (int)Session["Prog3_Index"];
            btnFirst.Enabled = (curIndex > 0);
            btnLast.Enabled = (curIndex < SQLDataClass.tblProduct.Rows.Count);
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnNew.Text != "Save New")
                {
                    txtID.Text = "";
                    txtName.Text = "";
                    txtPrice.Text = "";
                    txtDescription.Text = "";
                    btnNew.Text = "Save New";
                    btnDelete.Text = "Cancel";
                    btnFirst.Enabled = false;
                    btnLast.Enabled = false;
                    btnNext.Enabled = false;
                    btnPrevious.Enabled = false;
                    btnUpdate.Enabled = false;
                }
                else
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UWPCS3870ConnectionString1"].ConnectionString);
                    conn.Open();
                    string insertQuery = "insert into Product(ProductID, ProductName, UnitPrice, Description) values (@keyID, @Pname, @PPrice, @PDesc)";

                    SqlCommand com = new SqlCommand(insertQuery, conn);
                    com.Parameters.AddWithValue("@keyID", txtID.Text);
                    com.Parameters.AddWithValue("@Pname", txtName.Text);
                    com.Parameters.AddWithValue("@PPrice", txtPrice.Text);
                    com.Parameters.AddWithValue("@PDesc", txtDescription.Text);

                    com.ExecuteNonQuery();
                    Response.Redirect("Updating.aspx");

                    conn.Close();
                    btnNew.Text = "New";
                    btnDelete.Text = "Delete";
                    btnFirst.Enabled = true;
                    btnLast.Enabled = true;
                    btnNext.Enabled = true;
                    btnPrevious.Enabled = true;
                    btnUpdate.Enabled = true;
                    txtMessage.Text = "Data Inserted";
                }
            }
            catch (Exception ex)
            {
                txtMessage.Text = "Product Not Added: " + ex.Message;
            }
           
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (btnDelete.Text != "Delete")
            {
                DisplayRow((int)Session["Prog3_Index"]);
                btnDelete.Text = "Delete";
                btnNew.Text = "New";
                btnFirst.Enabled = true;
                btnLast.Enabled = true;
                btnNext.Enabled = true;
                btnPrevious.Enabled = true;
                btnUpdate.Enabled = true;
                txtMessage.Text = "Canceled";
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UWPCS3870ConnectionString1"].ConnectionString);
                conn.Open();
                string insertQuery = "Delete from Product where ProductID = @keyID";

                SqlCommand com = new SqlCommand(insertQuery, conn);
                com.Parameters.AddWithValue("@keyID", txtID.Text);
                if ((int) Session["Prog3_Index"] != 0)
                {
                    Session["Prog3_Index"] = (int)Session["Prog3_Index"] - 1;
                }              
                com.ExecuteNonQuery();
                Response.Redirect("Updating.aspx");             
                conn.Close();
                txtMessage.Text = "Data Removed";
            }
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            int index = SQLDataClass.tblProduct.Rows.Count;
            if (index > SQLDataClass.tblProduct.Rows.Count - 1)
                index = SQLDataClass.tblProduct.Rows.Count - 1;
            Session["Prog3_Index"] = index;
            DisplayRow(index);
            EnableDisableButtons();
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            int index = 0;
            if (index > SQLDataClass.tblProduct.Rows.Count - 1)
                index = SQLDataClass.tblProduct.Rows.Count - 1;
            Session["Prog3_Index"] = index;
            DisplayRow(index);
            EnableDisableButtons();
        }
    }
    
    
    
}