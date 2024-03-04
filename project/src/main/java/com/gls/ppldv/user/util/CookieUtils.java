package com.gls.ppldv.user.util;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class CookieUtils {
	private static final String SECRET_KEY = "MySecretKey12345"; // 암호화 키

	public static String encrypt(String value) {
		try {
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
			IvParameterSpec ivParameterSpec = new IvParameterSpec(SECRET_KEY.substring(0, 16).getBytes());
			cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivParameterSpec);
			return Base64.getEncoder().encodeToString(cipher.doFinal(value.getBytes()));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String decrypt(String encryptedValue) {
		try {
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
			SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
			IvParameterSpec ivParameterSpec = new IvParameterSpec(SECRET_KEY.substring(0, 16).getBytes());
			cipher.init(Cipher.DECRYPT_MODE, secretKey, ivParameterSpec);
			return new String(cipher.doFinal(Base64.getDecoder().decode(encryptedValue)));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
