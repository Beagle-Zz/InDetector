contract c18847{
    /////////////////////
    // State Functions //
    /////////////////////
    /** Check the state of the Contract, if in Pre Sale
      * @return bool  Return true if the contract is in Pre Sale
      */
    function isCrowdSaleStatePreSale() public constant returns (bool) {
        return crowdSaleState == State.PreSale;
    }
}