import java.lang.Math;  

public class Personagem {

    private String nome;
    private Arma arma;
    private int x = 0, y = 0, hp;
    
    public Personagem(String nome, Arma arma, int hp) {
        this.nome = nome;
        this.arma = arma;
        this.hp = hp;
    }

    public int getHp() {
        return hp;
    }

    public void setHp(int hp) {
        this.hp = hp;
    }

    public String getNome() {
        return nome;
    }

    public Arma getArma() {
        return arma;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public void movePara(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    public boolean estaVivo() {
        return hp > 0;
    }

    public boolean estaArmado() {
        return arma != null;
    }
    
    public int distanciaAte(Personagem outroPersonagem) {
        int a = (int) Math.pow(x - outroPersonagem.x, 2);
        int b = (int) Math.pow(y - outroPersonagem.y, 2);
        return (int) Math.sqrt(a + b);
    }
    
    public boolean estaAtingivel(Personagem outroPersonagem) {
        return estaArmado() ? (distanciaAte(outroPersonagem) <= arma.getDistancia()) : false;
    }
    
    public void ataca(Personagem outroPersonagem) {
        try {
            if(estaAtingivel(outroPersonagem)) {
                outroPersonagem.setHp(outroPersonagem.getHp() - this.arma.getDano());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
