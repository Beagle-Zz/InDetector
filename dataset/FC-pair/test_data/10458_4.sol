contract c10458{
    //function that is called when transaction target is a contract
    function transferToContract(address _to, uint256 _value, bytes _data) private returns (bool success) {
     require(balanceOf[msg.sender] > _value); 
     balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
     balanceOf[_to] = balanceOf[_to].add(_value);
     ContractReceiver receiver = ContractReceiver(_to);
     receiver.tokenFallback(msg.sender, _value, _data);
     emit Transfer(msg.sender, _to, _value);
     emit Transfer(msg.sender, _to, _value, _data);
     return true;
    }
}