contract c12841{
    // The tokens can never be stolen
    modifier secCheck(address aContract) {
        require(aContract != address(contractCall));
        _;
    }
}