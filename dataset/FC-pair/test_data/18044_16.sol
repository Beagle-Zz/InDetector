contract c18044{
    // Remove sales agent from token
    function removeSalesAgent() onlyOwner public {
        emit SalesAgentRemoved(salesAgent);
        salesAgent = address(0);
    }
}