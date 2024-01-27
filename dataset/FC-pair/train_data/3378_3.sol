contract c3378{
    // This function returns the details for the players by id (instead of by address)
    function GetPlayer(uint _id) public view returns(address, uint) {
        return(players[_id].playerAddress, players[_id].countVTL);
    }
}