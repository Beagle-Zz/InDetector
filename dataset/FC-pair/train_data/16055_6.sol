contract c16055{
    // Assemble the given address bytecode. If bytecode exists then the _addr is a contract.
    function isContract(address _addr) private constant returns (bool is_contract) {
      uint length;
      assembly {
            // Retrieve the size of the code on target address, this needs assembly.
            length := extcodesize(_addr)
        }
        return (length > 0);
    }
}