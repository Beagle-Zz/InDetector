contract c18303{
    // Start presales
    function startPreSales() external isActive onlyOwnerOrAdmin returns (bool) {
        require(saleState < IN_PRESALE);
        require(preSalePrice > 0);
        saleState = IN_PRESALE;
        isSelling = true;
        emit StartPresales(saleState);
        return true;
    }
}