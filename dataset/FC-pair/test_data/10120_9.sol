contract c10120{
    // Only owner can make tokens tradable at any time, or if the date is
    // greater than the end of the mainsale date plus 20 weeks, allow
    // any caller to make tokensTradeable.
    function makeTradeable() public {
        require(msg.sender == owner || now > dateMainEnd + 20 weeks);
        tokensTradeable = true;
    }
}