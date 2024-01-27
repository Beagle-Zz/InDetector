contract c16921{
    /// @dev Check if dad has authorized breeding with the mom. True if both dad
    ///  and mom have the same owner, or if the dad has given breeding permission to
    ///  the mom's owner (via approveBreeding()).
    function _isBreedingPermitted(uint40 _dadId, uint40 _momId) internal view returns (bool)
    {
        address momOwner = cutieIndexToOwner[_momId];
        address dadOwner = cutieIndexToOwner[_dadId];
        // Breeding is approved if they have same owner, or if the mom's owner was given
        // permission to breed with the dad.
        return (momOwner == dadOwner || sireAllowedToAddress[_dadId] == momOwner);
    }
}