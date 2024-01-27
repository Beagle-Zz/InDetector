contract c4769{
    /* Infers if whether _address is a contract based on the presence of bytecode */
    function isContract(address _address) internal returns (bool is_contract) {
        uint length;
        if (_address == 0) return false;
        assembly {
            length := extcodesize(_address)
        }
        if(length > 0) {
            return true;
        } else {
            return false;
        }
    }
}