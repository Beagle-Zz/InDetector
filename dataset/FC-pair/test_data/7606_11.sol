contract c7606{
    /**
     * change team wallet
     */
    function changeTeamWallet(address _teamWallet) public onlyOwner {
        teamWallet = _teamWallet;
    }
}