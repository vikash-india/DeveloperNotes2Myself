package topics.authorisation;

import static javax.crypto.Cipher.ENCRYPT_MODE;
import static org.apache.commons.io.IOUtils.closeQuietly;
import static org.apache.commons.lang3.tuple.Pair.of;
import static org.bouncycastle.util.encoders.Hex.encode;

import java.io.IOException;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.interfaces.RSAPublicKey;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.apache.commons.lang3.tuple.Pair;
import org.bouncycastle.openssl.PEMReader;

public class RSAEncryption {

    public String encrypt(final String payload, final Key publicKey)
            throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException,
            IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException {
        final Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        cipher.init(ENCRYPT_MODE, publicKey);
        final byte[] encrypted = cipher.doFinal(payload.getBytes("UTF-8"));
        final byte[] encoded = encode(encrypted);
        
        return new String(encoded);
    }

    public Pair<RSAPublicKey, PrivateKey> readKeyPair(final String privateKeySerialised)
            throws IOException {
        PEMReader pemReader = null;

        try {
            final StringReader reader = new StringReader(privateKeySerialised);
            pemReader = new PEMReader(reader);
            final KeyPair keyPair = (KeyPair) pemReader.readObject();

            final RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
            final PrivateKey privateKey = keyPair.getPrivate();
            return of(publicKey, privateKey);
        }
        finally {
            closeQuietly(pemReader);
        }
    }
}
