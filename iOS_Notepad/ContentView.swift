//
//  ContentView.swift
//  iOS_Notepad
//
//  Created by Max.Hendess on 2024-02-14.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = NoteViewModel()
     @State var fileName: String = ""
     @State var text: String = ""
     var body: some View {
         NavigationView{
             VStack {
                 NavigationLink(destination: newNoteView( viewModel: viewModel)){
                     Text("New Note")
                 }.padding()
                     .background(.blue)
                     .foregroundColor(.white)
                     .cornerRadius(20)
                 
                 List{
                     ForEach(viewModel.notes){entity in
                         NavigationLink{
                             NoteView(entity: entity, fileName: fileName, text: text, viewModel:viewModel)
                             //        Text(entity.name ?? " no name ")
                           //  Text(entity.age ?? " no age")
                         } label: {
                             Text(entity.fileName ?? " no name ")
                         }
                     }.onDelete(perform:
                         viewModel.deleteNote
                     )
                 }
             }
             .padding()
         }
     }
 }

 #Preview {
     ContentView()
 }
