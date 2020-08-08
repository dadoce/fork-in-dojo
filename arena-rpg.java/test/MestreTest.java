import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

public class MestreTest {

    private Personagem leonidas;
    private Arena arena;
    private Mestre mestre;

    @Before
    public void setUp() throws Exception {
        Arma espada = new Arma("Espada", 1, 20);
        leonidas = new Personagem("Leonidas", espada, 200);
        arena = new Arena(20, 20);
        mestre = new Mestre(arena);
    }
    
    @Test
    public void deveriaAdicionarPersonagem() {
        mestre.addPersonagem(leonidas, new Coordenada(5, 5));


        assertTrue(leonidas.getX() >= 1);
        assertTrue(leonidas.getX() <= arena.getWidth());

        assertTrue(leonidas.getY() >= 1);
        assertTrue(leonidas.getY() <= arena.getHeight());
    }
    
    @Test
    public void deveriaMoverPersonagem() {
        mestre.movePersonagem(leonidas, new Coordenada(4, 5));

        assertEquals(4, leonidas.getX());
        assertEquals(5, leonidas.getY());
    }
    
    @Test
    public void deveriaMoverPersonagemLimiteLargura() {
        mestre.movePersonagem(leonidas, new Coordenada(24, 10));

        assertEquals(20, leonidas.getX());
        assertEquals(10, leonidas.getY());
    }
    
    @Test
    public void deveriaMoverPersonagemLimiteAltura() {
        mestre.movePersonagem(leonidas, new Coordenada(15, 30));

        assertEquals(15, leonidas.getX());
        assertEquals(20, leonidas.getY());
    }
    
    @Test
    public void deveriaMoverPersonagemLimiteGeral() {

        mestre.movePersonagem(leonidas, new Coordenada(-10, 30));

        assertEquals(1, leonidas.getX());
        assertEquals(20, leonidas.getY());
    }
}
