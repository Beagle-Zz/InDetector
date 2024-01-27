contract c7244{
    // completion of operation with safe-keys
    function AuthEnd() public returns(bool){
        require (safeKeys[msg.sender]);
        for(uint i=0; i<4; i++){
          signKeys[massSafeKeys[i]] = false;
        }
        count = 0;
        end = 0;
        lastSafeKey = 0x0;
        return true;
    }
}