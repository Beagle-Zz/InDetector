contract c2378{
    /*******************************************************************************
     * Whitelist's section
     */
    function authorize(address wlCandidate) public onlyOwner  {
        require(wlCandidate != address(0x0));
        require(!isWhitelisted(wlCandidate));
        whitelist[wlCandidate] = true;
        emit Authorized(wlCandidate, now);
    }
}