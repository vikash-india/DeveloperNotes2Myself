package concepts;

import java.util.List;

/*
 * Description: Generics - Generic Inheritance
 * Note
 * 1. A generic class can be subtyped or interface by extending or implementing it.
 */
public class P074_Generics_Inheritance {

    public static void main(String[] args) {
        // The following parameterisations of PayloadList are subtypes of List<String>
        PayloadList<String, String> payloadList1;
        PayloadList<String, Integer> payloadList2;
        PayloadList<String, Exception> payloadList3;
    }
}

interface PayloadList<E, P> extends List<E> {
    void setPayload(int index, P val);
    /* ... */
}