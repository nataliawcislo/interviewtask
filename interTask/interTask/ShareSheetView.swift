//
//  ShareSheetView.swift
//  interTask
//
//  Created by Natalia Wcislo on 16.05.23.
//


import SwiftUI

struct ShareSheetView: View {
    
    let array = [1.2, 3.4, 5.6, 7.8, 9.0]
   
    
    @State private var count: Int = 0
    var body: some View {

        VStack{
            List {
                ForEach(array, id: \.self) { item in
                    HStack{
                        Text("\(item)")
                       
                        Spacer()
                        
                        Button(action: {
                            sharecounter()
                            actionSheet(index: Int(item) , temperature: item)
                        })
                        {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
            }
            Text("count: \(count)")
        }
    }
 
    
    

        
            
    func actionSheet(index: Int, temperature: Double) {
        let textmessage = "Day: \(index), Temp: \(temperature) "
        let activityVC = UIActivityViewController(activityItems: [textmessage], applicationActivities: nil)
       UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
    func sharecounter(){
        self.count += 1
    }
}

struct ShareSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetView()
    }
}
