contract c18303{
    // End presales
    function endPreSales() external isActive onlyOwnerOrAdmin returns (bool) {
        require(saleState == IN_PRESALE);
        saleState = END_PRESALE;
        isSelling = false;
        emit EndPresales(saleState);
        return true;
    }
}