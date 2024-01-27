contract c40344{
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    function computeNameFuzzyHash(string _name) constant internal
    returns (uint fuzzyHash) {
        bytes memory nameBytes = bytes(_name);
        uint h = 0;
        uint len = nameBytes.length;
        if (len > maximumNameLength) {
            len = maximumNameLength;
        }
        for (uint i = 0; i < len; i++) {
            uint mul = 128;
            byte b = nameBytes[i];
            uint ub = uint(b);
            if (b >= 48 && b <= 57) {
                 
                h = h * mul + ub;
            } else if (b >= 65 && b <= 90) {
                 
                h = h * mul + ub;
            } else if (b >= 97 && b <= 122) {
                 
                uint upper = ub - 32;
                h = h * mul + upper;
            } else {
                 
            }
        }
        return h;
    }
}