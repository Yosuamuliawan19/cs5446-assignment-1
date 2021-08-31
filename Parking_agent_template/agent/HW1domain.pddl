(define (domain grid_world ) 
(:requirements :strips :typing) 
(:types car
agent - car
gridcell
time
) 
(:predicates (forward_next_timestep ?ptime1 - gridcell ?ptime2 - gridcell) 
(at_timestamp ?ptime1 - gridcell ?ptime2 - gridcell) 
(is_time ?time - time) 
(is_next_time ?t1 - time ?t2 - time) 
(at ?pt1 - gridcell ?car - car) 
(up_next ?pt1 - gridcell ?pt2 - gridcell) 
(down_next ?pt1 - gridcell ?pt2 - gridcell) 
(forward_next ?pt1 - gridcell ?pt2 - gridcell) 
(forward_next_two ?pt1 - gridcell ?pt2 - gridcell) 
(forward_next_three ?pt1 - gridcell ?pt2 - gridcell) 
(will_be_blocked ?pt1 - gridcell ?t - time) 
(blocked ?pt1 - gridcell ?t - time) 
) 
(:action UP
:parameters ( ?pt1 - gridcell ?pt2 - gridcell ?agent - agent ?t1 - time ?t2 - time) 
:precondition (and (at ?pt1 ?agent) (not (blocked ?pt2 ?t2)) (up_next ?pt1 ?pt2) (is_time ?t1) (is_next_time ?t1 ?t2))
:effect (and (not (at ?pt1 ?agent)) (at ?pt2 ?agent) (not (is_time ?t1)) (is_time ?t2))
) 
(:action DOWN
:parameters ( ?pt1 - gridcell ?pt2 - gridcell ?agent - agent ?t1 - time ?t2 - time) 
:precondition (and (at ?pt1 ?agent) (not (blocked ?pt2 ?t2)) (down_next ?pt1 ?pt2) (is_time ?t1) (is_next_time ?t1 ?t2))
:effect (and (not (at ?pt1 ?agent)) (at ?pt2 ?agent) (not (is_time ?t1)) (is_time ?t2))
) 
(:action FORWARD
:parameters ( ?pt1 - gridcell ?pt2 - gridcell ?agent - agent ?t1 - time ?t2 - time) 
:precondition (and (at ?pt1 ?agent) (not (blocked ?pt2 ?t2)) (forward_next ?pt1 ?pt2) (is_time ?t1) (is_next_time ?t1 ?t2))
:effect (and (not (at ?pt1 ?agent)) (at ?pt2 ?agent) (not (is_time ?t1)) (is_time ?t2))
) 
(:action FORWARD_TWO
:parameters ( ?pt1 - gridcell ?pt2 - gridcell ?midPt1 - gridcell ?agent - agent ?t1 - time ?t2 - time) 
:precondition (and (at ?pt1 ?agent) (not (blocked ?pt2 ?t2)) (forward_next_two ?pt1 ?pt2) (forward_next ?pt1 ?midPt1) (not (blocked ?midPt1 ?t2)) (is_time ?t1) (is_next_time ?t1 ?t2))
:effect (and (not (at ?pt1 ?agent)) (at ?pt2 ?agent) (not (is_time ?t1)) (is_time ?t2))
) 
(:action FORWARD_THREE
:parameters ( ?pt1 - gridcell ?pt2 - gridcell ?midPt1 - gridcell ?midPt2 - gridcell ?agent - agent ?t1 - time ?t2 - time) 
:precondition (and (at ?pt1 ?agent) (not (blocked ?pt2 ?t2)) (forward_next_three ?pt1 ?pt2) (forward_next ?pt1 ?midPt1) (not (blocked ?midPt1 ?t2)) (forward_next_two ?pt1 ?midPt2) (not (blocked ?midPt2 ?t2)) (is_time ?t1) (is_next_time ?t1 ?t2))
:effect (and (not (at ?pt1 ?agent)) (at ?pt2 ?agent) (not (is_time ?t1)) (is_time ?t2))
) 
(:action IDLE
:parameters ( ?pt1 - gridcell ?agent - agent ?t1 - time ?t2 - time) 
:precondition (not (will_be_blocked ?agent ?t1))
:effect (and (not (is_time ?t1)) (is_time ?t2))
) 
) 
