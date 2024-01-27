contract c16911{
    /**
    * delete safe values in storage
    */
    function DeleteSafe(Safe s) private  {
        _totalSaved[s.tokenAddress] = sub(_totalSaved[s.tokenAddress], s.amount);
        delete _safes[s.id];
        uint256[] storage vector = _userSafes[msg.sender];
        uint256 size = vector.length; 
        for(uint256 i = 0; i < size; i++) {
            if(vector[i] == s.id) {
                vector[i] = vector[size-1];
                vector.length--;
                break;
            }
        } 
    }
}