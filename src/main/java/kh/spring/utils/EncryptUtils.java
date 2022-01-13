package kh.spring.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class EncryptUtils {

	public static String getSHA512(String input) {

		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return toReturn;
	}

//	public static void main(String[] args) {
//
//		// 단방향 암호화 : 원래대로 돌릴수가 없다. MD5 -> SHA256 or SHA512
//		String result = getSHA512("");
//		System.out.println(result);
//		System.out.println(result.length());
//		// 양방향 암호화 : 복호화 가능
//		
//	}
}
