package topics.jar.client;

import topics.jar.code.Bar;
import topics.jar.code.Foo;

public class FooBarClient {

    public static void main(String[] args) {

        // Call static methods
        Foo.sayFooFoo();
        Bar.sayBarBar();

        Foo.main(null);
        Bar.main(null);

        // Call non-static methods
        Foo foo = new Foo();
        foo.sayHello();

        Bar bar = new Bar();
        bar.sayHello();
    }
}
