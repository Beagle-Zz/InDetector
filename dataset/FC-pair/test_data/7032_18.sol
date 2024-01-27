contract c7032{
    //@dev for small src quantities dest qty might be 0, then returned rate is zero.
    //@dev for backward compatibility we would like to return non zero rate (correct one) for small src qty
    function expectedRateSmallQty(ERC20 src, ERC20 dest) internal view returns(uint) {
        address reserve;
        uint rateSrcToEth;
        uint rateEthToDest;
        (reserve, rateSrcToEth) = kyberNetwork.searchBestRate(src, ETH_TOKEN_ADDRESS, 0);
        (reserve, rateEthToDest) = kyberNetwork.searchBestRate(ETH_TOKEN_ADDRESS, dest, 0);
        return rateSrcToEth * rateEthToDest / PRECISION;
    }
}