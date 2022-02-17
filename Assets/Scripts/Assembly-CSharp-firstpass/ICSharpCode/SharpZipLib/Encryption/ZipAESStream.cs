using System.Security.Cryptography;
using System.IO;

namespace ICSharpCode.SharpZipLib.Encryption
{
	internal class ZipAESStream : CryptoStream
	{
		public ZipAESStream(Stream stream, ZipAESTransform transform, CryptoStreamMode mode) : base(default(Stream), default(ICryptoTransform), default(CryptoStreamMode))
		{
		}

	}
}
