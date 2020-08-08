import java.util.ArrayList;
import java.util.List;


public class Mestre {

    private Arena arena;
    private List<Personagem> personagens;
    
    public Mestre(Arena arena) {
        this.arena = arena;
        this.personagens = new ArrayList<Personagem>();
    }

    public List<Personagem> getPersonagens() {
        return personagens;
    }
    
    public void movePersonagem(Personagem personagem, Coordenada coordenada) {
        int coordenada_x = coordenada.getX() > arena.getWidth() ? arena.getWidth() : coordenada.getX();
        int coordenada_y = coordenada.getY() > arena.getHeight() ? arena.getHeight() : coordenada.getY();

        if(coordenada.getX() < 0) {
            coordenada_x = 1;
        }
        
        if(coordenada.getY() < 0) {
            coordenada_y = 1;
        }
        
        personagem.movePara(coordenada_x, coordenada_y);
    }
    
    public void addPersonagem(Personagem personagem, Coordenada coordenada) {
        personagens.add(personagem);
        
        movePersonagem(personagem, coordenada);
    }
    
}
