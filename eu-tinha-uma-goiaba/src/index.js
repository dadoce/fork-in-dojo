var CompraGoiaba = function(decisor) {
  this.podeFazer = function() {
    return decisor.estarFaminto() && this.valor <= decisor.dinheiroNaCarteira();
  }
  this.valor = 1.5;

  this.descricao = function() {
    return 'comprar goiaba';
  }
}

var CompraPassagem = function(decisor) {
  this.podeFazer = function() {
    return this.valor <= decisor.dinheiroNaCarteira();
  } 
  this.valor = 1.5;

  this.descricao = function() {
    return 'comprar passagem';
  }
}

var Decisor = function(dinheiroNaCarteira, estarFaminto) {
  var _dinheiroNaCarteira = dinheiroNaCarteira;
  var _estarFaminto       = estarFaminto;

  this.dinheiroNaCarteira = function() {
    return _dinheiroNaCarteira;
  }
  this.estarFaminto = function() {
    return _estarFaminto;
  }

  this.decide = function() {
    var opcoes  = [new CompraGoiaba(this),
                   new CompraPassagem(this)];
    var decisao = [];

    opcoes.forEach(function(opcao) {
      if(opcao.podeFazer()) {
        paga(opcao.valor);
        decisao.push(opcao.descricao());
      }
    });
    return decisao.join(" e ");
  }
  
  var paga = function(valor) {
    _dinheiroNaCarteira -= valor;
  }
}

module.exports = Decisor;