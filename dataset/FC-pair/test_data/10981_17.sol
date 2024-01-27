contract c10981{
    // The emergency escape hatch in case something has gone wrong. Refunds 95% of purchase Ether
    //   to all registered addresses: the other 0.01009 has been sent directly to the developer who can
    //   handle sending that back to everyone using a script.
    // Let's hope this one doesn't have to get pulled, eh?
    function pullRipCord()
        isAdministrator
        public
    {
        uint players = playerList.length;
        for (uint i = 0; i < players; i++) {
            address _toRefund = playerList[i];
            _toRefund.send(0.19171 ether);
            emit RipcordRefund(_toRefund);
        }
        selfdestruct(administrator);
    }
}