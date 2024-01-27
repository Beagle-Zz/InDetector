contract c11382{
    /**
        @dev returns the connector's virtual balance if one is defined, otherwise returns the actual balance
        @param _connectorToken  connector token contract address
        @return connector balance
    */
    function getConnectorBalance(IERC20Token _connectorToken)
        public
        view
        validConnector(_connectorToken)
        returns (uint256)
    {
        Connector storage connector = connectors[_connectorToken];
        return connector.isVirtualBalanceEnabled ? connector.virtualBalance : _connectorToken.balanceOf(this);
    }
}