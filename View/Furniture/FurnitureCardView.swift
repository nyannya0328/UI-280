//
//  FurnitureCardView.swift
//  FurnitureCardView
//
//  Created by nyannyan0328 on 2021/08/05.
//

import SwiftUI

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

struct FurnitureCardView: View {
    var item : Item
    var body: some View {
        HStack{
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 3.2)
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                
                Text(item.title)
                    .font(.body.bold())
                    .foregroundColor(.blue)
                
                Text(item.subTitle)
                    .foregroundStyle(.tertiary)
                
                Text(item.price)
                    .font(.title.bold())
            }
            
            Spacer()
            
            
            
            
        }
        .frame(width: getRect().width - 30)
        .background(.white,in: RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
       
       
    }
}

struct FurnitureCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
