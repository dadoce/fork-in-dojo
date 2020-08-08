import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;


public class ArenaTest {

    private Arena arena;
    
    @Before
    public void setUp() throws Exception {
        arena = new Arena(20, 20);
    }

    @Test
    public void testArena() {
        assertEquals(20, arena.getHeight());
        assertEquals(20, arena.getWidth());
    }
}
