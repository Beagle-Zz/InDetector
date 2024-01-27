contract c2532{
    /**
     *  Allows merchant to withdraw funds to it's own account
     */
    function withdraw(uint amount) external {
        withdrawTo(msg.sender, amount);
    }
}