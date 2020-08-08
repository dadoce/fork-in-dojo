package lib

import (
  "math"
  "errors"
)

type Character struct {
  Name     string
  Hp       int
  Weapon   *Weapon
  Position *Position
}

func NewCharacter(name string, hp int, weapon *Weapon) *Character {
  return &Character{Name: name, Hp: hp, Weapon: weapon, Position: NewPosition(0, 0)}
}

func (c *Character) MoveTo(x int, y int) {
  if c.Position == nil {
    c.Position = NewPosition(x, y)
  } else {
    c.Position.X = x
    c.Position.Y = y
  }
}

func (c *Character) IsAlive() bool {
  return c.Hp > 0
}

func (c *Character) Attack(anotherCharacter *Character) error {
  if c.Weapon == nil {
    return errors.New("atacante necessita de uma arma")
  }
  anotherCharacter.Hp = anotherCharacter.Hp - c.Weapon.Damage
  return nil
}

func (c *Character) IsArmed() bool {
  return c.Weapon != nil
}

func (c *Character) IsAttainable(anotherCharacter *Character) bool {
  if c.Weapon == nil {
    return false
  } 
  return c.Weapon.Distance >= int(c.distanceTo(anotherCharacter))
}

func (c *Character) distanceTo(anotherCharacter *Character) float64 {
  p1, p2 := c.Position, anotherCharacter.Position
  a := math.Pow(float64(p1.X-p2.X), 2)
  b := math.Pow(float64(p1.Y-p2.Y), 2)
  return math.Sqrt(a + b)
}