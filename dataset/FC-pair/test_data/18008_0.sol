contract c18008{
    // Pull the prize if no one has raced in 3 days :(
    function endRace() public {
        require(msg.sender == owner);
        require(now > latestTimestamp + 3 days);
        msg.sender.transfer(this.balance);
    }
}