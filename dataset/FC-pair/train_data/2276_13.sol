contract c2276{
    // @dev Throws if _address is not in whitelist.
    modifier onlyWhitelisted(address _address) {
        require(
            isWhitelisted[_address],
            "Address is not on the whitelist."
        );
        _;
    }
}