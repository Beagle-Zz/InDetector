contract c10164{
    // Token exchange / migration to new platform ---------
    function requestTokenExchangeMax() public {
        requestTokenExchange(unlockedTokensInternal(msg.sender));
    }
}