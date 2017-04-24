package topics.authorisation;

import static com.google.common.base.Charsets.UTF_8;

import com.google.common.hash.HashCode;
import com.google.common.hash.Hashing;

public class MessageDigest {

    public static String sha1(final String input) {
        final HashCode hashCode = Hashing.sha1().hashString(input, UTF_8);
        return hashCode.toString();
    }
}
