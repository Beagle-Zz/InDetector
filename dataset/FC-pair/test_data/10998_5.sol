contract c10998{
    // How many people are taking part in the tournament?
    function countParticipants()
        public
        view
        returns (int) 
    {
        return registeredPlayers;
    }
}