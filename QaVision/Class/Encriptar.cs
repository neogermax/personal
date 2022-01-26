using System;
using System.Security.Cryptography;
using System.Text;
using System.IO;

public class Encriptar
{

	#region "ENCRIPTAR"
	/// <summary>
	/// MD5: recibe un string que nos permite convertirlo a MD5. Este algoritmo, en teoría no se puede desencriptar.
	/// </summary>
	/// <param name="word"></param>
	/// <returns></returns>
	public static string MD5_Certificado(string vp_Texto)
	{
		MD5 vl_MD5 = MD5CryptoServiceProvider.Create();
		ASCIIEncoding vl_Encoding = new ASCIIEncoding();
		byte[] vl_Stream = null;
		StringBuilder vl_SB = new StringBuilder();
		vl_Stream = vl_MD5.ComputeHash(vl_Encoding.GetBytes(vp_Texto));
		for (int i = 0; i < vl_Stream.Length; i++) vl_SB.AppendFormat("{0:x2}", vl_Stream[i]);
		return vl_SB.ToString();
	}

	/// <summary>
	/// token: nos generá un valor único encriptado en MD5, cada vez que llames al método, este va a generar un nuevo ID.
	/// </summary>
	/// <returns></returns>
	public static string Token_Certificado()
	{
		long vl_I = 1;
		foreach (byte vl_B in Guid.NewGuid().ToByteArray()) vl_I *= ((int)vl_B + 1);
		return MD5_Certificado(string.Format("{0:x}", vl_I - DateTime.Now.Ticks));
	}

	/// <summary>
	/// SHA1: recibe un string que nos permite convertirlo a SHA1.
	/// </summary>
	/// <param name="str"></param>
	/// <returns></returns>
	public string SHA1_Certificado(string vp_Texto)
	{
		SHA1 vl_SHA1 = SHA1Managed.Create();
		ASCIIEncoding vl_Encoding = new ASCIIEncoding();
		byte[] vl_Stream = null;
		StringBuilder vl_SB = new StringBuilder();
		vl_Stream = vl_SHA1.ComputeHash(vl_Encoding.GetBytes(vp_Texto));
		for (int i = 0; i < vl_Stream.Length; i++) vl_SB.AppendFormat("{0:x2}", vl_Stream[i]);
		return vl_SB.ToString();
	}

	/// <summary>
	/// SHA256: recibe un string que nos permite convertirlo a SHA256.
	/// </summary>
	/// <param name="str"></param>
	/// <returns></returns>
	public string SHA256_Certificado(string vp_Texto)
	{
		SHA256 vl_SHA256 = SHA256Managed.Create();
		ASCIIEncoding vl_Encoding = new ASCIIEncoding();
		byte[] vl_Stream = null;
		StringBuilder vl_SB = new StringBuilder();
		vl_Stream = vl_SHA256.ComputeHash(vl_Encoding.GetBytes(vp_Texto));
		for (int i = 0; i < vl_Stream.Length; i++) vl_SB.AppendFormat("{0:x2}", vl_Stream[i]);
		return vl_SB.ToString();
	}

	/// <summary>
	/// SHA384: recibe un string que nos permite convertirlo a SHA384.
	/// </summary>
	/// <param name="str"></param>
	/// <returns></returns>
	public string SHA384_Certificado(string vp_Texto)
	{
		SHA384 vl_SHA384 = SHA384Managed.Create();
		ASCIIEncoding vl_Encoding = new ASCIIEncoding();
		byte[] vl_Stream = null;
		StringBuilder vl_SB = new StringBuilder();
		vl_Stream = vl_SHA384.ComputeHash(vl_Encoding.GetBytes(vp_Texto));
		for (int i = 0; i < vl_Stream.Length; i++) vl_SB.AppendFormat("{0:x2}", vl_Stream[i]);
		return vl_SB.ToString();
	}

	/// <summary>
	/// SHA512: recibe un string que nos permite convertirlo a SHA512.
	/// </summary>
	/// <param name="str"></param>
	/// <returns></returns>
	public string SHA512_Certificado(string vp_Texto)
	{
		SHA512 vl_SHA512 = SHA512Managed.Create();
		ASCIIEncoding vl_Encoding = new ASCIIEncoding();
		byte[] vl_Stream = null;
		StringBuilder vl_SB = new StringBuilder();
		vl_Stream = vl_SHA512.ComputeHash(vl_Encoding.GetBytes(vp_Texto));
		for (int i = 0; i < vl_Stream.Length; i++) vl_SB.AppendFormat("{0:x2}", vl_Stream[i]);
		return vl_SB.ToString();
	}

