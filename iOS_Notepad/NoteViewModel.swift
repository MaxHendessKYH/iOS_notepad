import Foundation
import CoreData

class NoteViewModel:ObservableObject{
    
    var container = Pesrsistance.shared.container
    @Published var notes: [Note] =  []
    
    init()
    {
        fetchNotes()
    }
    // CRUD create READ Update Delete
    func fetchNotes(){
        let request = NSFetchRequest<Note>(entityName: "Note")
        do{
            notes = try container.viewContext.fetch(request)
        }catch let error{
            print("error fetching \(error)")
        }
    }
    func addNote(fileName: String, text: String){
        let newNote = Note(context: container.viewContext)
        newNote.fileName = fileName
        newNote.text = text
        saveData()
       
    }
    func deleteNote(_index: IndexSet){
        guard let  index = _index.first else {return}
        let entity = notes[index]
        container.viewContext.delete(entity)
    saveData()
    }
    // Update existing person
    func updateNote(entity: Note, fileName: String, text: String){
        entity.fileName = fileName
        entity.text = text
        saveData()
    }
    func saveData()
    {
        do{
            try container.viewContext.save()
        }catch let error{
            print("error adding \(error)")
        }
        fetchNotes()
    }
}
