//
//  ContentView.swift
//  SwiftUIStructure
//
//  Created by eheuristic on 10/07/20.
//  Copyright © 2020 eheuristic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var open_slide: Bool = false
    var body: some View {
        VStack {
            HeaderView(title: "Home Page")
        }
    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    var title: String
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    self.showMenu.toggle()
                }
            }) {
                Image(systemName: "list.bullet")
                    .resizable()
                    .frame(width: 30, height: 25, alignment: .leading)
                    .accentColor(.black)
            }
            .padding()
            Spacer()
            Text(title)
                .font(.title)
                .padding(.trailing, 16)
            Spacer()
        }
    }
}

struct HeaderView: View {
      @State var open_slide: Bool = false
    var title: String
     var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                VStack {
                    MainView(showMenu: self.$open_slide, title: self.title)
                        .frame(width: geometry.size.width, height: 50, alignment: .leading)
                   Spacer()
                }
                if self.open_slide {
                    MenuView()
                        .frame(width: geometry.size.width/1.5, height: geometry.size.height, alignment: .leading)
                        .transition(.move(edge: .leading))
                }
                Spacer()
            }
            .gesture(DragGesture()
            .onEnded({ (value) in
                if value.translation.width < -100 {
                    withAnimation {
                        self.open_slide = false
                        }
                    }
                })
            )
        }
    }
}

struct MenuView: View {
    var arr_menus = ["home", "profile", "user"]
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().tableFooterView = UIView()
    }
    var body: some View {
        VStack(alignment: .leading) {
            List(arr_menus, id:\.self) { string in
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 25, height: 25, alignment: .leading)

                    Text(string)
                        .font(.title)
                        .foregroundColor(.white)
                    }
                }
            }
           .padding(.top, 100)
           .frame(maxWidth: .infinity, alignment: .leading)
           .background(Color(red: 32/255, green: 32/255, blue: 32/255))
           .edgesIgnoringSafeArea(.all)
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