	/// <summary>
	/// MD5: recibe un string que nos permite convertirlo a MD5.
	/// </summary>
	/// <param name="word"></param>
	/// <returns></returns>
	public string MD5_Encode(string vp_Texto)
	{
		try
		{
			string vl_Key = "GARRXD"; //llave para encriptar datos
			byte[] vl_KeyArray;
			byte[] vl_Arreglo_Cifrar = UTF8Encoding.UTF8.GetBytes(vp_Texto);

			//Se utilizan las clases de encriptación MD5
			MD5CryptoServiceProvider vl_Hash_MD5 = new MD5CryptoServiceProvider();
			vl_KeyArray = vl_Hash_MD5.ComputeHash(UTF8Encoding.UTF8.GetBytes(vl_Key));

			vl_Hash_MD5.Clear();

			//Algoritmo TripleDES
			TripleDESCryptoServiceProvider vl_TDes = new TripleDESCryptoServiceProvider();

			vl_TDes.Key = vl_KeyArray;
			vl_TDes.Mode = CipherMode.ECB;
			vl_TDes.Padding = PaddingMode.PKCS7;

			ICryptoTransform cTransform = vl_TDes.CreateEncryptor();
			byte[] vl_ArrayResultado = cTransform.TransformFinalBlock(vl_Arreglo_Cifrar, 0, vl_Arreglo_Cifrar.Length);

			vl_TDes.Clear();

			//se regresa el resultado en forma de una cadena
			vp_Texto = Convert.ToBase64String(vl_ArrayResultado, 0, vl_ArrayResultado.Length);
		}
		catch (Exception)
		{

		}
		return vp_Texto;
	}

	/// <summary>
	/// Base64Encode: este permite encriptar a Base64 cualquier cadena ingresada.
	/// </summary>
	/// <param name="word"></param>
	/// <returns></returns>
	public string Base64_Encode(string vp_Texto)
	{
		byte[] vl_Byt = System.Text.Encoding.UTF8.GetBytes(vp_Texto);
		return Convert.ToBase64String(vl_Byt);
	}

	/// <summary>
	/// SHA256: recibe un string que nos permite convertirlo a SHA256.
	/// </summary>
	/// <param name="plainText">String to be encrypted</param>
	/// <param name="password">Password</param>
	public string SHA256_Encode(string vp_PlainText, string vp_Password)
	{

		if (vp_PlainText == null) { return null; }
		if (vp_Password == null) { vp_Password = String.Empty; }

		// Get the bytes of the string
		var vl_TextoEncriptado = Encoding.UTF8.GetBytes(vp_PlainText);
		var vl_PasswordEncriptado = Encoding.UTF8.GetBytes(vp_Password);

		// Hash the password with SHA256
		vl_PasswordEncriptado = SHA256Managed.Create().ComputeHash(vl_PasswordEncriptado);
		var vl_BytesEcripado = Encriptar.SHA256Encrypt(vl_TextoEncriptado, vl_PasswordEncriptado);

		return Convert.ToBase64String(vl_BytesEcripado);
	}
	#endregion

	#region "DESENCRIPTAR"
	/// <summary>
	/// MD5: recibe un string que nos permite convertirlo a MD5
	/// </summary>
	/// <param name="textoEncriptado"></param>
	/// <returns></returns>
	public string MD5_Decode(string vp_Texto)
	{
		try
		{
			string vl_Key = "GARRXD";
			byte[] vl_KeyArray;
			byte[] vl_Array_Descifrar = Convert.FromBase64String(vp_Texto);

			//algoritmo MD5
			MD5CryptoServiceProvider vl_Hash_MD5 = new MD5CryptoServiceProvider();
			vl_KeyArray = vl_Hash_MD5.ComputeHash(UTF8Encoding.UTF8.GetBytes(vl_Key));
			vl_Hash_MD5.Clear();

			TripleDESCryptoServiceProvider vl_TDes = new TripleDESCryptoServiceProvider();

			vl_TDes.Key = vl_KeyArray;
			vl_TDes.Mode = CipherMode.ECB;
			vl_TDes.Padding = PaddingMode.PKCS7;

			ICryptoTransform cTransform = vl_TDes.CreateDecryptor();
			byte[] vl_ResultArray = cTransform.TransformFinalBlock(vl_Array_Descifrar, 0, vl_Array_Descifrar.Length);

			vl_TDes.Clear();
			vp_Texto = UTF8Encoding.UTF8.GetString(vl_ResultArray);

		}
		catch (Exception)
		{

		}
		return vp_Texto;
	}

