contract c16797{
    /**
        @dev disables purchasing with the given connector token in case the connector token got compromised
        can only be called by the owner
        note that selling is still enabled regardless of this flag and it cannot be disabled by the owner
        @param _connectorToken  connector token contract address
        @param _disable         true to disable the token, false to re-enable it
    */
    function disableConnectorPurchases(IERC20Token _connectorToken, bool _disable)
        public
        ownerOnly
        validConnector(_connectorToken)
    {
        connectors[_connectorToken].isPurchaseEnabled = !_disable;
    }
}