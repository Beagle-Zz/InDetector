contract c18373{
    /// @dev allocate token for Private Address
    function allocateCreationInvestmentingToken(address[] _creationInvestmentingingAddress, uint256[] _amount) public onlyOwner {
        creationInvestmenting = mintMultiToken(_creationInvestmentingingAddress, _amount, creationInvestmenting);
        require (creationInvestmenting <= creationInvestmentSupply);
    }
}