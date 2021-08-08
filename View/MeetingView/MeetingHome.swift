//
//  MeetingHome.swift
//  MeetingHome
//
//  Created by nyannyan0328 on 2021/08/07.
//

import SwiftUI

struct MeetingHome: View {
    @StateObject var model = MeetingViewModel()
    @State var seletedname = "UpComming"
    @Namespace var animation
    
    var top : CGFloat
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack{
                
                
                Text("Hey Guys")
                    .font(.title)
                    .fontWeight(.black)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                HStack(alignment:.bottom){
                    
                    Text("***Check Your\nMeeting Details***")
                        .frame(maxWidth: .infinity,alignment: .leading)
                    
                    
                    Spacer()
                    
                    Button {
                        
                        model.addNewMeeting.toggle()
                        
                    } label: {
                        Text("Add")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(
                            
                                .black,in: Capsule()
                            
                            
                            )
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                            .shadow(color: .white.opacity(0.3), radius: 5, x: 0, y: -5)
                    }

                    
                }
                .padding(.top,8)
                
                
                HStack(spacing:0){
                    
                    ForEach(["UpComming","Onhold","Post","Canceld"],id:\.self){title in
                        
                        
                        MeetingTabButton(title: title, selected: $seletedname, animation: animation)
                        
                        
                        
                        
                    }
                    
                    
                    
                }
                .padding(.top,10)
                
                
                if model.meetings.isEmpty{
                    
                    
                    Image("notes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    Text("Notes")

                        .font(.largeTitle.weight(.black))
                    
                    
                    
                }
                
                
                
                VStack(spacing:15){
                    
                    
                    ForEach($model.meetings){$meeting in
                        
                        
                        MeetingCardView(meeting: $meeting)
                        
                        
                        
                    }
                }
               
               
                
                
                
                
            }
            .padding()
            
        }
        .background(Color("Bg"))
        .overlay(
        
            ZStack{
                
                
                if model.addNewMeeting{
                    
                    
                    AddNewMeeting()
                        .environmentObject(model)
                }
                
            }
        
        )
    }
}

struct MeetingHome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MeetingTabButton : View{
    
    var title : String
    @Binding var selected : String
    
    var animation : Namespace.ID
    
    var body: some View{
        
        
        Button {
            withAnimation{
                
                selected = title
            }
        } label: {
            
            
            VStack{
                
                Text(title)
                    .font(.footnote.bold())
                
                if selected == title{
                    
                    Capsule()
                        .fill(.red)
                        .frame(height: 3.5)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
                
                else{
                    
                    Capsule()
                        .fill(.clear)
                        .frame(height: 3.5)
                    
                    
                    
                }
            }
            .frame(maxWidth: .infinity)
            
            
            
        }

    }
}
