import UIKit

//https://jsonplaceholder.typicode.com/todos/1

class Entry: Decodable {
    var userId: Int?;
    var id: Int?;
    var title: String?;
    var completed: Bool?;
}

//дженерик функция для извлечения опционала
func optionalExtract<T>(optional: T?) {
    if let extractedValue = optional {
        print(extractedValue);
    } else {
        print("Error");
    }
}

class Downloader {
    var jsonDecoder: JSONDecoder!;
    var parsedJSON: Entry = Entry();
    
    func downloadAndParse() -> Entry {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") {
            URLSession.shared.dataTask(with: url) { receivedData, response, error in
                if let data = receivedData {
                    self.jsonDecoder = JSONDecoder();
                    
                    do {
                        //возвращает экземляр Entry
                        self.parsedJSON = try self.jsonDecoder.decode(Entry.self, from: data);

                        //optionalExtract(optional: self.parsedJSON.userId);
                        //optionalExtract(optional: self.parsedJSON.id);
                        //optionalExtract(optional: self.parsedJSON.title);
                        //optionalExtract(optional: self.parsedJSON.completed);
                    } catch {
                        print(error);
                    }
                }
            }.resume();
        }
        
        return parsedJSON;
    }
}

var downloader: Downloader = Downloader();
//downloader.downloadAndParse();

var parsedJSON: Entry = downloader.downloadAndParse();

