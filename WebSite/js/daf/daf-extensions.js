Unable to download file 797c1b79-bcc1-4cba-9e0b-79174fc7463d matched to Premium\Scripts\daf-extensions.js of appgenerator release 8.6.11.0.

Microsoft.WindowsAzure.StorageClient.StorageClientException: The specified blob does not exist. ---> System.Net.WebException: The remote server returned an error: (404) Not Found.
   at System.Net.HttpWebRequest.EndGetResponse(IAsyncResult asyncResult)
   at Microsoft.WindowsAzure.StorageClient.EventHelper.ProcessWebResponse(WebRequest req, IAsyncResult asyncResult, EventHandler`1 handler, Object sender)
   --- End of inner exception stack trace ---
   at Microsoft.WindowsAzure.StorageClient.Tasks.Task`1.get_Result()
   at Microsoft.WindowsAzure.StorageClient.Tasks.Task`1.ExecuteAndWait()
   at Microsoft.WindowsAzure.StorageClient.TaskImplHelper.ExecuteImplWithRetry(Func`1 impl, RetryPolicy policy)
   at Microsoft.WindowsAzure.StorageClient.CloudBlob.FetchAttributes(BlobRequestOptions options)
   at CodeOnTime.WebSite.Downloader.StreamFile(HttpContext context, String appName, String version, String fileName, String segment1, String segment2, String segment3, String segment4, String segment5) in C:\Users\Dennis Bykkov\Documents\Visual Studio 2010\Projects\Code OnTime LLC\codeontime.com\WebSite\Downloader.ashx.cs:line 534