//
//DropboxManager
//CREDIT FOR THIS MODULE DUE TO:
//Tony DiPasquale  December 08, 2014
//https://robots.thoughtbot.com/using-the-dropbox-objectivec-api-in-swift
//
//
import UIKit

infix operator >>- { associativity left precedence 150 }

func >>-<A, B>(a: A?, f: A -> B?) -> B? {
    switch a {
    case let .Some(x): return f(x)
    case .None: return .None
    }
}

infix operator <^> { associativity left precedence 150 }

func <^><A, B>(f: A -> B, a: Result<A>) -> Result<B> {
    switch a {
    case let .Success(aBox): return .success(f(aBox.value))
    case let .Error(err): return .error(err)
    }
}

enum Result<A> {
    case Success(Box<A>)
    case Error(NSError)
    
    static func success(v: A) -> Result<A> {
        return .Success(Box(v))
    }
    
    static func error(e: NSError) -> Result<A> {
        return .Error(e)
    }
}

final class Box<A> {
    let value: A
    
    init(_ value: A) {
        self.value = value
    }
}

func >>-<A, B>(a: Result<A>, f: A -> Result<B>) -> Result<B> {
    switch a {
    case let .Success(aBox): return f(aBox.value)
    case let .Error(err): return .error(err)
    }
}


extension DBFilesystem {
    func listFolder(path: DBPath) -> Result<[DBFileInfo]> {
        var error: DBError?
        let files = listFolder(path, error: &error)
        
        switch error {
        case .None: return .success(files as! [DBFileInfo])
        case let .Some(err): return .error(err)
        }
    }
    
    
    func openFile(path: DBPath) -> Result<DBFile> {
        var error: DBError?
        let file = openFile(path, error: &error)
        
        switch error {
        case .None: return .success(file)
        case let .Some(err): return .error(err)
        }
    }
    
    func createFile(path: DBPath) -> Result<DBFile> {
        var error: DBError?
        let file = createFile(path, error: &error)
        
        switch error {
        case .None: return .success(file)
        case let .Some(err): return .error(err)
        }
    }
}

extension DBFile {
    func readData() -> Result<NSData> {
        var error: DBError?
        let data = readData(&error)
        
        switch error {
        case .None: return .success(data)
        case let .Some(err): return .error(err)
        }
    }
    
    func writeData(data: NSData) -> Result<()> {
        var error: DBError?
        writeData(data, error: &error)
        
        switch error {
        case .None: return .success(())
        case let .Some(err): return .error(err)
        }
    }
}

class DropboxManager: UIViewController{
    
    
    //Dropbox app is called "One Place"
    let APP_KEY = "s3s4pn17rto9et2"
    let APP_SECRET = "y9cujkdd4rwzpyo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setup() {
        let acctMgr = DBAccountManager(appKey: APP_KEY, secret: APP_SECRET)
        DBAccountManager.setSharedManager(acctMgr)
        var t = DBPath.root()
        println("ok")
    }
    
    func initiateAuthentication(viewController: UIViewController) {
        DBAccountManager.sharedManager().linkFromController(viewController)
    }
    
    func finalizeAuthentication(url: NSURL) -> Bool {
        let account = DBAccountManager.sharedManager().handleOpenURL(url)
        DBFilesystem(account: account) >>- { DBFilesystem.setSharedFilesystem($0) }
        return account != .None
    }
    
    func getFiles() -> Result<[String]> {
        let fileInfos = DBFilesystem.sharedFilesystem().listFolder(DBPath.root())
        let filePaths: [DBFileInfo] -> [String] = { $0.map { $0.path.stringValue() } }
        return filePaths <^> fileInfos
    }
    
    func getFile(filename: String) -> Result<NSData> {
        let path = DBPath.root().childPath(filename)
        return DBFilesystem.sharedFilesystem().openFile(path) >>- { $0.readData() }
    }
    
    func saveFile(filename: String, data: NSData) -> Result<()> {
        let path = DBPath.root().childPath(filename)
        return (DBFilesystem.sharedFilesystem().createFile(path, error: nil) >>- { $0.writeData(data) })!
    }
}