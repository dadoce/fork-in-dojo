package lib

type Master struct {
  Combatents []*Character
  Arena      *Arena
}

func NewMaster(arena *Arena) *Master {
  return &Master{Arena: arena}
}

func (m *Master) Add_combatent(char *Character, position *Position) {
  m.Combatents = append(m.Combatents, char)
  m.Move_character(char, position)
}

func (m *Master) Move_character(char *Character, position *Position) {
  coordenada_x, coordenada_y := position.X, position.Y
  switch {
  case position.X > m.Arena.Width:
    coordenada_x = m.Arena.Width
  case position.X < 1:
    coordenada_x = 1
  }
  switch {
  case position.Y > m.Arena.Height:
    coordenada_y = m.Arena.Height
  case position.Y < 1:
    coordenada_y = 1
  }
  char.MoveTo(coordenada_x, coordenada_y)
}