contract c18592{
    /// @dev allocate token for Team Address
    function allocateTeamToken() public onlyOwner {
        require(balances[teamAddress] == 0);
        mintTokens(teamAddress, teamSupply);
        teamAddressFreezeTime = now;
    }
}