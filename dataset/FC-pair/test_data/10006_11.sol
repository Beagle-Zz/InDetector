contract c10006{
 /// @notice Buy tokens from contract by sending ether
    function buy() payable public {
        uint amount = uint(msg.value) / uint(buyPrice);               // calculates the amount
        _transfer(this, msg.sender, amount * 10 ** uint256(decimals));              // makes the transfers
    }
}