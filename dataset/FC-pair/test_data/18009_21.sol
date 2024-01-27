contract c18009{
    // validates a connector token address - verifies that the address belongs to one of the connector tokens
    modifier validConnector(IERC20Token _address) {
        require(connectors[_address].isSet);
        _;
    }
}