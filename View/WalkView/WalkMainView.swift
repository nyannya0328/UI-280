//
//  WalkMainView.swift
//  WalkMainView
//
//  Created by nyannyan0328 on 2021/08/07.
//

import SwiftUI

struct WalkMainView: View {
    var screenSize : CGSize
    @State var offset : CGFloat = 0
    var body: some View {
        VStack{
            
            
            Button {
                
            } label: {
                Image("pack")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            
            WalkOffsetModifier(offset: $offset) {
                
                HStack(spacing:0){
                    
                    
                    ForEach(intros){intoro in
                        
                        VStack(spacing:10){
                            
                            
                            
                            Image(intoro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screenSize.height / 3)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text(intoro.title)
                                    .font(.largeTitle.bold())
                                
                                Text(intoro.discription)
                                    .font(.title2.italic())
                                    .foregroundStyle(.secondary)
                                
                                
                                
                                
                                
                                
                                
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            
                        }
                        .padding()
                        .frame(width: screenSize.width)
                        
                        
                        
                    }
                    
                }
          
                
                
                
                
            }
            
            
            HStack(alignment:.bottom){
                
                
                HStack(spacing:15){
                    
                    ForEach(intros.indices,id:\.self){index in
                        
                        Circle()
                            .fill(.white)
                            .frame(width: getIndex() == index ? 20 : 8, height: 8)
                        
                        
                    }
                        
                }
                .overlay(
                
                Capsule()
                    .fill(.white)
                    .frame(width: 20, height: 7)
                    .offset(x: getIndicator())
                
                ,alignment: .leading
                
                )
                .padding()
                
                
                
                Spacer()
                
                
                Button {
                    
                    
                    let index = min(getIndex() + 1, intros.count - 1)
                    
                    offset = CGFloat(index) * screenSize.width
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .padding(20)
                        .background(
                        
                            
                            intros[getIndex()].color,in: Circle()
                        
                        
                        
                        
                        )
                    
                    
                }
                

            }
            .offset(y: -50)
          

            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .animation(.easeInOut, value: getIndex())
       
    }
    
    func getIndex()->Int{
        
        let progress = round(offset / screenSize.width)
        
        let index = min(Int(progress), intros.count - 1)
        
        return index
        
    }
    
    func getIndicator()->CGFloat{
        
        
        let progress = offset / screenSize.width
        
        let maxWidth : CGFloat = 15 + 7
        
        return progress * maxWidth
    }
}

struct WalkMainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


