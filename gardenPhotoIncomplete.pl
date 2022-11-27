https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
% Program for INST0072 Assessment 3

/*

THE GARDEN PHOTOGRAPH PROBLEM
A photographer wants to take a photograph of her garden. Initially she is in her car, her camera is
in her house, and the camera is switched off. The photographer can do any of the following actions:
(1) Take a picture of her current location (provided she is holding the camera and the camera is switched on).
(2) Turn on the camera (provided she is holding the camera and it is switched off).
(3) Pick up the camera (provided she is in the same place as the camera).
(4) Go from one place (the car, the house or the garden) to another.
(5) Put down the camera (provided she is holding the camera).
(6) Turn off the camera (provided she is holding the camera and it is switched on).
What must the photographer do to have a photograph of her garden?


In this program, "state" takes 5 arguments with intended possible values as follows:

state(
      Photographer_location       % house, garden, car
      Camera_location             % house, garden, car
      Holding_camera_or_not       % holding, notHolding
      Camera_on_or_off            % on, off
      Last_place_photographed     % house, garden, car, nowhere
      )
      
The second argument of "can_do" is intended to be one of the following 6 actions:      
     takePhoto              % take a photograph
     turnOn                 % turn on the camera
     pickUp                 % pick up the camera
     go(From, To)           % go from one place to another
     putDown                % put down the camera
     turnOff                % turn off the camera
      
EXAMPLE QUERY:
is_plan_without_loop(state(car, house, notHolding, off, nowhere), state(_, _ , _, _, garden), Plan).
      
*/

place(garden).
place(house).
place(car).

can_do(state(Place, Place, holding, on, Last_place_photographed),  
       takePhoto,
       state(Place, Place, holding, on, Place)) :-
    place(Place).


% MORE can_do CLAUSES NEED TO BE ADDED HERE


is_plan(Goal_state, Goal_state, [], States_so_far).

is_plan(State, Goal_state, [Action|Plan_for_state_after], States_so_far):-
    can_do(State, Action, State_after),
    \+ member(State_after, States_so_far),
    is_plan(State_after, Goal_state, Plan_for_state_after, [State_after|States_so_far]).
    
is_plan_without_loop(State, Goal_state, Plan):-
    is_plan(State, Goal_state, Plan, [State]).
