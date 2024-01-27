contract c3895{
    //Permit manager to sweep any tokens that landed here
    function transferTokens(address token,uint _value) public restricted returns (bool success){
        return ERC20Token(token).transfer(msg.sender,_value);
    }
}