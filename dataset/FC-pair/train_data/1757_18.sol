contract c1757{
    // Dev withdrawal of tokens - splits equally among all owners of contract
    function devTokenWithdraw(uint amount) public
        onlyWallet
    {
        uint amountPerPerson = SafeMath.div(amount, owners.length);
        for (uint i=0; i<owners.length; i++) {
            ZTHTKN.transfer(owners[i], amountPerPerson);
        }
        emit DevWithdraw(amount, amountPerPerson);
    }
}