contract c16826{
        /**
        * @dev Gets the amount of tokens for pre-ICO investor.
        * @param _investorPreIco the pre-ICO investor address.
        */
        function getPreIcoInvestment(address _investorPreIco) constant public returns (uint256) {
            return investmentsPreIco[_investorPreIco];
        }
}