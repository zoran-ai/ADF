package org.adf.framework.util;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.Cipher;

import org.apache.commons.codec.binary.Base64;

public class RSAUtil {

	/**
	 * String to hold name of the encryption algorithm.
	 */
	public static final String ALGORITHM = "RSA";
	
	/**
	 * Size of the key.
	 */
	public static final int KEY_SIZE = 1024;

	/**
	 * Generate key which contains a pair of private and public key using 1024 bytes.
	 */
	public static void generateKey() throws Exception {
		KeyPairGenerator keyGen = KeyPairGenerator.getInstance(ALGORITHM);
		keyGen.initialize(KEY_SIZE, new SecureRandom());
		
		KeyPair keyPair = keyGen.generateKeyPair();
		
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();
		
		String publicKeyStr = new Base64().encodeToString((publicKey.getEncoded()));
		String privateKeyStr = new Base64().encodeToString((privateKey.getEncoded()));
		
		System.out.println("PublicKey:");
		System.out.println(publicKeyStr);
		System.out.println("--------------------------------------------------");
		System.out.println("PrivateKey:");
		System.out.println(privateKeyStr);
		System.out.println("--------------------------------------------------");
	}

	/**
	 * 使用公钥进行加密
	 * @param text 原文
	 * @param key  公钥
	 */
	public static String encrypt(String text, String key) throws Exception {
		Cipher cipher = Cipher.getInstance(ALGORITHM);
		cipher.init(Cipher.ENCRYPT_MODE, getPublicKeyObject(key));
		return new Base64().encodeToString(cipher.doFinal(text.getBytes()));
	}

	/**
	 * 使用私钥进行解密
	 * @param text 原文
	 * @param key  私钥
	 */
	public static String decrypt(String text, String key) throws Exception {
		Cipher cipher = Cipher.getInstance(ALGORITHM);
		cipher.init(Cipher.DECRYPT_MODE, getPrivateKeyObject(key));
		return new String(cipher.doFinal(new Base64().decode(text)));
	}

	/**
	 * 实例化公钥
	 */
	private static PublicKey getPublicKeyObject(String key) throws Exception {
		byte[] keyByteArr = new Base64().decode(key);
		X509EncodedKeySpec bobPubKeySpec = new X509EncodedKeySpec(keyByteArr);
		KeyFactory keyFactory = KeyFactory.getInstance(ALGORITHM);
		return keyFactory.generatePublic(bobPubKeySpec);
	}
	
	/**
	 * 实例化私钥
	 */
	private static PrivateKey getPrivateKeyObject(String key) throws Exception {
		byte[] keyByteArr = new Base64().decode(key);
		PKCS8EncodedKeySpec priPKCS8 = new PKCS8EncodedKeySpec(keyByteArr);
		KeyFactory keyf = KeyFactory.getInstance(ALGORITHM);
		return keyf.generatePrivate(priPKCS8);
	} 
	
	public static void main(String[] args) throws Exception {
		generateKey();
		
		String text = "000000";
		String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCl+96aijYTpUl6UEYvcNdThxrcEYSsI6/Tfd2SXkAlXIK+nvxD84s1CTGT2vZo3ok1rvXobLAbXfSrOyINe9Q2rkHWJBJ9NH0/2ekq7byZBtYDLHKi0aQ3JgOEJXasXcXa936Mfg4AvetfzUoUPB3HPnO9Z6kCAcGtZauUmBOZjQIDAQAB";
		String privateKey = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKX73pqKNhOlSXpQRi9w11OHGtwRhKwjr9N93ZJeQCVcgr6e/EPzizUJMZPa9mjeiTWu9ehssBtd9Ks7Ig171DauQdYkEn00fT/Z6SrtvJkG1gMscqLRpDcmA4Qldqxdxdr3fox+DgC961/NShQ8Hcc+c71nqQIBwa1lq5SYE5mNAgMBAAECgYBKdJ84R4NWcLBzM4soQL/2cgZ0bU9MQH3gqvc3bxvrJoJnq72RZbAuTD93CaO7CwgVkrQwXIDq5cyY+t+dmMxqOURPG5GyFgRHWHVPCtHdSQfMF8eYZe6HQiNbGHM3ng/NImRYnbPBR9NC0q8lK9NgPqBh+YeOTtoOLG8ZjjXwwQJBAOC+K4/cebkilPsdBZ8hT9wFNCxyo2PCkBjvnW2BDGkafMR71VsxUbA1CgJubvwDYXc6Ueu43rvAmysmFmQR0+UCQQC9EZ9Cb2cfRZUBsZcnwruDjxZx2iIttlh7JHh+U6L5mm3WWALKoOuhbmsO2dXioDkAU45nft1TntXOxijD+SSJAkEAtUGq8IPoyB/T+BMYDZdYSSMJSS/MBxFMFlBqr358++eY6P7WvI2yTGL6h6t5Z1dyrC4lE/At808L1mkJdfvK4QJAUeuMwdBbMiWIBo/YGpY5gStCYlpNbNkRRWnr+3BpsRTEepbvvrQy5GNfZ7PjBKq/h/CsRxOk+lJb+ZfKmf8dYQJAPGHWxd8gEc8tyKl9NDyc7j3nn5f8UqitQ1JWgNnKvCq7yumVZ3V8aZZuKse0IS57grtCT/h+GVpM2GrL5sj0Zg==";
	
		String encryptText = encrypt(text, publicKey);
		String decryptText = decrypt(encryptText, privateKey);
		
		System.out.println("原文：" + text);
		System.out.println("加密：" + encryptText);
		System.out.println("解密：" + decryptText);
	}
	
}