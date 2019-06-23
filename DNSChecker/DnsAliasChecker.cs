using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using DnsClient;
using DnsClient.Protocol;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;

namespace DNSChecker
{
    public static class DnsAliasChecker
    {
        [FunctionName("DnsAliasChecker")]
        public static async Task<HttpResponseMessage> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", "post", Route = null)]HttpRequestMessage req, TraceWriter log)
        {
            log.Info("C# HTTP trigger function processed a request.");

            // parse query parameter
            string fqdn = req.GetQueryNameValuePairs()
                .FirstOrDefault(q => string.Compare(q.Key, "fqdn", true) == 0)
                .Value;

            string alias = req.GetQueryNameValuePairs()
                .FirstOrDefault(q => string.Compare(q.Key, "alias", true) == 0)
                .Value;

            if (fqdn == null)
            {
                // Get request body
                dynamic data = await req.Content.ReadAsAsync<object>();
                fqdn = data?.fqdn;
            }

            if (alias == null)
            {
                dynamic data = await req.Content.ReadAsAsync<object>();
                alias = data?.alias;
            }

            if (fqdn == null || alias == null)
            {
                return req.CreateResponse(HttpStatusCode.BadRequest, "Please pass a fqdn and an alias on the query string or in the request body");
            }

            var lookupClient = new LookupClient();
            var result = lookupClient.Query(fqdn, QueryType.CNAME);
            var foundEntry = false;
            foreach (var record in result.Answers)
            {
                var cnameRecord = record as CNameRecord;
                var cname = cnameRecord.CanonicalName.Value.ToString();
                // check if it has trailing .
                if (cname.EndsWith("."))
                {
                    cname = cname.Remove(cname.Length - 1);
                }
                System.Console.WriteLine("cname: " + cname);
                if (cname.Equals(alias))
                {
                    foundEntry = true;
                    break;
                }
            }

            if (foundEntry)
            {
                return req.CreateResponse(HttpStatusCode.OK, true);
            }
            return req.CreateResponse(HttpStatusCode.OK, false);


        }
    }
}
