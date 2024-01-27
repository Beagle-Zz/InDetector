contract c4225{
    // Crowdsale owners can collect ETH any number of times
    function collect() public auth {
        assert(currRound() > 0); // Prevent recycling during window 0
        exec(msg.sender, address(this).balance);
        emit LogCollect(address(this).balance);
    }
}