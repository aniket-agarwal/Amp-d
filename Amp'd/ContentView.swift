//
//  ContentView.swift
//  Amp'd
//
//  Created by Aniket Agarwal on 8/30/22.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    
    let motionManager = CMMotionManager()
    @State var dragLocation = CGPoint(x: 0, y: 0)
    @State var isDragging = false
    @State var pitch: Double = 0.0
    @State var roll: Double = 0.0
    @State var yaw: Double = 0.0
    
    var width: CGFloat = 380
    var height: CGFloat = 280

    var intensity: CGFloat = 10
    
    func scale(inputMin: CGFloat, inputMax: CGFloat, outputMin: CGFloat, outputMax: CGFloat, value: CGFloat) -> CGFloat {
        return outputMin + (outputMax - outputMin) * (value - inputMin) / (inputMax - inputMin)
    }
    var body: some View {
        ZStack {
            Color("BG")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Your Playlists")
                        .font(.system(.title, design: .default))
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "plus")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.indigo)
                .padding()
                Spacer()
                Image("Headphones")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .rotation3DEffect(.degrees(pitch * 28 + dragLocation.x), axis: (x: 1, y: 1 , z: 0))
    //.offset(x: CGFloat(-yaw * 5), y: CGFloat(-pitch * 5))
    .animation(.linear(duration: 0.2), value: pitch)
    .onAppear {
        motionManager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
            yaw = motionData!.attitude.yaw
            pitch = motionData!.attitude.pitch
            pitch = motionData!.attitude.roll
        }
    }
    .gesture(
                        DragGesture(minimumDistance: 0.0)
                            .onChanged { gesture in
                                let normalizedX = scale(inputMin: 0, inputMax: width, outputMin: -intensity, outputMax: intensity, value: gesture.location.x)
                                let normalizedY = scale(inputMin: 0, inputMax: height, outputMin: intensity, outputMax: -intensity, value: gesture.location.y)

                                print(normalizedX, normalizedY)

                                withAnimation(isDragging ? .interactiveSpring() : .spring()) {
                                    dragLocation = CGPoint(x: normalizedX, y: normalizedY)
                                }
                                isDragging = true
                            }
                            .onEnded { _ in
                                isDragging = false
                                withAnimation(.spring()) {
                                    dragLocation = .zero
                                }
                            }
                    )
                Spacer()
                
            Text("No Playlists")
                    .font(.system(.title3))
                    .fontWeight(.semibold)
                Text("Your created or joined playlists will appear here. Create a playlist and invite friends to collaborate")
                    .font(.system(.body)).opacity(0.7)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                Spacer()
                
                Button {
                } label: {
                    HStack (spacing: 16) {
                        Spacer()
                        Image(systemName: "music.note.list")
                        Text("Create New Playlist")
                        Spacer()
                        
                    }.font(.title3)
                        .fontWeight(.medium)
                        .padding(.vertical, 12)
                       // .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        
                }
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
                .padding(.horizontal, 24)
                Spacer()
                 
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
