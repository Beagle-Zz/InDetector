contract c16492{
    /**
    * @dev Set Comission rate 100-x = %
    * @param _comission Rate inverted
    */
    function setComission(uint _comission) public contract_onlyOwner returns(bool success) {
        comission = _comission;
        return true;
    }
}