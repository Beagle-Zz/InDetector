contract c18453{
    // Function that is called when a user or another contract wants to transfer funds .
    function transfer(address to, uint value, bytes data) onlyPayloadSize(2 * 32) public {
        // Standard function transfer similar to ERC20 transfer with no _data .
        // Added due to backwards compatibility reasons .
        uint codeLength;
        assembly {
            // Retrieve the size of the code on target address, this needs assembly .
            codeLength := extcodesize(to)
        }
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[to] = balances[to].add(value);
        if(codeLength > 0) {
            ERC223ReceivingContract receiver = ERC223ReceivingContract(to);
            receiver.tokenFallback(msg.sender, value, data);
        }
        Transfer(msg.sender, to, value);  // ERC20 transfer event
        Transfer(msg.sender, to, value, data);  // ERC223 transfer event
    }
}