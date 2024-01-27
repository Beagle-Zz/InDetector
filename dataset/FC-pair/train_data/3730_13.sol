contract c3730{
        //Return tickets left in the contract
    function getTicketsLeft() public view returns (uint) {
        return maxPlayers - playerList.length;
    }
}