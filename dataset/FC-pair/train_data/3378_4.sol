contract c3378{
    // Return the player id and the count of VTL for the connected player
    function GetPlayerDetails(address _address) public view returns(uint, uint) {
        uint _playerId = playersToId[_address];
        uint _countVTL = 0;
        if(_playerId > 0) {
            _countVTL = players[_playerId].countVTL;
        }
        return(_playerId, _countVTL);
    }
}