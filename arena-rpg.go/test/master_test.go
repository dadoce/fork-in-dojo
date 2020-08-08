package test

import (
  . "arena-rpg.go/lib"
  . "github.com/smartystreets/goconvey/convey"
  "testing"
)

func TestMaster(t *testing.T) {
  var master *Master
  var leonidas *Character

  Convey("Mestre", t, func() {
    arena := NewArena(20, 20)
    master = NewMaster(arena)
    leonidas = NewCharacter("Leonidas", 1, nil)

    Convey("deveria poder adicionar um personagem na arena", func() {
      master.Add_combatent(leonidas, NewPosition(1, 1))

      So(master.Combatents, ShouldContain, leonidas)
    })

    Convey("deveria poder mover o personagem ao longo da arena", func() {
      master.Move_character(leonidas, NewPosition(4, 5))

      So(leonidas.Position.X, ShouldEqual, 4)
      So(leonidas.Position.Y, ShouldEqual, 5)
    })

    Convey("deveria poder mover o personagem até o limite do largura da arena quando movimento o levaria para fora", func() {
      master.Move_character(leonidas, NewPosition(24, 10))

      So(leonidas.Position.X, ShouldEqual, 20)
      So(leonidas.Position.Y, ShouldEqual, 10)
    })

    Convey("deveria poder mover o personagem até o limite do altura da arena quando movimento o levaria para fora", func() {
      master.Move_character(leonidas, NewPosition(15, 30))

      So(leonidas.Position.X, ShouldEqual, 15)
      So(leonidas.Position.Y, ShouldEqual, 20)
    })

    Convey("deveria poder mover o personagem até o limite da arena quando movimento o levaria para fora", func() {
      master.Move_character(leonidas, NewPosition(-10, 30))

      So(leonidas.Position.X, ShouldEqual, 1)
      So(leonidas.Position.Y, ShouldEqual, 20)
    })
  })
}