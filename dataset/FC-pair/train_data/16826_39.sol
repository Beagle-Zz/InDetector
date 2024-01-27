contract c16826{
        /**
        * @dev Add new investment to the pre-ICO investments storage.
        * @param _from The address of a pre-ICO investor.
        * @param _value The investment received from a pre-ICO investor.
        */
        function addInvestmentPreIco(address _from, uint256 _value) internal {
            if (investmentsPreIco[_from] == 0) {
                investorsPreIco.push(_from);
            }
            investmentsPreIco[_from] = investmentsPreIco[_from].add(_value);
        }  
}