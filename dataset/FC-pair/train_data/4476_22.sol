contract c4476{
    /**
    * @notice Allows owner to set new sanity bounds for price updates
    * @param _sanityBounds sanity bounds as a percentage * 10**16
    */
    function setSanityBounds(uint256 _sanityBounds) onlyOwner public {
        sanityBounds = _sanityBounds;
    }
}