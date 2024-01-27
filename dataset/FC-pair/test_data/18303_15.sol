contract c18303{
    // End ICO
    function endICO() external isActive onlyOwnerOrAdmin returns (bool) {
        require(getCurrentState() == IN_3RD_ICO);
        require(icoEndTime == 0);
        saleState = END_SALE;
        isSelling = false;
        icoEndTime = now;
        emit EndICO(saleState);
        return true;
    }
}