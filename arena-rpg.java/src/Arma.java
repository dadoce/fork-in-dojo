
public class Arma {

    private String nome;
    private int distancia, dano;

    public Arma(String nome, int distancia, int dano) {
        this.nome = nome;
        this.distancia = distancia;
        this.dano = dano;
    }

    public String getNome() {
        return nome;
    }

    public int getDistancia() {
        return distancia;
    }

    public int getDano() {
        return dano;
    }

}
