contract c2853{
    /**
    * @dev Do the airDrop to msg.sender
    */
    function receiveAirDrop() public {
        require(isValidAirDropForIndividual());
        // set invalidAirDrop of msg.sender to true
        invalidAirDrop[msg.sender] = true;
        // set msg.sender to the array of the airDropReceiver
        arrayAirDropReceivers.push(msg.sender);
        // execute transfer
        erc223.transfer(msg.sender, airDropAmount);
        emit LogAirDrop(msg.sender, airDropAmount);
    }
}