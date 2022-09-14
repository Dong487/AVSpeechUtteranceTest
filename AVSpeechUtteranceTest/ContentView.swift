//
//  ContentView.swift
//  AVSpeechUtteranceTest
//
//  Created by DONG SHENG on 2022/9/14.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var text: String = "醜八怪"
    @State private var rate: Float = 0.5
    @State private var volume: Float = 1
    @State private var pitchMultiplier: Float = 1
    
    
    var body: some View {
        VStack {
            HStack{
                Button {
                    play()
                } label: {
                    Text("播放聲音")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 300, height: 300)
                    
                }
                Button {
                    play()
                } label: {
                    Text("播放聲音22222")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 300, height: 300)
                    
                }
            }
            
            TextField("?????????", text: $text)
                .font(.largeTitle.bold())
                .foregroundColor(.brown)
            
            VStack{
                Text("RATE 速度:")
                Slider(value: $rate,in: 0...1 ,step: 0.1)
                    .accentColor(.red)
            }
            
            VStack{
                Text("volume 音量:")
                Slider(value: $volume,in: 0...1 ,step: 0.1)
                    .accentColor(.red)
            }

            VStack{
                Text("volume 音調:")
                Slider(value: $pitchMultiplier,in: 0.5...2 ,step: 0.1)
                    .accentColor(.red)
            }
        }
    }
    
    func play(){
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW") // 語言
        utterance.rate = rate   // 速度 0-1
        utterance.volume = volume   // 音量 0-1
        utterance.pitchMultiplier = pitchMultiplier // 音調 0.5-2
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
