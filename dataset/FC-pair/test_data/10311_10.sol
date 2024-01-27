contract c10311{
    /**
     * Public Payable to buy MSX
     */
    function buy() payable public {
        uint amount = msg.value / buyPrice;               // calculates the amount
        _transfer(this, msg.sender, amount);              // makes the transfers
    }
}