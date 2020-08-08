require 'rspec'
require 'matriz'

describe "Matriz" do

  it "Matriz de 3 e 4" do
    matriz = Matriz.new(3, 4)

    expect(matriz.columns).to be 3
    expect(matriz.lines).to be 4
  end

  it "Matriz de 5 e 6" do
    matriz = Matriz.new(5, 6)

    expect(matriz.columns).to be 5
    expect(matriz.lines).to be 6
  end

  it "deveria gerar uma matriz 3x4 em espiral de fora para dentro no sentido horário quando receber 3, 4" do
    expected_matrix = [[1,  2,  3],
                       [10, 11, 4],
                       [9,  12, 5],
                       [8,  7,  6]]

    matrix = Matriz.new(3, 4)

    expect(matrix.mount_matrix).to eq expected_matrix
  end

  it "deveria gerar uma matriz 6x5 em espiral de fora para dentro no sentido horário quando receber 6, 5" do
    expected_matrix = [[1,  2,  3,  4,  5,  6],
                       [18, 19, 20, 21, 22, 7],
                       [17, 28, 29, 30, 23, 8],
                       [16, 27, 26, 25, 24, 9],
                       [15, 14, 13, 12, 11, 10]]

    matrix = Matriz.new(6, 5)

    expect(matrix.mount_matrix).to eq expected_matrix
  end
end