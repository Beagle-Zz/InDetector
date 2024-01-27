contract c18639{
    /// @notice This method should be called by the owner before the contribution
    ///  period starts This initializes most of the parameters
    function initialize(
        address _token,
        address _destTokensReserve,
        address _destTokensTeam,
        address _destTokensBounties,
        address _destTokensAirdrop,
        address _destTokensAdvisors,
        address _destTokensEarlyInvestors
    ) public onlyOwner {
        // Initialize only once
        require(address(token) == 0x0);
        token = MiniMeToken(_token);
        require(token.totalSupply() == 0);
        require(token.controller() == address(this));
        require(token.decimals() == 8);
        require(_destTokensReserve != 0x0);
        destTokensReserve = _destTokensReserve;
        require(_destTokensTeam != 0x0);
        destTokensTeam = _destTokensTeam;
        require(_destTokensBounties != 0x0);
        destTokensBounties = _destTokensBounties;
        require(_destTokensAirdrop != 0x0);
        destTokensAirdrop = _destTokensAirdrop;
        require(_destTokensAdvisors != 0x0);
        destTokensAdvisors = _destTokensAdvisors;
        require(_destTokensEarlyInvestors != 0x0);
        destTokensEarlyInvestors= _destTokensEarlyInvestors;
    }
}