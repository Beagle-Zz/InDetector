contract c13405{
    /// @notice Mint initial supply for founder and move to token locker
    /// @param _founders Left 160 bits are the founder address and the right 96 bits are the token amount.
    /// @param _token MET token contract address
    /// @param _proceeds Address of Proceeds contract
    function mintInitialSupply(uint[] _founders, address _token, 
        address _proceeds, address _autonomousConverter) public onlyOwner returns (bool) 
    {
        require(!minted);
        require(_founders.length != 0);
        require(address(token) == 0x0 && _token != 0x0);
        require(address(proceeds) == 0x0 && _proceeds != 0x0);
        require(_autonomousConverter != 0x0);
        token = METToken(_token);
        proceeds = Proceeds(_proceeds);
        // _founders will be minted into individual token lockers
        uint foundersTotal;
        for (uint i = 0; i < _founders.length; i++) {
            address addr = address(_founders[i] >> 96);
            require(addr != 0x0);
            uint amount = _founders[i] & ((1 << 96) - 1);
            require(amount > 0);
            TokenLocker tokenLocker = tokenLockers[addr];
            require(token.mint(address(tokenLocker), amount));
            tokenLocker.deposit(addr, amount);
            foundersTotal = foundersTotal.add(amount);
        }
        // reconcile minted total for founders
        require(foundersTotal == INITIAL_FOUNDER_SUPPLY);
        // mint a small amount to the AC
        require(token.mint(_autonomousConverter, INITIAL_AC_SUPPLY));
        minted = true;
        return true;
    }
}