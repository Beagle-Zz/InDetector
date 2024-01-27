contract c10998{
    // Is a player registered?
    function playerIsRegistered(address _player)
        public
        view
        returns (bool)
    {
        return playerRegistered[_player];
    }
}