contract c9652{
    // deprecate current contract in favour of a new one
    function deprecate(address _upgradedAddress) public onlyCEO whenPaused {
        deprecated = true;
        upgradedAddress = _upgradedAddress;
        emit Deprecate(_upgradedAddress);
    }
}