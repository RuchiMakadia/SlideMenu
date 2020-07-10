//
//  LeftMenu.swift
//  SwiftUIStructure
//
//  Created by eheuristic on 10/07/20.
//  Copyright © 2020 eheuristic. All rights reserved.
//

import SwiftUI

struct LeftMenu: View {
    var body: some View {
       VStack(alignment: .leading) {
                   Text("profie")
                       .font(.title)
                       .padding()
                   Text("profie")
                       .font(.title)
                       .padding()
                   Text("profie")
                       .font(.title)
                       .padding()
                   
                   Spacer()
               }
               .frame(width: .infinity, alignment: .leading)
               .background(Color.gray)
    }
}


struct LeftMenu_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenu()
    }
}
