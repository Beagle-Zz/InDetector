contract c7639{
    // Return true if crowdsale event has ended
    function hasEnded() public view returns (bool) {
        return ((now > SALE_END) || (tokensRaised >= SALE_CAP));
    }
}