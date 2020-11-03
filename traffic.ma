[top]
components : traffic

[traffic]
type : cell
width : 20
height : 2
delay : transport
defaultDelayTime : 100
border : nowrapped
neighbors : traf(0,0)  %the cell itself
neighbors : traf(0,1) traf(0,-1) % the cell ahead and behind
neighbors : traf(-1,0) traf(1,0) % the cell above and below
neighbors : traf(-1,1) traf(1,-1)% the cell on right above and left below
initialvalue : 0
%1st type
initialrowvalue :  0     11111110111000000100
initialrowvalue :  1     11111010110001101010

localtransition : traffic-rule


[traffic-rule]

%Modified Rule-184 CA

%First lane behavior
%the behavior of this lane is that to check if there is a room on its left side (since cars are moving from right to left)
%so that they can leave the lane as soon as possible
%If they dont have the chance to move, v = v-1 (haven't implemented yet..)
%so the total combinations of a cell in the next time step would be
%0000 to 1111 which represent the car ahead, behind, itself, on the right hand side(the other side)

%1--first row
rule : 0 100 { (1,0)=0 and (0,0)=1 and cellpos(0)=0 } %move down

rule : 0 100 { (1,0)=1 and (0,-1)=0 and (0,0)=0 and (0,1)=0 and cellpos(0)=0 } %no car
rule : 0 100 { (1,0)=1 and (0,-1)=0 and (0,0)=0 and (0,1)=1 and cellpos(0)=0 } %car ahead
rule : 0 100 { (1,0)=1 and (0,-1)=0 and (0,0)=1 and (0,1)=0 and cellpos(0)=0 } %move ahead
rule : 1 100 { (1,0)=1 and (0,-1)=0 and (0,0)=1 and (0,1)=1 and cellpos(0)=0 } %stuck

rule : 1 100 { (1,0)=1 and (0,-1)=1 and (1,-1)=1 and (0,0)=0 and cellpos(0)=0 } %car behind
rule : 0 100 { (1,0)=1 and (0,-1)=1 and (1,-1)=1 and (0,0)=1 and (0,1)=0 and cellpos(0)=0 } %car behind
rule : 1 100 { (1,0)=1 and (0,-1)=1 and (1,-1)=1 and (0,0)=1 and (0,1)=1 and cellpos(0)=0 } %car behind

%2--second row
%car coming from above
rule : 1 100 { (-1,0)=1 and (0,0)=0 and cellpos(0)=1 } %car insert

%if the cell is occupied
rule : 1 100 { (-1,0)=1 and (0,0)=1 and (-1,1)=1 and cellpos(0)=1 } %car stay because there is a car on right above
rule : 0 100 { (-1,0)=1 and (0,0)=1 and (-1,1)=0 and (0,-1)=0 and (0,1)=0 and cellpos(0)=1 } %move ahead
rule : 1 100 { (-1,0)=1 and (0,0)=1 and (-1,1)=0 and (0,-1)=0 and (0,1)=1 and cellpos(0)=1 } %car stay
rule : 0 100 { (-1,0)=1 and (0,0)=1 and (-1,1)=0 and (0,-1)=1 and (0,1)=0 and cellpos(0)=1 } %move ahead
rule : 1 100 { (-1,0)=1 and (0,0)=1 and (-1,1)=0 and (0,-1)=1 and (0,1)=1 and cellpos(0)=1 } %move ahead

%if there is no car above but there is car on the above right
rule : 0 100 { (-1,0)=0 and (-1,1)=1 and (0,-1)=0 and (0,0)=0 and (0,1)=0 and cellpos(0)=1 } %no car
rule : 0 100 { (-1,0)=0 and (-1,1)=1 and (0,-1)=0 and (0,0)=0 and (0,1)=1 and cellpos(0)=1 } %no car
rule : 1 100 { (-1,0)=0 and (-1,1)=1 and (0,-1)=0 and (0,0)=1 and (0,1)=0 and cellpos(0)=1 } %car stay
rule : 1 100 { (-1,0)=0 and (-1,1)=1 and (0,-1)=0 and (0,0)=1 and (0,1)=1 and cellpos(0)=1 } %car stay
rule : 1 100 { (-1,0)=0 and (-1,1)=1 and (0,-1)=1 and (0,0)=0 and (0,1)=0 and cellpos(0)=1 } %car behind
rule : 1 100 { (-1,0)=0 and (-1,1)=1 and (0,-1)=1 and (0,0)=0 and (0,1)=1 and cellpos(0)=1 } %car behind
rule : 1 100 { (-1,0)=0 and (-1,1)=1 and (0,-1)=1 and (0,0)=1 and (0,1)=0 and cellpos(0)=1 } %move ahead
rule : 1 100 { (-1,0)=0 and (-1,1)=1 and (0,-1)=1 and (0,0)=1 and (0,1)=1 and cellpos(0)=1 } %car stay

%if there is no car above and above right
rule : 0 100 { (-1,0)=0 and (-1,1)=0 and (0,-1)=0 and (0,0)=0 and (0,1)=0 and cellpos(0)=1 } %no car
rule : 0 100 { (-1,0)=0 and (-1,1)=0 and (0,-1)=0 and (0,0)=0 and (0,1)=1 and cellpos(0)=1 } %no car
rule : 0 100 { (-1,0)=0 and (-1,1)=0 and (0,-1)=0 and (0,0)=1 and (0,1)=0 and cellpos(0)=1 } %move ahead
rule : 1 100 { (-1,0)=0 and (-1,1)=0 and (0,-1)=0 and (0,0)=1 and (0,1)=1 and cellpos(0)=1 } %stay
rule : 1 100 { (-1,0)=0 and (-1,1)=0 and (0,-1)=1 and (0,0)=0 and (0,1)=0 and cellpos(0)=1 } %car behind
rule : 1 100 { (-1,0)=0 and (-1,1)=0 and (0,-1)=1 and (0,0)=0 and (0,1)=1 and cellpos(0)=1 } %car behind
rule : 0 100 { (-1,0)=0 and (-1,1)=0 and (0,-1)=1 and (0,0)=1 and (0,1)=0 and cellpos(0)=1 } %move ahead
rule : 1 100 { (-1,0)=0 and (-1,1)=0 and (0,-1)=1 and (0,0)=1 and (0,1)=1 and cellpos(0)=1 } %car stay

rule : 0 100 { t } 