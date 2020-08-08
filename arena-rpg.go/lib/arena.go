package lib

type Arena struct {
	Width      int
	Height     int
}

func NewArena(width int, height int) *Arena {
	return &Arena{Width: width, Height: height}
}
