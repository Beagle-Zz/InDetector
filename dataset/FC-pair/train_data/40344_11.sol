contract c40344{
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    function extractNameFromData(bytes _data) constant internal
    returns (string extractedName) {
         
        uint expectedPrefixLength = (bytes(nameDataPrefix)).length;
        if (_data.length < expectedPrefixLength) {
            throw;
        }
        uint i;
        for (i = 0; i < expectedPrefixLength; i++) {
            if ((bytes(nameDataPrefix))[i] != _data[i]) {
                throw;
            }
        }
         
        uint payloadLength = _data.length - expectedPrefixLength;
        if (payloadLength < minimumNameLength ||
            payloadLength > maximumNameLength) {
            throw;
        }
        string memory name = new string(payloadLength);
        for (i = 0; i < payloadLength; i++) {
            (bytes(name))[i] = _data[expectedPrefixLength + i];
        }
        return name;
    }
}