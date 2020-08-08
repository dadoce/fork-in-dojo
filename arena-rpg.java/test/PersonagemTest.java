import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

import static org.mockito.Mockito.*;


public class PersonagemTest {

    private Personagem leonidas, hulk;
    @Mock private Arma espada;
    
    @Before
    public void setUp() throws Exception {
        espada = mock(Arma.class);
        leonidas = new Personagem("Leonidas", espada, 200);
        hulk = new Personagem("Hulk", null, 800);
    }

    @Test
    public void deveriaEstarVivo() {
        assertTrue(leonidas.estaVivo());
    }
    
    @Test 
    public void deveriaSaberQualADistanciaAteOutroPersonagem() {
    	leonidas.movePara(1, 2);
    	hulk.movePara(4, 2);
    	assertEquals("quando no ponto 1,2 e outro personagem no ponto 4,2, deveria saber que a distancia até ele é de 3", 
    			leonidas.distanciaAte(hulk), 3);
    	
    	leonidas.movePara(4, 2);
    	hulk.movePara(1, 2);
    	assertEquals("quando no ponto 4,2 e outro personagem no ponto 1,2, deveria saber que a distancia até ele é de 3", 
    			leonidas.distanciaAte(hulk), 3);

    	leonidas.movePara(1, 1);
    	hulk.movePara(7, 10);
    	assertEquals("quando no ponto 1,1 e outro personagem no ponto 7,10, deveria saber que a distancia até ele é de 10", 
    			leonidas.distanciaAte(hulk), 10);
    }
    
    @Test
    public void deveriaAtacarOutroPersonagem() {
    	when(espada.getDano()).thenReturn(20);
        leonidas.ataca(hulk);
        
        assertEquals(hulk.getHp(), 780);
    }
    
    @Test
    public void deveriaNaoEstarArmado() {
        assertFalse(hulk.estaArmado());
    }
    
    @Test
    public void deveriaEstarAtingivel() {
        leonidas.movePara(1, 2);

        Personagem chuck = new Personagem("Chuck Noris", null, 1);
        chuck.movePara(1, 1);
        
        when(espada.getDistancia()).thenReturn(1);
        
        assertTrue(leonidas.estaAtingivel(chuck));
    }
    
    @Test
	public void quandoDesarmadoDeveriaSaberQueOponenteNaoEstaAtingivel() {
		hulk.movePara(1, 2);

		Personagem chuck = new Personagem("Chuck Noris", null, 1);
		chuck.movePara(1, 1);

		assertFalse(
				"quando desarmado, deveria saber que oponente não está atingível",
				hulk.estaAtingivel(chuck));
	}
    
    @Test
    public void deveriaNaoEstaAtingivel() {
        leonidas.movePara(4, 4);

        Personagem chuck = new Personagem("Chuck Noris", null, 1);
        chuck.movePara(1, 1);
        
        assertFalse(leonidas.estaAtingivel(chuck));
    }
    
    @Test
    public void deveriaMoverPontoAoOutro() {
        leonidas.movePara(1, 1);
        leonidas.movePara(4, 5);

        assertEquals(4, leonidas.getX());
        assertEquals(5, leonidas.getY());
    }
    

}
