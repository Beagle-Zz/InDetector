contract c40344{
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    function validateNameInternal(string _name) constant internal
    returns (bool allowed) {
        bytes memory nameBytes = bytes(_name);
        uint lengthBytes = nameBytes.length;
        if (lengthBytes < minimumNameLength ||
            lengthBytes > maximumNameLength) {
            return false;
        }
        bool foundNonPunctuation = false;
        for (uint i = 0; i < lengthBytes; i++) {
            byte b = nameBytes[i];
            if (
                (b >= 48 && b <= 57) ||  
                (b >= 65 && b <= 90) ||  
                (b >= 97 && b <= 122)    
            ) {
                foundNonPunctuation = true;
                continue;
            }
            if (
                b == 32 ||  
                b == 33 ||  
                b == 40 ||  
                b == 41 ||  
                b == 45 ||  
                b == 46 ||  
                b == 95     
            ) {
                continue;
            }
            return false;
        }
        return foundNonPunctuation;
    }
}