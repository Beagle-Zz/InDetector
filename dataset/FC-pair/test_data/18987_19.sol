contract c18987{
    /// @dev Only allow permitted contracts to interact with this contract
    modifier onlyGrantedContracts() {
        require(contractsGrantedAccess[msg.sender] == true);
        _;
    }
}