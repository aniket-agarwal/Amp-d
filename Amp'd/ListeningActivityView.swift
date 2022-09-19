//
//  ListeningActivityView.swift
//  Amp'd
//
//  Created by Aniket Agarwal on 9/13/22.
//

import SwiftUI

struct ListeningActivityView: View {
    var body: some View {
        ZStack {
            Color("BG")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Listening Activity")
                    .font(.system(.title, design: .default))
                    .fontWeight(.bold)
                    .foregroundColor(.indigo)
                    .padding(.top)
                
                ScrollView (showsIndicators: false) {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        UserActivityCard(avatar: "Avatar", UserName: "Joe King", AlbumArt: "Art", SongName: "Entropy", ArtistName: "Beach Bunny").padding(.bottom, 4)
                    }
                    .padding(.bottom, 32)
                }
            
            }
        }
    }
}

struct UserActivityCard : View {
    var avatar: String
    var UserName : String
    var AlbumArt : String
    var SongName : String
    var ArtistName : String
    
    var body : some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Image(avatar)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .frame(width: 40, height: 40)
                    
                Text(UserName)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .opacity(0.87)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Text("Now")
                    .font(.footnote)
                    .opacity(0.5)
            }
            .frame(maxWidth: .infinity)
            
            HStack(alignment: .bottom) {
                Image(AlbumArt)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .frame(width: 80, height: 80)
                    .shadow(color: .black.opacity(0.12), radius: 2, x: 0,y: 0)
                
                
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(SongName)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(ArtistName)
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .opacity(0.7)
                        
                        HStack() {
                            Image(systemName: "flame")
                                .font(.title2)
                                .padding(.horizontal, 3)
                                .frame(width: 28, height: 28)
                            
                            Image(systemName: "heart")
                                .font(.title2)
                                
                                .padding(.leading, 1)
                                .frame(width: 28, height: 28)
                            
                            Image(systemName: "hand.thumbsdown")
                                .font(.title2)
                                .padding(.leading, 1)
                                .frame(width: 28, height: 28)
                        }
                        .opacity(0.5)
                        .padding(.top, 6)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Image(systemName: "play.circle")
                    .font(.title2)
                    .foregroundColor(.indigo)
                    
            }
            .frame(maxWidth: .infinity)
        }
        .padding(16)
        .frame(width: 358)
        .background(Color("CardBG"))
        .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color.black.opacity(0.2), lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct ListeningActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ListeningActivityView()
    }
}

