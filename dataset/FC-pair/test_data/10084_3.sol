contract c10084{
    // What was the last game ID that has had an official score registered for it?
    function gameResultsLogged()
        view
        public
        returns (int)
    {
        return latestGameFinished;
    }
}