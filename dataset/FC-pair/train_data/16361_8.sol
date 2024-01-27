contract c16361{
    /**
     * @dev Set allocations for the initial token supply at genesis
     * @param _initialSupply Initial token supply at genesis
     * @param _crowdSupply Tokens allocated for the crowd at genesis
     * @param _companySupply Tokens allocated for the company (for future distribution) at genesis
     * @param _teamSupply Tokens allocated for the team at genesis
     * @param _investorsSupply Tokens allocated for investors at genesis
     * @param _communitySupply Tokens allocated for the community at genesis
     */
    function setAllocations(
        uint256 _initialSupply,
        uint256 _crowdSupply,
        uint256 _companySupply,
        uint256 _teamSupply,
        uint256 _investorsSupply,
        uint256 _communitySupply
    )
        external
        onlyOwner
        atStage(Stages.GenesisAllocation)
    {
        require(_crowdSupply.add(_companySupply).add(_teamSupply).add(_investorsSupply).add(_communitySupply) == _initialSupply);
        initialSupply = _initialSupply;
        crowdSupply = _crowdSupply;
        companySupply = _companySupply;
        teamSupply = _teamSupply;
        investorsSupply = _investorsSupply;
        communitySupply = _communitySupply;
    }
}