contract c8984{
    // @notice to sell the amount token
    // @param amount
    function sell(address _contract, address sender, uint256 amount) public {
        require(false);
        require(address(_contract).balance >= amount * data.sellPrice());      // Check if there is enough ether in the contract
        _transfer(sender, _contract, amount);              // makes the transfers
        sender.transfer(amount * data.sellPrice());          // Shipping ether to the seller.This is important to avoid recursive attacks
    }
}