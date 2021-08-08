//
//  FurnitureHom.swift
//  FurnitureHom
//
//  Created by nyannyan0328 on 2021/08/05.
//

import SwiftUI


struct FurnitureHome: View {
    
    @State var size = "Medium"
    
    @State var current = "All"
    
    @State var items = [
        
        Item(title: "Stylish Table Lamp", price: "$20.00", subTitle: "We have amazing quality Lamp wide range.", image: "lamp"),
        Item(title: "Modern Chair", price: "$60.00", subTitle: "New style of tables for your home and office.", image: "chair"),
        Item(title: "Wodden Stool", price: "$35.00", subTitle: "Amazing Stylish in multiple Most selling item of this.", image: "stool"),
        
        ]
    
    @State var cart : [Item] = []
    
    
    
    @GestureState var gesoffset : Bool = true

    var body: some View {
        VStack{
            
            
            HStack{
                
                
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.title.bold())
                    .foregroundColor(.blue)
                
                
                Spacer()
                
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.black)
                    .overlay(
                    
                        Text("\(cart.count)")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(.red,in: Circle())
                        .offset(x: 15, y: -13)
                            .opacity(cart.isEmpty ? 0 : 1)
                    
                    ,alignment: .topTrailing
                    
                    )
                
                
                
                
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            
                            
                            Text("Furniture in Unique Style")
                                .font(.largeTitle.weight(.black))
                            
                            
                            Text("We have wide range of\nFurniture")
                                .foregroundColor(.mint)
                               
                            
                        }
                        .multilineTextAlignment(.center)
                        
                        
                        Spacer(minLength: 0)
                        
                        
                        
                        Menu(content: {
                            
                            
                            Button {
                                
                                withAnimation{
                                    
                                    size = "Small"
                                }
                                
                            } label: {
                                
                                Text("Small")
                                
                            }
                            
                            Button {
                                
                                withAnimation{
                                    
                                    size = "Medium"
                                }
                                
                            } label: {
                                
                                Text("Medium")
                                
                            }
                            
                            Button {
                                
                                withAnimation{
                                    
                                    size = "large"
                                }
                                
                            } label: {
                                
                                Text("large")
                                
                            }

                            
                            
                        }) {
                            
                            
                            Label {
                                Text(size)
                            } icon: {
                                Image(systemName: "slider.horizontal.3")
                            }
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(.black,in: Capsule())

                            
                            
                        }
                        
                        
                        

                        
                        

                        
                        
                    }
                    .padding()
                    .padding(.top,10)
                    
                    
                    HStack{
                        
                        
                        ForEach(["Tables","Charis","Lamps","All"],id:\.self){index in
                            
                        
                            Button {
                                withAnimation{
                                    
                                    current = index
                                }
                            } label: {
                                
                            Text(index)
                                    .font(.title2)
                                    .foregroundColor(current == index ? .black : .gray)
                                    .padding(.vertical,5)
                                    .padding(.horizontal,5)
                                    .overlay(
                                        
                                        
                                        ZStack{
                                            
                                            if current == index{
                                                
                                                RoundedRectangle(cornerRadius: 10)

                                                    .stroke(
                                                    
                                                        Color.orange,lineWidth: 3
                                                        
                                                    
                                                    )
                                            }
                                        
                                        }
                                   
                                    )
                            
                            }
                            
                            .frame(maxWidth: .infinity)

                            
                            
                            
                        }
                    }
                    .padding(.top,10)
                   
                    
                    
                    ForEach(items.indices,id:\.self){item in
                        

                        ZStack{

                            Color.red
                                .cornerRadius(20)

                            Color.blue
                                .cornerRadius(20)
                                .padding(.trailing,65)
                            
                            HStack{
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "swift")
                                        .foregroundColor(.black)
                                }
                                .frame(width: 65)
                                
                                
                                Button {
                                    
                                    
                                    addCart(index: item)
                                    
                                } label: {
                                    Image(systemName:checkCart(index: item) ? "cart.badge.minus" :  "cart.badge.plus")
                                }
                                .frame(width: 65)

                            }
                            FurnitureCardView(item: items[item])
                                .offset(x: items[item].offset)
                                .gesture(
                                
                                    DragGesture().updating($gesoffset, body: { value, out, _ in
                                        
                                        
                                    out = true
                                    })
                                        .onChanged({ value in
                                            
                                            if value.translation.width < 0 && gesoffset{
                                                
                                                
                                                items[item].offset = value.translation.width
                                                
                                            }
                                            
                                        })
                                        .onEnded({ value in
                                            
                                            
                                            withAnimation{
                                                
                                                
                                               if -value.translation.width >= 100 {
                                                    
                                                    items[item].offset = -130
                                                }
                                                
                                                else{
                                                    
                                                    items[item].offset = 0
                                                }
                                            }
                                        })
                                
                                
                                )


                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        
                      
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                }
                .padding(.bottom,100)
                
                
            }
            
            
            
            
        }
      
       
        
        .background(.ultraThinMaterial)
    }
    
    func checkCart(index : Int) -> Bool{
        
        return cart.contains { item in
            
            return item.id == items[index].id
            
            
        }
        
        
        
        
        
    }
    
    
    func addCart(index : Int){
        
        if checkCart(index: index){
            
            
            cart.removeAll { item in
                
               item.id == items[index].id
                
            }
            
        }
        
        else{
            
            cart.append(items[index])
        }
        
        withAnimation{
            
            items[index].offset = 0
        }
        
        
        
    }
}

struct FurnitureHom_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
