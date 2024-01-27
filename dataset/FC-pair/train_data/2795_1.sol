contract c2795{
    /**
     * Unique address
     *
     */
    function setName(string name) isHuman() payable public {
        uint256 amount = msg.value;
        require(amount >= 1e15);
        require(addressFromName[name] == address(0));
        players[teamAddress].balance += amount;
        teamNamingIncome += amount;
        players[msg.sender].name = name;
        addressFromName[name] = msg.sender;
    }
}