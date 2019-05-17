(define (domain sokoban-strips)
(:predicates 
(empty ?x ?y)
(wall ?x ?y)
(man ?m)
(barrel ?b)
(at-man ?m ?x ?y)
(at-barrel ?b ?x ?y)
(dec ?p ?np)
(inc ?p ?np)
(position ?p))

(:action moveUp
:parameters (?m ?px ?py ?by)
:precondition (and (man ?m) (position ?px) (position ?py) (position ?by) (dec ?py ?by) (empty ?px ?by) (at-man ?m ?px ?py))
:effect (and (not (empty ?px ?by)) (not (at-man ?m ?px ?py)) (empty ?px ?py) (at-man ?m ?px ?by)))

(:action moveDown
:parameters (?m ?px ?py ?by)
:precondition (and (man ?m) (position ?px) (position ?py) (position ?by) (inc ?py ?by) (empty ?px ?by) (at-man ?m ?px ?py))
:effect (and (not (empty ?px ?by)) (not (at-man ?m ?px ?py)) (empty ?px ?py) (at-man ?m ?px ?by)))

(:action moveLeft
:parameters (?m ?px ?py ?bx)
:precondition (and (man ?m) (position ?px) (position ?py) (position ?bx) (dec ?px ?bx) (empty ?bx ?py) (at-man ?m ?px ?py))
:effect (and (not (empty ?bx ?py)) (not (at-man ?m ?px ?py)) (empty ?px ?py) (at-man ?m ?bx ?py)))

(:action moveRight
:parameters (?m ?px ?py ?bx)
:precondition (and (man ?m) (position ?px) (position ?py) (position ?bx) (inc ?px ?bx) (empty ?bx ?py) (at-man ?m ?px ?py))
:effect (and (not (empty ?bx ?py)) (not (at-man ?m ?px ?py)) (empty ?px ?py) (at-man ?m ?bx ?py)))

(:action moveBarrelUp
:parameters (?m ?b ?px ?py ?by ?cy)
:precondition (and (man ?m) (barrel ?b) (position ?px) (position ?py) (position ?by) (position ?cy) (dec ?py ?by) (dec ?by ?cy) 
(at-man ?m ?px ?py) (at-barrel ?b ?px ?by) (empty ?px ?cy))
:effect (and (not (at-man ?m ?px ?py)) (not (at-barrel ?b ?px ?by)) (not (empty ?px ?cy)) (at-man ?m ?px ?by) (at-barrel ?b ?px ?cy) 
(empty ?px ?py)))

(:action moveBarrelDown
:parameters (?m ?b ?px ?py ?by ?cy)
:precondition (and (man ?m) (barrel ?b) (position ?px) (position ?py) (position ?by) (position ?cy) (inc ?py ?by) (inc ?by ?cy) 
(at-man ?m ?px ?py) (at-barrel ?b ?px ?by) (empty ?px ?cy))
:effect (and (not (at-man ?m ?px ?py)) (not (at-barrel ?b ?px ?by)) (not (empty ?px ?cy)) (at-man ?m ?px ?by) (at-barrel ?b ?px ?cy) 
(empty ?px ?py)))

(:action moveBarrelLeft
:parameters (?m ?b ?px ?py ?bx ?cx)
:precondition (and (man ?m) (barrel ?b) (position ?px) (position ?py) (position ?bx) (position ?cx) (dec ?px ?bx) (dec ?bx ?cx) 
(at-man ?m ?px ?py) (at-barrel ?b ?bx ?py) (empty ?cx ?py))
:effect (and (not (at-man ?m ?px ?py)) (not (at-barrel ?b ?bx ?py)) (not (empty ?cx ?py)) (at-man ?m ?bx ?py) (at-barrel ?b ?cx ?py)
(empty ?px ?py)))

(:action moveBarrelRight
:parameters (?m ?b ?px ?py ?bx ?cx)
:precondition (and (man ?m) (barrel ?b) (position ?px) (position ?py) (position ?bx) (position ?cx) (inc ?px ?bx) (inc ?bx ?cx) 
(at-man ?m ?px ?py) (at-barrel ?b ?bx ?py) (empty ?cx ?py))
:effect (and (not (at-man ?m ?px ?py)) (not (at-barrel ?b ?bx ?py)) (not (empty ?cx ?py)) (at-man ?m ?bx ?py) (at-barrel ?b ?cx ?py)
(empty ?px ?py)))

)
