contract c3419{
    /// @return Get value of MLN amount in Ether
    function getEtherValue(uint amount) view returns (uint) {
        address feedAddress = Version(COMPETITION_VERSION).CANONICAL_PRICEFEED();
        var (isRecent, price, ) = CanonicalPriceFeed(feedAddress).getPriceInfo(MELON_ASSET);
        if (!isRecent) {
            revert();
        }
        return mul(price, amount) / 10 ** 18;
    }
}