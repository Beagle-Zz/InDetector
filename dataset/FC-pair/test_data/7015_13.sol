contract c7015{
    /* The number of tokens that are burned, unissued, or otherwise not in circulation */
    function setUncirculatedSupplyCount(uint newValue) onlyAdmin public {
        require (newValue > 0);
        uncirculatedSupplyCount = uint256(newValue);
    }
}