contract c18303{
    // Set ICO price including ICO standard price, ICO 1st round price, ICO 2nd round price
    function setICOPrice(uint256 _tokenPerEther) external onlyOwnerOrAdmin returns(bool) {
        require(_tokenPerEther > 0);
        icoStandardPrice = _tokenPerEther;
        ico1stPrice = _tokenPerEther + _tokenPerEther * 20 / 100;
        ico2ndPrice = _tokenPerEther + _tokenPerEther * 10 / 100;
        emit SetICOPrice(icoStandardPrice);
        return true;
    }
}