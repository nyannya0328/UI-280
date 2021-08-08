//
//  AddNewMeeting.swift
//  AddNewMeeting
//
//  Created by nyannyan0328 on 2021/08/07.
//

import SwiftUI



struct AddNewMeeting: View {
    @EnvironmentObject var model : MeetingViewModel
    
    @State var currentDate = Meeting(title: "", timing: Date())
    
    @State var tf = ""
    
    @State var showPicker = false
    
    @State var meetingbutton = "Private"
    var body: some View {
     
        
        
        ScrollView(getRect().height < 850 ? .vertical : .init(), showsIndicators: false){
            
            VStack{
                
                
                
                HStack{
                    
                    Button {
                        
                        model.addNewMeeting = false
                        
                    } label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.title.bold())
                            .foregroundColor(.white)
                            .padding(8)
                            .background(.black,in: Circle())
                        
                        
                        
                        
                    }
                    
                    
                    
                    Spacer()
                    
                    
                    Image("pro")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                    
                    
                    
                }
                .padding()
                .overlay(
                
                Text("New Meeting")
                    .font(.title)
                    .font(.system(size: 18))
               
                
                )
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    Text("Enter Meeting Name")
                        .font(.title2.italic())
                        .foregroundColor(.black)
                    
                    TextField("Enert Name", text: $currentDate.title)
                        .font(.system(size: 15, weight: .light))
                    
                    
                    
                    Divider()
                    
                    
                    
                }
                .padding(.top,15)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    Text("Timing")
                        .font(.title2.italic())
                        .foregroundColor(.black)
                    
                   
                    
                    HStack{
                        
                        let time = currentDate.timing.formatted(date: .omitted, time: .shortened)
                        
                        let date = currentDate.timing.formatted(date: .numeric, time: .omitted)
                        
                        
                        Text("\(time),\(date)")
                        
                        Spacer()
                        
                        
                        Button {
                            
                            withAnimation{
                                
                                showPicker.toggle()
                            }
                            
                        } label: {
                            
                            Image(systemName: "calendar")
                                .font(.title2.bold())
                                .padding(10)
                                .background(.yellow,in: Circle())
                            
                        }

                        
                    
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    Divider()
                    
                    
                    
                }
                .padding(.top,15)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    Text("Select Collaboration")
                        .font(.title2.italic())
                        .foregroundColor(.black)
                    
                    
                    HStack(spacing:-10){
                        
                        ForEach(1...3,id:\.self){index in
                            
                            
                            Image("animoji\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .padding(4)
                                .background(.white,in: Circle())
                                .background(
                                
                                    Circle()
                                        .stroke(.black,lineWidth: 1)
                                        .shadow(radius: 10)
                                
                                
                                )
                        
                        }
                        
                        
                        Spacer()
                        
                        
                        
                        Button {
                            
                        } label: {
                            
                            Text("Contact")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                        }
                        .tint(.green)
                        .buttonStyle(.borderedProminent)
                        .background(Capsule().stroke(.white))

                        
                        
                        
                    }
                    
               
                    
                    
                    Divider()
                    
                    
                    
                }
                .padding(.top,15)
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    Text("Meeting Type")
                        .font(.title2.italic())
                        .foregroundColor(.black)
                    
                    HStack{
                        
                        
                        ForEach(["Private","Public","Oninvite"],id:\.self){title in
                            
                        MeetingButton(title: title, meetingSelect: $meetingbutton)
                            
                            
                        }
                    }
                   
                    
                   
                    
                    
                    
                    
                    Divider()
                    
                    
                    
                }
                .padding(.top,15)
                
                VStack(alignment: .leading, spacing: 13) {
                    
                    
                    Text("Meeting Card Color")
                        .font(.title3.bold())
                    
                    let colors = [Color("Blue"),Color("Green"),Color("Purple"),Color("Red"),Color("Orange")]
                    
                    
                    HStack{
                        
                        
                        ForEach(colors,id:\.self){color in
                            
                            
                            Circle()
                                .fill(color)
                                .frame(width: 40, height: 40)
                                .overlay(
                                
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .opacity(currentDate.cardColor == color ? 1 : 0)
                                
                                )
                                .onTapGesture {
                                    currentDate.cardColor = color
                                }
                        }
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                
                Spacer(minLength: 10)
                
                
                HStack{
                    
                   
                        
                      
                        
                        
                        ForEach(1...5,id:\.self){index in
                            
                            
                            GeometryReader{proxy in
                                
                                let size = proxy.size
                                
                                
                                Image("pro")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .offset(x: size.width - 50, y: size.height / 3)
                                    
                                
                                
                            }
                          
                            
                            
                           
                        }

                  
                    
                    
                }
                
               
                
                Button {
                    
                 
                        
                        AddMeeting()
                        
                        
                        
                        
                
                    
                } label: {
                    Text("Sceduel")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,10)
                        .background(.black,in: Capsule())
                }
                .disabled(currentDate.title == "")

                
                
                
                
                
            }
            .padding()
            
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("Bg"))
        .overlay(CustomDatePicker(date: $currentDate.timing, showPicker: $showPicker))
        .transition(.move(edge: .bottom))
        
    }
    
    func AddMeeting(){
        withAnimation{
            
           
            model.meetings.append(currentDate)
            model.addNewMeeting.toggle()
            
        }
        
        
    }
}

struct AddNewMeeting_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MeetingButton : View{
    
    var title : String
    @Binding var meetingSelect : String
    
    
    var body: some View{
        
        
        Button {
            withAnimation{
                
                meetingSelect = title
            }
        } label: {
            
            
            Text(title)
                .font(.callout.weight(.black))
                .foregroundColor(meetingSelect == title ? .white : .gray)
                .padding(.vertical,8)
                //.padding(.horizontal,8)
                .frame(maxWidth: .infinity)
                .background(Capsule().stroke(.white,lineWidth: meetingSelect == title ? 1 : 0)
                
                
                
                )
                .background(Capsule().fill(.black.opacity(meetingSelect == title ? 1 : 0)))
                
            
            
            
            
            
            
            
        }
        .frame(maxWidth: .infinity)

    }
}

struct CustomDatePicker : View{
    
    @Binding var date : Date
    
    @Binding var showPicker : Bool
    
    
    var body: some View{
        
        ZStack{
            
            
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
            
            DatePicker("", selection: $date, displayedComponents: [.date,.hourAndMinute])
                .labelsHidden()
            
            
            Button {
                
                withAnimation{
                    
                    showPicker.toggle()
                }
                
            } label: {
                
                
                Image(systemName: "xmark")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .padding()
                    .background(.gray,in: Circle())
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            

            
            
            
            
            
            
            
            
            
            
            
        }
        .opacity(showPicker ? 1  : 0)
        
        
    }
    
    
}
