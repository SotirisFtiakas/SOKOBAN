;The initial map:
;
;  x  0 1 2 3 4 5 6 7
;y

;0    # # # # # # # #
;1    # . . ☺ # . . #
;2    # . x . . . . #
;3    # # . . . o . #
;4    # # . o . # # #
;5    # # . . . # # #
;6    # . . . . . ☺ .
;7    # . . . . x . .
;
;     # = wall
;     . = empty spot
;     ☺ = man 
;     o = barrel
;     x = goal

(define (problem SOKOBAN)
(:domain sokoban-strips)
(:objects x0 x1 x2 x3 x4 x5 x6 x7 y0 y1 y2 y3 y4 y5 y6 y7 man1 man2 barrel1 barrel2)
(:init

(man man1)
(man man2)
(barrel barrel1)
(barrel barrel2)

; MOVING PATTERNS AND POSITIONS (inc = MOVE UP, dec = MOVE DOWN)

(position x0) (position x1) (position x2) (position x3) (position x4) (position x5) (position x6) (position x7)
(position y0) (position y1) (position y2) (position y3) (position y4) (position y5) (position y6) (position y7)

(inc x0 x1) (inc x1 x2) (inc x2 x3) (inc x3 x4) (inc x4 x5) (inc x5 x6) (inc x6 x7) 
(inc y0 y1) (inc y1 y2) (inc y2 y3) (inc y3 y4) (inc y4 y5) (inc y5 y6) (inc y6 y7)

(dec x7 x6) (dec x6 x5) (dec x5 x4) (dec x4 x3) (dec x3 x2) (dec x2 x1) (dec x1 x0)
(dec y7 y6) (dec y6 y5) (dec y5 y4) (dec y4 y3) (dec y3 y2) (dec y2 y1) (dec y1 y0)

; LEVEL INITIALIZATION (WALLS, EMPTY BOXES, MEN, BARRELS)

(wall x0 y0) (wall x1 y0) (wall x2 y0) (wall x3 y0) (wall x4 y0) (wall x5 y0) (wall x6 y0) (wall x7 y0)
(wall x0 y1) (empty x1 y1) (empty x2 y1) (at-man man1 x3 y1) (wall x4 y1) (empty x5 y1) (empty x6 y1) (wall x7 y1)
(wall x0 y2) (empty x1 y2) (empty x2 y2) (empty x3 y2) (empty x4 y2) (empty x5 y2) (empty x6 y2) (wall x7 y2)
(wall x0 y3) (wall x1 y3) (empty x2 y3) (empty x3 y3) (empty x4 y3) (at-barrel barrel1 x5 y3) (empty x6 y3) (wall x7 y3)
(wall x0 y4) (wall x1 y4) (empty x2 y4) (at-barrel barrel2 x3 y4) (empty x4 y4) (wall x5 y4) (wall x6 y4) (wall x7 y4)
(wall x0 y5) (wall x1 y5) (empty x2 y5) (empty x3 y5) (empty x4 y5) (wall x5 y5) (wall x6 y5) (wall x7 y5)
(wall x0 y6) (empty x1 y6) (empty x2 y6) (empty x3 y6) (empty x4 y6) (empty x5 y6) (at-man man2 x6 y6) (empty x7 y6)
(wall x0 y7) (empty x1 y7) (empty x2 y7) (empty x3 y7) (empty x4 y7) (empty x5 y7) (empty x6 y7) (empty x7 y7))


(:goal 

(and (or (at-barrel barrel1 x5 y7) (at-barrel barrel1 x2 y2)) (or (at-barrel barrel2 x5 y7) (at-barrel barrel2 x2 y2))))


)
