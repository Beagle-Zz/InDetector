contract c16826{
        /**
        * @dev Count the pre-ICO investors total.
        */
        function getPreIcoInvestorsCount() constant public returns (uint256) {
            return investorsPreIco.length;
        }
}