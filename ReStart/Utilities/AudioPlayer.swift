//
//  AudioPlayer.swift
//  ReStart
//
//  Created by APPLE on 20/09/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(_ id: String) {
    
    switch id {
        
    case K.toHome:
        if let path = Bundle.main.path(forResource: K.chimeupSound, ofType: K.mp3) {
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not play the sound file: \(error.localizedDescription)")
            }
        }
    
    case K.toOnboarding:
        if let path = Bundle.main.path(forResource: K.successSound, ofType: K.m4a) {
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not play the sound file: \(error.localizedDescription)")
            }
        }
        
    default:
        print("default case")
    }
}

//Alternate method that uses 2 inputs

//func playSound(sound: String, type: String) {
//
//    if let path = Bundle.main.path(forResource: sound, ofType: type) {
//        do{
//            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
//            audioPlayer?.play()
//        } catch {
//            print("Could not play the sound file: \(error.localizedDescription)")
//        }
//    }
//}
