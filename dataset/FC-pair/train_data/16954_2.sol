contract c16954{
    /**
     * Allow destination address to withdraw funds from account that is caller
     * of this function
     *
     * @param destination The one who receives permission
     * @param amount How much funds can be withdrawn
     * @return Whether or not approval was successful
     */
    function approve(
        address destination,
        uint amount
    )
        public returns (bool)
    {
        allowances[msg.sender][destination] = amount;
        emit Approval(msg.sender, destination, amount);
        return true;
    }
}