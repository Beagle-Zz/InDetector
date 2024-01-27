contract c16983{
    //assemble the given address bytecode. If bytecode exists then the _addr is a contract.
    function isContract(address _addr) returns (bool is_contract) {
          uint256 length;
          assembly {
              //retrieve the size of the code on target address, this needs assembly
              length := extcodesize(_addr)
          }
          if(length>0) {
              return true;
          }
          else {
              return false;
          }
    }
}