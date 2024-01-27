contract c16702{
      /**
       * @dev Addition to StandardToken methods. Decrease the amount of tokens that
       * @dev an owner allowed to a spender and execute a call with the sent data.
       *
       * @dev approve should be called when allowed[_spender] == 0. To decrement
       * @dev allowed value is better to use this function to avoid 2 calls (and wait until
       * @dev the first transaction is mined)
       * @dev From MonolithDAO Token.sol
       *
       * @param _spender The address which will spend the funds.
       * @param _subtractedValue The amount of tokens to decrease the allowance by.
       * @param _data ABI-encoded contract call to call `_spender` address.
       */
      function decreaseApprovalAndCall(address _spender, uint _subtractedValue, bytes _data) public payable returns (bool) {
        require(_spender != address(this));
        super.decreaseApproval(_spender, _subtractedValue);
        // solium-disable-next-line security/no-call-value
        require(_spender.call.value(msg.value)(_data));
        return true;
      }
}