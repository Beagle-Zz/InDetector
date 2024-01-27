contract c40412{
     
    function addDoc(
                    string _publisher,
                    string _docText) returns (bytes32) {
         
        if (msg.sender != manager){
             
            return sha3("not authorized");  
             
             
        }
         
        if (sha256Docs[sha256(_docText)].docIndex > 0){
             
            return sha3("text already exists");  
             
             
        }
         
        docIndex = docIndex + 1;
         
        indexedDocs[docIndex] = Doc(docIndex,
                                    _publisher,
                                    now,
                                    block.number,
                                    _docText,
                                    sha256(_docText),
                                    sha3(_docText)
                                    );
        sha256Docs[sha256(_docText)] = indexedDocs[docIndex];
        sha3Docs[sha3(_docText)]   = indexedDocs[docIndex];
         
        DocumentAdded(indexedDocs[docIndex].docIndex,
                      indexedDocs[docIndex].publisher,
                      indexedDocs[docIndex].publishedOnUnixTime
                      );
         
         
        return indexedDocs[docIndex].sha3Hash;
    }
}