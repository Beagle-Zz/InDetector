contract c16591{
    // cancels crowdsale
    function stop() public onlyManager() hasntStopped()  {
        // we can stop only not started and not completed crowdsale
        if (started) {
            require(!isFailed());
            require(!isSuccessful());
        }
        stopped = true;
    }
}