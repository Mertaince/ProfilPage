//
//  ContentView.swift
//  Profil
//
//  Created by Mert ATK on 15.05.2023.
//

import SwiftUI



class TelefonNum: ObservableObject{
    @Published var value = ""{
        // Just enter a number
        didSet{
            let filtered = value.filter{$0.isNumber}
            if value != filtered{
                value = filtered
            }
        }
    }
}

struct ContentView: View {
    
    @State private var ad = ""
    @State private var soyad = ""
    @State private var dogumTar = Date()
    @State private var youtube = ""
    @State private var instagram = ""
    @State private var bildirimler = false
    @ObservedObject private var telefon = TelefonNum()
    
    var body: some View {
        NavigationView{
            
            ZStack{
                VStack{
                    ProfilFoto(imageName: "Profil")
                        .padding()
                    
                    Form{
                        Section(header: Text("Kişisel Bilgiler")){
                            TextField("Adın", text: $ad)
                            TextField("Soyadın", text: $soyad)
                            DatePicker("Doğum Günün", selection: $dogumTar, displayedComponents: .date)
                            TextField("Telefon +90", text: $telefon.value)
                        }
                        Section(header: Youtube(YouIcon: "youtube")){
                            TextField("Youtube Link", text: $youtube)
                                .textFieldStyle(.roundedBorder)
                        }
                        Section(header: Ins(instagram: "instagram")){
                            TextField("Instagram Link", text: $instagram)
                                .textFieldStyle(.roundedBorder)
                        }
                        
                        Section(header: Text("Eylemler")){
                            Toggle("Bildirimler", isOn: $bildirimler)
                            Link("Bize ulaşın", destination: URL(string: "https://www.linkedin.com/in/mert-atakan-ince-15b039258/")!)
                        }
                        
                        
                        
                    }.navigationTitle("Profil Bilgileri")
                        .monospacedDigit()
                        .accentColor(.blue)
                        .toolbar {
                            ToolbarItemGroup(placement: .navigationBarTrailing){
                                Button("Kaydet"){
                                    print("Kaydedildi")
                                        
                                }
                            
                                }
                            }
                        
                        
                }
            }
        }
    }
}



struct ProfilFoto: View {
    var imageName: String
    var body: some View{
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(Circle())
            //.border(.red, width: 4)
            .shadow(color: .red, radius: 10, x: 0, y: -4)
        
        
    }
}

struct Youtube: View {
    var YouIcon: String
    var body: some View{
        Image(YouIcon)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 30, height: 0, alignment: .bottom)
            .shadow(color: .red, radius: 30, x: 1, y: 1)
        
        
    }
}

struct Ins: View {
    var instagram: String
    var body: some View{
        Image(instagram)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 20, height: 0, alignment: .bottom)
            .shadow(color: .orange, radius: 20, x: 1, y: 1)
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
