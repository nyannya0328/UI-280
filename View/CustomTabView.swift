//
//  CustomTabView.swift
//  CustomTabView
//
//  Created by nyannyan0328 on 2021/08/05.
//

import SwiftUI

struct CustomTabView: View {
    @State var currentTab = "Meesage"
    
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    var body: some View {
        TabView(selection:$currentTab){
            
            FurnitureHome()
                .tag("Home")
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                WalkMainView(screenSize: size)
                  
            }
                .tag("Meesage")
            
          
                
              
                Text("C")
                
           
                .tag("Account")
            
            
            
            
            
        }
        .overlay(
        
        
            HStack(spacing:0){
                
                
                CustomTabButton(title: "Home", image: "home", animation: animation, currentTab: $currentTab)
                
                CustomTabButton(title: "Meesage", image: "messenger", animation: animation, currentTab: $currentTab)
                
                CustomTabButton(title: "Account", image: "user", animation: animation, currentTab: $currentTab)
                
                
                
            }
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(.black,in: Capsule())
                .padding(.horizontal)
                .padding(.top,getRect().height < 750 ? 5 : 10)
            ,alignment: .bottom
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

struct CustomTabButton : View{
    
    var title : String
    var image : String
    var animation : Namespace.ID
    
    @Binding var currentTab : String
    var body: some View{
        
        Button {
            withAnimation{
                
            currentTab = title
            }
        } label: {
            
            HStack(spacing:10){
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                
                if currentTab == title{
                    
                    Text(title)
                        .font(.footnote.bold())
                        .foregroundColor(.orange)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                    
                    
                }
                
                
                
                
            }
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity)
         
            .background(Color.white.opacity(currentTab == title ? 0.2 : 0),in: Capsule())
           
            
        
            
        }

    }
}
