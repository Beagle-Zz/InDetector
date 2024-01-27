contract c16827{
        /**
        * @dev Get the pre-ICO investor address.
        * @param _index the index of investor in the array. 
        */
        function getPreIcoInvestor(uint256 _index) constant public returns (address) {
            return investorsPreIco[_index];
        }
}