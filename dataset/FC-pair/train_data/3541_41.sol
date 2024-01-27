contract c3541{
    // get exchange-specific information
    function exchangeIsRegistered(address ofExchange) view returns (bool) { return exchangeInformation[ofExchange].exists; }
}