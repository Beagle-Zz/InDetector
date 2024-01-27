contract c18303{
    // Start ICO
    function startICO() external isActive onlyOwnerOrAdmin returns (bool) {
        require(saleState == END_PRESALE);
        require(icoStandardPrice > 0);
        saleState = IN_1ST_ICO;
        icoStartTime = now;
        isSelling = true;
        emit StartICO(saleState);
        return true;
    }
}