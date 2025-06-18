package examples.test1;

import com.intuit.karate.junit5.Karate;

class Test1Runner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("test1").relativeTo(getClass());
    }    

}
