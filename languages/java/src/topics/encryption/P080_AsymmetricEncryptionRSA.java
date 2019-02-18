package concepts;


import java.math.BigInteger;
import java.security.Key;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Security;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class P080_AsymmetricEncryptionRSA {
    private final int MAX_INPUT_BYTES_LEN = 53;
    
    private static char[] HexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b',
            'c', 'd', 'e', 'f'};

    public synchronized String encrypt(Key pubKey, String str) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA/NONE/PKCS1Padding", "BC");
        
        // Number of bytes for the string may be more than MAX_INPUT_BYTES_LEN.
        // Encrypt MAX_INPUT_BYTES_LEN bytes at a time.
        byte[] bytes = str.getBytes("UTF-8");
        String encryptedStr = "";
        while (bytes.length > 0) {
            byte item[];
            if (bytes.length > MAX_INPUT_BYTES_LEN) {
                item = new byte[MAX_INPUT_BYTES_LEN];
                System.arraycopy(bytes, 0, item, 0, MAX_INPUT_BYTES_LEN);
                int newLength = bytes.length - MAX_INPUT_BYTES_LEN;
                byte[] _bytes = new byte[newLength];
                System.arraycopy(bytes, MAX_INPUT_BYTES_LEN, _bytes, 0, newLength);
                bytes = _bytes;
            }
            else {
                item = bytes;
                bytes = new byte[0];
            }
            try {
                cipher.init(Cipher.ENCRYPT_MODE, pubKey);
                String encryptedItem = toHex(cipher.doFinal(item));
                encryptedStr += encryptedItem;
            }
            catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return encryptedStr;
    }
    
    public synchronized String decrypt(Key privKey, String str) throws Exception {
        Cipher decipher = Cipher.getInstance("RSA/NONE/PKCS1Padding", "BC");

        // str may be longer than 128 characters.
        // Decrypt 128 characters at a time.
        String decryptedStr = "";
        while (str.length() > 0) {
            String item;
            if (str.length() > 128) {
                item = str.substring(0, 128);
                str = str.substring(128);
            }
            else {
                item = str;
                str = "";
            }
            try {
                decipher.init(Cipher.DECRYPT_MODE, privKey);
                byte[] decryptedBytes = decipher.doFinal(fromHex(item));
                decryptedStr += new String(decryptedBytes, "UTF-8");
            }
            catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return decryptedStr;
    }

    public static String toHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < bytes.length; ++i) {
            int b = (int) (bytes[i] & 0xff);
            sb.append(HexChars[b / 16]).append(HexChars[b % 16]);
        }
        return sb.toString();
    }
    
    public static byte[] fromHex(String str) {
        // Convert the string to lower case
        str = str.toLowerCase();

        byte[] out = new byte[str.length() / 2];

        for (int i = 0; i < str.length(); i += 2) {
            char c1 = str.charAt(i);
            char c2 = str.charAt(i + 1);
            int b =
                    16 * ((c1 >= 'a') ? (c1 - 'a' + 10) : (c1 - '0'))
                            + ((c2 >= 'a') ? (c2 - 'a' + 10) : (c2 - '0'));
            out[i / 2] = (byte) b;
        }

        return out;
    }

    public static void main(String args[]) {
        /*
         * Modulus and exponent used in GST datalytics
         * @see https://apidemo.perfios.com/KYCServer/api/v1/gst/demo/datalytics
         * String modulusStr = "ac7288f010bb3ce4bea63291b5158e28a33e8975742ece594601d0aea4bf1bb0ab11a784ba798c043bd705f62f774aca956dee69331b9b1f8af99377c944bbbb";
         * String publicExponentStr = "10001";
         */

        String modulusStr = "ac7288f010bb3ce4bea63291b5158e28a33e8975742ece594601d0aea4bf1bb0ab11a784ba798c043bd705f62f774aca956dee69331b9b1f8af99377c944bbbb";
        String publicExponentStr = "10001";
        P080_AsymmetricEncryptionRSA p080_AsymmetricEncryptionRSA = new P080_AsymmetricEncryptionRSA();

        Security.addProvider(new BouncyCastleProvider());

        try {
            BigInteger modulus = new BigInteger(modulusStr, 16);
            BigInteger pubExponent = new BigInteger(publicExponentStr);
            
            RSAPublicKeySpec publicSpec = new RSAPublicKeySpec(modulus, pubExponent);
            
            // Create a key factory
            KeyFactory factory = KeyFactory.getInstance("RSA");
                     
            // Create the RSA public keys
            PublicKey publicKey = factory.generatePublic(publicSpec);
            

            String input = "29ABCDE1234F1ZW"; // GSTN
            String enc = p080_AsymmetricEncryptionRSA.encrypt(publicKey, input);

            System.out.println("GST Number: " + input);
            System.out.println("GST Number (encrypted): " + enc);
            
            //System.out.println("User: " + p080_AsymmetricEncryptionRSA.encrypt(publicKey, "demo1234"));
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            
        }
    }
}
