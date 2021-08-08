//
//  WalkOffsetModifier.swift
//  WalkOffsetModifier
//
//  Created by nyannyan0328 on 2021/08/07.
//

import SwiftUI

struct WalkOffsetModifier<Content : View>: UIViewRepresentable  {
    func makeCoordinator() -> Coordinator {
        return WalkOffsetModifier.Coordinator(parent: self)
    }
    
    
    var content : Content
    @Binding var offset : CGFloat
    
    init(offset : Binding<CGFloat>,@ViewBuilder content : @escaping()->Content) {
        self.content = content()
        self._offset = offset
    }
    
    let scroll = UIScrollView()
    
    func makeUIView(context: Context) -> UIScrollView {
        
        setUP(scroll: scroll)
        
        scroll.delegate = context.coordinator
        
        
        return scroll
        
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        let contentoffset = uiView.contentOffset.x
        
        if offset != contentoffset{
            
            
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
        
    }
    
    func setUP(scroll : UIScrollView){
        
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        
        let hostView = UIHostingController(rootView: content)
        
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constains = [
        
        
            hostView.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            hostView.view.heightAnchor.constraint(equalTo: scroll.heightAnchor),
        
        ]
        
        scroll.addSubview(hostView.view)
        scroll.addConstraints(constains)
        
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : WalkOffsetModifier
        
        init(parent : WalkOffsetModifier) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
            
        }
    }
    
}

struct WalkOffsetModifier_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
