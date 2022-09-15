//
//  ContentView.swift
//  AVSpeechUtteranceTest
//
//  Created by DONG SHENG on 2022/9/14.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var synthesizer = AVSpeechSynthesizer()
    
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
                        .frame(width: 150, height: 150)
                    
                }
                
                Button {
                    play()
                } label: {
                    Text("播放聲音22222")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 150)
                    
                }
            }
            .padding()
            
            HStack{
                Button {
                    // 暫停 設置斷點
                    synthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
                } label: {
                    Text("暫停")
                        .font(.headline.bold())
                        .foregroundColor(.brown)
                }
                
                Button {
                    // 從斷掉的地方 繼續閱讀
                    synthesizer.continueSpeaking()
                } label: {
                    Text("恢復")
                        .font(.headline.bold())
                        .foregroundColor(.brown)
                }
            }
            
            Button {
                synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
            } label: {
                Text("停止 (直接中斷)")
                    .font(.headline.bold())
                    .foregroundColor(.red)
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
        .padding()
    }
    
    func play(){
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW") // 語言
        
        // 型態 Float
        utterance.rate = rate   // 速度 0-1
        utterance.volume = volume   // 音量 0-1
        utterance.pitchMultiplier = pitchMultiplier // 音調 0.5-2
        
        // 型態 Double
        utterance.preUtteranceDelay = 0.5 // 說之前的 延遲時間
//        utterance.postUtteranceDelay = 1 // 說完後的 停頓時間
        
        
//        let synthesizer = AVSpeechSynthesizer()
    
        synthesizer.speak(utterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
