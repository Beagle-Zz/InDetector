contract c3419{
    // get exchange-specific information
    function exchangeIsRegistered(address ofExchange) view returns (bool) { return exchangeInformation[ofExchange].exists; }
}