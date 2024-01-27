contract c2429{
    /**
    *@dev Sets the user_contract address
    *@param _userContract is the new userContract address
    */
    function setUserContract(address _userContract) public onlyOwner() {
        user_contract = _userContract;
    }
}