	/// <summary>
	/// Base64Encode: este permite desencriptar a Base64 cualquier cadena ingresada
	/// </summary>
	/// <param name="word"></param>
	/// <returns></returns>
	public string Base64_Decode(string vp_Texto)
	{
		byte[] vl_B = Convert.FromBase64String(vp_Texto);
		return System.Text.Encoding.UTF8.GetString(vl_B);
	}

	/// <summary>
	/// Decrypt a string.
	/// </summary>
	/// <param name="vp_TextoEncriptado">String to be decrypted</param>
	/// <param name="vl_Password">Password used during encryption</param>
	/// <exception cref="FormatException"></exception>
	public string SHA256_Decode(string vp_TextoEncriptado, string vl_Password)
	{
		if (vp_TextoEncriptado == null) { return null; }
		if (vl_Password == null) { vl_Password = String.Empty; }

		// Get the bytes of the string
		var vl_ByteDesencriptado = Convert.FromBase64String(vp_TextoEncriptado);
		var vl_PasswordByte = Encoding.UTF8.GetBytes(vl_Password);

		vl_PasswordByte = SHA256Managed.Create().ComputeHash(vl_PasswordByte);
		var bytesDecrypted = Encriptar.SHA256Decrypt(vl_ByteDesencriptado, vl_PasswordByte);

		return Encoding.UTF8.GetString(bytesDecrypted);
	}

	#endregion

	#region "PRIVATE"
	/// <summary>
	/// Funcion privada para Encriptar SHA256
	/// </summary>
	/// <param name="bytesToBeEncrypted"></param>
	/// <param name="passwordBytes"></param>
	/// <returns></returns>
	private static byte[] SHA256Encrypt(byte[] bytesToBeEncrypted, byte[] passwordBytes)
	{
		byte[] encryptedBytes = null;

		// Set your salt here, change it to meet your flavor:
		// The salt bytes must be at least 8 bytes.
		var saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };

		using (MemoryStream ms = new MemoryStream())
		{
			using (RijndaelManaged AES = new RijndaelManaged())
			{
				var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);

				AES.KeySize = 256;
				AES.BlockSize = 128;
				AES.Key = key.GetBytes(AES.KeySize / 8);
				AES.IV = key.GetBytes(AES.BlockSize / 8);

				AES.Mode = CipherMode.CBC;

				using (var cs = new CryptoStream(ms, AES.CreateEncryptor(), CryptoStreamMode.Write))
				{
					cs.Write(bytesToBeEncrypted, 0, bytesToBeEncrypted.Length);
					cs.Close();
				}

				encryptedBytes = ms.ToArray();
			}
		}

		return encryptedBytes;
	}

	/// <summary>
	/// Funcion privada para Desencriptar SHA256
	/// </summary>
	/// <param name="bytesToBeEncrypted"></param>
	/// <param name="passwordBytes"></param>
	/// <returns></returns>
	private static byte[] SHA256Decrypt(byte[] bytesToBeDecrypted, byte[] passwordBytes)
	{
		byte[] decryptedBytes = null;

		// Set your salt here, change it to meet your flavor:
		// The salt bytes must be at least 8 bytes.
		var saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };

		using (MemoryStream ms = new MemoryStream())
		{
			using (RijndaelManaged AES = new RijndaelManaged())
			{
				var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);

				AES.KeySize = 256;
				AES.BlockSize = 128;
				AES.Key = key.GetBytes(AES.KeySize / 8);
				AES.IV = key.GetBytes(AES.BlockSize / 8);
				AES.Mode = CipherMode.CBC;

				using (var cs = new CryptoStream(ms, AES.CreateDecryptor(), CryptoStreamMode.Write))
				{
					cs.Write(bytesToBeDecrypted, 0, bytesToBeDecrypted.Length);
					cs.Close();
				}

				decryptedBytes = ms.ToArray();
			}
		}

		return decryptedBytes;
	}
	#endregion
}
