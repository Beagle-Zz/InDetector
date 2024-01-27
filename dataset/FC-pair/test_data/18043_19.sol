contract c18043{
    // Transfer sales agent permissions to another account
    function transferSalesAgentPermissions(address _salesAgent) onlyOwner public {
        emit SalesAgentPermissionsTransferred(salesAgent, _salesAgent);
        salesAgent = _salesAgent;
    }
}