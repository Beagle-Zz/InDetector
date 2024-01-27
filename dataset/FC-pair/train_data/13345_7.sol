contract c13345{
    /// @dev Constructor creates a reference to the NFT ownership contract
    ///  and verifies the owner cut is in the valid range.
    /// @param _coreAddress - address of a deployed contract implementing
    ///  the Nonfungible Interface.
    /// @param _fee - percent cut the owner takes on each auction, must be
    ///  between 0-10,000.
    function setup(address _coreAddress, uint16 _fee) public {
        require(_fee <= 10000);
        require(msg.sender == owner);
        ownerFee = _fee;
        CutieCoreInterface candidateContract = CutieCoreInterface(_coreAddress);
        require(candidateContract.isCutieCore());
        coreContract = candidateContract;
    }
}