contract c2189{
    // @return true if crowdsale event has ended
    function hasEnded() public view returns (bool) {
        if (now > saleEnd)
            return true;
        if (tokensRaised >= SALE_CAP)
            return true; // if we reach the tokensForSale
        return false;
    }
}