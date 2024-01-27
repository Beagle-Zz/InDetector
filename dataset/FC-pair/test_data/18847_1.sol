contract c18847{
    /** Check the state of the Contract, if in ICO
      * @return bool  Return true if the contract is in ICO
      */
    function isCrowdSaleStateICO() public constant returns (bool) {
        return crowdSaleState == State.ICO;
    }
}