import SwiftUI

struct newNoteView: View {
    @State var fileName: String = ""
    @State var text: String = ""
    @ObservedObject var viewModel: NoteViewModel
    
    var body: some View {
        TextField("fileName", text: $fileName)
            .padding()
        TextEditor(text: $text)
            .padding()
            .frame(minWidth:  0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .border(Color.gray)
       
        Button("Add Note"){
            addNote()
        }.padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
        
    //    Text(entity.fileName ?? "")
     //   Text(entity.text ?? "")
    }
    
    func addNote(){
        if fileName.isEmpty {
            return
        }
        if text.isEmpty {
         return
        }
        viewModel.addNote(fileName: fileName, text: text)
        text = ""
        fileName = ""
    }
}
