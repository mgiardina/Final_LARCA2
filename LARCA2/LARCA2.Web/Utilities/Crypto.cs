using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace Larca2.Utilities
{
    public class Crypto
    {
        public static string Encrypt(string plainText)
        {
            return Convert.ToBase64String(Encoding.ASCII.GetBytes(plainText));
        }

        public static string Decrypt(string cipherText)
        {
            return Encoding.ASCII.GetString(Convert.FromBase64String(cipherText)); ;
        } 
    }
}