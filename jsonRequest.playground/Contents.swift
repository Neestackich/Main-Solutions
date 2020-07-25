import UIKit

//https://jsonplaceholder.typicode.com/todos/1

//дженерик функция для извлечения опционала
func optionalExtract<T>(optional: T?) {
    if let extractedValue = optional {
        print(extractedValue);
    } else {
        print("Error");
    }
}

enum RequestError: Error {
    case invalidUrl(url: String);
    case invalidData(url: String);
}

class Entry: Decodable {
    var userId: Int?;
    var id: Int?;
    var title: String?;
    var completed: Bool?;
}

class Downloader {
    var jsonDecoder: JSONDecoder!;
    var parsedJSON: Entry!;
    
    func downloadAndParse() throws -> Void {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") {
            URLSession.shared.dataTask(with: url) { receivedData, response, error in
                if let data = receivedData {
                    self.jsonDecoder = JSONDecoder();
                    
                    do {
                        //возвращает экземляр Entry
                        self.parsedJSON = try self.jsonDecoder.decode(Entry.self, from: data);
                        
                        optionalExtract(optional: self.parsedJSON.userId);
                        optionalExtract(optional: self.parsedJSON.id);
                        optionalExtract(optional: self.parsedJSON.title);
                        optionalExtract(optional: self.parsedJSON.completed);
                    } catch {
                        print(error);
                    }
                }
            }.resume();
        } else {
            throw RequestError.invalidUrl(url: "https://jsonplaceholder.typicode.com/todos/1")
        }
    }
}

var downloader: Downloader = Downloader();

do {
    try downloader.downloadAndParse();
} catch RequestError.invalidUrl(let url) {
    print("Using of invalid url: \(url)");
} catch RequestError.invalidData(let url) {
    print("Downloading of invalid data via url: \(url)");
}

