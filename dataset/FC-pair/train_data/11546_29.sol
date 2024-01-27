contract c11546{
    // allows execution by the BancorNetwork contract only
    modifier bancorNetworkOnly {
        IBancorNetwork bancorNetwork = IBancorNetwork(registry.getAddress(ContractIds.BANCOR_NETWORK));
        require(msg.sender == address(bancorNetwork));
        _;
    }
}