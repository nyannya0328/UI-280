//
//  MeetingCardView.swift
//  MeetingCardView
//
//  Created by nyannyan0328 on 2021/08/07.
//

import SwiftUI

struct MeetingCardView: View {
    @Binding var meeting : Meeting
    var body: some View {
        VStack(spacing:10){
            
            
            HStack(alignment:.top){
                
                
                VStack(alignment : .leading ,spacing:15){
                    
                    
                    Text(meeting.timing.formatted(date: .numeric, time: .omitted))
                    
                    Text(meeting.title)
                        .font(.title2.bold())
                    
                    Text("\($meeting.members.count) joing")
                        .font(.title3.bold())
                    
                
                }
                
                Spacer()
                
                ZStack(alignment: meeting.turendOn ? .trailing : .leading) {
                    
                    
                    Capsule()
                        .fill(.secondary)
                        .foregroundStyle(.white)
                        .frame(width: 35, height: 20)
                    
                    Circle()
                        .fill(meeting.turendOn ? .red : .white)
                        .frame(width: 18, height: 18)
                    
                    
                    
                    
                }
                .shadow(radius: 1.5)
                .onTapGesture {
                    meeting.turendOn.toggle()
                }
                
            }
            .foregroundColor(getColor())
            
            HStack(spacing:-15){
                
                
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
                
                Spacer(minLength: 20)
                
                
                Button {
                    
                } label: {
                    
                    
                    Text("Join")
                        .font(.body.italic())
                        .underline()
                }
                .tint(.purple)
               .buttonStyle(.borderedProminent)
               .shadow(radius: 1.2)
               

                
                
                
            
            }
            
            
            
            
        }
        .padding()
        .background(meeting.cardColor,in: RoundedRectangle(cornerRadius: 15))
    }
    
    func getColor()->Color{
        
        if meeting.cardColor == Color("Purple") || meeting.cardColor == Color("Red"){
            
            
            return .white
        }
        return .black
    }
}

struct MeetingCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
