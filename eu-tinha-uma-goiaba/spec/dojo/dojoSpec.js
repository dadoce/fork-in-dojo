var Decisor = require('../../src/index');

describe("Carinha da Goiaba:", function() {
  
  it("Se não tem grana, nao compra a goiaba", function() {
    var decisor = new Decisor(0.50, false); 

    expect(decisor.decide()).toBe('');
  });

  it("Tem fome e tem grana, compra a goiaba", function() {
    var decisor = new Decisor(2, true); 

    expect(decisor.decide()).toBe('comprar goiaba');
  });

  it("Não tem fome e tem grana, não compra a goiaba e pega o onibus", function() {
    var decisor = new Decisor(2, false); 

    expect(decisor.decide()).toBe('comprar passagem');
  });

  it("Tem fome e não tem grana, não compra a goiaba", function() {
    var decisor = new Decisor(0.5, true); 

    expect(decisor.decide()).toBe('');
  });

  it("Compra a goiaba e pega onibus", function() {
    var decisor = new Decisor(10, true); 

    expect(decisor.decide()).toBe('comprar goiaba e comprar passagem');
  });
});
