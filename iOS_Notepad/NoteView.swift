import SwiftUI

struct NoteView: View {
     var entity: Note
    @State var fileName: String = ""
    @State var text: String = ""
    @ObservedObject var viewModel: NoteViewModel
   
    var body: some View {
        Button("UPDATE Note"){
        updateNote()
    }.padding()
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(20)
        .onAppear(){
                fileName = entity.fileName ?? ""
                text = entity.text ?? ""
        }
        TextField(entity.fileName ?? "file name", text: $fileName){
        }
            .padding()
        TextEditor(text: $text)
            .padding()
            .frame(minWidth:  0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .border(Color.gray)
    }
    func updateNote(){
        viewModel.updateNote(entity : entity, fileName: fileName, text: text)
        if fileName.isEmpty {
            return
        }
        if text.isEmpty {
            return
        }
       // fileName = entity.fileName
        //text = entity.text
    }
}
