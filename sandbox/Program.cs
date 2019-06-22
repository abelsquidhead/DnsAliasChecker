using DnsClient;
using DnsClient.Protocol;
using System;
using System.Net;

namespace sandbox
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            var fqdn = "www.abelurlist.club";
            var alias = "abelurlistfd4.azurefd.net";
            
            var lookupClient = new LookupClient();
            var result = lookupClient.Query(fqdn, QueryType.CNAME);
            var foundEntry = false;
            foreach (var record in result.Answers)
            {
                var cnameRecord = record as CNameRecord;
                var cname = cnameRecord.CanonicalName.Value.ToString();
                // check if it has trailing .
                if (cname.EndsWith('.'))
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
                System.Console.WriteLine("yay!!!");
            }

            

        }
    }
}
