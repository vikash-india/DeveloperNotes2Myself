package topics.authorisation;

import static java.security.Security.addProvider;
import static org.apache.commons.io.FileUtils.readFileToString;

import java.io.File;
import java.security.PrivateKey;
import java.security.interfaces.RSAPublicKey;

import org.apache.commons.lang3.tuple.Pair;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import com.google.gson.Gson;

public class MainAndroid {

    public static void main(String[] args) throws Exception {
        // Create Bean
        Customer customer = new Customer(1, "Acme", "1.00");
        System.out.println("Bean: " + customer.toString());

        // Create JSON payload.
        Gson gson = new Gson();
        String json = gson.toJson(customer);
        System.out.println("JSON: " + json);

        // Compute SHA1 of payload.
        MessageDigest messageDigest = new MessageDigest();
        String sha1sum = messageDigest.sha1(json);
        System.out.println("SHA1: " + sha1sum);

        // Encrypt SHA1 using private key
        final String privateKeyFileName = "src/topics/authorisation/acme-rsa-key";
        final String privateKeyContent = readFileToString(new File(privateKeyFileName));
        addProvider(new BouncyCastleProvider());
        RSAEncryption rsaEncryption = new RSAEncryption();
        final Pair<RSAPublicKey, PrivateKey> keyPair = rsaEncryption.readKeyPair(privateKeyContent);
        final String signature = rsaEncryption.encrypt(sha1sum, keyPair.getLeft());
        System.out.println("Encrypted SHA1: " + signature);
    }
}
