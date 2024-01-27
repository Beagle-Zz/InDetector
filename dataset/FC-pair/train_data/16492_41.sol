contract c16492{
    /**
    * @dev set default sale price of Chibies
    * @param _priceChibi price of 1 Chibi in Wei
    */
    function setChibiGEN0Price(uint _priceChibi) public contract_onlyOwner returns (bool success) {
        priceChibi = _priceChibi;
        return true;
    }
}