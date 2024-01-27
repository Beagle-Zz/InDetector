contract c18373{
    /// @dev allocate Token
    function allocateTokens(address[] _owners, uint256[] _values) public onlyOwner {
        require (_owners.length == _values.length);
        for(uint256 i = 0; i < _owners.length ; i++){
            address owner = _owners[i];
            uint256 value = _values[i];
            mintTokens(owner, value);
        }
    }
}