contract c18779{
    // Withdraw all not sold tokens.
    // Can be performed only by the owner.
    function withdrawToken() public onlyOwner stopInEmergency {
        token.transfer(msg.sender, token.balanceOf(this));
    }
}