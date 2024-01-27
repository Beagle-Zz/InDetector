contract c10189{
    /**
    * @dev Change the Custom Token detailed information after creation.
    * @param _name The name to assign to the Custom Token.
    * @param _symbol The symbol to assign to the Custom Token.
    */
    function setInformation(string _name, string _symbol) public onlyOwner returns(bool successful) {
        require(bytes(_name).length > 0, "_name is empty");
        require(bytes(_symbol).length > 0, "_symbol is empty");
        name = _name;
        symbol = _symbol;
        emit LogInformationChanged(msg.sender, _name, _symbol);
        return true;
    }
}