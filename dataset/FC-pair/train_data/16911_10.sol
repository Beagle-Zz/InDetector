contract c16911{
    /**
    * store comission from unfinished hodl
    */
    function StoreComission(address tokenAddress, uint256 amount) private {
        _systemReserves[tokenAddress] = add(_systemReserves[tokenAddress], amount);
        bool isNew = true;
        for(uint256 i = 0; i < _listedReserves.length; i++) {
            if(_listedReserves[i] == tokenAddress) {
                isNew = false;
                break;
            }
        } 
        if(isNew) _listedReserves.push(tokenAddress); 
    }
}