contract c10084{
    // How many people are taking part in the tournament?
    function countParticipants()
        public
        view
        returns (int)
    {
        return registeredPlayers;
    }
}