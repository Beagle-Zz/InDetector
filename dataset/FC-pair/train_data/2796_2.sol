contract c2796{
    /**
     * Fallback function
     *
     * The function without name is the default function that is called whenever anyone sends funds to a contract
     */
    function referralName (string name) isHuman() payable public {
        if(addressFromName[name] != address(0) && addressFromName[name] != msg.sender && players[msg.sender].referrer == 0)
            players[msg.sender].referrer = players[addressFromName[name]].id;
        uint256 amount = msg.value;
        deposit(amount);
    }
}