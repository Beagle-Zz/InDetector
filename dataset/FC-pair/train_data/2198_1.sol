contract c2198{
    /**
     * return all available games address
     **/
    function getDeployedGames() public view returns (address[]) {
        return deployedGames;
    }
}