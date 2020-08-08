package test

import (
	. "arena-rpg.go/lib"
	. "github.com/smartystreets/goconvey/convey"
	"testing"
)

func TestGame(t *testing.T) {
	var arena *Arena

	Convey("Arena de combate", t, func() {
		Convey("Criação de arena", func() {
			Convey("Ao criar uma arena 30x25", func() {

				arena = NewArena(30, 25)

				Convey("O comprimento deve ser 30", func() {
					So(arena.Width, ShouldEqual, 30)
				})
				Convey("O altura deve ser 25", func() {
					So(arena.Height, ShouldEqual, 25)
				})
			})
		})
	})
}
