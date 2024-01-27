contract c10144{
    /**
     * @notice Accept the nomination to be owner.
     */
    function acceptOwnership()
        external
        onlyNominatedOwner
    {
        owner = nominatedOwner;
        nominatedOwner = address(0);
        emit OwnerChanged(owner, nominatedOwner);
    }
}