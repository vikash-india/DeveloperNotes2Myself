package topics.authorisation;

import static java.security.Security.addProvider;
import static org.apache.commons.io.FileUtils.readFileToString;

import java.io.File;
import java.security.PrivateKey;
import java.security.interfaces.RSAPublicKey;

import org.apache.commons.lang3.tuple.Pair;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import com.google.gson.Gson;

public class MainServer {

    public static void main(String[] args) throws Exception {
        
        // Get JSON
        String json = "{\"customerId\":1,\"customerName\":\"Acme\",\"version\":\"1.00\"}";
        System.out.println("JSON: " + json);
        
        // Get Encrypted SHA1
        String signature = "4b3a0891d27b2fb0fe1c1011fdcd85daa6e4bfc53cb45fa5eabcbdc84baf09e8ab340f0e9f05d103f1fb5d86e96d37d78f0db6720229ca09d223ed9641ffe8cd1e069d49f3a67a0d93317a80720286bfdd2ddbe422c08385e2b0b1e160e070c3a1f283d2e9e0224872b4c87727257f9af6b5ed17c0ce71779ef401bac4e17086";
        System.out.println("Encrypted SHA1: " + signature);
        
        // Get Decrypted SHA1
        final String privateKeyFileName = "src/topics/authorisation/acme-rsa-key";
        final String privateKeyContent = readFileToString(new File(privateKeyFileName));
        addProvider(new BouncyCastleProvider());
        RSADecryption encrypt = new RSADecryption();
        final Pair<RSAPublicKey, PrivateKey> keyPair = encrypt.readKeyPair(privateKeyContent);
        final String decryptedSHA1 = encrypt.decrypt(signature, keyPair.getRight());
        System.out.println("Decrypted SHA1: " + decryptedSHA1);
        
        // Compute SHA1 of payload
        MessageDigest messageDigest = new MessageDigest();
        String sha1sum = messageDigest.sha1(json);
        System.out.println("Computed SHA1: " + sha1sum);
        
        // Compare Decrypted SHA1 with Computed SHA1s
        if (sha1sum.equals(decryptedSHA1)) {
            System.out.println("Match: The SHA1s MATCHES!!");
        } else {
            System.out.println("Match: The SHA1s DO NOT MATCH!!");
            System.exit(1);
        }
        
        // Covert JSON to Bean
        Gson gson = new Gson();
        Customer customer = gson.fromJson(json, Customer.class);
        System.out.println("Bean: " + customer.toString());
    }
}
