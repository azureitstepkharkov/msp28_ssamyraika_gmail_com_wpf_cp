using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace LaravelAdminMysql
{
    public class FTPLoader
    {
        public static string DownloadFile(string FileNameToDownload, string NamePath)
        {
            string FtpUrl = Resource.FtpUrl;
            string userName = Resource.FtpUserName;
            string password = Resource.FtpUserPassw;

            string ResponseDescription = "";
            string PureFileName = new FileInfo(FileNameToDownload).Name;
            string DownloadedFilePath = NamePath + "/" + PureFileName;
            //string downloadUrl = String.Format("{0}/{1}", FtpUrl, FileNameToDownload);
            string downloadUrl = String.Format("{0}/{1}", FtpUrl, PureFileName);
            FtpWebRequest req = (FtpWebRequest)FtpWebRequest.Create(downloadUrl);
            req.Method = WebRequestMethods.Ftp.DownloadFile;
            req.Credentials = new NetworkCredential(userName, password);
            req.UseBinary = true;
            req.Proxy = null;
            try
            {
                FtpWebResponse response = (FtpWebResponse)req.GetResponse();
                Stream stream = response.GetResponseStream();
                byte[] buffer = new byte[2048];
                FileStream fs = new FileStream(DownloadedFilePath, FileMode.Create);
                int ReadCount = stream.Read(buffer, 0, buffer.Length);
                while (ReadCount > 0)
                {
                    fs.Write(buffer, 0, ReadCount);
                    ReadCount = stream.Read(buffer, 0, buffer.Length);
                }
                ResponseDescription = response.StatusDescription;
                fs.Close();
                stream.Close();
            }
            catch (Exception e)
            {
                ResponseDescription += e.Message;
            }
            return ResponseDescription;
        }
        public static string UploadFile(string FileName, string UploadDirectory = "")
        {
            string FtpUrl = Resource.FtpUrlUploadFile;
            string userName = Resource.FtpUserName;
            string password = Resource.FtpUserPassw;

            string PureFileName = new FileInfo(FileName).Name;
            String uploadUrl = String.Format("{0}{1}/{2}", FtpUrl, UploadDirectory, PureFileName);
            FtpWebRequest req = (FtpWebRequest)FtpWebRequest.Create(uploadUrl);
            req.Proxy = null;
            req.Method = WebRequestMethods.Ftp.UploadFile;
            req.Credentials = new NetworkCredential(userName, password);
            req.UseBinary = true;
            req.UsePassive = true;
            byte[] data = File.ReadAllBytes(FileName);
            req.ContentLength = data.Length;
            Stream stream = req.GetRequestStream();
            stream.Write(data, 0, data.Length);
            stream.Close();
            FtpWebResponse res = (FtpWebResponse)req.GetResponse();
            return res.StatusDescription;
        }

        //Загрузить несколько файлов 
        public static string DownloadFiles(List<string> ListFiles, string NamePath)
        {
            string result = string.Empty;

            foreach (string curFile in ListFiles)
            {
                result += DownloadFile(curFile, NamePath);
            }

            return result;
        }
    }
}
