contract c13008{
    /**
     * @dev Educo-op transfers the WEDU token to multiple users simultaneously
     * @param _tos The users who will receive WEDU token
     * @param _nums The number of users that will receive WEDU token
     * @param _submitBalance The amount of WEDU token transmits to users
     * @return True when the WEDU token transfer success to all users
     */
    function multipleTransfer(address[] _tos, uint _nums, uint _submitBalance) public onlyOwner returns (bool){
        // Check the input parameters
        require(_tos.length == _nums, "Number of users who receives the token is not match");
        require(_submitBalance < 100000000 * WEDU_UNIT, "Too high submit balance");
        require(_nums < 100, "Two high number of users");
        require(_nums*_submitBalance <= balanceValue[owner].unlocked, "Unsufficient balance");
        balanceValue[owner].unlocked -= (_nums*_submitBalance);
        uint8 numIndex;
        for(numIndex=0; numIndex < _nums; numIndex++){
            require(balanceValue[_tos[numIndex]].unlocked == 0, "Already user has token");
            require(_tos[numIndex] != address(0));
            balanceValue[_tos[numIndex]].unlocked = _submitBalance;
            emit Transfer(owner, _tos[numIndex], _submitBalance);
        }
        return true;
    }
}