const dojo = {};
const referencias = {
	'ABC2': '2',
	'DEF3': '3',
	'GHI4': '4',
	'JKL5': '5',
	'MNO6': '6',
	'PQRS7': '7',
	'TUV8': '8',
	'WXYZ9': '9'
};

dojo.traduza = function(letras) {
  return letras.split('').map(function(el) { return dojo.tecla(el) }).join('');
}

dojo.tecla = function(letra) {
  key = Object.keys(referencias).find(function(el){ return ~el.indexOf(letra) });
  return referencias[key] || letra;
}

module.exports = dojo;
