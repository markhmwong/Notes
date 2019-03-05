//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



//https://stackoverflow.com/questions/22703364/delay-shooting-while-touch-moving
//typedef enum
//{
//    IDLE,
//    FINGER_DOWN,
//    FIRING_START_DELAY,
//    FIRE_BULLET,
//    INTER_FIRE_DELAY,
//} FIRING_STATE;
//
//
//// Class Variables:
//FIRING_STATE _firingState = IDLE;
//int _ticks = 0;
//bool _fingerDown = false;
//
//const int FRAMES_PER_SECOND = 60;
//const float FIRING_START_DELAY_SECONDS = 1.5f;
//const float INTER_FIRE_DELAY_SECONDS = 0.5;
//
//void EnterState(FIRING_STATE firingState);
//void ExecuteState(FIRING_STATE firingState);
//void ChangeState(FIRING_STATE firingState);
//
//void EnterState(FIRING_STATE firingState)
//{
//    switch(firingState)
//    {
//    case IDLE:
//        break;
//    case FINGER_DOWN:
//        break;
//    case FIRING_START_DELAY:
//        // NOTE: You may change/start an animation or
//        // play a sound here to give some feedback
//        // to the player.
//        _ticks = FIRING_START_DELAY_SECONDS*FRAMES_PER_SECOND;
//        break;
//    case FIRE_BULLET:
//        break;
//    case INTER_FIRE_DELAY:
//        _ticks = INTER_FIRE_DELAY_SECONDS*FRAMES_PER_SECOND;
//        break;
//    }
//}
//
//void ExecuteState(FIRING_STATE firingState)
//{
//    // If the counter is running, decrement it.
//    if(_ticks > 0)
//    {
//        _ticks--;
//    }
//    switch(firingState)
//    {
//    case IDLE:
//        if(_fingerDown)
//        {
//            ChangeState(FINGER_DOWN);
//        }
//        break;
//    case FINGER_DOWN:
//        if(!_fingerDown)
//        {
//            ChangeState(IDLE);
//        }
//        else
//        {
//
//            ChangeState(FIRING_START_DELAY);
//        }
//        break;
//    case FIRING_START_DELAY:
//        if(_ticks == 0)
//        {  //  Move on to next state
//            ChangeState(FIRE_BULLET);
//        }
//        if(!_fingerDown)
//        {
//            ChangeState(IDLE);
//        }
//        break;
//    case FIRE_BULLET:
//        if(!_fingerDown)
//        {
//            ChangeState(IDLE);
//        }
//        ChangeState(INTER_FIRE_DELAY);
//        break;
//    case INTER_FIRE_DELAY:
//        if(_ticks == 0)
//        {  //  Move on to next state
//            ChangeState(FIRE_BULLET);
//        }
//        if(!_fingerDown)
//        {
//            ChangeState(IDLE);
//        }
//        break;
//    }
//}
//
//void ChangeState(FIRING_STATE firingState)
//{
//    EnterState(firingState);
//    _firingState = firingState;
//    ExecuteState(firingState);
//}
