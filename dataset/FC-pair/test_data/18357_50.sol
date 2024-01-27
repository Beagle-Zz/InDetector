contract c18357{
    // ------------------------------------------------------------------------
    // Will set the Direct Offers Comission Ratio
    // ------------------------------------------------------------------------
    function setDirectOffersComissionRatio(uint ratio) public onlyOwner returns (bool success) {
        require(ratio != 0);
        directOffersComissionRatio = ratio;
        return true;
    }
}