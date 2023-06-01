<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload_pdffile.aspx.cs" Inherits="upload_pdf.upload_pdffile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>File Upload</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .file-upload {
            text-align: center;
            margin: 20px 0;
        }

        .file-upload input[type="file"] {
            display: none;
        }

        .file-upload label {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4caf50;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .file-upload label:hover {
            background-color: #45a049;
        }

        .custom-button {
            display: block;
            margin: 0 auto;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .custom-button:hover {
            background-color: #2980b9;
        }

        .file-info {
            margin-top: 20px;
            text-align: center;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .file-info span {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="fileUploadForm" runat="server">
        <div class="container">
            <h2>File Upload</h2>
            <div class="file-upload">
                <input type="file" id="fileInput" runat="server" onchange="displayFileInfo(this)" />
                <label for="fileInput">Select PDF File</label>
            </div>
            <asp:Button ID="uploadButton" runat="server" Text="Upload" CssClass="custom-button" OnClick="UploadButton_Click" />
            <div class="file-info" id="fileInfo" style="display: none;"></div>
        </div>
    </form>

    <script>
        function displayFileInfo(input) {
            if (input.files.length > 0) {
                var fileInfo = "Selected file: <span>" + input.files[0].name + "</span> (" + (input.files[0].size / 1024).toFixed(2) + " KB)";
                document.getElementById("fileInfo").innerHTML = fileInfo;
                document.getElementById("fileInfo").style.display = "block";
            }
            else {
                document.getElementById("fileInfo").innerHTML = "";
                document.getElementById("fileInfo").style.display = "none";
            }
        }
    </script>
</body>
</html>
