using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;


using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using System.IO;

namespace upload_pdf
{
    public partial class upload_pdffile : System.Web.UI.Page
    {

     

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (fileInput.PostedFile != null && fileInput.PostedFile.ContentLength > 0)
            {
                // Check if the file is a PDF
                if (Path.GetExtension(fileInput.PostedFile.FileName).Equals(".pdf", StringComparison.OrdinalIgnoreCase))
                {
                    // Check if the file size is within the limit (5 MB)
                    int maxSize = 5 * 1024 * 1024; // 5 MB in bytes
                    if (fileInput.PostedFile.ContentLength <= maxSize)
                    {
                        // File is within the size limit, proceed with the upload

                        string uploadDirectory = Server.MapPath("~/Uploads/"); // Specify the directory where you want to save the uploaded file
                        string filename = Path.GetFileName(fileInput.PostedFile.FileName); // Get the original filename

                        // Generate the new filename using the format "000000 + date + originalfilename"
                        string currentDate = DateTime.Now.ToString("ddMMyyyy");
                        string newFilename = "000000" + "-" + currentDate + "-" + filename;

                        string filePath = Path.Combine(uploadDirectory, newFilename); // Combine the directory and new filename to create the full file path

                        fileInput.PostedFile.SaveAs(filePath); // Save the file to the specified path

                        // Optionally, you can perform additional processing or save the file information to a database

                        // Reset the file input control
                       // fileInput.Value = string.Empty;

                        // Display a success message
                        ScriptManager.RegisterStartupScript(this, GetType(), "UploadSuccess", "alert('อัพโหลดไฟล์สำเร็จ.');", true);
                    }
                    else
                    {
                        // File size exceeds the limit, display a notification
                        ScriptManager.RegisterStartupScript(this, GetType(), "FileSizeExceeded", "alert('ขนาดไฟล์ของท่านเกิน 5 MB.');", true);
                    }
                }
                else
                {
                    // Invalid file type, display an error message
                    ScriptManager.RegisterStartupScript(this, GetType(), "InvalidFileType", "alert('กรุณาอัพโหลดเฉพาะไฟล์ PDF.');", true);
                }
            }
            else
            {
                // No file selected, display an error message
                ScriptManager.RegisterStartupScript(this, GetType(), "NoFileSelected", "alert('กรุณาเลือกไฟล์เพื่ออัพโหลด.');", true);
            }
        }




    }
}