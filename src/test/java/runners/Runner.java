package runners;

import com.intuit.karate.junit5.Karate;

class Runner {

    @Karate.Test
    Karate testAll() {
      return Karate.run("classpath:features/marvel_characters_api").relativeTo(getClass());
    }

}
