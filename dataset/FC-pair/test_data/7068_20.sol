contract c7068{
    /**
        @dev freeze/unfreeze account
        can only be called by the contract owner
        @param _address    user address to freeze
        @param _freezeOrNot true means freeze, false means unfreeze
    */
    function freeze(address _address, bool _freezeOrNot) public ownerOnly {
        isFrozen[_address] = _freezeOrNot;
    }
}