contract c2198{
    /**
     * return all available games address
     **/
    function getEndedGames() public view returns (address[]) {
        return endedGames;
    }
}