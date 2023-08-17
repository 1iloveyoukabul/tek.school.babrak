package Runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	public Karate runTest() {
		// address for our feature files
		// And tag
		return Karate.run("classpath:combinedAccounts.feature")
				.tags("@Regression ");
	}


}



