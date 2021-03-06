package org.adaptiveplatform.surveys.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.Collection;

/**
 * Various custom assertions to make our tests cleaner.
 * 
 * @author Marcin Deryło
 */
public final class Asserts {

	private Asserts() {
	}

	public static void assertCollectionSize(Collection<?> collection, int expectedSize) {
		assertEquals(expectedSize, collection.size());
	}

	public static void assertEmpty(Collection<?> collection) {
		assertCollectionSize(collection, 0);
	}

	public static void expectException() {
		fail("Excepted exception before reaching this line, but none occured");
	}
}
