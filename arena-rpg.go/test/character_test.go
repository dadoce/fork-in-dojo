package test

import (
  . "arena-rpg.go/lib"
  . "github.com/smartystreets/goconvey/convey"
  "testing"
  "errors"
)

func TestCharacter(t *testing.T) {
  Convey("Character", t, func() {
    espada   := NewWeapon("Espada", 1, 20)
    leonidas := NewCharacter("Leonidas", 200, espada)
    hulk     := NewCharacter("Hulk", 800, nil)

    Convey("deveria estar vivo enquanto hp estiver maior que zero", func() {
      So(leonidas.IsAlive(), ShouldBeTrue)
    })

    Convey("deveria estar morto quanto hp for menor que um", func() {
      chuckNoris := NewCharacter("Chuck Noris", 0, nil)

      So(chuckNoris.IsAlive(), ShouldBeFalse)
    })

    Convey("deveria poder atacar outro personagem quando armado", func() {
      leonidas.Attack(hulk)

      So(hulk.Hp, ShouldEqual, 780)
    })

    Convey("deveria dar erro ao tentar atacar outro personagem quando desarmado", func() {
      SkipSo(func(){ hulk.Attack(leonidas) }, ShouldPanicWith, errors.New("atacante necessita de uma arma"))
    })

    Convey("deveria estar armado", func() {
      So(leonidas.IsArmed(), ShouldBeTrue)
    })

    Convey("deveria não estar armado", func() {
      So(hulk.IsArmed(), ShouldBeFalse)
    })

    Convey("deveria saber se o oponente está atingível quando a distancia de sua arma pode alcança-lo", func() {
      leonidas.MoveTo(1, 1)
      hulk.MoveTo(1, 2)

      So(leonidas.IsAttainable(hulk), ShouldBeTrue)
    })

    Convey("deveria saber que oponente não está atingível quando a distancia de sua arma não pode alcança-lo", func() {
      leonidas.MoveTo(1, 1)
      hulk.MoveTo(10, 5)

      So(leonidas.IsAttainable(hulk), ShouldBeFalse)
    })

    Convey("deveria saber que oponente não está atingível quando desarmado", func() {
      So(hulk.IsAttainable(leonidas), ShouldBeFalse)
    })

    Convey("deveria poder se mover de um ponto ao outro", func() {
      leonidas.MoveTo(1, 1)
      leonidas.MoveTo(5, 7)

      So(leonidas.Position.X, ShouldEqual, 5)
      So(leonidas.Position.Y, ShouldEqual, 7)
    })
  })
}