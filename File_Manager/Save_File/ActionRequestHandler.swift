
class ActionRequestHandler: NSObject, NSExtensionRequestHandling {
    
    var extensionContext: NSExtensionContext?
    
    func beginRequestWithExtensionContext(context: NSExtensionContext!) {
        self.extensionContext = context
        let identifierType = NSString(format: kUTTypePropertyList, NSUTF8StringEncoding)
        for (item: NSExtensionItem) in context.inputItems as [NSExtensionItem] {
            for (itemProvider: NSItemProvider) in item.attachments as [NSItemProvider] {
                if itemProvider.hasItemConformingToTypeIdentifier(identifierType) {
                    itemProvider.loadItemForTypeIdentifier(identifierType, options: nil, completionHandler: {(item, error) in
                        let dictionary = item as NSDictionary
                        dispatch_async(dispatch_get_main_queue(), {
                            self.itemLoadCompletedWithPreprocessingResults(dictionary[NSExtensionJavaScriptPreprocessingResultsKey] as NSDictionary)
                        })
                    })
                }
            }
        }
    }
    
    func itemLoadCompletedWithPreprocessingResults(javaScriptPreprocessingResults: NSDictionary) {
        if let text = javaScriptPreprocessingResults["args"] as? String {
            let userDefaults = NSUserDefaults(suiteName: "group.name")
            userDefaults.setValue(text, forKey: "note")
            userDefaults.synchronize()
            self.doneWithResults(["message": "Successfully added to the note app"])
        }
    }
    
    func doneWithResults(resultsForJavaScriptFinalizeArg: NSDictionary?) {
        if let resultsForJavaScriptFinalize = resultsForJavaScriptFinalizeArg {
            let identifierType = NSString(format: kUTTypePropertyList, NSUTF8StringEncoding)
            // Construct an NSExtensionItem of the appropriate type to return our
            // results dictionary in.
            
            // These will be used as the arguments to the JavaScript finalize()
            // method.
            
            var resultsDictionary = [NSExtensionJavaScriptFinalizeArgumentKey: resultsForJavaScriptFinalize]
            
            var resultsProvider = NSItemProvider(item: resultsDictionary, typeIdentifier: identifierType)
            
            var resultsItem = NSExtensionItem()
            resultsItem.attachments = [resultsProvider]
            
            // Signal that we're complete, returning our results.
            self.extensionContext!.completeRequestReturningItems([resultsItem], completionHandler: nil)
        } else {
            // We still need to signal that we're done even if we have nothing to
            // pass back.
            self.extensionContext!.completeRequestReturningItems(nil, completionHandler: nil)
        }
        
        // Don't hold on to this after we finished with it.
        self.extensionContext = nil
    }
}