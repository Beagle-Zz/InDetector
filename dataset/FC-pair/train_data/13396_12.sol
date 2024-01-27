contract c13396{
    // By beard
    function push_or_update_key(uint256 key) private {
        bool found_index = false;
        uint256 i=0;
        // Found a empty key.
        if(lockedKeys.length >= 1) {
            for(; i<lockedKeys.length; i++) {
                if(lockedKeys[i] == 0) {
                    found_index = true;
                    break;
                }
            }
        }
        // If found a empty key(value == 0) in lockedKeys array, reused it.
        if( found_index ) {
            lockedKeys[i] = key;
        } else {
            lockedKeys.push(key);
        }
    }
}