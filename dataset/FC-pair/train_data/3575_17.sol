contract c3575{
    /**
     * @dev Overrides the method from the default `Fundraiser` contract
     * to additionally check if the `hardCap` is reached.
     *
     * @return Whether or not the fundraiser has ended.
     */
    function hasEnded() public view returns (bool) {
        return (super.hasEnded() || totalRaised >= hardCap);
    }
}