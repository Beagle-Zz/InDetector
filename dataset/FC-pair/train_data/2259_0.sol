contract c2259{
    // Yes there are divs generated on each buy,
    // but not enough to justify transferring to msg.sender - gas price makes it not worth it.
    function sendDivsToBankroll() public {
        require(msg.sender == owner);
        bankroll.transfer(address(this).balance);
    }
}