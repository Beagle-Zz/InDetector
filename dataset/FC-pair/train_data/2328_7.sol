contract c2328{
    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint _value) internal {
        require (_to != 0x0);                               // Prevent transfer to 0x0 address. Use burn() instead
        require (balanceOf[_from] >= _value);               // Check if the sender has enough
        require (balanceOf[_to] + _value >= balanceOf[_to]); // Check for overflows
        require(!frozenAccount[_from]);                     // Check if sender is frozen
        require(!frozenAccount[_to]);                       // Check if recipient is frozen
        // LOCK COINS
        uint start = 1532964203;
        address peAccount = 0xb04905C01A755c97224Cf89be52364DD8B0b72A6;
        address fundAccount = 0x0816b3Cb8aB12A2960200f30c92cE52d385acb7A;
        address bizAccount = 0x44E108CFB3E0b353C946833eCDb157459EDb2002;
        address teamAccount = 0xbF1485d55BCEeEbB116C2Cf31c7a12Ef342cAceC;
        address partnerAccount = 0x9507Af24075c780024C48638C355ba5100Df3976;
        uint256 amount = _value;
        address sender = _from;
        uint256 balance = balanceOf[_from];
        if (peAccount == sender) {
            require((balance - amount) >= totalSupply * 65/100);
        } else if (fundAccount == sender) {
            if (now < start + 365 * 1 days) {
                require((balance - amount) >= totalSupply * 3/20 * 3/4);
            } else if (now < start + (2*365+1) * 1 days){
                require((balance - amount) >= totalSupply * 3/20 * 2/4);
            }else if (now < start + (3*365+1) * 1 days){
                require((balance - amount) >= totalSupply * 3/20 * 1/4);
            }
        } else if (bizAccount == sender) {
            require((balance - amount) >= totalSupply * 4/5);
        } else if (teamAccount == sender) {
            if (now < start + 365 * 1 days) {
                require((balance - amount) >= totalSupply/10 * 3/4);
            } else if (now < start + (2*365+1) * 1 days){
                require((balance - amount) >= totalSupply/10 * 2/4);
            }else if (now < start + (3*365+1) * 1 days){
                require((balance - amount) >= totalSupply/10 * 1/4);
            }
        } else if (partnerAccount == sender) {
            require((balance - amount) >= totalSupply * 4/5);
        }
        balanceOf[_from] -= _value;                         // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
}